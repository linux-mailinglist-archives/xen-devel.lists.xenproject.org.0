Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOoTLYzgnmmCXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:44:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F5196C49
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240623.1541947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDJE-00035b-Ip; Wed, 25 Feb 2026 11:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240623.1541947; Wed, 25 Feb 2026 11:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDJE-00032Y-FP; Wed, 25 Feb 2026 11:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1240623;
 Wed, 25 Feb 2026 11:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvDJD-0002SC-1Q
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:44:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 470d1f37-123f-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 12:44:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483487335c2so58992385e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 03:44:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bffc17dasm17462215e9.2.2026.02.25.03.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:44:00 -0800 (PST)
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
X-Inumbo-ID: 470d1f37-123f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772019840; x=1772624640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qvqxSGqotIAOODsHnK2+oa0DmybL0jdHjJLUZwFNknw=;
        b=cgYfSze+bxQCzruFc3EXdrJMlZmGFyQ62Y+tWUW5Q0Om5PRRpTDKshn/Z4pnXrgbMk
         jlc95OoWL+G9JvKcfobUZjMsASfHxWMc99eK4TB2MEcf42T5oB9VFWhKVUBm0IAok/zQ
         ZREXwbTB0NGQLWwo5PuFfTMg6OTWAnlEaCOZ2Efb9/3S4IWkYmVdNNmNgLx+ESe3981B
         PpqT0/eN+5P5J/r9thcFAOh4kmr6XAcKtJso5JMCpTibD6qDtwfuRUq3pJzX3KZuHyLx
         UVq7tkgKkdmhDX2+vyAWJH3av1x+VEXMTqRlEkoFjNZxoJECcMCqbVzi7CLl1KOR8ngq
         y9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019840; x=1772624640;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvqxSGqotIAOODsHnK2+oa0DmybL0jdHjJLUZwFNknw=;
        b=Pv7N/xYE2nQWOO45xsMOXqUzYKr4iql0IfgqwzZsoGpzrwiQ/9LNliK+1DINHMKimW
         SyQT4vpk70UvNOZC+ih6coNJ0LnDkXgkgk5nvllBren7yr7sq8PVY1iAnenXIFHVAEdJ
         mLYughEY9XNcRzCRUKgiroC/aqGibE2PIx96AkRkIDWuauMrDTW/fAbWJ8mDP5PH9IYK
         LSXi9DFreW9FkGQwimDW3TZuJ1b0dSv2tTqJ+trGHmdcevHHiV++BFYSHhEY9OdBUX9V
         IyqHfpYBlyYwBerehZZIbsF02pAGG6aNSo9kEMeAt1Icz+H09Ra59dmRTibIyjEbMwFP
         yBxw==
X-Gm-Message-State: AOJu0YxN97PEU9HCQAqd3NBfvCVUDUsPLxPIA6kC/8S5sia4gBi9iLUQ
	8yvVQkVKzJ/f/Oh7zNiYxCQgWwkBSCFK3xfO1bsOiujI3+kKJc3JwN7juXq6Y9ceaX/ZRGMQk6L
	my9c=
X-Gm-Gg: ATEYQzwXbUO5zVoiywV76lFA5YhFB5p+PZ0LK7XUOBPVC5oQ+JyFh10mPXqakqvbYd4
	i6arE4wqG5chcnkzLXoBLytVQ/qNq7e/AAdBSfS9CbmUwrMGGuvu7q1f8J5wklVjNGKfLeJy9yT
	qhhO0XU7W4Wt3+TU6Wtef7ddH9CWmLBcgkp30TmDkibLgxvt2qHTPsEFZThKHBmhKI7oQtcznse
	iyKe8utJvMcShyZ5uJKyCqTr5Sv4ey/zJEFR3+IwrE6Dwpix4d2YNkVwupxS+QkEef42iKalQ4B
	xkLWG7A4Xv29OC1Srxt0/6nBK+c7L4d7IlO6ptp7icJcWv6sGgcGdNJp0qDvId4bA//mbATDVL3
	ZvWYXPLU4M+2s9jc4bdVs9Bm4K7Hscv1OvEZ+aNFlffnt4vzZOJr1teSZxds8tuyb8bYHcQipI3
	guK3LNZz0pZsxGsiaJv5ycyP84t09NKiit5ORM9L6+1noZE4xCdph3FMsOvWiaOxivz28eywfdk
	EgV48iirKrJbUA=
X-Received: by 2002:a05:600c:4f93:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-483aaa15e35mr278740115e9.18.1772019840449;
        Wed, 25 Feb 2026 03:44:00 -0800 (PST)
