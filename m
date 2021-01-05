Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6A2EB591
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 23:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62214.110033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHl-0002ym-Qh; Tue, 05 Jan 2021 22:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62214.110033; Tue, 05 Jan 2021 22:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHl-0002yQ-NQ; Tue, 05 Jan 2021 22:58:41 +0000
Received: by outflank-mailman (input) for mailman id 62214;
 Tue, 05 Jan 2021 22:58:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwvHk-0002yI-6S
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 22:58:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8300d48f-3ee9-4b40-8582-01a576cfa037;
 Tue, 05 Jan 2021 22:58:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 949FA22E00;
 Tue,  5 Jan 2021 22:58:38 +0000 (UTC)
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
X-Inumbo-ID: 8300d48f-3ee9-4b40-8582-01a576cfa037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609887518;
	bh=69p+484dQt+6foXFxCNFPfmJVqDlV19mqdSlH8JxoWc=;
	h=Date:From:To:cc:Subject:From;
	b=UeILlYfhQLOUUpXWE7Cv8E9ps98KyxVB4Fgx6G1OsP/fOT+PAcsW4sA6evdLHnu36
	 /pezWjopxjLP+cPikeHPW/YURNQht9fpOa9FYWHCbxutr0lNINdhfSIzYcYqBkFLRE
	 DGXamT0m4e4MMWxDzwR06erpklSkR3QqLY5zN1CgosWYjXDh1Y8JKo/gAjsbUAYcbF
	 +WO8BpHpKRi291317ztMOqGUvPALCl6vb9JGdUWpBzNxmG1Z+2b4ZvFD+FPlCAttnj
	 /JQO6Dnk3FjSUi0PM+PQGAyghgm1v0wXEc557b5DSZ2YnHQzG4PDq40jua7eH32jEZ
	 kozyjaRJTDYjw==
Date: Tue, 5 Jan 2021 14:58:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: andrew.cooper3@citrix.com, cardoe@cardoe.com, wl@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] automation: build qemu-system-aarch64 and use it for
 tests
Message-ID: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Currently we are using Debian's qemu-system-aarch64 for our tests.
However, sometimes it crashes. See for instance
https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/939556527. It
is hard to debug and even harder to apply any fixes to it.

Instead, build our own QEMU as one of our test-artifacts, which are only
built once, then imported into each pipeline via phony jobs. Use the
provided qemu-system-aarch64 binary for our arm64 tests.


Stefano Stabellini (3):
      automation: add qemu-system-aarch64 to test-artifacts
      automation: add a job to import qemu-system-aarch64 into the pipeline
      automation: use test-artifacts/qemu-system-aarch64 instead of Debian's

 automation/gitlab-ci/build.yaml                    | 11 ++++
 automation/gitlab-ci/test.yaml                     |  2 +
 automation/scripts/qemu-alpine-arm64.sh            | 12 ++--
 automation/scripts/qemu-smoke-arm64.sh             | 15 ++---
 .../qemu-system-aarch64/5.2.0-arm64v8.dockerfile   | 75 ++++++++++++++++++++++
 5 files changed, 100 insertions(+), 15 deletions(-)
 create mode 100644 automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile

