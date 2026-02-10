Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEP/HLMOi2l/PQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:55:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9305119E33
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226264.1532809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplP8-0006so-Nj; Tue, 10 Feb 2026 10:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226264.1532809; Tue, 10 Feb 2026 10:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplP8-0006pi-K9; Tue, 10 Feb 2026 10:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1226264;
 Tue, 10 Feb 2026 10:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vplP7-0006pN-7L
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:55:37 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078fcdc6-066f-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:55:36 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2557449f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 02:55:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362972fa4csm31979410f8f.26.2026.02.10.02.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 02:55:35 -0800 (PST)
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
X-Inumbo-ID: 078fcdc6-066f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770720936; x=1771325736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GNpIj6jaNl2LxIucX2SnvqUjVuHy9Wt9ulv9NB3hNFo=;
        b=R25tQqfVaBK6/gSGqclZ2F0CFFT0IN4jd91VW/2nmRZ+eBe5JFC9AQlc+nciODVHD7
         D2EjTqud88xEU214WvyE2vWC4s+rH72i85JMsyrxLYqGBlUuE4tWwfm10Jsyfmwc1M24
         ezPmAACPKzlutbucBB0IV9+FcGxn5HzNiIRSyPpbgdCFolfk26L4Yp+Gt/IB5GOIRJ3k
         nSQ9v9ZzjqotzTCE+4voY+xQLIk0TVTOdVoSjpdmCHVovYyEOn+38RDj3R1vckCBf/Dp
         pqQv554SVKs9n4+IOIkyNxgAd8p47paTOS7aV4TOw1ykuYQHJo1UQ8CitcevDuB5nWjR
         NqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720936; x=1771325736;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNpIj6jaNl2LxIucX2SnvqUjVuHy9Wt9ulv9NB3hNFo=;
        b=S3kSUNiY8ineFOUW7YtkbT9hxh23msphA+pwjqWlEMS01HAT/nW6LQeM0zou4HJy50
         bjc8stf0fljR/fCZiAZ48+xQJNyIgBVUQ0ggWaX4QR274iA/C8AQmUciYtQ3m7xxgjmE
         4w9H2WfQy/NePqYTQqQsVugyp0BasmycRomFtFkloKDUiXOPw/CS8NVUyCwJUrOTKpwS
         CKQ+SNgjyIVwj402/kpdLC7ZoxPTRqZwOin2sZtRTG7pKOOMW4J4BDK/59FFDiKcfJsd
         fF/cozb7t9ksAcy4XRqbIC6GGIU4jYrvKlNDmNsQGimr68yXEdPrvukoidD9uAK6DpNV
         boEg==
X-Gm-Message-State: AOJu0YzyfpX6LvVRqnb80A0ezYXJio3QvtwRSow+P4ta8K4c6pGs1zPG
	8ok+FbWU25eqQFZoNkE3/YPfgRBUKoFLYiQAy5s4EYp2pGHOBwVrRnzvpTxcYjC5dqnYGIW4VNE
	lIE0=
X-Gm-Gg: AZuq6aJWytdBwhLLTassQVLu3RnQ/6NRf1eGeTlal4UXH1MiDEoOs8Mt7jvpm6zs2fX
	YqOP3Hg+rXN8gCj+66kA+VP+a3qpdWmVlpXVrdEt/nWc10tKZyOMgoxUT1djWbvZSyULDFkcH3G
	x2sXSbVekV0Xx9GqbKbEl8TEApy34wGMPMqlaIp2eaK05SOpEyP5/ul852JqDc+sszBotz6e5TH
	y3E3BM8XA9eEzd+GWC525ldobF9bmhuRvKSHZ++Udbx+XMacXliOLzN9f6I3bfazeQnGe18ZNgi
	2QpmETpWRnxISe+y7SlUdflZNK7Ih/6cjVwzTblso6o6ZpH4615H0z7u2X5wc3+vmF6QGe7BWUq
	/yfxykZ+2qN5ozUJA/cvBMmME2i1WyZWjAuEsGr3ZdLThMKmIb+Kt2XhcHrcnWPUbLUaDtioZVI
	uuZQju8aQ2F+nRRkHEvomIu7kLv84W3Oa8wRwC8SI15el8M2Z4k2Hgp0+eEf2wFL5NOcawx3pOD
	FV04xsP4MHAJvE=
X-Received: by 2002:a05:6000:4012:b0:435:7154:2a7 with SMTP id ffacd0b85a97d-43629244890mr19756974f8f.6.1770720935719;
        Tue, 10 Feb 2026 02:55:35 -0800 (PST)
