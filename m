Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477DAB8832
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985626.1371570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYmp-0007B0-KU; Thu, 15 May 2025 13:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985626.1371570; Thu, 15 May 2025 13:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYmp-000784-HO; Thu, 15 May 2025 13:38:11 +0000
Received: by outflank-mailman (input) for mailman id 985626;
 Thu, 15 May 2025 13:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYYq-0006hT-Cx
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:23:44 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d15f04a2-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:23:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731520685435.04435821717914;
 Thu, 15 May 2025 06:20:06 -0700 (PDT)
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
X-Inumbo-ID: d15f04a2-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kxcq2eaFIHbcjQbUBLOECM9KYNss9ShGDJq16IPwqbpAVv0V9uJx8ACTSHG973hAVhm5jYYY8MufnWrMN4DlQq17ZpNsn73UfGvfcpYqI0UG4lnHYYhZo2vxf6kmAgk1Ka7QKt9A0mTqK55jCb7Jfp5FxuG6h/vEEqbotgrVcjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315210; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=96dkUqvgm/7UIRL7jRGOzfsQUACLFlErwk/VB4OugJM=; 
	b=TQN0GsXSjDaRuXgqpHOVnBug9+0dD9GGj2RNkw57uZ9fiuj1Am6nYkSCLqwKl6JZy6Db2o4JYMohzI3A8iuwXYN1U4L8YfGVq5vleP26GpzXvpsYvTLyZJ8tpSemq+lNxw9I9kkaGaXFE2OCKeay5sqeAk5OyE06/3ErWGA4nQ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315210;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=96dkUqvgm/7UIRL7jRGOzfsQUACLFlErwk/VB4OugJM=;
	b=Od1+a5Mxbc8jzMsajg+SwvQNiVcFgESgXxOBa1EtBzPY2dBaWbppSTCr1u5+bXsv
	QJMEZrx+w62sYRcaNBt/zFs7uTTI/dwoH42BVKa010EAlXIoEta22NYwoNJ3Oypy1H9
	dBhBbNaZ8Ol18VxnNSfQKhLiEzCNavdxsCaHoltg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 33/38] x86/hyperlaunch: move kernel extraction under domain builder
Date: Thu, 15 May 2025 09:19:45 -0400
Message-Id: <20250515131951.5594-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131951.5594-1-dpsmith@apertussolutions.com>
References: <20250515131951.5594-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function bzimage_parse attempted to prepare the kernel image for copying
into the guest for all supported kernel types, not just bzImage. The result was
convoluted logic to handle three kernel image types, and then within the
bzImage type, also handle three types of payloads.

This commit moves the generalized kernel preparation for the three kernel types
to the domain builder. It descopes bziamge_parse to only handling bzImages.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/bzimage.c                    | 34 ++++++++++-------------
 xen/arch/x86/domain-builder/domain.c      | 30 ++++++++++++++++++++
 xen/arch/x86/hvm/dom_build.c              |  3 +-
 xen/arch/x86/include/asm/bzimage.h        |  5 ++--
 xen/arch/x86/include/asm/domain-builder.h |  3 ++
 xen/arch/x86/pv/dom0_build.c              |  4 ++-
 6 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ba090b3ef9d6..65ee0eef029a 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -66,8 +66,6 @@ int __init bzimage_check(void *image, unsigned long len)
     return 1;
 }
 
