Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLvuJ4lQ1mm8DQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:56:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026893BC759
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276006.1561652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASRe-0003GY-Af; Wed, 08 Apr 2026 12:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276006.1561652; Wed, 08 Apr 2026 12:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASRe-0003F7-7d; Wed, 08 Apr 2026 12:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1276006;
 Wed, 08 Apr 2026 12:55:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wASRd-0003Et-2V
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:55:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wASRa-007rbZ-TL
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:55:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69d65044-5cb7-0a2a0a5109dd-0a2a450c9820-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:55:42 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <freddy77@gmail.com>)
 id 69d6504e-f40c-0a2a450c0019-d1558032b12d-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:55:42 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4888375f735so58779715e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:55:42 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5dd63d6sm18454195e9.34.2026.04.08.05.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 05:55:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775652942; x=1776257742; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkqBrdaNrBJCy0crOvcxBRylV9zvc66c7xFOX+Za0sU=;
        b=NO+jrD6k7TzPeOjkfyHN5tEkgy9B323se6GKpXqhl3dL0wChl2hUvDXg3QK9oT1XhO
         0VlMLm1sd6u5Am9K958ux41cx6w1n+3tHj/igGMGLByFXHt2feCds/PSZpAqL4f+/dLn
         PVKo7aCc9vqhGjNHWZlnqpKgexYgtoPLTo6xRWO2euQ405WapxQi9VOOmv8tWaqgfPmI
         BHVJGjFWsoKOY/BaYzlql3lVMblbf7rbRyfhgu3W8nlCrfWQOLXFTMgn2GyI34ElVC8o
         jkGPqmqwpr80TkBEJzy//YmyANYLzeP3VVvZ856tCWgNC3opAPP4fhSXJZHjIWjQ2dTJ
         XuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775652942; x=1776257742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkqBrdaNrBJCy0crOvcxBRylV9zvc66c7xFOX+Za0sU=;
        b=sq732y/KapxgOBbe+vEWxcbsWtpPwoSr8klMkwwSiDQWrP5R5sWMRSEJl1Xkhtcczm
         JXF3wGsErZ3zC+557LbLa8pdaZlIiscSxVfoMklMza+9dfctjgCaI9PkAdWEIK5JK3/T
         ODpxmR3JwUMjx8JUGwygz+A11yB8pdL9ze6ZDsK2rmxS1up9FQFxPZk5R0LwTevkuEFu
         ZOeA+FygnHSkLwWv6nnBtP4H3fkaPiYMyMWBepAdStfkTRcp/Lo2jBPJbmSEVvHSRNYQ
         003fwcApvYs+A9rzU3t5gJ++/hsn4vIuyIIXxZ9bdTtidXi1krVwRFrECbCbGHpR493p
         Gp+w==
X-Gm-Message-State: AOJu0YxZhY0+Yy22f09v1jGFufNd9DbM0weSw3lsH+CxyGb6jxpIBOlW
	tOqhnNZlqrRTzT/3RzmWwCF4cxpcuUjHgNsk6RHUQio4mFCLsEbsQ/FAYcGPhw==
X-Gm-Gg: AeBDiet4gbT6sizMcd83Cb2Etu/Z6I0vuA335poYwaHwrrZRDxySSgJYqwGt89SIoiL
	9hzCobTrCCnopRxgOJNqJyvv3LuBgvMTF3tkTy+q71AtIEfJKacZ0tucB/iErHMYYfnhpFMFyf6
	8h787cDlq1alQuc6lcwHxKMiogbZ1uh1jZht2E/wqJs6Qdk20GLbpTEFNZ+pdg/3O4IaAGD1P/M
	yiGULcr/KJi3yGWPyCNwgCnZ5iA4PAELOVb/6s01PLyAx8AkUCUcIeqfktCjx9HnKXRNbAlniWW
	pfLCb2jmoNCbo1J7A3qMpROvPAVQKsZN51LkRfniprUEpAqCqp9OEibVpaFGrJLzvwZutPJXCh1
	DAr/m8MygLEBfywb+JSaO7mJqFttqc8DjOR7LavuDcsGA162JjK43EBcumV3Qi80Vk+PvN6fRCy
	QQWPcNBifEiZcJeGplmDhM/6SdGv6HEz6lRwJ7jsN90GRWy/vbszLw2eCMEvZRXBiolQ==
X-Received: by 2002:a05:600c:1c21:b0:488:b87b:3052 with SMTP id 5b1f17b1804b1-488b87b3508mr123638805e9.29.1775652941866;
        Wed, 08 Apr 2026 05:55:41 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] xen/x86: Check supported features even for PVH dom0
Date: Wed,  8 Apr 2026 13:55:14 +0100
Message-ID: <20260408125521.104660-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775652942-FD358A3D-04C6BDE1/0/0
X-purgate-type: clean
X-purgate-size: 3569
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 026893BC759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The supported features ELF notes was tested only if the dom0 was
PV. Factor out a function to check ELF notes and reuse it even
for PVH.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
--
Changes since v1:
- fix typo in title;
- fix minor formatting issue;
- use is_hardware_domain instead of checking is_pv_shim;
- reduce indentation returning earlier;
- return error instead of jumping to cleanup code.

Changes since v2:
- rename dom0_check_parms to initdom_check_parms;
- move call to initdom_check_parms in PVH code earlier;
- make "struct domain" constant.
---
 xen/arch/x86/dom0_build.c             | 14 ++++++++++++++
 xen/arch/x86/hvm/dom0_build.c         |  3 +++
 xen/arch/x86/include/asm/dom0_build.h |  2 ++
 xen/arch/x86/pv/dom0_build.c          | 10 ++--------
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 864dd9e53e..56eba8f59a 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
     return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
 }
 
+int __init initdom_check_parms(
+    const struct domain *d, const struct elf_dom_parms *parms)
+{
+    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
+        return 0;
+
+    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
+    {
+        printk("Kernel does not support Dom0 operation\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
 
 /*
  * If allocation isn't specified, reserve 1/16th of available memory for
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d69a83b089..aa06cdb2f7 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -692,6 +692,9 @@ static int __init pvh_load_kernel(
         return -EINVAL;
     }
 
+    if ( (rc = initdom_check_parms(d, &parms)) != 0 )
+        return rc;
+
     /* Copy the OS image and free temporary buffer. */
     elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
     elf.dest_size = parms.virt_kend - parms.virt_kstart;
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af..1332f18cc6 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -8,6 +8,8 @@
 
 extern unsigned int dom0_memflags;
 
+int initdom_check_parms(const struct domain *d,
+                        const struct elf_dom_parms *parms);
 unsigned long dom0_compute_nr_pages(struct domain *d,
                                     struct elf_dom_parms *parms,
                                     unsigned long initrd_len);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 075a3646c2..12d8ba744a 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -494,14 +494,8 @@ static int __init dom0_construct(const struct boot_domain *bd)
         return -EINVAL;
     }
 
-    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
-    {
-        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
-        {
-            printk("Kernel does not support Dom0 operation\n");
-            return -EINVAL;
-        }
-    }
+    if ( (rc = initdom_check_parms(d, &parms)) != 0 )
+        return rc;
 
     nr_pages = dom0_compute_nr_pages(d, &parms, initrd_len);
 
-- 
2.43.0


