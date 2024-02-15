Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440C855EEE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681481.1060275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYlH-0000mf-0O; Thu, 15 Feb 2024 10:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681481.1060275; Thu, 15 Feb 2024 10:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYlG-0000kJ-Th; Thu, 15 Feb 2024 10:14:34 +0000
Received: by outflank-mailman (input) for mailman id 681481;
 Thu, 15 Feb 2024 10:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYlF-0000Sx-JE
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:14:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0329edfd-cbeb-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:14:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41205e19660so4893155e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:14:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:14:32 -0800 (PST)
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
X-Inumbo-ID: 0329edfd-cbeb-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992072; x=1708596872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fj8qUorQgdMO+SEeflpHtiiMwgxTjCex7pYcfIyVQuE=;
        b=e8tdgsXF24xURiNWHJri0h8BL3XuKB77vTGJOPmBLlJoW+thPghgJRRx3kEwBLr1R/
         FZmIw03rDpYS7WNPa6hY/CFsC9ioUNb6K6MsF9OQA9GHj2b4HIJ3wEaQHaAGHOGgrpF/
         4DTlysSVws1n7xcZyMoAFvZ/Qoh4/dmv6/pFqfqfYL/e/pNU1OmyVHEBl975sbhIT5Je
         hM3vR6VWI7WHvn+v9KXekTslM0nSpR0gyUJWWjJSkwJ2fkoyGGRbHgGIOUiIcKn/DMx4
         6oYjQ5fPOOIWwr2Bv58uCsvr3EC49j7NSupJVpRx72cHSFn+tM/5xEG+B5bDhTMEPOci
         EihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992072; x=1708596872;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fj8qUorQgdMO+SEeflpHtiiMwgxTjCex7pYcfIyVQuE=;
        b=kgbzVEAOoNzsu/7ETPu7ksmEwjD6sQ1TRLgmjF+/zafCkMHhYMxzXJvBGEWYMbyPtr
         btRP0CNSEtEd/MFb5zBQUNThH7vJUdlYJ1tUhWuNMFVtLYiFd8RtmdNiisN3W9QAP2Je
         HYqeONnuk/4PnyPCwVYtSCNy5qk54GZ/hCo6p3R/hIMYdMvGBY0hOShNX7y9DNoI2JJn
         3f7gHkBtX30DjHZxVQIb31aPebdKepNDLX29ZUlBw/PzljvSwJxB/eI8975KQTRYnQSl
         p964f7uKutSrTekG8h1l8wgqZnw2tjcSvYp+MP5dtdkm69k/TC0hO+4wDErNR+TZVA3p
         KvTA==
X-Gm-Message-State: AOJu0YxrzXSvlIV9/TNOE6OEgck+eZZomH/JeK5oczLVmsLHzbx5Ixg0
	fdLtgKrtehIfn8GAAsGGBqANEeptpB/vYM4sAhfwB5GWcOHDWlyMVUx2FURVwDcXtd1s+ATlPP4
	=
X-Google-Smtp-Source: AGHT+IGFGMj7EAeEq5MHaPpPZFlgUlUywi+V2oHpegmyE6iJJ0Ys0Olf4VeGGL4VOtkXN+7+isl0vQ==
X-Received: by 2002:adf:ec82:0:b0:33b:1a39:e501 with SMTP id z2-20020adfec82000000b0033b1a39e501mr874165wrn.28.1707992072274;
        Thu, 15 Feb 2024 02:14:32 -0800 (PST)
Message-ID: <c70b250d-2ec4-4254-89cf-d3241dac0d35@suse.com>
Date: Thu, 15 Feb 2024 11:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 03/12] VT-d: parse ACPI "SoC Integrated Address Translation
 Cache Reporting Structure"s
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
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
In-Reply-To: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a prereq to us, in particular, respecting the "ATC required"
flag.

Note that ACPI_SATC_ATC_REQUIRED has its #define put in dmar.h, as we
try to keep actbl*.h in sync what Linux (who in turn inherit from ACPI
CA) has.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Lovely: On the SPR system with the SATC I tried passing "ats" (the
"required" flag is clear there), just to then hit "IOMMU#4: QI dev wait
descriptor taking too long" while setting up Dom0. The 2nd message there
doesn't ever appear, so the request never completes. Not sure whether
that's us doing something wrong or the hardware acting up. In the former
case I'd generally expect an IOMMU fault to be raised, though. FTR same
on 4.18 with just "VT-d: correct ATS checking for root complex
integrated devices" backported there.

Should we check scope entries for appropriate types? (If so, then also
for e.g. ATSR.)
---
v2: Move error case freeing to acpi_parse_one_satc(). Introduce #define
    for the flag bit. Style.

--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -47,6 +47,7 @@ LIST_HEAD_READ_MOSTLY(acpi_drhd_units);
 LIST_HEAD_READ_MOSTLY(acpi_rmrr_units);
 static LIST_HEAD_READ_MOSTLY(acpi_atsr_units);
 static LIST_HEAD_READ_MOSTLY(acpi_rhsa_units);
+static LIST_HEAD_READ_MOSTLY(acpi_satc_units);
 
 static struct acpi_table_header *__read_mostly dmar_table;
 static int __read_mostly dmar_flags;
@@ -750,6 +751,93 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
     return ret;
 }
 