-static unsigned long __initdata orig_image_len;
-
 unsigned long __init bzimage_headroom(void *image_start,
                                       unsigned long image_length)
 {
@@ -77,7 +75,6 @@ unsigned long __init bzimage_headroom(void *image_start,
     image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
     image_length = hdr->payload_length;
 
-    orig_image_len = image_length;
     /* Linux build system mimics gzip isize field for bzip2/lzma algos */
     headroom = gzip_isize(image_start, image_length);
     /*
@@ -96,31 +93,28 @@ unsigned long __init bzimage_headroom(void *image_start,
     return ROUNDUP(headroom, PAGE_SIZE);
 }
 
-int __init bzimage_parse(void *image_base, void **image_start,
-                         unsigned long *image_len)
+int __init bzimage_parse(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
-    int err = bzimage_check(hdr, *image_len);
+    int err = 0;
     unsigned long output_len;
 
-    if ( err < 0 )
-        return err;
-
-    if ( err > 0 )
-    {
-        *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
-        *image_len = hdr->payload_length;
-    }
+    *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
+    *image_len = hdr->payload_length;
 
     if ( elf_is_elfbinary(*image_start, *image_len) )
-        return 0;
+        return err;
 
-    BUG_ON(!(image_base < *image_start));
+    output_len = gzip_isize(*image_start, *image_len);
 
-    output_len = gzip_isize(*image_start, orig_image_len);
+    BUG_ON(!(image_base < *image_start));
 
-    if ( (err = perform_gunzip(image_base, *image_start, orig_image_len)) > 0 )
-        err = decompress(*image_start, orig_image_len, image_base);
+    if ( gzip_check(*image_start, *image_len) )
+        err = perform_gunzip(image_base, *image_start, *image_len);
+    else
+        err = decompress(*image_start, *image_len, image_base);
 
     if ( !err )
     {
@@ -128,7 +122,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
         *image_len = output_len;
     }
 
-    return err > 0 ? 0 : err;
+    return err;
 }
 
 /*
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 9c2f30eee8bd..deff6c8efaf1 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -271,6 +271,36 @@ void __init arch_builder_headroom(struct boot_domain *bd)
     bootstrap_unmap();
 }
 
+int __init arch_builder_prepare_kernel(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len)
+{
+    int rc = 0;
+
+    *image_start = image_base + headroom;
+    *image_len -= headroom;
+
+    if ( bzimage_check(*image_start, *image_len) )
+        rc = bzimage_parse(image_base, image_start, headroom, image_len);
+    else if ( gzip_check(*image_start, *image_len) )
+    {
+        unsigned long len = gzip_isize(*image_start, *image_len);
+        rc = perform_gunzip(image_base, *image_start, *image_len);
+        if ( !rc )
+        {
+            *image_start = image_base;
+            *image_len = len;
+        }
+    }
+    else if ( elf_is_elfbinary(*image_start, *image_len) )
+        rc = 0;
+    else
+        rc = -EINVAL;
+
+    return rc;
+}
+
+
 struct domain *__init arch_create_dom(
     struct boot_info *bi, struct boot_domain *bd)
 {
diff --git a/xen/arch/x86/hvm/dom_build.c b/xen/arch/x86/hvm/dom_build.c
index 3eab97b5288b..170caac6716e 100644
--- a/xen/arch/x86/hvm/dom_build.c
+++ b/xen/arch/x86/hvm/dom_build.c
@@ -745,7 +745,8 @@ static int __init pvh_load_kernel(
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = arch_builder_prepare_kernel(image_base, &image_start,
+                                           image->headroom, &image_len)) != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
         return rc;
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index c3a042f177ac..ebe4f9325c4f 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -6,7 +6,8 @@
 int bzimage_check(void *image, unsigned long len);
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 
-int bzimage_parse(void *image_base, void **image_start,
-                  unsigned long *image_len);
+int bzimage_parse(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len);
 
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index f1749d2786c6..3adeadc15423 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -21,6 +21,9 @@ unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
 
 void arch_builder_headroom(struct boot_domain *bd);
+int arch_builder_prepare_kernel(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len);
 
 unsigned long dom_compute_nr_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21cb0b11748e..72319c31fa0e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -428,7 +428,9 @@ static int __init dom0_construct(struct boot_domain *bd)
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = arch_builder_prepare_kernel(image_base, &image_start,
+                                           bd->kernel->headroom,
+                                           &image_len)) != 0 )
         return rc;
 
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
-- 
2.30.2


