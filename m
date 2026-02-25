Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI34JHTgnmmCXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:43:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0995196C2D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 12:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240610.1541936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDIm-0002Vc-7y; Wed, 25 Feb 2026 11:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240610.1541936; Wed, 25 Feb 2026 11:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvDIm-0002Ti-4n; Wed, 25 Feb 2026 11:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1240610;
 Wed, 25 Feb 2026 11:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvDIl-0002SC-BY
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 11:43:35 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36268e7e-123f-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 12:43:32 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso46010455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 03:43:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd6f19d6sm66613375e9.2.2026.02.25.03.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:43:31 -0800 (PST)
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
X-Inumbo-ID: 36268e7e-123f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772019812; x=1772624612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uAgcdDfpsSw1jsAfrY2aV1rXdVm2j1GaT1wB7ahB0HM=;
        b=hCtIPvNF0GAePeUiht/dviW63m76RF4YyJF6dsyKcrLD6VNhnS2Op0t2SCsnT7qp4F
         AkXhg2ou0WCG9lpt+GRp8QhnlFex7V1OZGQfYuE8ORZyht+278l2Lnv4LlBG8lYEb0k6
         EYlBoTn8W38xp5BGg9FdUylfT0qpuUZgquHBZA/zVbMDhoakiebSP6qo151jFY4IQWl9
         WUzTTOXd/7umiVH6TZrr00v8TNLXXEJ2DdOkJXmIdvWI7aZyqOEpmqZXbW8QT7a+Z/Fm
         HYlfWPf/RzWM0awhoPIVgFwdrGiuIi7oj1PY+NZ+EqUbJyb0d2Q+vD5iNdQBfi1eHTPH
         uJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019812; x=1772624612;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAgcdDfpsSw1jsAfrY2aV1rXdVm2j1GaT1wB7ahB0HM=;
        b=wFlwNvhpJMWhenu1uRkJtJnCu+qy6n/VLPsgNorbBXteTCOZZkMIOS70+Fux0xHO0w
         mLRlfz9J1cpr6X+48Y/o7Ni/ibP3W5lNeuXAQpHAKPpY3LMUPFqJU6iOPJ+zIesSbiw3
         R+BC25j8Wa79wZqIlVohzlycISRiWGI3uJUVge5VG9ccSjeCOE+opLIp1c41h6+y+GaZ
         mmCMFdzlp0mhoUWImD1lO5Za9tOJVfUGSkYQgb3PLb1gsr2salCmJ6ASuY8fm6Q5blwi
         PulX4bBG+NoUYy6PXB4b5wqYZ+OcXFlMZRb+K622E7nhIdo791/OB5x19RA572U4V4gX
         X/Yg==
X-Gm-Message-State: AOJu0YypdJl+x4GV/j0hh8MHLVzvTHANTqtsxV5fxdd8nE10pe97lvxD
	iYhWpPDpvsjD/cG8NPzoeQUuF3zJX8bceD5/AOmLxADF7cizt73Ir0Hq+aPSt9zSXrMyhiqkgTU
	V0/Q=
X-Gm-Gg: ATEYQzww0k1DvocuMsfQhLUDMcVEhrCCveKJhJ1Fq0BySvX7YhxftIUUsxinJmn2ub/
	NvmjItcDS9yLfxE0zCXA/4CTJJp/lByPAopseM+5pLFKkwZ05ZSBQdVcm1b0lFHz2ssM77h4zfc
	oZ2bOvnNAqy/KTWQEzBRt1vB6Bn+Jx0VPPUC1zwbfJpuhPuKXKXvtjS590NLjR+bQSDC/4KgawT
	xsgIXuZ1d4LbM1+YLkzNlZnG4Jsw14XaKGfLC4hMMALP7H6/I5V0A165lNfuLz1rg8dBmQdySjZ
	oEMRexBzRJ0/xTSanWS3al9ax9wuoGCN9Q3TA0unUsL8+/b8OWXbHIczOD6wnYBDCVHwYZlrD0Z
	9FunbIhn9xFFU++hH8fraeoA+KrcZXHCtj5h3yfVdbLzfYIkDT05WIL8JD+vTEnNGcYMDY3tTA+
	yIqhOqR2llbViUhNPEvfuHuGboOEhfoCmFeKIgJer07o+7zKYoLcZ3eZ4hQoKou5tQGmjBttdpu
	HCBRsl20ZZJiMw=
