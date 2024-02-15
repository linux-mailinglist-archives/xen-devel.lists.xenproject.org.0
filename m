Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF82855EEB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681476.1060265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYko-0000Cn-LS; Thu, 15 Feb 2024 10:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681476.1060265; Thu, 15 Feb 2024 10:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYko-0000AU-Ih; Thu, 15 Feb 2024 10:14:06 +0000
Received: by outflank-mailman (input) for mailman id 681476;
 Thu, 15 Feb 2024 10:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYkn-000877-Gm
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:14:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d22946-cbea-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 11:14:03 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33d01faf711so279534f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:14:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:14:02 -0800 (PST)
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
X-Inumbo-ID: f1d22946-cbea-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992043; x=1708596843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KU/lqMLMrEbpy7S9jjdmyz27GyrWioKTxk0YxtgDY6A=;
        b=RS3sxTB80kNFYvvxKXiD5fE0JIuIb67cB56i/lx9KLxTbqVdvFtyGwTNBkQDt8uK+B
         5Lf4rVj9wWbuNSK4ZTQwMXO383WJuFh24TabAOtifO5tyW020EW8XMdxJozZiSRDQv24
         Ubays/0ZbEkRUPEmO3A7xuTO4fM2nZuExrj02cJAWYgtxbgZST57sSVZ84H7phEYKKFG
         EZX+SYzAYsfddiVWfgcuq7MD3CRVv+HQ/Du6oaxHwFfppwWLTcNgJDXB/evAFhezaTfx
         lzsA1+nAVvHgSCofOsFNAgd8T4HjV7Zg2iwHtayUdGebmMSIbUUkA6NKTqqxHUYZBttN
         5mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992043; x=1708596843;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KU/lqMLMrEbpy7S9jjdmyz27GyrWioKTxk0YxtgDY6A=;
        b=d0UtahmGns4m50McaFNC12u5tDfnfuCyxfy18uGz1hb6pXlzyE8eGv5HZVFvPcP5zi
         ejSvHDes1aH1rYTbFV/KFXgA2E7ogTZVC0SoJM2pH+N2eu831yW3kDpjEQRG8zC9liE0
         VPgSghg/spFOcxWy47fWcGBawD6OQX+pziYiqHW1xGi6OHMZjCo2o0v6bkkyBSptr1kT
         UMjzKRAJBmnBZZOBFtUCpCmMJgWBkA+HFMYBMO5L96GrPuF+5QYGKH+lBF2L6/zBjy0u
         hCRwzTwVlfKkgGRT70vz8qYUFW2ltuMBCb0J7zSFc3Ccc98Fw1wUq34L4jxNb8ObuaPk
         fgng==
X-Gm-Message-State: AOJu0YzLq+x3ftdxcWLtQOiHn7Z2f6B88k8Fasv//syiDOuPBJXZanVa
	89Q+P9Gc8x8R78Wm7dzgBz2hGnmJo74p+seazMh1zE0+N1ABJF4xDrUDyKKwLBQDWDkR3Gg1H3U
	=
X-Google-Smtp-Source: AGHT+IHKaWfAiFYhRjDVVpSwFB7pRSbD3IcCQS5JuxOtu7EYgKWLGl4fizouEZ0cB440LcqOK4QmQw==
X-Received: by 2002:a5d:5591:0:b0:33c:d139:66fb with SMTP id i17-20020a5d5591000000b0033cd13966fbmr1219944wrv.52.1707992043032;
        Thu, 15 Feb 2024 02:14:03 -0800 (PST)
Message-ID: <97577ebf-3871-47be-97c5-8164701be756@suse.com>
Date: Thu, 15 Feb 2024 11:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 02/12] VT-d: tidy error handling of RMRR parsing
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
Content-Transfer-Encoding: 8bit

It's acpi_parse_one_rmrr() where the allocation is coming from (by way
of invoking acpi_parse_dev_scope()), or in add_one_user_rmrr()'s case
allocation is even open-coded there, so freeing would better also happen
there. Care needs to be taken to preserve acpi_parse_one_rmrr()'s
ultimate return value.

While fiddling with callers also move scope_devices_free() to .init and
have it use XFREE() instead of open-coding it.

In register_one_rmrr() also have the "ignore" path take the main
function return path.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -82,14 +82,13 @@ static int __init acpi_register_rmrr_uni
     return 0;
 }
 
-static void scope_devices_free(struct dmar_scope *scope)
+static void __init scope_devices_free(struct dmar_scope *scope)
 {
     if ( !scope )
         return;
 
     scope->devices_cnt = 0;
-    xfree(scope->devices);
-    scope->devices = NULL;
+    XFREE(scope->devices);
 }
 
 static void __init disable_all_dmar_units(void)
@@ -595,17 +594,13 @@ static int register_one_rmrr(struct acpi
                 " Ignore RMRR [%"PRIx64",%"PRIx64"] as no device"
                 " under its scope is PCI discoverable!\n",
                 rmrru->base_address, rmrru->end_address);
-        scope_devices_free(&rmrru->scope);
-        xfree(rmrru);
-        return 1;
+        ret = 1;
     }
     else if ( rmrru->base_address > rmrru->end_address )
     {
         dprintk(XENLOG_WARNING VTDPREFIX,
                 " RMRR [%"PRIx64",%"PRIx64"] is incorrect!\n",
                 rmrru->base_address, rmrru->end_address);
-        scope_devices_free(&rmrru->scope);
-        xfree(rmrru);
         ret = -EFAULT;
     }
     else
@@ -660,21 +655,20 @@ acpi_parse_one_rmrr(struct acpi_dmar_hea
                                &rmrru->scope, RMRR_TYPE, rmrr->segment);
 
     if ( !ret && (rmrru->scope.devices_cnt != 0) )
-    {
         ret = register_one_rmrr(rmrru);
-        /*
-         * register_one_rmrr() returns greater than 0 when a specified
-         * PCIe device cannot be detected. To prevent VT-d from being
-         * disabled in such cases, reset the return value to 0 here.
-         */
-        if ( ret > 0 )
-            ret = 0;
 
-    }
-    else
+    if ( ret )
+    {
+        scope_devices_free(&rmrru->scope);
         xfree(rmrru);
+    }
 
-    return ret;
+    /*
+     * register_one_rmrr() returns greater than 0 when a specified PCIe
+     * device cannot be detected. To prevent VT-d from being disabled in
+     * such cases, make the return value 0 here.
+     */
+    return ret > 0 ? 0 : ret;
 }
 
 static int __init
@@ -945,9 +939,13 @@ static int __init add_one_user_rmrr(unsi
     rmrr->scope.devices_cnt = dev_count;
 
     if ( register_one_rmrr(rmrr) )
+    {
         printk(XENLOG_ERR VTDPREFIX
                "Could not register RMMR range "ERMRRU_FMT"\n",
                ERMRRU_ARG);
+        scope_devices_free(&rmrr->scope);
+        xfree(rmrr);
+    }
 
     return 1;
 }


