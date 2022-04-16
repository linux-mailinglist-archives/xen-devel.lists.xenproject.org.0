Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51970503202
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 02:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305997.521171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW7V-0005Hc-W0; Sat, 16 Apr 2022 00:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305997.521171; Sat, 16 Apr 2022 00:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW7V-0005Fl-Sy; Sat, 16 Apr 2022 00:16:57 +0000
Received: by outflank-mailman (input) for mailman id 305997;
 Sat, 16 Apr 2022 00:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfW7U-0005Ff-F9
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 00:16:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 854a5eff-bd1a-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 02:16:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27755622B5;
 Sat, 16 Apr 2022 00:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39197C385A4;
 Sat, 16 Apr 2022 00:16:53 +0000 (UTC)
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
X-Inumbo-ID: 854a5eff-bd1a-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650068213;
	bh=ptYmmK7oSeN6t7zkKcFYae82czllhfj65kZFPx7eje4=;
	h=Date:From:To:cc:Subject:From;
	b=mmMxlkPBumEwZ5nFNbQ3y/ZMrbBFww4I4Hl8u7sB7sgqBEZdO8WCELxL68plOJNb8
	 99I+Xqt2wXIY0+x6YUZeSdm5aN1FjY4yK5V05zcsIhNTrYW4A9BXwQ5QNtGscq6QwS
	 YkYPpw/hzOyuJmqFBYh3IW274/iuierCOlAkRLyZBHJhma3f+AIE4403ViNn1YyK8x
	 tfshRPV/n8xlT5AFAtBFoo1b0x5FRbfobtupdkGrIEr48eYwH1ZtkYfV0PkuXj40qk
	 3gIxYIQO9i0uFKzpK13oAK/Lnk7tgZZClUrTZtohLAt4cljOGqp11xi8Dn9lhPP9Hc
	 icxCptLSDkYUA==
Date: Fri, 15 Apr 2022 17:16:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com
Subject: [PATCH v5 0/2] automation: qemu32 smoke test
Message-ID: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop>
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

 automation/gitlab-ci/build.yaml                    | 14 +++-
 automation/gitlab-ci/test.yaml                     | 27 +++++++-
 automation/scripts/qemu-smoke-arm32.sh             | 81 ++++++++++++++++++++++
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
 4 files changed, 121 insertions(+), 6 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)