X-Received: by 2002:a05:600c:a016:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-483a962e470mr270138675e9.17.1772019811947;
        Wed, 25 Feb 2026 03:43:31 -0800 (PST)
Message-ID: <ccd3c017-9f01-4695-9ec1-fe22fc01b9b4@suse.com>
Date: Wed, 25 Feb 2026 12:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/5] vPCI: move vpci_init_capabilities() to a separate file
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,amd.com:email];
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
X-Rspamd-Queue-Id: F0995196C2D
X-Rspamd-Action: no action

Let's keep capability handling together. Start with moving
vpci_init_capabilities() and its helpers, plus splitting out of its
cleanup counterpart.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
vpci_get_register(), while now only used by cap.c, didn't look like it
would want moving there.
---
v4: New.

--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1,2 +1,3 @@
+obj-y += cap.o
 obj-y += vpci.o header.o rebar.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
--- /dev/null
+++ b/xen/drivers/vpci/cap.c
@@ -0,0 +1,252 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Capability handling for guest PCI configuration space.
+ */
+
+#include "private.h"
+
+#include <xen/sched.h>
+
+extern const vpci_capability_t __start_vpci_array[];
+extern const vpci_capability_t __end_vpci_array[];
+#define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
+
+static struct vpci_register *vpci_get_previous_cap_register(
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int next;
+    struct vpci_register *r;
+
+    if ( offset < 0x40 )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
+          r = next >= 0x40 ? vpci_get_register(vpci,
+                                               next + PCI_CAP_LIST_NEXT, 1)
+                           : NULL )
+    {
+        next = (unsigned int)(uintptr_t)r->private;
+        ASSERT(next == (uintptr_t)r->private);
+        if ( next == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
+    struct vpci_register *prev_r, *next_r;
+    struct vpci *vpci = pdev->vpci;
+
+    if ( !offset )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    prev_r = vpci_get_previous_cap_register(vpci, offset);
+    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
+    if ( !prev_r || !next_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    prev_r->private = next_r->private;
+    /*
+     * Not calling vpci_remove_registers() here is to avoid redoing
+     * the register search.
+     */
+    list_del(&next_r->node);
+    spin_unlock(&vpci->lock);
+    xfree(next_r);
+
+    if ( !is_hardware_domain(pdev->domain) )
+        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
+
+    return 0;
+}
+
+static struct vpci_register *vpci_get_previous_ext_cap_register(
+    const struct vpci *vpci, unsigned int offset)
+{
+    unsigned int pos = PCI_CFG_SPACE_SIZE;
+    struct vpci_register *r;
+
+    if ( offset <= PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    for ( r = vpci_get_register(vpci, pos, 4); r;
+          r = pos > PCI_CFG_SPACE_SIZE ? vpci_get_register(vpci, pos, 4)
+                                       : NULL )
+    {
+        uint32_t header = (uint32_t)(uintptr_t)r->private;
+
+        ASSERT(header == (uintptr_t)r->private);
+
+        pos = PCI_EXT_CAP_NEXT(header);
+        if ( pos == offset )
+            break;
+    }
+
+    return r;
+}
+
+static int vpci_ext_capability_hide(
+    const struct pci_dev *pdev, unsigned int cap)
+{
+    const unsigned int offset = pci_find_ext_capability(pdev, cap);
+    struct vpci_register *r, *prev_r;
+    struct vpci *vpci = pdev->vpci;
+    uint32_t header, pre_header;
+
+    if ( offset < PCI_CFG_SPACE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    spin_lock(&vpci->lock);
+    r = vpci_get_register(vpci, offset, 4);
+    if ( !r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    header = (uint32_t)(uintptr_t)r->private;
+    if ( offset == PCI_CFG_SPACE_SIZE )
+    {
+        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
+            r->private = (void *)0;
+        else
+            /*
+             * The first extended capability (0x100) can not be removed from
+             * the linked list, so instead mask its capability ID to return 0
+             * hopefully forcing OSes to skip it.
+             */
+            r->private = (void *)(uintptr_t)(header & ~PCI_EXT_CAP_ID(header));
+
+        spin_unlock(&vpci->lock);
+        return 0;
+    }
+
+    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
+    if ( !prev_r )
+    {
+        spin_unlock(&vpci->lock);
+        return -ENODEV;
+    }
+
+    pre_header = (uint32_t)(uintptr_t)prev_r->private;
+    pre_header &= ~PCI_EXT_CAP_NEXT_MASK;
+    pre_header |= header & PCI_EXT_CAP_NEXT_MASK;
+    prev_r->private = (void *)(uintptr_t)pre_header;
+
+    list_del(&r->node);
+    spin_unlock(&vpci->lock);
+    xfree(r);
+
+    return 0;
+}
+
+int vpci_init_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = &__start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        const bool is_ext = capability->is_ext;
+        unsigned int pos = 0;
+        int rc;
+
+        if ( !is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( is_hardware_domain(pdev->domain) )
+            pos = pci_find_ext_capability(pdev, cap);
+
+        if ( !pos )
+            continue;
+
+        rc = capability->init(pdev);
+        if ( rc )
+        {
+            const char *type = is_ext ? "extended" : "legacy";
+
+            printk(XENLOG_WARNING
+                   "%pd %pp: init %s cap %u fail rc=%d, mask it\n",
+                   pdev->domain, &pdev->sbdf, type, cap, rc);
+
+            if ( capability->cleanup )
+            {
+                rc = capability->cleanup(pdev, true);
+                if ( rc )
+                {
+                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                           pdev->domain, &pdev->sbdf, type, cap, rc);
+                    if ( !is_hardware_domain(pdev->domain) )
+                        return rc;
+                }
+            }
+
+            if ( !is_ext )
+                rc = vpci_capability_hide(pdev, cap);
+            else
+                rc = vpci_ext_capability_hide(pdev, cap);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
+                       pdev->domain, &pdev->sbdf, type, cap, rc);
+                return rc;
+            }
+        }
+    }
+
+    return 0;
+}
+
+void vpci_cleanup_capabilities(struct pci_dev *pdev)
+{
+    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = &__start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        unsigned int pos = 0;
+
+        if ( !capability->cleanup )
+            continue;
+
+        if ( !capability->is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( is_hardware_domain(pdev->domain) )
+            pos = pci_find_ext_capability(pdev, cap);
+        if ( pos )
+        {
+            int rc = capability->cleanup(pdev, false);
+
+            if ( rc )
+                printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                       pdev->domain, &pdev->sbdf,
+                       capability->is_ext ? "extended" : "legacy", cap, rc);
+        }
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/drivers/vpci/private.h
+++ b/xen/drivers/vpci/private.h
@@ -9,6 +9,20 @@ typedef uint32_t vpci_read_t(const struc
 typedef void vpci_write_t(const struct pci_dev *pdev, unsigned int reg,
                           uint32_t val, void *data);
 
+/* Internal struct to store the emulated PCI registers. */
+struct vpci_register {
+    vpci_read_t *read;
+    vpci_write_t *write;
+    unsigned int size;
+    unsigned int offset;
+    void *private;
+    struct list_head node;
+    uint32_t ro_mask;
+    uint32_t rw1c_mask;
+    uint32_t rsvdp_mask;
+    uint32_t rsvdz_mask;
+};
+
 typedef struct {
     unsigned int id;
     bool is_ext;
@@ -32,6 +46,9 @@ typedef struct {
 
 int __must_check vpci_init_header(struct pci_dev *pdev);
 
+int vpci_init_capabilities(struct pci_dev *pdev);
+void vpci_cleanup_capabilities(struct pci_dev *pdev);
+
 /* Add/remove a register handler. */
 int __must_check vpci_add_register_mask(struct vpci *vpci,
                                         vpci_read_t *read_handler,
@@ -49,6 +66,10 @@ int __must_check vpci_add_register(struc
 int vpci_remove_registers(struct vpci *vpci, unsigned int start,
                           unsigned int size);
 
+struct vpci_register *vpci_get_register(const struct vpci *vpci,
+                                        unsigned int offset,
+                                        unsigned int size);
+
 /* Helper to return the value passed in data. */
 uint32_t cf_check vpci_read_val(
     const struct pci_dev *pdev, unsigned int reg, void *data);
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -22,24 +22,7 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
-/* Internal struct to store the emulated PCI registers. */
-struct vpci_register {
-    vpci_read_t *read;
-    vpci_write_t *write;
-    unsigned int size;
-    unsigned int offset;
-    void *private;
-    struct list_head node;
-    uint32_t ro_mask;
-    uint32_t rw1c_mask;
-    uint32_t rsvdp_mask;
-    uint32_t rsvdz_mask;
-};
-
 #ifdef __XEN__
-extern const vpci_capability_t __start_vpci_array[];
-extern const vpci_capability_t __end_vpci_array[];
-#define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
 static int assign_virtual_sbdf(struct pci_dev *pdev)
@@ -84,9 +67,9 @@ static int assign_virtual_sbdf(struct pc
 
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
-static struct vpci_register *vpci_get_register(const struct vpci *vpci,
-                                               unsigned int offset,
-                                               unsigned int size)
+struct vpci_register *vpci_get_register(const struct vpci *vpci,
+                                        unsigned int offset,
+                                        unsigned int size)
 {
     struct vpci_register *r;
 
@@ -104,209 +87,6 @@ static struct vpci_register *vpci_get_re
     return NULL;
 }
 
-static struct vpci_register *vpci_get_previous_cap_register(
-    const struct vpci *vpci, unsigned int offset)
-{
-    unsigned int next;
-    struct vpci_register *r;
-
-    if ( offset < 0x40 )
-    {
-        ASSERT_UNREACHABLE();
-        return NULL;
-    }
-
-    for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
-          r = next >= 0x40 ? vpci_get_register(vpci,
-                                               next + PCI_CAP_LIST_NEXT, 1)
-                           : NULL )
-    {
-        next = (unsigned int)(uintptr_t)r->private;
-        ASSERT(next == (uintptr_t)r->private);
-        if ( next == offset )
-            break;
-    }
-
-    return r;
-}
-
-static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
-{
-    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
-    struct vpci_register *prev_r, *next_r;
-    struct vpci *vpci = pdev->vpci;
-
-    if ( !offset )
-    {
-        ASSERT_UNREACHABLE();
-        return 0;
-    }
-
-    spin_lock(&vpci->lock);
-    prev_r = vpci_get_previous_cap_register(vpci, offset);
-    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
-    if ( !prev_r || !next_r )
-    {
-        spin_unlock(&vpci->lock);
-        return -ENODEV;
-    }
-
-    prev_r->private = next_r->private;
-    /*
-     * Not calling vpci_remove_registers() here is to avoid redoing
-     * the register search.
-     */
-    list_del(&next_r->node);
-    spin_unlock(&vpci->lock);
-    xfree(next_r);
-
-    if ( !is_hardware_domain(pdev->domain) )
-        return vpci_remove_registers(vpci, offset + PCI_CAP_LIST_ID, 1);
-
-    return 0;
-}
-
-static struct vpci_register *vpci_get_previous_ext_cap_register(
-    const struct vpci *vpci, unsigned int offset)
-{
-    unsigned int pos = PCI_CFG_SPACE_SIZE;
-    struct vpci_register *r;
-
-    if ( offset <= PCI_CFG_SPACE_SIZE )
-    {
-        ASSERT_UNREACHABLE();
-        return NULL;
-    }
-
-    for ( r = vpci_get_register(vpci, pos, 4); r;
-          r = pos > PCI_CFG_SPACE_SIZE ? vpci_get_register(vpci, pos, 4)
-                                       : NULL )
-    {
-        uint32_t header = (uint32_t)(uintptr_t)r->private;
-
-        ASSERT(header == (uintptr_t)r->private);
-
-        pos = PCI_EXT_CAP_NEXT(header);
-        if ( pos == offset )
-            break;
-    }
-
-    return r;
-}
-
-static int vpci_ext_capability_hide(
-    const struct pci_dev *pdev, unsigned int cap)
-{
-    const unsigned int offset = pci_find_ext_capability(pdev, cap);
-    struct vpci_register *r, *prev_r;
-    struct vpci *vpci = pdev->vpci;
-    uint32_t header, pre_header;
-
-    if ( offset < PCI_CFG_SPACE_SIZE )
-    {
-        ASSERT_UNREACHABLE();
-        return 0;
-    }
-
-    spin_lock(&vpci->lock);
-    r = vpci_get_register(vpci, offset, 4);
-    if ( !r )
-    {
-        spin_unlock(&vpci->lock);
-        return -ENODEV;
-    }
-
-    header = (uint32_t)(uintptr_t)r->private;
-    if ( offset == PCI_CFG_SPACE_SIZE )
-    {
-        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
-            r->private = (void *)0;
-        else
-            /*
-             * The first extended capability (0x100) can not be removed from
-             * the linked list, so instead mask its capability ID to return 0
-             * hopefully forcing OSes to skip it.
-             */
-            r->private = (void *)(uintptr_t)(header & ~PCI_EXT_CAP_ID(header));
-
-        spin_unlock(&vpci->lock);
-        return 0;
-    }
-
-    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
-    if ( !prev_r )
-    {
-        spin_unlock(&vpci->lock);
-        return -ENODEV;
-    }
-
-    pre_header = (uint32_t)(uintptr_t)prev_r->private;
-    pre_header &= ~PCI_EXT_CAP_NEXT_MASK;
-    pre_header |= header & PCI_EXT_CAP_NEXT_MASK;
-    prev_r->private = (void *)(uintptr_t)pre_header;
-
-    list_del(&r->node);
-    spin_unlock(&vpci->lock);
-    xfree(r);
-
-    return 0;
-}
-
-static int vpci_init_capabilities(struct pci_dev *pdev)
-{
-    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        const vpci_capability_t *capability = &__start_vpci_array[i];
-        const unsigned int cap = capability->id;
-        const bool is_ext = capability->is_ext;
-        unsigned int pos = 0;
-        int rc;
-
-        if ( !is_ext )
-            pos = pci_find_cap_offset(pdev->sbdf, cap);
-        else if ( is_hardware_domain(pdev->domain) )
-            pos = pci_find_ext_capability(pdev, cap);
-
-        if ( !pos )
-            continue;
-
-        rc = capability->init(pdev);
-        if ( rc )
-        {
-            const char *type = is_ext ? "extended" : "legacy";
-
-            printk(XENLOG_WARNING
-                   "%pd %pp: init %s cap %u fail rc=%d, mask it\n",
-                   pdev->domain, &pdev->sbdf, type, cap, rc);
-
-            if ( capability->cleanup )
-            {
-                rc = capability->cleanup(pdev, true);
-                if ( rc )
-                {
-                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
-                           pdev->domain, &pdev->sbdf, type, cap, rc);
-                    if ( !is_hardware_domain(pdev->domain) )
-                        return rc;
-                }
-            }
-
-            if ( !is_ext )
-                rc = vpci_capability_hide(pdev, cap);
-            else
-                rc = vpci_ext_capability_hide(pdev, cap);
-            if ( rc )
-            {
-                printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
-                       pdev->domain, &pdev->sbdf, type, cap, rc);
-                return rc;
-            }
-        }
-    }
-
-    return 0;
-}
-
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -322,29 +102,7 @@ void vpci_deassign_device(struct pci_dev
                     &pdev->domain->vpci_dev_assigned_map);
 #endif
 
-    for ( i = 0; i < NUM_VPCI_INIT; i++ )
-    {
-        const vpci_capability_t *capability = &__start_vpci_array[i];
-        const unsigned int cap = capability->id;
-        unsigned int pos = 0;
-
-        if ( !capability->cleanup )
-            continue;
-
-        if ( !capability->is_ext )
-            pos = pci_find_cap_offset(pdev->sbdf, cap);
-        else if ( is_hardware_domain(pdev->domain) )
-            pos = pci_find_ext_capability(pdev, cap);
-        if ( pos )
-        {
-            int rc = capability->cleanup(pdev, false);
-
-            if ( rc )
-                printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
-                       pdev->domain, &pdev->sbdf,
-                       capability->is_ext ? "extended" : "legacy", cap, rc);
-        }
-    }
+    vpci_cleanup_capabilities(pdev);
 
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )


