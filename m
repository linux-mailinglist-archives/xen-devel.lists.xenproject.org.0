Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6EC1C0B7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 17:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152996.1483489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8xl-0007H8-Qi; Wed, 29 Oct 2025 16:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152996.1483489; Wed, 29 Oct 2025 16:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8xl-0007FO-Nx; Wed, 29 Oct 2025 16:23:53 +0000
Received: by outflank-mailman (input) for mailman id 1152996;
 Wed, 29 Oct 2025 16:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U31q=5G=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vE8xk-0007FG-0z
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 16:23:52 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a72df9ea-b4e3-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 17:23:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3A4517790B35
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 11:23:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PD9Rv4tCOCd1 for <xen-devel@lists.xenproject.org>;
 Wed, 29 Oct 2025 11:23:49 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CA8757790DFB
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 11:23:49 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sSEDBaT-ttMj for <xen-devel@lists.xenproject.org>;
 Wed, 29 Oct 2025 11:23:49 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ABE197790B35
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 11:23:49 -0500 (CDT)
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
X-Inumbo-ID: a72df9ea-b4e3-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CA8757790DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761755029; bh=LaMMJ1RaAsqQ/4OzrOdilkNi9nebC9PCZG2l1wXmboo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ukiyrPPFYgS9GLDnoJz4SIKX9J2jlDcaz5G5w8fHFT8RgiQotdqTT/X/JB2mv+mMb
	 UPIqKCj5S8Ssc2vwc6iC1idfIfpYWfPvyfRi16ymQRgWdkpzs245PvjG8oalF5JY/+
	 orj8r0oPywQGBhoeLgoMniLUXVgs1ggqGfthgFek=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 29 Oct 2025 11:23:49 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1066630274.4872.1761755029561.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2] xen/ppc: Fix tooling FTBFS due to missing definitions in
 public header
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: 4Gm38kUbOdS5euyS7eJvq63OEU+agA==
Thread-Topic: xen/ppc: Fix tooling FTBFS due to missing definitions in public header

int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C compiler
is in use.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 xen/include/public/arch-ppc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 4ca453a284..264e20b89e 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -11,7 +11,7 @@
 #ifndef __XEN_PUBLIC_ARCH_PPC_H__
 #define __XEN_PUBLIC_ARCH_PPC_H__
 
-#if defined(__XEN__) || defined(__XEN_TOOLS__)
+#if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
 #define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
 #define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
 #endif
-- 
2.39.5

