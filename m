Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77F436DF6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 01:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214616.373233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhAp-0006Ez-Gs; Thu, 21 Oct 2021 23:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214616.373233; Thu, 21 Oct 2021 23:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhAp-0006CW-Dz; Thu, 21 Oct 2021 23:08:35 +0000
Received: by outflank-mailman (input) for mailman id 214616;
 Thu, 21 Oct 2021 23:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXrv=PJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mdhAo-0006CQ-EX
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 23:08:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 897cc301-9859-46c3-9059-fec2dc71b232;
 Thu, 21 Oct 2021 23:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7688610EA;
 Thu, 21 Oct 2021 23:08:32 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 897cc301-9859-46c3-9059-fec2dc71b232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634857713;
	bh=fu5FSK0nfBCvtW4RDWEEmy3EjlarFXwEa5zENq/8TwM=;
	h=Date:From:To:cc:Subject:From;
	b=BLDqVOmHOLJ+yovmewxxQFBRxWgZwsHG7vUbyGfDZ3ZTrwWq6y5LfOXdyXIWo5j8Q
	 ranG+zS8/QWcX8l66+JCNfaQafsEbjNTFQtkRbEeiCh+Skk8BWVbH7hgK2mtIrdfbv
	 laUew1F7bHw1ulki4/E9P7Z1/mU1k4fVRmNgKVIttZMBZLf4rsFXEBRm3+zIW9/4V/
	 un+Xu3wh5rZJMrRdqarLH9j63kl9JwJ3eAR+fY7L+Pi4+otsBtFQ3sBFYjxUlYqJjn
	 vwHmHVRXRaCohGr6a0dehI4zSEhTGj+rFCgevhcv+pHM01P9vrptxTfSLIX6u7Abe7
	 cnbBQ75654wAg==
Date: Thu, 21 Oct 2021 16:08:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, iwj@xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com
Subject: [PATCH 0/3] automation: introduce an x86_64 Dom0/DomU test
Message-ID: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small patch series introduces a new QEMU-based test to Gitlab-CI.
It uses QEMU to emulate an x86_64 machine and run Xen, Dom0 and start a
DomU. It is very similar to the existing qemu-alpine-arm64-gcc test but
based on x86_64 rather than ARM64. I think it is important because all
the other x86_64 gitlab-ci tests we currently have are more narrow and
based on XTF. This would be the first end-to-end x86_64 test in
gitlab-ci.

To make it happen, we need an Alpine Linux rootfs and a Linux kernel.
The first two patches introduce them to gitlab-ci. Note that actually
nothing will get build during gitlab-ci runs, it has already been done
beforehand and uploaded as containers. They only import *existing*
containers and binaries into a gitlab-ci run, thus, they cannot fail.
The risk to the release of the first two patches is as close to zero as
possible.

The last patch is the one introducing a new test. This one can fail.
However, it is a new test at the end of the pipeline: it doesn't impact
the existing tests. In the worst case, the test will fail and the whole
pipeline will be marked as "failed" but looking at the jobs all the
other will continue to be marked as successful. In short, if it fails,
we can simply ignore it. Also, at the moment it is actually succeeding.

Cheers,

Stefano


Stefano Stabellini (3):
      automation: add x86_64 alpine 3.12 test-artifact
      automation: Linux 5.10.74 test-artifact
      automation: add a QEMU based x86_64 Dom0/DomU test

 automation/gitlab-ci/build.yaml                    | 24 ++++++
 automation/gitlab-ci/test.yaml                     | 24 ++++++
 automation/scripts/qemu-alpine-x86_64.sh           | 92 ++++++++++++++++++++++
 automation/tests-artifacts/alpine/3.12.dockerfile  | 68 ++++++++++++++++
 .../tests-artifacts/kernel/5.10.74.dockerfile      | 38 +++++++++
 5 files changed, 246 insertions(+)
 create mode 100644 automation/scripts/qemu-alpine-x86_64.sh
 create mode 100644 automation/tests-artifacts/alpine/3.12.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/5.10.74.dockerfile

