Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4590BC4B68
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139557.1474853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SyU-00029H-AE; Wed, 08 Oct 2025 12:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139557.1474853; Wed, 08 Oct 2025 12:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SyU-00027C-7f; Wed, 08 Oct 2025 12:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1139557;
 Wed, 08 Oct 2025 12:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6SyS-0001EV-2b
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:08:52 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cfda1fc-a43f-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 14:08:50 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b40f11a1027so1320798566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:08:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4c7396b863sm920696866b.65.2025.10.08.05.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:08:49 -0700 (PDT)
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
X-Inumbo-ID: 8cfda1fc-a43f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759925330; x=1760530130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MHZqV2u/Nz6QJJBHNe3slnvZ/gJbEJWr1JFuX4gdknI=;
        b=KAmcWY5XsxvHbdZcIUJWnCgsoUrGpL6uNCsE9ql0immVwEwHMLXIIdnp74qTbiprJP
         5nq2Zvmk/AgdOlTQlNOSpSaXCX1OKAn8pOJn46nNT4pIzNb5KWrZR9zzetWLkgoopygP
         8uKDIhEkwRuep18Bn1jzhzbucFUfL5MUrXq+SMIBpDobCgDQPVcM59onAz0THoYJtgav
         tW4zcCF5bpgHrzPjMD2Jr2JXrdLWphDaDaWpKKTpp7sQ7Mvu/xX7Y9PLceq3L72mPdwI
         DwxphQb3XNsZLGCjrc8cv+ZQraZhnc7DgYDNC9ExL3qgpCUhot13wN86Q1/61P2k1kIm
         8SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925330; x=1760530130;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHZqV2u/Nz6QJJBHNe3slnvZ/gJbEJWr1JFuX4gdknI=;
        b=s5PZglEmI82HD5WUsOvFOHDJMLOB/1dwMuv/VW8E2DfCe0QD7xXOwGufIn3gVJy9TH
         yps4g4dm9DQ0JB9hTKB1+XaLtnFeFkU05hzmdIRxxOodywS4+odh1UAFKfRxaE4ryviS
         2CtYDSUlzUop/XFQfyNoKTMa6YWeNxex/CNPAnEDWHTBptMfN6tOmpA/zjw71q3MupZA
         UOS6Ok7UVIaYhaoq/5J0KKFGGqtpFEsSz02e21fNldXyNXp05UM65oxE5AzQY+jdvQ/o
         HRMibX8bzDJVXeYkGoVvr9bw05+PRe1D89JKDNcBzQFDFBThwj/v5gwX2N5uT6NspDDe
         YUDg==
X-Gm-Message-State: AOJu0YwKce0NV15y/lOJCzQyO6/hx32dHiiEfPk4YYMNGiVKY6Eo/oBB
	k+QbslIONEee/pgSUJDXwlCbHUaZwQiqHuaU9atfHy+J26OgjBgj3X+ORsAT2lHRgvvVE917io0
	ZwoU=
X-Gm-Gg: ASbGnctpiuedcRGqLNg//88wP4pvrPlQnc/uBCRutJvOOrMDndAOh+cyaM6AlTE/wbi
	paAgF+Onj8ODnTuLf1eWfkqbc8DCUHPDjVA/nwaBTGBjPEqd9f7NWCK5tvN4IPDYUck9uUMoDSe
	L6ZXvCJA5Iq82CdeDN15itvz/lVdncJH8F735+3SdzeRnVrFNHyMwbLueAXJ0X8k/aCRbCqcpN6
	zHXZY9W9B2zibJA01OBg3qFFYDfB0BDN3VrYTwZPCHGHXLsX7HJ9QJPtQtGtwaAdeMU9xF7/7Mr
	BkAGtmWMY87Z+xp1TnJwwotyPdNKdX39QRQDnN6r2lo0gdhXMryebA8ZFtR9G47Ww6dFk2j6qrd
	XsKJ4xKS3Q3r5D35wGW+GvkQEmSdOvC+gxUFD9CZySz2cx0m88OlPfQyzCr8TeLC+tu3wZ0C/54
	TC//mnCqIfWqgmdl45D1gMGO40tgzIrV2/92EJmsQr+A==
X-Google-Smtp-Source: AGHT+IFk+rfUs6b10Yz5R9xv/2mVnMbmLDb3xkOFaLESK5F0Scb6QGFAVLylQx9Sk2Hb9BKpdeLmKQ==
X-Received: by 2002:a17:907:3e94:b0:b4f:4c70:f61a with SMTP id a640c23a62f3a-b50abfd59a0mr415820066b.40.1759925329964;
        Wed, 08 Oct 2025 05:08:49 -0700 (PDT)
Message-ID: <feb47fa6-27a0-4cf7-8fc6-bf5f29f467c1@suse.com>
Date: Wed, 8 Oct 2025 14:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.21??? 2/3] x86/vLAPIC: drop VLAPIC_VERSION
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Grygorii Strashko <grygorii_strashko@epam.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
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
In-Reply-To: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation of making the value somewhat dynamic drop the constant.
Replace its use in guest_wrmsr_x2apic() by actually fetching the LVR
value.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -31,7 +31,6 @@
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
 
-#define VLAPIC_VERSION                  0x00050014
 #define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
 
 #define LVTS \
@@ -1015,7 +1014,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
     case APIC_SPIV:
         if ( val & ~(APIC_VECTOR_MASK | APIC_SPIV_APIC_ENABLED |
                      APIC_SPIV_FOCUS_DISABLED |
-                     (VLAPIC_VERSION & APIC_LVR_DIRECTED_EOI
+                     (vlapic_get_reg(vlapic, APIC_LVR) & APIC_LVR_DIRECTED_EOI
                       ? APIC_SPIV_DIRECTED_EOI : 0)) )
             return X86EMUL_EXCEPTION;
         break;
@@ -1439,7 +1438,7 @@ static void vlapic_do_init(struct vlapic
     if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
         return;
 
-    vlapic_set_reg(vlapic, APIC_LVR, VLAPIC_VERSION);
+    vlapic_set_reg(vlapic, APIC_LVR, 0x00050014);
 
     for ( i = 0; i < 8; i++ )
     {


