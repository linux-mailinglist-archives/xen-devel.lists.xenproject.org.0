Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO7sENpbe2nXEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:08:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3598B0434
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216428.1526384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRlB-0003Zf-HN; Thu, 29 Jan 2026 13:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216428.1526384; Thu, 29 Jan 2026 13:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRlB-0003XT-E9; Thu, 29 Jan 2026 13:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1216428;
 Thu, 29 Jan 2026 13:08:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlRlA-0003Nf-91
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:08:32 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bdfc517-fd13-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 14:08:31 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42fb2314eb0so866782f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 05:08:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354205sm14915758f8f.41.2026.01.29.05.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 05:08:30 -0800 (PST)
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
X-Inumbo-ID: 9bdfc517-fd13-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769692111; x=1770296911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+psAJ7UCo75ato/kJWZ5qYPGZM3zv9DbaC1Tdx5QNA=;
        b=V0jsGFMnuwZkB7sn5El70nZs43+R9TQuk0iaBLOWnWB/aE7f38HoR5c+zfjRhahsE/
         CNAozeGQaivKCN032ATAZbbrFbufe8vi+zt+UDnDcqz4z1Sf5IjSe2YFAvEG+tInMRx6
         lgtHfBy1OSaS4IjWAxpbRxxzaOYAmqC6uceuAZgGz32VkbXsnV/hM3sXicrzcxkG8zn1
         +SIVzVjRLJC08B5kNisc6gNjhnrvh8utPHGHs2YOgEUPJH3VoynVtuz3cZdFiv+RNKnt
         gF9KY4MbG7hDvMi/4fTZSYD2fFf9XhpHHi7fujltXA7JF+QfxYAJxMNYocHOf1hVZNNR
         3JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769692111; x=1770296911;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+psAJ7UCo75ato/kJWZ5qYPGZM3zv9DbaC1Tdx5QNA=;
        b=Z3DvvryfzFi1I3X02nRb++zTOxHHWKcDPcYb0GcPdstEqSO2orP0Lk43+/gXejzX8r
         fx0McabrtgsQ4LiPS62WBWMFwZzNAMP2TEpDFRv2iA0bU9n2saOJNUL62CbXIHMY25c4
         CMZK+RrpU9BRgjVZROCiCqBVkqzTv4MUQQpQJIWGUHHXjOg33Cf2yvaBuGRh8ZC8Tqyn
         eoAn/9zYRYhnX87zANlljsL5N7rQYbiR452muydfpdZLu350QDGqIe/AO/Jnti2QsIcl
         kGSsH8AoS76EBwbeilnbim92Dd403gNQtLQKvpKdvyXGS+Ae1+hkZZINmxx/bUpmC6Pg
         bkhQ==
X-Gm-Message-State: AOJu0YztukGSP8Ziya12Ka01znc4dIeeXg/Qvd9jDiOKbNQu+S4P1zzr
	i9sfB+s+8bIalL9iyOTSShCATUuHAC4pkl619XZcC9FdQLV2PzgzjHMhjpIadu7ZRPu3Tf4Bzyj
	7Ii4nkw==
X-Gm-Gg: AZuq6aJZkR+8rFukM/CqyZpOXGRF8F+AdxBsrqzs1HTw7DSmlg9R5xmFqr0sWfMyA6W
	ROCf5MRA3boahCjqAe32y2PvhLNU1J3zvNt/Z51TyfCBTMlYz+bLuFxMypuE6dllIe+AB0oHnF7
	s+LFM1Dhru9ORIE3rq0IVGv0nSG1PafcQ66j8cUyBSvBF7Rm4+lhHRW+djH1ciNsAt4mBgloamO
	iwD5dEvSRFNyANeYDnBKIg3T6s/iKeJ+q9RWfBOl0FS6sWTvxGZzXaZOunrcbswG1VQ3EsT3MSO
	K6JS+7wVu1+suTSTBtdGcgM3rLvSceblq/jUiSlTFcYSw7JJGNPK1H1ZBOrSHBxZeqck+3/lF10
	e1zA/lbW06lfwVvnI6Sbe6Dq5vnMl1jq5A9e7WzBpkckUVN0w6U+zarWxrtX8TyFaK0u0E9hgT3
	LQLGdSExDSnM1uiK2ZO8PtwyJ/OuQV8jh3TUrfGrW3k2oDkRwrILZmllHVGTaMbMATx773swn0A
	9Y=
