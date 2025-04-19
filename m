Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E6A945CC
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960324.1352435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZQ-0002DJ-Me; Sat, 19 Apr 2025 22:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960324.1352435; Sat, 19 Apr 2025 22:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GZQ-000286-Hd; Sat, 19 Apr 2025 22:21:56 +0000
Received: by outflank-mailman (input) for mailman id 960324;
 Sat, 19 Apr 2025 22:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GRi-0004yY-0n
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:13:58 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9592cd98-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:13:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100565715336.52410652135313;
 Sat, 19 Apr 2025 15:09:25 -0700 (PDT)
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
X-Inumbo-ID: 9592cd98-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=btFqBz997oftbi6g/MDEZqH4hS3bnCM9xa+ajGHPcYMNn6oKIkgWwFRcnOgw/9YsbaDxz+8kZpCzbKxTWfDl5JolRGj9ZaOb1E9MovXzS1v+yEFawyRbtbSxvfIPjNi9mhkPGMi0I58mDAuWPZwf9kF2sqHlfwGQ9+cfGs0AWSo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100571; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U9FvVn492x+OFP8sG0Y52wx0v+AcRwxTtLU4QhuGxA8=; 
	b=Rt49BZJVAbG5KPOvAQrMKh6xnBTRHIVqyPxzgQ/3a+0ozA8M/jnix5uHA4+inI9STTiznDUH4e+Sss+8Lidaa0SoxspD9bXvLgdQ9aMTvRdakzQW1af1tYB230X1HMBWunhtimXuED66Wb2rhmQ/HfL87ikK6zFpLWor3c+np1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=U9FvVn492x+OFP8sG0Y52wx0v+AcRwxTtLU4QhuGxA8=;
	b=jbYPsAtNflY25+wfKESia+/y49i+O/W+hrm/2+aHYP4i1GPYwxIFYqenBVHm2sv8
	zo3AjY3QUdsNKlT2ct71Iq8y17iEjiFRI9omJw+mAPMEqP2sFwUJXxcsrw1p4YD4niY
	jPIp+ZCttjs9Lx1o/HWVkUNOY71xmHrR04Bj219Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 33/38] x86/boot: refactor bzimage parser to be re-enterant
Date: Sat, 19 Apr 2025 18:08:15 -0400
Message-Id: <20250419220820.4234-34-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The bzimage logic uses the unit global orig_image_len to hold the original
module length for the kernel when the headroom is calculated. It then uses
orig_image_len to locate the start of the bzimage when the expansion is done.
This is an issue when more than one bzimage is processed by the headroom
calculation logic, as it will leave orig_image_len set to the length of the
last bzimage it processed.

The boot module work introduced storing the headroom size on a per module
basis. By passing in the headroom from the boot module, orig_image_len is no
longer needed to locate the beginning of the bzimage after the allocated
headroom. The bzimage functions are reworked as such, allowing the removal of
orig_image_len and enabling them to be reused by multiple kernel boot modules.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/bzimage.c             | 38 ++++++++++++++++++------------
 xen/arch/x86/hvm/dom_build.c       |  3 ++-
 xen/arch/x86/include/asm/bzimage.h |  5 ++--
 xen/arch/x86/pv/dom0_build.c       |  3 ++-
 4 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311e4..32f0360d25b4 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -68,8 +68,6 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
     return 1;
 }
 
-static unsigned long __initdata orig_image_len;
-
 unsigned long __init bzimage_headroom(void *image_start,
                                       unsigned long image_length)
 {
@@ -90,7 +88,6 @@ unsigned long __init bzimage_headroom(void *image_start,
     if ( elf_is_elfbinary(image_start, image_length) )
         return 0;
 
-    orig_image_len = image_length;
     headroom = output_length(image_start, image_length);
     if (gzip_check(image_start, image_length))
     {
@@ -103,13 +100,20 @@ unsigned long __init bzimage_headroom(void *image_start,
     return headroom;
 }
 
-int __init bzimage_parse(void *image_base, void **image_start,
-                         unsigned long *image_len)
+int __init bzimage_parse(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
     int err = bzimage_check(hdr, *image_len);
-    unsigned long output_len;
-
+    unsigned long module_len = *image_len;
+
+    /*
+     * Variable err will have one of three values:
+     *   -  < 0: a error occurred trying to inspect the contents
+     *   -  > 0: the image is a bzImage
+     *   - == 0: not a bzImage, could be raw elf or elf.gz (vmlinuz.gz)
+     */
     if ( err < 0 )
         return err;
 
@@ -118,21 +122,25 @@ int __init bzimage_parse(void *image_base, void **image_start,
         *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
         *image_len = hdr->payload_length;
     }
-
-    if ( elf_is_elfbinary(*image_start, *image_len) )
-        return 0;
+    else
+    {
+        if ( elf_is_elfbinary(*image_start, *image_len) )
+            return 0;
+        else
+            *image_len = *image_len - headroom;
+    }
 
     BUG_ON(!(image_base < *image_start));
 
-    output_len = output_length(*image_start, orig_image_len);
-
-    if ( (err = perform_gunzip(image_base, *image_start, orig_image_len)) > 0 )
-        err = decompress(*image_start, orig_image_len, image_base);
+    if ( (err = perform_gunzip(image_base, *image_start, *image_len)) > 0 )
+        err = decompress(*image_start, *image_len, image_base);
 
     if ( !err )
     {
+        printk(XENLOG_ERR "%s(%d): decompression failed, reseting image start and len\n",
+               __func__, err);
         *image_start = image_base;
-        *image_len = output_len;
+        *image_len = module_len;
     }
 
     return err > 0 ? 0 : err;
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index a847c2cb16d9..4f614aea34c3 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -743,7 +743,8 @@ static int __init pvh_load_kernel(
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, image->headroom,
+                             &image_len)) != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
         return rc;
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d39103d..24c7d4b8eb68 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -5,7 +5,8 @@
 
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 
-int bzimage_parse(void *image_base, void **image_start,
-                  unsigned long *image_len);
+int bzimage_parse(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len);
 
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 8d941ff4486e..8b02f62892d4 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -427,7 +427,8 @@ static int __init dom0_construct(struct boot_domain *bd)
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, bd->kernel->headroom,
+                             &image_len)) != 0 )
         return rc;
 
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
-- 
2.30.2


