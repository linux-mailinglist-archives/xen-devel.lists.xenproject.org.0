Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77198849C53
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676090.1051925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzRS-00061Y-Le; Mon, 05 Feb 2024 13:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676090.1051925; Mon, 05 Feb 2024 13:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzRS-0005zC-J2; Mon, 05 Feb 2024 13:55:22 +0000
Received: by outflank-mailman (input) for mailman id 676090;
 Mon, 05 Feb 2024 13:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzRQ-0005z2-IB
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:55:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328309ed-c42e-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:55:19 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fdf2b69b2so431675e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:55:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8570104wmb.26.2024.02.05.05.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:55:18 -0800 (PST)
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
X-Inumbo-ID: 328309ed-c42e-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141319; x=1707746119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xWCA/5RL2ARwAkMhUTOsGwspLyYaB9W2mN7GzM8E/nc=;
        b=VJAEkUsHmFp2LnhIGGi3MaJmXgKRWUeK98uD3HkkxOQkq2MWx8OGnPh7/tJt5nthNa
         EzZyJ2+WTXiIPMZorzEJOcN3iDgEqXmtb1wDrzsf4z3VKaGqIwVsYDCopffHV1H6J1YX
         6ShcJ6RylYSVTzlZRq83Fs4buDGu6Ln9ni7K+HrUDzuFQKhaaF3MaCSIWUtO23aIGVOU
         gRJvwuU/ekwQUAw9zlcW+IKQ7NQ1bk95uxcjw4gUYLpCwB69oYESJWH8MjVume3p5CEu
         T1lC9v1Yrv43UXPMhmzhgemtT2XEhoJUhntO3QR+bg5Qo9OpaGUHIToWLTydtJ7QHGL2
         FBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141319; x=1707746119;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWCA/5RL2ARwAkMhUTOsGwspLyYaB9W2mN7GzM8E/nc=;
        b=H4giu3hRoqONnTbzSI1q5G3lDQVuEPCi3Yze4cw0ljz13CSoDfiaYAtnCIrxs+oeYW
         vx3q9HKz8qWVUeVIfEUFO8F7bBmD0vu6CVP7H+2EI/MrI4nyPUWUCxFJpVMIsqbLhIrQ
         /2fXc8B8W4FGEM3QMql3sa4Uf//+e0/fMml3/YktdzWkz17pOTrZ/jzFfcYldCxZMZmh
         4liMdnFgGbzeq37pvwnHg7C3hZ9DB0DeycNfI6DSjiLszBpoCag/8hjofOT3tPDn2Uuu
         /bPKWzHsuEN+V23KhA1oTl/UU5t+MCpkHgdGZDzoBJlOh+Q8QCyxwGYlV4TXX9OCE2Ba
         KbRw==
X-Gm-Message-State: AOJu0YwIcZ14sMMg2YgXiddho3snEKpJOTCXB/8E9C8WZlab9d19ISos
	sJJDQ0sDZc07oCMw4bG49MwFZPpWG5fDOMtmVwdkI72+nl6wOe+UoU0Jez6DE/czrU1JmCcbUMs
	=
X-Google-Smtp-Source: AGHT+IE3Y6Nnj8BJo5oq8ZdSRhY8/K2PsXc/x8+2sF7Kx4VHPHvV8o+WE+HTnA9gj7y71d+JW8fk2A==
X-Received: by 2002:a05:600c:19cb:b0:40e:cca6:d82f with SMTP id u11-20020a05600c19cb00b0040ecca6d82fmr4310954wmq.16.1707141318842;
        Mon, 05 Feb 2024 05:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV0KkxzR5NiOqJ00N1ujGxrmv45Diry5WnCzIm0nWt87sZTJAC3qQhvKya64f9AKgujYygQZbdLBMFC6KdviRsZgBZDAkIrvrHxs7RBBdCus6Yj
Message-ID: <b5a58dee-9a4c-4833-be59-b52c62f7137d@suse.com>
Date: Mon, 5 Feb 2024 14:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/7] VT-d: parse ACPI "SoC Integrated Address Translation
 Cache Reporting Structure"s
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
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
In-Reply-To: <25506838-b818-4686-8c16-3a198338af44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a prereq to us, in particular, respecting the "ATC required"
flag.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should we check scope entries for appropriate types? (If so, then also
for e.g. ATSR.)

--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -47,6 +47,7 @@ LIST_HEAD_READ_MOSTLY(acpi_drhd_units);
 LIST_HEAD_READ_MOSTLY(acpi_rmrr_units);
 static LIST_HEAD_READ_MOSTLY(acpi_atsr_units);
 static LIST_HEAD_READ_MOSTLY(acpi_rhsa_units);
+static LIST_HEAD_READ_MOSTLY(acpi_satc_units);
 
 static struct acpi_table_header *__read_mostly dmar_table;
 static int __read_mostly dmar_flags;
@@ -764,6 +765,95 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
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
+        if ( pci_device_detect(satcu->segment, b, d, f) == 0 )
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
+                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable!\n",
+                satcu->segment);
+        scope_devices_free(&satcu->scope);
+        xfree(satcu);
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
+    int ret;
+
+    if ( (ret = acpi_dmar_check_length(header, sizeof(*satc))) != 0 )
+        return ret;
+
+    satcu = xzalloc(struct acpi_satc_unit);
+    if ( !satcu )
+        return -ENOMEM;
+
+    satcu->segment = satc->segment;
+    satcu->atc_required = satc->flags & 1;
+
+    dev_scope_start = (const void *)(satc + 1);
+    dev_scope_end   = (const void *)satc + header->length;
+    ret = acpi_parse_dev_scope(dev_scope_start, dev_scope_end,
+                               &satcu->scope, SATC_TYPE, satc->segment);
+
+    if ( !ret && satcu->scope.devices_cnt )
+    {
+        ret = register_one_satc(satcu);
+        /*
+         * register_one_satc() returns greater than 0 when a specified
+         * PCIe device cannot be detected. To prevent VT-d from being
+         * disabled in such cases, reset the return value to 0 here.
+         */
+        if ( ret > 0 )
+            ret = 0;
+    }
+    else
+        xfree(satcu);
+
+    return ret;
+}
+
 static int __init cf_check acpi_parse_dmar(struct acpi_table_header *table)
 {
     struct acpi_table_dmar *dmar;
@@ -817,6 +907,11 @@ static int __init cf_check acpi_parse_dm
                 printk(VTDPREFIX "found ACPI_DMAR_RHSA:\n");
             ret = acpi_parse_one_rhsa(entry_header);
             break;
+        case ACPI_DMAR_TYPE_SATC:
+            if ( iommu_verbose )
+                printk(VTDPREFIX "found ACPI_DMAR_SATC:\n");
+            ret = acpi_parse_one_satc(entry_header);
+            break;
         default:
             dprintk(XENLOG_WARNING VTDPREFIX,
                     "Ignore unknown DMAR structure type (%#x)\n",
--- a/xen/drivers/passthrough/vtd/dmar.h
+++ b/xen/drivers/passthrough/vtd/dmar.h
@@ -91,6 +91,13 @@ struct acpi_rhsa_unit {
     u32    proximity_domain;
 };
 
+struct acpi_satc_unit {
+    struct dmar_scope scope;
+    struct list_head list;
+    uint16_t segment;
+    bool atc_required:1;
+};
+
 #define for_each_drhd_unit(drhd) \
     list_for_each_entry(drhd, &acpi_drhd_units, list)
 
@@ -106,6 +113,7 @@ struct acpi_atsr_unit *acpi_find_matched
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