Message-ID: <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
Date: Tue, 10 Feb 2026 11:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D9305119E33
X-Rspamd-Action: no action

When Dom0 informs us about MMCFG usability, this may change whether
extended capabilities are available (accessible) for devices. Zap what
might be on record, and re-initialize things.

No synchronization is added for the case where devices may already be in
use. That'll need sorting when (a) DomU support was added and (b) DomU-s
may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
vpci_reinit_ext_capabilities()'es return value isn't checked, as it
doesn't feel quite right to fail the hypercall because of this. At the
same time it also doesn't feel quite right to have the function return
"void". Thoughts?
---
v4: Make sure ->cleanup() and ->init() are invoked.
v3: New.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -8,6 +8,8 @@
 #include <xen/guest_access.h>
 #include <xen/iocap.h>
 #include <xen/serial.h>
+#include <xen/vpci.h>
+
 #include <asm/current.h>
 #include <asm/io_apic.h>
 #include <asm/msi.h>
@@ -169,7 +171,10 @@ int cf_check physdev_check_pci_extcfg(st
 
     ASSERT(pdev->seg == info->segment);
     if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
+    {
         pci_check_extcfg(pdev);
+        vpci_reinit_ext_capabilities(pdev);
+    }
 
     return 0;
 }
--- a/xen/drivers/vpci/cap.c
+++ b/xen/drivers/vpci/cap.c
@@ -285,13 +285,16 @@ static int vpci_init_ext_capability_list
     return 0;
 }
 
-int vpci_init_capabilities(struct pci_dev *pdev)
+int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only)
 {
     int rc;
 
-    rc = vpci_init_capability_list(pdev);
-    if ( rc )
-        return rc;
+    if ( !ext_only )
+    {
+        rc = vpci_init_capability_list(pdev);
+        if ( rc )
+            return rc;
+    }
 
     rc = vpci_init_ext_capability_list(pdev);
     if ( rc )
@@ -305,7 +308,7 @@ int vpci_init_capabilities(struct pci_de
         unsigned int pos = 0;
 
         if ( !is_ext )
-            pos = pci_find_cap_offset(pdev->sbdf, cap);
+            pos = !ext_only ? pci_find_cap_offset(pdev->sbdf, cap) : 0;
         else if ( is_hardware_domain(pdev->domain) )
             pos = pci_find_ext_capability(pdev, cap);
 
@@ -349,7 +352,7 @@ int vpci_init_capabilities(struct pci_de
     return 0;
 }
 
-void vpci_cleanup_capabilities(struct pci_dev *pdev)
+void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
     {
@@ -361,7 +364,7 @@ void vpci_cleanup_capabilities(struct pc
             continue;
 
         if ( !capability->is_ext )
-            pos = pci_find_cap_offset(pdev->sbdf, cap);
+            pos = !ext_only ? pci_find_cap_offset(pdev->sbdf, cap) : 0;
         else if ( is_hardware_domain(pdev->domain) )
             pos = pci_find_ext_capability(pdev, cap);
         if ( pos )
@@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
     }
 }
 
+int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
+{
+    if ( !pdev->vpci )
+        return 0;
+
+    vpci_cleanup_capabilities(pdev, true);
+
+    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
+                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
+        ASSERT_UNREACHABLE();
+
+    return vpci_init_capabilities(pdev, true);
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/drivers/vpci/private.h
+++ b/xen/drivers/vpci/private.h
@@ -44,8 +44,8 @@ typedef struct {
 #define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
     REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
 
-int vpci_init_capabilities(struct pci_dev *pdev);
-void vpci_cleanup_capabilities(struct pci_dev *pdev);
+int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only);
+void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -102,7 +102,7 @@ void vpci_deassign_device(struct pci_dev
                     &pdev->domain->vpci_dev_assigned_map);
 #endif
 
-    vpci_cleanup_capabilities(pdev);
+    vpci_cleanup_capabilities(pdev, false);
 
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
@@ -159,7 +159,7 @@ int vpci_assign_device(struct pci_dev *p
     if ( rc )
         goto out;
 
-    rc = vpci_init_capabilities(pdev);
+    rc = vpci_init_capabilities(pdev, false);
 
  out:
     if ( rc )
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -20,6 +20,7 @@
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
 int __must_check vpci_init_header(struct pci_dev *pdev);
+int vpci_reinit_ext_capabilities(struct pci_dev *pdev);
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
@@ -197,6 +198,11 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, uns
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
 
+static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
+{
+    return 0;
+}
+
 static inline int vpci_assign_device(struct pci_dev *pdev)
 {
     return 0;