Message-ID: <a67efd56-5286-4f1a-829c-ed3c4526268e@suse.com>
Date: Wed, 25 Feb 2026 12:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/5] vPCI: move capability-list init
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
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 272F5196C49
X-Rspamd-Action: no action

... both for when the functions are invoked and where they live in source.
Don't invoke them directly in vpci_init_header(), but instead first thing
in vpci_init_capabilities().

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: New.

--- a/xen/drivers/vpci/cap.c
+++ b/xen/drivers/vpci/cap.c
@@ -159,15 +159,150 @@ static int vpci_ext_capability_hide(
     return 0;
 }
 
+static int vpci_init_capability_list(struct pci_dev *pdev)
+{
+    int rc;
+    bool mask_cap_list = false;
+    bool is_hwdom = is_hardware_domain(pdev->domain);
+
+    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
+    {
+        /* Only expose capabilities to the guest that vPCI can handle. */
+        unsigned int next, ttl = 48;
+        static const unsigned int supported_caps[] = {
+            PCI_CAP_ID_MSI,
+            PCI_CAP_ID_MSIX,
+        };
+        /*
+         * For dom0, we should expose all capabilities instead of a fixed
+         * capabilities array, so setting n to 0 here is to get the next
+         * capability position directly in pci_find_next_cap_ttl.
+         */
+        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
+
+        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
+                                     supported_caps, n, &ttl);
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val,
+                               is_hwdom ? vpci_hw_write8 : NULL,
+                               PCI_CAPABILITY_LIST, 1,
+                               (void *)(uintptr_t)next);
+        if ( rc )
+            return rc;
+
+        next &= ~3;
+
+        if ( !next && !is_hwdom )
+            /*
+             * If we don't have any supported capabilities to expose to the
+             * guest, mask the PCI_STATUS_CAP_LIST bit in the status
+             * register.
+             */
+            mask_cap_list = true;
+
+        while ( next && ttl )
+        {
+            unsigned int pos = next;
+
+            next = pci_find_next_cap_ttl(pdev->sbdf,
+                                         pos + PCI_CAP_LIST_NEXT,
+                                         supported_caps, n, &ttl);
+
+            if ( !is_hwdom )
+            {
+                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
+                                       pos + PCI_CAP_LIST_ID, 1, NULL);
+                if ( rc )
+                    return rc;
+            }
+
+            rc = vpci_add_register(pdev->vpci, vpci_read_val,
+                                   is_hwdom ? vpci_hw_write8 : NULL,
+                                   pos + PCI_CAP_LIST_NEXT, 1,
+                                   (void *)(uintptr_t)next);
+            if ( rc )
+                return rc;
+
+            next &= ~3;
+        }
+    }
+
+    /* Return early for the hw domain, no masking of PCI_STATUS. */
+    if ( is_hwdom )
+        return 0;
+
+    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
+    return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                  PCI_STATUS, 2, NULL,
+                                  PCI_STATUS_RO_MASK &
+                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                  PCI_STATUS_RW1C_MASK,
+                                  mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
+                                  PCI_STATUS_RSVDZ_MASK);
+}
+
+static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+
+    if ( !pdev->ext_cfg )
+        return 0;
+
+    if ( !is_hardware_domain(pdev->domain) )
+        /* Extended capabilities read as zero, write ignore for DomU */
+        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                                 pos, 4, (void *)0);
+
+    do
+    {
+        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
+        int rc;
+
+        if ( header == 0xffffffffU )
+        {
+            printk(XENLOG_WARNING
+                   "%pd %pp: broken extended cap list, offset %#x\n",
+                   pdev->domain, &pdev->sbdf, pos);
+            return 0;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
+                               pos, 4, (void *)(uintptr_t)header);
+        if ( rc == -EEXIST )
+        {
+            printk(XENLOG_WARNING
+                   "%pd %pp: overlap in extended cap list, offset %#x\n",
+                   pdev->domain, &pdev->sbdf, pos);
+            return 0;
+        }
+
+        if ( rc )
+            return rc;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    } while ( pos >= PCI_CFG_SPACE_SIZE );
+
+    return 0;
+}
+
 int vpci_init_capabilities(struct pci_dev *pdev)
 {
+    int rc;
+
+    rc = vpci_init_capability_list(pdev);
+    if ( rc )
+        return rc;
+
+    rc = vpci_init_ext_capability_list(pdev);
+    if ( rc )
+        return rc;
+
     for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
     {
         const vpci_capability_t *capability = &__start_vpci_array[i];
         const unsigned int cap = capability->id;
         const bool is_ext = capability->is_ext;
         unsigned int pos = 0;
-        int rc;
 
         if ( !is_ext )
             pos = pci_find_cap_offset(pdev->sbdf, cap);
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -744,132 +744,6 @@ static int bar_add_rangeset(const struct
     return !bar->mem ? -ENOMEM : 0;
 }
 
-static int vpci_init_capability_list(struct pci_dev *pdev)
-{
-    int rc;
-    bool mask_cap_list = false;
-    bool is_hwdom = is_hardware_domain(pdev->domain);
-
-    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
-    {
-        /* Only expose capabilities to the guest that vPCI can handle. */
-        unsigned int next, ttl = 48;
-        static const unsigned int supported_caps[] = {
-            PCI_CAP_ID_MSI,
-            PCI_CAP_ID_MSIX,
-        };
-        /*
-         * For dom0, we should expose all capabilities instead of a fixed
-         * capabilities array, so setting n to 0 here is to get the next
-         * capability position directly in pci_find_next_cap_ttl.
-         */
-        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
-
-        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
-                                     supported_caps, n, &ttl);
-
-        rc = vpci_add_register(pdev->vpci, vpci_read_val,
-                               is_hwdom ? vpci_hw_write8 : NULL,
-                               PCI_CAPABILITY_LIST, 1,
-                               (void *)(uintptr_t)next);
-        if ( rc )
-            return rc;
-
-        next &= ~3;
-
-        if ( !next && !is_hwdom )
-            /*
-             * If we don't have any supported capabilities to expose to the
-             * guest, mask the PCI_STATUS_CAP_LIST bit in the status
-             * register.
-             */
-            mask_cap_list = true;
-
-        while ( next && ttl )
-        {
-            unsigned int pos = next;
-
-            next = pci_find_next_cap_ttl(pdev->sbdf,
-                                         pos + PCI_CAP_LIST_NEXT,
-                                         supported_caps, n, &ttl);
-
-            if ( !is_hwdom )
-            {
-                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
-                                       pos + PCI_CAP_LIST_ID, 1, NULL);
-                if ( rc )
-                    return rc;
-            }
-
-            rc = vpci_add_register(pdev->vpci, vpci_read_val,
-                                   is_hwdom ? vpci_hw_write8 : NULL,
-                                   pos + PCI_CAP_LIST_NEXT, 1,
-                                   (void *)(uintptr_t)next);
-            if ( rc )
-                return rc;
-
-            next &= ~3;
-        }
-    }
-
-    /* Return early for the hw domain, no masking of PCI_STATUS. */
-    if ( is_hwdom )
-        return 0;
-
-    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
-    return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
-                                  PCI_STATUS, 2, NULL,
-                                  PCI_STATUS_RO_MASK &
-                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
-                                  PCI_STATUS_RW1C_MASK,
-                                  mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
-                                  PCI_STATUS_RSVDZ_MASK);
-}
-
-static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
-{
-    unsigned int pos = PCI_CFG_SPACE_SIZE;
-
-    if ( !pdev->ext_cfg )
-        return 0;
-
-    if ( !is_hardware_domain(pdev->domain) )
-        /* Extended capabilities read as zero, write ignore for DomU */
-        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
-                                 pos, 4, (void *)0);
-
-    do
-    {
-        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
-        int rc;
-
-        if ( header == 0xffffffffU )
-        {
-            printk(XENLOG_WARNING
-                   "%pd %pp: broken extended cap list, offset %#x\n",
-                   pdev->domain, &pdev->sbdf, pos);
-            return 0;
-        }
-
-        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
-                               pos, 4, (void *)(uintptr_t)header);
-        if ( rc == -EEXIST )
-        {
-            printk(XENLOG_WARNING
-                   "%pd %pp: overlap in extended cap list, offset %#x\n",
-                   pdev->domain, &pdev->sbdf, pos);
-            return 0;
-        }
-
-        if ( rc )
-            return rc;
-
-        pos = PCI_EXT_CAP_NEXT(header);
-    } while ( pos >= PCI_CFG_SPACE_SIZE );
-
-    return 0;
-}
-
 int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -918,14 +792,6 @@ int vpci_init_header(struct pci_dev *pde
     if ( rc )
         return rc;
 
-    rc = vpci_init_capability_list(pdev);
-    if ( rc )
-        return rc;
-
-    rc = vpci_init_ext_capability_list(pdev);
-    if ( rc )
-        return rc;
-
     if ( pdev->ignore_bars )
         return 0;
 


