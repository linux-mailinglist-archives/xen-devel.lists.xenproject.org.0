Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDBCD08F3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 16:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190775.1511039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccZ-0006iT-9Z; Fri, 19 Dec 2025 15:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190775.1511039; Fri, 19 Dec 2025 15:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccZ-0006h0-4W; Fri, 19 Dec 2025 15:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1190775;
 Fri, 19 Dec 2025 15:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPPR=6Z=bounce.vates.tech=bounce-md_30504962.69457259.v1-6501ec1ec5004e07b4e02c10b996350d@srs-se1.protection.inumbo.net>)
 id 1vWccX-0006gj-5B
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 15:42:21 +0000
Received: from mail179-28.suw41.mandrillapp.com
 (mail179-28.suw41.mandrillapp.com [198.2.179.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cab848e-dcf1-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 16:42:18 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-28.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4dXsGx2hmczMQxZx7
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 15:42:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6501ec1ec5004e07b4e02c10b996350d; Fri, 19 Dec 2025 15:42:17 +0000
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
X-Inumbo-ID: 4cab848e-dcf1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766158937; x=1766428937;
	bh=OMQbs0phcyzMgJGF4jAxHSlsn32hgTTfBxA1a6JNmEI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AEGYHczNriwe7wFs2mo2XB+6QoP/f6f0xaXg5ueZKbHucUK9T15JOpNlZnenzYgme
	 fDOXAb/tIu+H5hEVuABpA8amuGxEvdGk4+LyCc/TcKZQhQn02UhpBdmQ+XozFQQrUN
	 Bk4MfWaDT6VfMP04BdktRQYgIZ4AB8Tunc6AA9tPZKwj25fogW0w2AhOujpLMKaz2q
	 Qf+X58RnZl/SzK2edpgJKwI3YGDXxKehtdZ1pfPNVT+99Ng8IKRRsNoyfgKIjXFwMl
	 RGJ7sIo/Ti3qA1VZSyxHPeNaNK84G+Bv2q+wGFVrTCWR+CRdzKbDY8GYJ/v62Gj7YZ
	 sp9O/1nRVCvUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766158937; x=1766419437; i=teddy.astie@vates.tech;
	bh=OMQbs0phcyzMgJGF4jAxHSlsn32hgTTfBxA1a6JNmEI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eup5Lex/LkI9FmzQD5vh3zOy+PMltjt77ZBJTPEcdUrQ/DmAnAWMEpkWf9omaaNpg
	 N8JwfxU0wPmmm6b+PVzprAyDdMdKPdx2ykThxyN7Q6yFbqzSZG3fAGuCQ6EGws21Rg
	 EmyijPzkAFEYUpJDh4z7hnQtsyZE+SWrtIz12qndi9ha4S++Qyhtg3I3qDb1nMGoKR
	 FWyehgJuIOU2984FgAdBp+zXyjYwvFlncATNnYQgjylHcv4lxM8qq6/taUdctdO4sn
	 5cwMfOljlUgqozc2i+YNIBAJbWPFDwtZ3D6NnrUADiyuLQc7+BDWtyXslxDkCAK+DT
	 OIZHwGuPLUGvw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=202/4]=20xenpm:=20Don't=20build=20outside=20of=20x86?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766158936552
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <77dc07c4b4431fb53aa5b226d302f437e4314d8c.1766158766.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1766158766.git.teddy.astie@vates.tech>
References: <cover.1766158766.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6501ec1ec5004e07b4e02c10b996350d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 15:42:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

xenpm doesn't provide any interesting usable features outside of x86,
skip building it if we are not x86.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 CHANGELOG.md        | 3 +++
 tools/misc/Makefile | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3aaf598623..1fa58ce848 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
      2011 onwards.
 
+ - Removed xenpm on non-x86 platforms as it doesn't actually provide anything
+   useful outside of x86.
+
 ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
 
 ### Changed
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index c26e544e83..672df02c3b 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -23,13 +23,13 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mceinj
 INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
+INSTALL_SBIN-$(CONFIG_X86)     += xenpm
 INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
 INSTALL_SBIN-$(CONFIG_X86)     += xen-vmtrace
 INSTALL_SBIN                   += xencov
 INSTALL_SBIN                   += xenhypfs
 INSTALL_SBIN                   += xenlockprof
 INSTALL_SBIN                   += xenperf
-INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
 INSTALL_SBIN                   += xen-access
 INSTALL_SBIN                   += xen-livepatch
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