X-Received: by 2002:a05:6000:1786:b0:433:42d1:f71f with SMTP id ffacd0b85a97d-435dd1c1d59mr13079823f8f.38.1769692110530;
        Thu, 29 Jan 2026 05:08:30 -0800 (PST)
Message-ID: <99d45a27-ce67-4f10-9883-dba96f055285@suse.com>
Date: Thu, 29 Jan 2026 14:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/6] PCI: determine whether a device has extended config
 space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
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
In-Reply-To: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3598B0434
X-Rspamd-Action: no action

Legacy PCI devices don't have any extended config space. Reading any part
thereof may return all ones or other arbitrary data, e.g. in some cases
base config space contents repeatedly.

Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
determination of device type; in particular some comments are taken
verbatim from there. Like with Linux'es CONFIG_PCI_QUIRKS, only the alias
detection logic is covered by the new "pci=no-quirks". The singular access
at PCI_CFG_SPACE_SIZE is left unconditional.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
The warning near the bottom of pci_check_extcfg() may be issued multiple
times for a single device now. Should we try to avoid that?

Note that no vPCI adjustments are done here, but they're going to be
needed: Whatever requires extended capabilities will need re-
evaluating / newly establishing / tearing down in case an invocation of
PHYSDEVOP_pci_mmcfg_reserved alters global state.
---
v3: Add command line (sub-)option.
v2: Major re-work to also check upon PHYSDEVOP_pci_mmcfg_reserved
    invocation.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2009,12 +2009,21 @@ Only effective if CONFIG_PARTIAL_EMULATI
 behavior.**
 
 ### pci
-    = List of [ serr=<bool>, perr=<bool> ]
+    = List of [ serr=<bool>, perr=<bool>, quirks=<bool> ]
+
+* `serr` and `perr`
 
     Default: Signaling left as set by firmware.
 
-Override the firmware settings, and explicitly enable or disable the
-signalling of PCI System and Parity errors.
+  Override the firmware settings, and explicitly enable or disable the
+  signalling of PCI System and Parity errors.
+
+* `quirks`
+
+    Default: `on`
+
+  In its negative form, allows to suppress certain quirk workarounds, in case
+  they cause issues.
 
 ### pci-phantom
 > `=[<seg>:]<bus>:<device>,<stride>`
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -22,6 +22,8 @@ int physdev_map_pirq(struct domain *d, i
                      struct msi_info *msi);
 int physdev_unmap_pirq(struct domain *d, int pirq);
 
+int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg);
+
 #include "x86_64/mmconfig.h"
 
 #ifndef COMPAT
@@ -160,6 +162,17 @@ int physdev_unmap_pirq(struct domain *d,
 
     return ret;
 }
+
+int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg)
+{
+    const struct physdev_pci_mmcfg_reserved *info = arg;
+
+    ASSERT(pdev->seg == info->segment);
+    if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
+        pci_check_extcfg(pdev);
+
+    return 0;
+}
 #endif /* COMPAT */
 
 ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
@@ -511,6 +524,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
 
         ret = pci_mmcfg_reserved(info.address, info.segment,
                                  info.start_bus, info.end_bus, info.flags);
