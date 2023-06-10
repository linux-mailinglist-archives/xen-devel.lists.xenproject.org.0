Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA272A896
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 04:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546338.853138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7opK-0001TA-Vz; Sat, 10 Jun 2023 02:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546338.853138; Sat, 10 Jun 2023 02:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7opK-0001R9-T2; Sat, 10 Jun 2023 02:59:42 +0000
Received: by outflank-mailman (input) for mailman id 546338;
 Sat, 10 Jun 2023 02:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujxR=B6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q7opJ-00019q-D6
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 02:59:41 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6f1cbd7-073a-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 04:59:39 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E44D75C01A2;
 Fri,  9 Jun 2023 22:59:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 09 Jun 2023 22:59:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jun 2023 22:59:37 -0400 (EDT)
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
X-Inumbo-ID: d6f1cbd7-073a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1686365978; x=1686452378; bh=e12eRh5lyv
	IG/KvFdPXdCrr7zx2xKqvfBfJtwKk/UpE=; b=AKQPI0PHuEOU5fmJQ9qD4WkgYQ
	aNoiEv1lfrVM0NCY9ewgg8yFu5cfmny1yi8ZTNrtfImDp1pGhuDRkui/TEHC5s+K
	/xhOVAL5AQHfiqgCeBetpDfYF+GaDlidqVKEsi6C0xbUzHx/PqDUoPV6QFq6aB0C
	OOg0YoA7t8x2EWeZFwRJG97M00gjgS83Yl6TlolCRF6hGmsfSTI1ujrLvHwJZL0W
	M+woz3GhEN1YABJ8oG7BW769tXKF258OMnnper1WHFH+X07RwCndRpFuDFfE7T+s
	n72DZrUVHVYow5+16yXo6hevd822TTGQ2Fdv5qHENyPTDOZPdcvDunwPJiTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1686365978; x=
	1686452378; bh=e12eRh5lyvIG/KvFdPXdCrr7zx2xKqvfBfJtwKk/UpE=; b=G
	9VxVZvzIe9D+6jHeneyaWFSJNodZvgGP36tWCCmi9ous9JGq8T+LtFFMVNxNKBVP
	MresaRrefOqjnUcrB4yiDWx8qfazyFcNbts2DK6HNnEehk882KT2F6Zj8juL1H+F
	EGMd5nnB1BCD3epAfyfTbNELCE+L5PN2BYKbpdok84A3GH/TGBG0/FjPZPQbfcac
	IgY9AimP0eNkEX3UHJZealznt+phzF/ZWd7R3S5A0LdrA4WRjrcrpszwDQQEdYgf
	CHUT3mfooyG1vP/tzzRKIamZBiNqmWCfoaecQR88wlj9ZWEAdZGDmnvVnmHOsYQZ
	DTk3wKN7CU9rnuuMR4IcA==
X-ME-Sender: <xms:GueDZG18f9Cg-tE7YUbukbcbpHfxslanf3EtyE5BZRXTqupjMKF0zg>
    <xme:GueDZJEEhNIvjy07tWqGTTu7wNRaT76Bfq3-zsGrPQRL7yjlfocyiw0iDPMKRtFZp
    a8cNDqdYT4cBHA>
X-ME-Received: <xmr:GueDZO6PXCm--S9voaboQoLqRMpdAXi4REsf6vkjJ6dqf1lY0CSIME_XQ8uAsA6dupn_ciTEGNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
    gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:GueDZH2IBB4Sumu2fuMneaiI39kH0836FyDV9J2K9qo5MrsuALAF7g>
    <xmx:GueDZJEvDlCmZm7SNd8JFmSe2VBgsOISovGKSYqab1-24hPCSCAxiQ>
    <xmx:GueDZA8jWe2q81fNSp_fcvurdqkIUuTxfgHF7Bc_3KGGTLWYdCCftA>
    <xmx:GueDZH_-F4gz03FlCFBUbJ1SZj5CDts9Hwx2l7iSJAaKDQRfZ4DOEQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/4] Add strict version of vsscanf()
Date: Fri,  9 Jun 2023 22:57:58 -0400
Message-Id: <20230610025759.1813-3-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230610025759.1813-1-demi@invisiblethingslab.com>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 include/linux/kernel.h |  4 ++++
 lib/vsprintf.c         | 43 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0d91e0af01250c1d82f4a2ea562d2619b9cc6e9c..b348b84ce9c4e95031f67e0cbac5de8deca69aac 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -227,8 +227,12 @@ const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);
 
 extern __scanf(2, 3)
 int sscanf(const char *, const char *, ...);
+extern __scanf(2, 3)
+int sscanf_strict(const char *, const char *, ...);
 extern __scanf(2, 0)
 int vsscanf(const char *, const char *, va_list);
+extern __scanf(2, 0)
+int vsscanf_strict(const char *, const char *, va_list);
 
 extern int no_hash_pointers_enable(char *str);
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 9846d2385f5b9e8f3945a5664d81047e97cf10d5..2dae357b367e1da8b1004ed6e85e051a045ca36b 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -3414,6 +3414,8 @@ EXPORT_SYMBOL_GPL(bprintf);
 
 #endif /* CONFIG_BINARY_PRINTF */
 
+static int vsscanf_internal(const char *buf, const char *fmt, va_list args, bool strict);
+
 /**
  * vsscanf - Unformat a buffer into a list of arguments
  * @buf:	input buffer
@@ -3421,6 +3423,23 @@ EXPORT_SYMBOL_GPL(bprintf);
  * @args:	arguments
  */
 int vsscanf(const char *buf, const char *fmt, va_list args)
+{
+	return vsscanf_internal(buf, fmt, args, false);
+}
+
+/**
+ * vsscanf_strict - Unformat a buffer into a list of arguments, but
+ *                  do not skip spaces.
+ * @buf:	input buffer
+ * @fmt:	format of buffer
+ * @args:	arguments
+ */
+int vsscanf_strict(const char *buf, const char *fmt, va_list args)
+{
+	return vsscanf_internal(buf, fmt, args, true);
+}
+
+static int vsscanf_internal(const char *buf, const char *fmt, va_list args, bool strict)
 {
 	const char *str = buf;
 	char *next;
@@ -3530,8 +3549,10 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 			char *s = (char *)va_arg(args, char *);
 			if (field_width == -1)
 				field_width = SHRT_MAX;
-			/* first, skip leading white space in buffer */
-			str = skip_spaces(str);
+			if (!strict) {
+				/* first, skip leading white space in buffer */
+				str = skip_spaces(str);
+			}
 
 			/* now copy until next white space */
 			while (*str && !isspace(*str) && field_width--)
@@ -3621,7 +3642,8 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 		/* have some sort of integer conversion.
 		 * first, skip white space in buffer.
 		 */
-		str = skip_spaces(str);
+		if (!strict)
+			str = skip_spaces(str);
 
 		digit = *str;
 		if (is_sign && digit == '-') {
@@ -3721,6 +3743,9 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
 		str = next;
 	}
 
+	if (strict && *str)
+		return -EINVAL;
+
 	return num;
 }
 EXPORT_SYMBOL(vsscanf);
@@ -3743,3 +3768,15 @@ int sscanf(const char *buf, const char *fmt, ...)
 	return i;
 }
 EXPORT_SYMBOL(sscanf);
+int sscanf_strict(const char *buf, const char *fmt, ...)
+{
+	va_list args;
+	int i;
+
+	va_start(args, fmt);
+	i = vsscanf_strict(buf, fmt, args);
+	va_end(args);
+
+	return i;
+}
+EXPORT_SYMBOL(sscanf_strict);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


