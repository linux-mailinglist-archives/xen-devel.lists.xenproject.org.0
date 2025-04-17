Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F0A91F7E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957829.1350853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QAc-0003Fq-6b; Thu, 17 Apr 2025 14:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957829.1350853; Thu, 17 Apr 2025 14:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QAc-0003Dh-3l; Thu, 17 Apr 2025 14:24:50 +0000
Received: by outflank-mailman (input) for mailman id 957829;
 Thu, 17 Apr 2025 14:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJ1x=XD=bounce.vates.tech=bounce-md_30504962.68010f2c.v1-7071b087b5af41eea43e2f018f894983@srs-se1.protection.inumbo.net>)
 id 1u5QAZ-0003Db-UA
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:24:47 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c7d2e0-1b97-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:24:46 +0200 (CEST)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZdgC03bKKzS62Gkj
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 14:24:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7071b087b5af41eea43e2f018f894983; Thu, 17 Apr 2025 14:24:44 +0000
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
X-Inumbo-ID: b5c7d2e0-1b97-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744899884; x=1745169884;
	bh=uU2qQmHUgzWMJY0PgEiFWGMmWa82Cd+ekDeWVGOWNAc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=gnDsh8HUA95QvACQy5XLRY3u/JG+KLPnwi7pLhTDsEWMBgWBSOuldb3rfmeGV0cX5
	 8Jry4bwx4qkDMGOkLFtO9OMJVRMHuyuY2i6zBgwYPV8b99mvFzMYjTQH0k9ydrtpOw
	 Yajiv2gvITk1RSc3lmdBJX0VydxtyAHgmpxH3+I9URWUcIjzIh4M1IQGo+W+1EwwZe
	 OqEl6En1gt2NGd2WxrdGl1E4lg5hDDiIjJvk+kBX8Uqld+tuNp2AFlLwZo0tR0g92J
	 2dDDy5f7FyDt9wyoctiCJv60dKUh3esCslFYdqDejNEg+vNceS7zmN8r2keAHK4g/W
	 8srdUl7ZOYGdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744899884; x=1745160384; i=teddy.astie@vates.tech;
	bh=uU2qQmHUgzWMJY0PgEiFWGMmWa82Cd+ekDeWVGOWNAc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yrO6aXH2fAFZHPhZHOBx9Sz2b3GLX0/ODvBatPb/Mu41Dwxu905bI308S97H8QDgU
	 l5qLyKE2FtIHHmtJpvhbsuvFJRMSqRuNFd8B8Ixk72dLzs9S8oT6Wf/BdAg9TlChiP
	 6cJXhIBesghHG1PqII/4AytRKR4dajsH/fZxnHDfjrr862ao0EXa+F6MGK6ABgXvNL
	 Zr32w787ARBwWFVllH9aHeR8FF8p3kB96fAz/yq7JbeB5YLjFuTYMc0MWbadexi12i
	 OV2TKjndyFeQspX/Zs6MfYS5BpiTjG0jxnpQjwYnW3ZgazEjNqHNcT/cimHwkDpY38
	 lmYu5K2H7XDJQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20vmx:=20Don't=20open-code=20vmresume/vmlaunch=20instructions?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744899883537
To: security@xenproject.org, xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7071b087b5af41eea43e2f018f894983?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250417:md
Date: Thu, 17 Apr 2025 14:24:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

binutils 2.25 has support for assembling vmresume/vmlaunch
instructions, so we don't need to open-code the byte sequences
for these opcodes anymore.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/vmx/entry.S | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 6aaeb28a5b..2bfee715b3 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -21,9 +21,6 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
-#define VMRESUME     .byte 0x0f,0x01,0xc3
-#define VMLAUNCH     .byte 0x0f,0x01,0xc2
-
 FUNC(vmx_asm_vmexit_handler)
         SAVE_ALL
 
@@ -166,11 +163,11 @@ UNLIKELY_END(realmode)
         jns  .Lvmx_launch
 
 /*.Lvmx_resume:*/
-        VMRESUME
+        vmresume
         jmp  .Lvmx_vmentry_fail
 
 .Lvmx_launch:
-        VMLAUNCH
+        vmlaunch
 
 .Lvmx_vmentry_fail:
         sti
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


