Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP+oFaWLqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:56:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C7212DE2
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246722.1545842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9Bv-0003bi-I2; Thu, 05 Mar 2026 13:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246722.1545842; Thu, 05 Mar 2026 13:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9Bv-0003Yb-EV; Thu, 05 Mar 2026 13:56:39 +0000
Received: by outflank-mailman (input) for mailman id 1246722;
 Thu, 05 Mar 2026 13:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy9Bt-0003YV-Sw
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:56:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f99a60b-189b-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:56:35 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso2346811f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 05:56:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b34b6252sm34182860f8f.10.2026.03.05.05.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 05:56:34 -0800 (PST)
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
X-Inumbo-ID: 1f99a60b-189b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772718995; x=1773323795; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FendGPAIk98VHbhLv0gYNMJLU5gwi51eXUlXYQkH8iQ=;
        b=ASEqV2L22YaEDPXUJDkhx/3EU1EckgsISGb+B9H3YZhUQZxStpf8pY2RtQf7V0J3zD
         lso5rL74oh2VXaJjQfABpx/tkCazG3Gt7/ERkg2tSw1R2bbWtdHaXnAQYicMKkiloh5j
         wqIadoyQVYJ0oZZ1O8RS6s3PsYpo9SsdGtqUlRMhg/JJIi5Pol/cQ86HUx/V9ZvRAK9y
         htVJ5Sy/wxfF39ZKDmsjl+wB2YZpssksiRChs9rhBTBKYq0XUxR0vPowJ1l5l5dUJwkA
         4EBYPAKYzsUPV0oWPdscfzkRCtijtdxWiC2lwvr2/zbmKvpoay9Sude4gCrJJ0GXBzny
         NoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718995; x=1773323795;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FendGPAIk98VHbhLv0gYNMJLU5gwi51eXUlXYQkH8iQ=;
        b=sjETGAjL1Fh37Emc99rgjW5dJuT1N2Irq+bdyp41MYXjoHm7Y6Kucx5OZ0OXhNedDo
         tGz1VcFx8vJanBjd6pFpVfZk5Wls5sDNLj3fZ/plfmMbbl20cBc3Q67K24hucsqGFZmK
         NPyBMKg5DEjlUOo+KQnTkwgU0vwSy6/boOdvGYOnEguZMfstfwtbzMQZsYn8kwU0fjDi
         5mfnZcQxorHkqu8GXm1gmza1nfxvwGh46pZmEutMzUzYYwi3Rc6OqwxdRI5640GoHCgV
         vST561ZW0Bi6Z++5/U0VlVJGrMvIE4VS0MV0WFkICjxB0TzkdOSnMfwexYDCV2ko48cj
         Fg8w==
X-Gm-Message-State: AOJu0YwvBbgnMcwCfRE7r1GyGKwmyBA+DrxcsG8piXQLRUeLnxE+TQTP
	RM3YJVBT3yyQ+TrymW78Ga4/vkOhJkvurXa/xIVmDJ+z5XhdW8w671Cj9zG8ywMp9hPRlGB5+72
	h+1M=
X-Gm-Gg: ATEYQzxrj+oH6bpePzWc1UzZbJUdY31ZoEg0H1sJz8X23Jx8/emFcTRhXf8ZxbwJB9/
	4DOrj9NXAwg8Y9jfqvFaradE/onkInLsBkCpx86QpaQyappvl+z8DHbCGnyFzMTzuX83SP9/jlH
	WU8IzOzYHTkogUv1HUkQo1p8pll5XkCtgnf8xqbD+MXWz4RVYK/MDSD9/tCrqmMZNCc8aZEPRQq
	YORsLgEkgQR2fe2TabJqOxiaEzyRDAjt+uegVCvFWqYfgeTX6I2dxHC+0Cnyqp6OLtGtphjfELA
	xBhgnp8wzTOPZHd7ZCUzwEcNlifHbgsSFcuXUZPJ6IGIFLGRscx2YoRN+xQSvTETwgZhfM031PI
	9KWuHNiWWtfWlvi60tReASbAbij3YPgCeZjw+M/qdOrXdcInfPQnn/QNtZeB9FZl0hFeluu0svr
	tCpd20utDZBLIn/vec4AtBPE3noEZIIrUz/q3M/L0CDHTx/mWq/wLMFDAcfVACaa7MsyQbJUtZD
	N+86u4yKFKd/Xo=
X-Received: by 2002:a5d:5f83:0:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-439c7fadc99mr10784072f8f.14.1772718994779;
        Thu, 05 Mar 2026 05:56:34 -0800 (PST)
Message-ID: <689dae19-f83d-463f-95d9-c39c15a4e45c@suse.com>
Date: Thu, 5 Mar 2026 14:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6] vPCI: re-init extended-capabilities when MMCFG
 availability changed
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BE5C7212DE2
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