+static int __init register_one_satc(struct acpi_satc_unit *satcu)
+{
+    bool ignore = false;
+    unsigned int i = 0;
+    int ret = 0;
+
+    /* Skip checking if segment is not accessible yet. */
+    if ( !pci_known_segment(satcu->segment) )
+        i = UINT_MAX;
+
+    for ( ; i < satcu->scope.devices_cnt; i++ )
+    {
+        uint8_t b = PCI_BUS(satcu->scope.devices[i]);
+        uint8_t d = PCI_SLOT(satcu->scope.devices[i]);
+        uint8_t f = PCI_FUNC(satcu->scope.devices[i]);
+
+        if ( !pci_device_detect(satcu->segment, b, d, f) )
+        {
+            dprintk(XENLOG_WARNING VTDPREFIX,
+                    " Non-existent device (%pp) is reported in SATC scope!\n",
+                    &PCI_SBDF(satcu->segment, b, d, f));
+            ignore = true;
+        }
+        else
+        {
+            ignore = false;
+            break;
+        }
+    }
+
+    if ( ignore )
+    {
+        dprintk(XENLOG_WARNING VTDPREFIX,
+                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable\n",
+                satcu->segment);
+        return 1;
+    }
+
+    if ( iommu_verbose )
+        printk(VTDPREFIX " ATC required: %d\n", satcu->atc_required);
+
+    list_add(&satcu->list, &acpi_satc_units);
+
+    return ret;
+}
+
+static int __init
+acpi_parse_one_satc(const struct acpi_dmar_header *header)
+{
+    const struct acpi_dmar_satc *satc =
+        container_of(header, const struct acpi_dmar_satc, header);
+    struct acpi_satc_unit *satcu;
+    const void *dev_scope_start, *dev_scope_end;
+    int ret = acpi_dmar_check_length(header, sizeof(*satc));
+
+    if ( ret )
+        return ret;
+
+    satcu = xzalloc(struct acpi_satc_unit);
+    if ( !satcu )
+        return -ENOMEM;
+
+    satcu->segment = satc->segment;
+    satcu->atc_required = satc->flags & ACPI_SATC_ATC_REQUIRED;
+
+    dev_scope_start = (const void *)(satc + 1);
+    dev_scope_end   = (const void *)satc + header->length;
+    ret = acpi_parse_dev_scope(dev_scope_start, dev_scope_end,
+                               &satcu->scope, SATC_TYPE, satc->segment);
+
+    if ( !ret && satcu->scope.devices_cnt )
+        ret = register_one_satc(satcu);
+
+    if ( ret )
+    {
+        scope_devices_free(&satcu->scope);
+        xfree(satcu);
+    }
+
+    /*
+     * register_one_satc() returns greater than 0 when a specified PCIe
+     * device cannot be detected. To prevent VT-d from being disabled in
+     * such cases, make the return value 0 here.
+     */
+    return ret > 0 ? 0 : ret;
+}
+
 static int __init cf_check acpi_parse_dmar(struct acpi_table_header *table)
 {
     struct acpi_table_dmar *dmar;
@@ -803,6 +891,13 @@ static int __init cf_check acpi_parse_dm
                 printk(VTDPREFIX "found ACPI_DMAR_RHSA:\n");
             ret = acpi_parse_one_rhsa(entry_header);
             break;
+
+        case ACPI_DMAR_TYPE_SATC:
+            if ( iommu_verbose )
+                printk(VTDPREFIX "found ACPI_DMAR_SATC:\n");
+            ret = acpi_parse_one_satc(entry_header);
+            break;
+
         default:
             dprintk(XENLOG_WARNING VTDPREFIX,
                     "Ignore unknown DMAR structure type (%#x)\n",
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -91,6 +91,16 @@ struct acpi_rhsa_unit {
     u32    proximity_domain;
 };
 
+struct acpi_satc_unit {
+    struct dmar_scope scope;
+    struct list_head list;
+    uint16_t segment;
+    bool atc_required:1;
+};
+
+/* In lieu of a definition in actbl2.h. */
+#define ACPI_SATC_ATC_REQUIRED (1U << 0)
+
 #define for_each_drhd_unit(drhd) \
     list_for_each_entry(drhd, &acpi_drhd_units, list)
 
@@ -106,6 +116,7 @@ struct acpi_atsr_unit *acpi_find_matched
 #define DMAR_TYPE 1
 #define RMRR_TYPE 2
 #define ATSR_TYPE 3
+#define SATC_TYPE 4
 
 #define DMAR_OPERATION_TIMEOUT MILLISECS(1000)
 
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -345,7 +345,8 @@ enum acpi_dmar_type {
 	ACPI_DMAR_TYPE_RESERVED_MEMORY = 1,
 	ACPI_DMAR_TYPE_ATSR = 2,
 	ACPI_DMAR_HARDWARE_AFFINITY = 3,
-	ACPI_DMAR_TYPE_RESERVED = 4	/* 4 and greater are reserved */
+	ACPI_DMAR_TYPE_SATC = 5,
+	ACPI_DMAR_TYPE_RESERVED = 7	/* 7 and greater are reserved */
 };
 
 /* DMAR Device Scope structure */
@@ -427,6 +428,15 @@ struct acpi_dmar_rhsa {
 	u32 proximity_domain;
 };
 
+/* 5: SOC Integrated Address Translation Cache Reporting Structure */
+
+struct acpi_dmar_satc {
+	struct acpi_dmar_header header;
+	uint8_t flags;
+	uint8_t reserved;
+	uint16_t segment;
+};
+
 /*******************************************************************************
  *
  * HPET - High Precision Event Timer table