+
+        if ( !ret )
+            ret = pci_segment_iterate(info.segment, physdev_check_pci_extcfg,
+                                      &info);
+
         if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )
         {
             /*
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -183,6 +183,7 @@ custom_param("pci-phantom", parse_phanto
 
 static u16 __read_mostly command_mask;
 static u16 __read_mostly bridge_ctl_mask;
+static bool __ro_after_init opt_pci_quirks = true;
 
 static int __init cf_check parse_pci_param(const char *s)
 {
@@ -207,6 +208,8 @@ static int __init cf_check parse_pci_par
             cmd_mask = PCI_COMMAND_PARITY;
             brctl_mask = PCI_BRIDGE_CTL_PARITY;
         }
+        else if ( (val = parse_boolean("quirks", s, ss)) >= 0 )
+            opt_pci_quirks = val;
         else
             rc = -EINVAL;
 
@@ -422,6 +425,9 @@ static struct pci_dev *alloc_pdev(struct
     }
 
     apply_quirks(pdev);
+
+    pci_check_extcfg(pdev);
+
     check_pdev(pdev);
 
     return pdev;
@@ -719,6 +725,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
 
                 list_add(&pdev->vf_list, &pf_pdev->vf_list);
             }
+
+            if ( !pdev->ext_cfg )
+                printk(XENLOG_WARNING
+                       "%pp: VF without extended config space?\n",
+                       &pdev->sbdf);
         }
     }
 
@@ -1042,6 +1053,79 @@ enum pdev_type pdev_type(u16 seg, u8 bus
     return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
 }
 
+void pci_check_extcfg(struct pci_dev *pdev)
+{
+    unsigned int pos;
+
+    pdev->ext_cfg = false;
+
+    switch ( pdev->type )
+    {
+    case DEV_TYPE_PCIe_ENDPOINT:
+    case DEV_TYPE_PCIe_BRIDGE:
+    case DEV_TYPE_PCI_HOST_BRIDGE:
+    case DEV_TYPE_PCIe2PCI_BRIDGE:
+    case DEV_TYPE_PCI2PCIe_BRIDGE:
+        break;
+
+    case DEV_TYPE_LEGACY_PCI_BRIDGE:
+    case DEV_TYPE_PCI:
+        pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
+        if ( !pos ||
+             !(pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
+               (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
+            return;
+        break;
+
+    default:
+        return;
+    }
+
+    /*
+     * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express devices
+     * have 4096 bytes.  Even if the device is capable, that doesn't mean we
+     * can access it.  Maybe we don't have a way to generate extended config
+     * space accesses, or the device is behind a reverse Express bridge.  So
+     * we try reading the dword at PCI_CFG_SPACE_SIZE which must either be 0
+     * or a valid extended capability header.
+     */
+    if ( pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
+        return;
+
+    if ( opt_pci_quirks )
+    {
+        /*
+         * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says
+         * that when forwarding a type1 configuration request the bridge must
+         * check that the extended register address field is zero.  The bridge
+         * is not permitted to forward the transactions and must handle it as
+         * an Unsupported Request.  Some bridges do not follow this rule and
+         * simply drop the extended register bits, resulting in the standard
+         * config space being aliased, every 256 bytes across the entire
+         * configuration space.  Test for this condition by comparing the first
+         * dword of each potential alias to the vendor/device ID.
+         * Known offenders:
+         *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
+         *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
+         */
+        unsigned int sig = pci_conf_read32(pdev->sbdf, PCI_VENDOR_ID);
+
+        for ( pos = PCI_CFG_SPACE_SIZE;
+              pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
+            if ( pci_conf_read32(pdev->sbdf, pos) != sig )
+                break;
+
+        if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
+        {
+            printk(XENLOG_WARNING "%pp: extended config space aliases base one\n",
+                   &pdev->sbdf);
+            return;
+        }
+    }
+
+    pdev->ext_cfg = true;
+}
+
 /*
  * find the upstream PCIe-to-PCI/PCIX bridge or PCI legacy bridge
  * return 0: the device is integrated PCI device or PCIe
@@ -1842,6 +1926,29 @@ int pci_iterate_devices(int (*handler)(s
     return pci_segments_iterate(iterate_all, &iter) ?: iter.rc;
 }
 
+/* Iterate a single PCI segment, with locking but without preemption. */
+int pci_segment_iterate(unsigned int segment,
+                        int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg)
+{
+    struct pci_seg *seg = get_pseg(segment);
+    struct segment_iter iter = {
+        .handler = handler,
+        .arg = arg,
+    };
+
+    if ( !seg )
+        return -ENODEV;
+
+    pcidevs_lock();
+
+    iter.rc = iterate_all(seg, &iter) ?: iter.rc;
+
+    pcidevs_unlock();
+
+    return iter.rc;
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -126,6 +126,9 @@ struct pci_dev {
 
     nodeid_t node; /* NUMA node */
 
+    /* Whether the device has (accessible) extended config space. */
+    bool ext_cfg;
+
     /* Device to be quarantined, don't automatically re-assign to dom0 */
     bool quarantine;
 
@@ -242,6 +245,11 @@ void pci_check_disable_device(u16 seg, u
 int pci_iterate_devices(int (*handler)(struct pci_dev *pdev, void *arg),
                         void *arg);
 
+/* Iterate a single PCI segment, with locking but without preemption. */
+int pci_segment_iterate(unsigned int segment,
+                        int (*handler)(struct pci_dev *pdev, void *arg),
+                        void *arg);
+
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg);
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg);
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg);
@@ -260,6 +268,7 @@ unsigned int pci_find_next_cap_ttl(pci_s
                                    unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
+void pci_check_extcfg(struct pci_dev *pdev);
 unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
                                      unsigned int cap);
 unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,