When Dom0 informs us about MMCFG usability, this may change whether
extended capabilities are available (accessible) for devices. Zap what
might be on record, and re-initialize things.

No synchronization is added for the case where devices may already be in
use. That'll need sorting when (a) DomU support was added and (b) DomU-s
may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).

vpci_cleanup_capabilities() also shouldn't have used
pci_find_ext_capability(), as already when the function was introduced
extended config space may not have been (properly) accessible anymore,
no matter whether it was during init. Extended capability cleanup hooks
need to cope with being called when the respective capability doesn't
exist (and hence the corresponding ->init() hook was never called).

Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: Add comment in physdev_check_pci_extcfg(), while dropping the logging
    of a(nother) message there. Drop hwdom restriction from
    vpci_cleanup_capabilities(). In the re-init case don't bail early from
    vpci_init_capabilities(). Simplify assertion and re-order actions in
    vpci_reinit_ext_capabilities().
v5: Don't use pci_find_ext_capability() in vpci_cleanup_capabilities().
    Add assertion in vpci_reinit_ext_capabilities().
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
@@ -169,8 +171,19 @@ int cf_check physdev_check_pci_extcfg(st
 
     ASSERT(pdev->seg == info->segment);
     if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
+    {
         pci_check_extcfg(pdev);
 
+        /*
+         * The re-init failing doesn't mean the device becomes entirely non-
+         * functional.  In case of failure, a message was already logged.
+         * Hence don't otherwise act upon failure.
+         *
+         * FIXME: Re-visit when DomU support is added to vPCI.
+         */
+        vpci_reinit_ext_capabilities(pdev);
+    }
+
     return 0;
 }
 #endif /* COMPAT */
--- a/xen/drivers/vpci/cap.c
+++ b/xen/drivers/vpci/cap.c
@@ -285,13 +285,16 @@ static int vpci_init_ext_capability_list
     return 0;
 }
 
-int vpci_init_capabilities(struct pci_dev *pdev)
+int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only)
 {
-    int rc;
+    int rc, accum_rc = 0;
 
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
 
@@ -341,30 +344,40 @@ int vpci_init_capabilities(struct pci_de
             {
                 printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
                        pdev->domain, &pdev->sbdf, type, cap, rc);
-                return rc;
+
+                /* Best effort for the re-init case. */
+                if ( !ext_only )
+                    return rc;
+
+                if ( !accum_rc )
+                    accum_rc = rc;
             }
         }
     }
 
-    return 0;
+    return accum_rc;
 }
 
-void vpci_cleanup_capabilities(struct pci_dev *pdev)
+void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
 {
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
     {
         const vpci_capability_t *capability = &__start_vpci_array[i];
         const unsigned int cap = capability->id;
-        unsigned int pos = 0;
 
         if ( !capability->cleanup )
             continue;
 
-        if ( !capability->is_ext )
-            pos = pci_find_cap_offset(pdev->sbdf, cap);
-        else if ( is_hardware_domain(pdev->domain) )
-            pos = pci_find_ext_capability(pdev, cap);
-        if ( pos )
+        /*
+         * Cannot call pci_find_ext_capability() here, as extended config space
+         * may (no longer) be accessible.  As a result, extended capability
+         * ->cleanup() handlers need to cope with being called despite ->init()
+         * never having been called.  Which in turn allows calling them even
+         * for DomU-s, no matter that vpci_init_capabilities() excludes them
+         * there for now.
+         */
+        if ( capability->is_ext
+             || (!ext_only && pci_find_cap_offset(pdev->sbdf, cap)) )
         {
             int rc = capability->cleanup(pdev, false);
 
@@ -376,6 +389,27 @@ void vpci_cleanup_capabilities(struct pc
     }
 }
 
+int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
+{
+    if ( !pdev->vpci )
+        return 0;
+
+    /*
+     * FIXME: DomU support is missing.  For already running domains we may
+     * need to pause them around the entire re-evaluation of extended config
+     * space accessibility.
+     */
+    ASSERT(pdev->domain == hardware_domain);
+
+    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
+                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
+        ASSERT_UNREACHABLE();
+
+    vpci_cleanup_capabilities(pdev, true);
+
+    return vpci_init_capabilities(pdev, true);
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/drivers/vpci/private.h
+++ b/xen/drivers/vpci/private.h
@@ -46,8 +46,8 @@ typedef struct {
 
 int __must_check vpci_init_header(struct pci_dev *pdev);
 
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
@@ -25,6 +25,8 @@ int __must_check vpci_assign_device(stru
 /* Remove all handlers and free vpci related structures. */
 void vpci_deassign_device(struct pci_dev *pdev);
 
+int vpci_reinit_ext_capabilities(struct pci_dev *pdev);
+
 /* Generic read/write handlers for the PCI config space. */
 uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
 void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
@@ -202,6 +204,11 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, uns
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

