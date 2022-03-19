Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C74DE4DE
	for <lists+xen-devel@lfdr.de>; Sat, 19 Mar 2022 01:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292292.496510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVN0z-0000Js-CR; Sat, 19 Mar 2022 00:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292292.496510; Sat, 19 Mar 2022 00:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVN0z-0000Fv-9B; Sat, 19 Mar 2022 00:32:17 +0000
Received: by outflank-mailman (input) for mailman id 292292;
 Sat, 19 Mar 2022 00:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVN0x-0000Fo-QX
 for xen-devel@lists.xenproject.org; Sat, 19 Mar 2022 00:32:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04e80783-a71c-11ec-8fbc-03012f2f19d4;
 Sat, 19 Mar 2022 01:32:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 035586172C;
 Sat, 19 Mar 2022 00:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD856C340E8;
 Sat, 19 Mar 2022 00:32:10 +0000 (UTC)
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
X-Inumbo-ID: 04e80783-a71c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647649931;
	bh=CxHI6HHmfpMy1PQnGzk7HrUpZ0HnzSW1dfmfHoj7f64=;
	h=Date:From:To:cc:Subject:From;
	b=h9gZxdeEZYLSLOFlwtuo0HXFRBT1U8z02U1AAlT41/F0InMpq2ct/pjvbXXCxII7I
	 pRjJlr4j/f8HNqD2bvtWXtEG/84h8gd79wzc4AG3ATtOqQ8HOPS2ADHL/L9FZmITjR
	 oo/G8FeuOj8vZPGaDu5GuQuPcu3qvtpL0qXrjtJfzDkFQyctRBsBo0fxSN2GdUIVRA
	 EqNtD45O/0EKd1IKWauUTzGgSKw5X6IXxhDZ7gaxZkE/+lS8ugpukf7LlP0y3BY7oR
	 0IwH0DgB/Ixukk1k9xSw30toNZij0X5nB6puQLZ+tXQ9JBwjYT1q9xt64JdWZmr/sl
	 JLowf2XAQmffA==
Date: Fri, 18 Mar 2022 17:32:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com
Subject: [PATCH v3 0/2] automation: qemu32 smoke test
Message-ID: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small series adds a simple Xen + Dom0 boot arm32 test to gitlab-ci
using QEMU, similar to the existing tests for arm64 and x86.

Cheers,

Stefano


Stefano Stabellini (2):
      gitlab-ci: add qemu-system-arm to the existing tests-artifacts container
      gitlab-ci: add an ARM32 qemu-based smoke test

 automation/gitlab-ci/build.yaml                    | 14 ++++-
 automation/gitlab-ci/test.yaml                     | 27 +++++++-
 automation/scripts/qemu-smoke-arm32.sh             | 72 ++++++++++++++++++++++
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
 4 files changed, 112 insertions(+), 6 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)

