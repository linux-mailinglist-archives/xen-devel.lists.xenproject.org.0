Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B6VNHSRzmkbogYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:55:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AF38B85C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 17:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272155.1560007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8KOA-0003wO-8g; Thu, 02 Apr 2026 15:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272155.1560007; Thu, 02 Apr 2026 15:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8KOA-0003uw-5u; Thu, 02 Apr 2026 15:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1272155;
 Thu, 02 Apr 2026 15:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1w8KO8-0003uo-LN
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8KO8-00Flc6-1Q
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 17:55:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ce915d-bab6-0a2a0a5309dd-0a2a4501bcca-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:55:20 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <freddy77@gmail.com>)
 id 69ce9167-6fc9-0a2a45010019-d155802ee096-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 17:55:19 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486b96760easo11582775e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:55:19 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a62616dsm98260155e9.3.2026.04.02.08.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 08:55:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775145319; x=1775750119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sc+GVPgMu2RbwBMk8uqaoY6h1yyfHiG33iexYIz/sA=;
        b=NUDQjsDCDLpld/Hx0eeIJ4v9mW/E+1xx727kXDb76HtZ31NmUqsii42t521EnceKX/
         DfYq4kDNUoBSgXzTTyWqs06kPXq9K2aU0vRM61uI52b7SqUXY+O0RK1Arp3km0EyJnAS
         H3I5E/BN7TSuFG1qCvRmhKQ4HXv7nEpqaMCGpbqspOmL7LK8QGQABB8W1fwLSkSeEFRB
         ev3tb/KLMoVTbmAm15sHhJ3RCZODVw4URiQJhSs/AvrhmkqDj2EBWz8/Kb0V5nlOswSm
         GnV2ty934SxtBhSd69fwKe0tL1YoT38EbQxKqcZkRlS1h/EWX0aOVypBmtxyfnA4dOxO
         a7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145319; x=1775750119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sc+GVPgMu2RbwBMk8uqaoY6h1yyfHiG33iexYIz/sA=;
        b=FafzpjVDTel4+knwCIRLIfPeGL0VQXjKPyTdoJ81/ZYZmGUzNaU2i2rnx4n6u3l8CK
         CLzOKm2zT3bi//VnUV/Bx3vXWlJT8LCl3OtvlFDQ7z0eBedlWchUOYhOfD3jYKg/8W/8
         BHe0dscoWDX+EdyL8zrEamIwpIgpYO4B7CshYs3RYg7PdK5izqxovJXkOb9dJ4Ugh6hJ
         IaaDqiG7Wd8BP4h2ITEGSH1+WBIvskuIaO+jGSNsiN4HeNHcBwriPgNqWp8E7dTmNjTV
         6MbqZhJbL54IjZuN4dzhZ/x5J2yYV7/iM9DGteeyIMmP3D6C7bTkt/PuP8XCQYLVh1sQ
         D+dA==
X-Gm-Message-State: AOJu0YzuXge+DMFIamNTSfyMjm8dv6QgL2T9r44p+MkEhbXFEjyXTjR0
	TGgvsW15U62PsT30ayTGu/7U443//vndNBGnPQkk/wtL2Lr87u+LCPn6Qt9u8LWU
X-Gm-Gg: ATEYQzy8NB+m5F0uRZ79eItTevulY2fBECpsrgXUH/8Yf3ZUhsoCm6A0siYrxRUMlPi
	F8uumGc6yb9TcCweY4Z0r7lj6kxwfJci1NBausea+EQaKgykebc+p4kN/UM8BTApBsB7hxtV6SV
	ux+1YCbP0tBDSIB8UDfsUBRIV/CDo6YEBkz9Y4Mo9hpildmndDV9v8dLDTWyQXT9XhRkYOzzJJP
	lgULxi60j5CgS/GoSjsC6VFECBj9NCmR4LAtBGU6Gk+StPG91xljM/WXpBN9bpPAOYCa/Mt9xfr
	upjc5udEzjf7V5O6avH5KziN9RdUXeLzT+YizRLcJ/lLmvCRgUQAGJjcRF5//d9wvEb7KJWW8uG
	z1bmqDZy+CgXllwNpf7hcK0iiNrJSxVwVXmSfZ9YkTaltpUslGjejcKAHUXEfmp/emksVYqPPqM
	v1B+LPtrAxT558r17Z16n67qNMs810irFSGjBXg/25PzzX1reQJeAFWeFN58k/Jrl3lg==
X-Received: by 2002:a05:600c:1798:b0:488:8bdd:cfde with SMTP id 5b1f17b1804b1-4888bddd1bemr39642745e9.7.1775145318911;
        Thu, 02 Apr 2026 08:55:18 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] xen/x86: Check supported features even for PVH dom0
Date: Thu,  2 Apr 2026 16:55:10 +0100
Message-ID: <20260402155512.80170-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775145319-160E8185-07A24108/0/0
X-purgate-type: clean
X-purgate-size: 3330
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cloud.com:email,cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 495AF38B85C
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
---
 xen/arch/x86/dom0_build.c             | 14 ++++++++++++++
 xen/arch/x86/hvm/dom0_build.c         |  3 +++
 xen/arch/x86/include/asm/dom0_build.h |  2 ++
 xen/arch/x86/pv/dom0_build.c          | 10 ++--------
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 864dd9e53e..a33ce77321 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
     return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
 }
 
+int __init dom0_check_parms(
+    struct domain *d, const struct elf_dom_parms *parms)
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
index d69a83b089..f95a00acfd 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
     if ( !check_and_adjust_load_address(d, &elf, &parms) )
         return -ENOSPC;
 
+    if ( (rc = dom0_check_parms(d, &parms)) != 0 )
+        return rc;
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af..b7bbfcbe6a 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -8,6 +8,8 @@
 
 extern unsigned int dom0_memflags;
 
+int dom0_check_parms(struct domain *d,
+                     const struct elf_dom_parms *parms);
 unsigned long dom0_compute_nr_pages(struct domain *d,
                                     struct elf_dom_parms *parms,
                                     unsigned long initrd_len);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 075a3646c2..d50e1b9f78 100644
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
+    if ( (rc = dom0_check_parms(d, &parms)) != 0 )
+        return rc;
 
     nr_pages = dom0_compute_nr_pages(d, &parms, initrd_len);
 
-- 
2.43.0


