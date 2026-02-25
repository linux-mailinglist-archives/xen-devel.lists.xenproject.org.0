Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKXyLrjgnmmCXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:44:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30D196CAB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240639.1541967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDJx-00045V-1p; Wed, 25 Feb 2026 11:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240639.1541967; Wed, 25 Feb 2026 11:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDJw-00042W-Ut; Wed, 25 Feb 2026 11:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1240639;
 Wed, 25 Feb 2026 11:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvDJv-0002tl-PO
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:44:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6260a9a1-123f-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 12:44:46 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4398f8403edso485490f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 03:44:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c977sm35949921f8f.32.2026.02.25.03.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:44:45 -0800 (PST)
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
X-Inumbo-ID: 6260a9a1-123f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772019886; x=1772624686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5hnVqcplaxx7N9eKjGfFgGadhHdC3ywA3qjLGFALOaQ=;
        b=FPv32s3VUBMK+sHKJzGJ0a9wSV7ydqv8ZmX1ejpzsUcnwK1b2fxWqgUSGzRJ2MRURj
         DWwPy49tz/wNJUPEoq3mRLlQvVVDHzRPfzBSvNHLp+2v5h2y7/7DfIluNyKG6xTecYlY
         foxqs+VJqssJMkvYriyBjMuRPykEqXpp1vEw6nPXPLJm/WJTzkVNLGNMeL01eWRRdbl+
         VQlOzk2B1sl91JhLcMO5gLoOkeV70xFDFiLpPXPt3pxXcstoqNv7TN3oJEjgvAfDZDxy
         sPAc2+ILGPdweFLbtsmeiPtTFEFwMw1e/GwTVBOQDw2XNX1xx72cXFX5EADDbHdZRMP2
         Ij7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019886; x=1772624686;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hnVqcplaxx7N9eKjGfFgGadhHdC3ywA3qjLGFALOaQ=;
        b=AQuseMMDSDN8n3CFQ7YTRwnk8XjaHJLE53vuP4joNwzA/ZL0nu0njj3OXJ/P6ZxN98
         ynsiXTzZD33yMOHbiIRH6niNZjtInaczfAqcE9ceii/ifLnmdgalHIgU5HOwyBuSQmih
         e08ods55YHwHmGxIy3ORZlXuAO+QGpfTheXAU1ShcnUEJ3YEi1nksvuPtZCNvGq6PeeJ
         fYIbz2fQTj2fNLxVDu2izppY2bxYx3wSWQIUqKdAT2pvQll3RVNL1pxvoQEjtfCgjrW5
         ahFFbrlaQ0LRyY900o6v1mrTHoxeuhkxsqMPLy5DIvjx4XUuMVeAB7W6vW6iG8+ePIdd
         LdJQ==
X-Gm-Message-State: AOJu0YxHLApdx56Q+flogWBndwJzFvn5dF6MdOXIGHNozQjqIZl/LwrE
	v282nKaCFkymsyy9gMY9mi/xYuYfkm/sGl1mtqiZRXvsKcwAdOsnbUBnH9FeU6MEuDNQGPjFg9/
	VEp4=
X-Gm-Gg: ATEYQzwundrQBW+C7q2MUIJjmCb8Wsz1dEOYw97aQr4+8fhDHChyL4f7zBG2vNBDmjl
	gTAuhlSXXV5vKGI0oSMFTiY/MvKDYO5F8sP5zjveSQ8VhsCrgjXRJ5c7wYor8N5HUApj3CJ/Vti
	cXsy9dL8EIh27LEWliZlilzpxGSAQ6MhGen5uT6rXUuYrlezpNRepGOoPCY6CRWp9siDdj9Okz7
	Sr/0j1+Cod1WaDuSHPxJnQYXhL2qe92mPBlECs03SKXB2SMvUcnPcY6hQIwO9wcnlAGiCG6Wqo4
	pu8kSFHnbYq73fCm55X2mF2OlBm/mdoffuRMVsUWbGgDvahBp4m6BBNh5aPTN7Vr4Q1F0xDUkrA
	fFLa2/6yVVNq6g3f+3JH+oj/BLIXcra3jwdPa8WH5h21WDnDM1W19U/t8edb3tbzZJMRWSZW+s6
	4GVYqcJWrhVHtqcuOhx0IffSyQCKaQalgDVX95UrDAUB4dUvYeFlFO3ZoSgQXX2tNMLaBtwaHmv
	+FvLub1tW0AUBE=
X-Received: by 2002:a05:6000:1867:b0:439:9312:4b72 with SMTP id ffacd0b85a97d-439942ed0b3mr265421f8f.30.1772019886133;
        Wed, 25 Feb 2026 03:44:46 -0800 (PST)
Message-ID: <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
Date: Wed, 25 Feb 2026 12:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
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
In-Reply-To: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2C30D196CAB
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
vpci_reinit_ext_capabilities()'es return value is checked only to log an
error; it doesn't feel quite right to fail the hypercall because of this.
Roger brought up the idea of de-assigning the device in such a case, but
if a driver doesn't use extended capabilities the device would likely
continue to work fine, for Dom0 this probably wouldn't be quite right
anyway, and it's also unclear whether calling deassign_device() could be
done from this context. Something like what pci_check_disable_device()
does may be an option, if we really think we need to "break" the device.

The use of is_hardware_domain() in vpci_cleanup_capabilities() was
uncommented and hence is left so. Shouldn't there be a DomU-related TODO
or FIXME?
---
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
@@ -169,8 +171,17 @@ int cf_check physdev_check_pci_extcfg(st
 
     ASSERT(pdev->seg == info->segment);
     if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
+    {
+        int rc;
+
         pci_check_extcfg(pdev);
 
+        rc = vpci_reinit_ext_capabilities(pdev);
+        if ( rc )
+            gprintk(XENLOG_ERR, "%pp(%pd): vPCI extcap reinit failed: %d\n",
+                    &pdev->sbdf, pdev->domain, rc);
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
 
@@ -349,22 +352,23 @@ int vpci_init_capabilities(struct pci_de
     return 0;
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
+         * Cannot call pci_find_ext_capability() here, as extended config
+         * space may (no longer) be accessible.
+         */
+        if ( capability->is_ext
+             ? is_hardware_domain(pdev->domain)
+             : !ext_only && pci_find_cap_offset(pdev->sbdf, cap) )
         {
             int rc = capability->cleanup(pdev, false);
 
@@ -376,6 +380,28 @@ void vpci_cleanup_capabilities(struct pc
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
+    if ( pdev->domain )
+        ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_io);
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


