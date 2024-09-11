Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F37997521C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796519.1206155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMSc-00065P-CW; Wed, 11 Sep 2024 12:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796519.1206155; Wed, 11 Sep 2024 12:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMSc-00063s-9i; Wed, 11 Sep 2024 12:28:38 +0000
Received: by outflank-mailman (input) for mailman id 796519;
 Wed, 11 Sep 2024 12:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMSa-0005SW-G7
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:28:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d8e968c-7039-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:28:35 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso166521466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:28:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ceaf86sm605558566b.155.2024.09.11.05.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:28:34 -0700 (PDT)
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
X-Inumbo-ID: 5d8e968c-7039-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057715; x=1726662515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qG8cDP93BwNlVsK1ljt1DG0gUd8sN+5TqGY0WyzLe8M=;
        b=S6FSIU/HtAlGrydQ8AJsQuLWaGj3B8o4uAtyPMyIwwXUxPBYGjXx+KK/gjZAht+rGP
         GB3KJ271rLiecfsBFsQX3A8bZJigluE6/zxMCzcDASXXJArHSm0afKjPpYLs0A/fZCrf
         ER4etH2X05/VFlm+GLrkF1Mr/1yvyKnqpsFi5ab5BqrMgiddmVuPSHT4K8Z769r50s1q
         +RKkp4mFJMqWvIXc3GJ/eXuHdDLNdZ7d6pTrxPIwsVmnQIjGAHdlCkbjeGF3eGLme/t3
         vY+R0W+TvpZqsLtvLK6+mSiLnFXzZtDOUX4gzZtbAWOqMTsuohgDLSLKaDBroC7ZjqEY
         NNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057715; x=1726662515;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qG8cDP93BwNlVsK1ljt1DG0gUd8sN+5TqGY0WyzLe8M=;
        b=wGqaod13MT5BrLGJ8udzZ1dHE9DptT23I4nKKyCX+YhjvDdTFaILnLhDiNCMehSQVh
         VRpCUBx9H7OASIsEKBdq71qluz/HKjMfuxo5snMIgWZaVithqBlK24JZp5C5Jabw7CFI
         696RmqYlV2Zk8TdCCSFZSSLiK0xs6LgrGJzdomCm502CEA0Lg/sUSOj0YVPE1+GPZwPA
         VrmlCRMQZH44axQmEeA9x46Md5OLmsLzKMhgojcDLYoJm0PnJmzTMLLoOX4U1Xz6QbVg
         RRC13YnDmSx0koHy/t7zCznpRCl73HAAbWCqHF3c6redhNY/vzC9uKTmVL59okVZnCYk
         UjOg==
X-Gm-Message-State: AOJu0YxMMNVVMKexFydfEHlRzdkI72nZNi86VNHe+YATXVHhT2kG49cJ
	7pztwLPAfu0v3sWtGJ630Wtizk5/j5T+ue4LOhrvKySBFIS/eDhgz3zRTZPhoNShD736CImORMk
	=
X-Google-Smtp-Source: AGHT+IG0UPGfrviw2qfvMsFj1wTYZ7skIe7CFv6BujrD78SnAH9Zo1kLb0mRTfjEfQPJRRIfV0JxCw==
X-Received: by 2002:a17:907:944b:b0:a8a:87d5:2f49 with SMTP id a640c23a62f3a-a8ffae3a20cmr404957266b.28.1726057715139;
        Wed, 11 Sep 2024 05:28:35 -0700 (PDT)
Message-ID: <398a5651-70fa-4c23-b8c7-4eb88aacea81@suse.com>
Date: Wed, 11 Sep 2024 14:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/9] x86/HVM: drop stdvga's "gr[]" struct member
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
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
In-Reply-To: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No consumers are left, hence the producer and the array itself can also
go away. The static gr_mask[] is then orphaned and hence needs dropping,
too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -49,18 +49,6 @@ static const uint8_t sr_mask[8] = {
     (uint8_t)~0x00,
 };
 
-static const uint8_t gr_mask[9] = {
-    (uint8_t)~0xf0, /* 0x00 */
-    (uint8_t)~0xf0, /* 0x01 */
-    (uint8_t)~0xf0, /* 0x02 */
-    (uint8_t)~0xe0, /* 0x03 */
-    (uint8_t)~0xfc, /* 0x04 */
-    (uint8_t)~0x84, /* 0x05 */
-    (uint8_t)~0xf0, /* 0x06 */
-    (uint8_t)~0xf0, /* 0x07 */
-    (uint8_t)~0x00, /* 0x08 */
-};
-
 static int stdvga_outb(uint64_t addr, uint8_t val)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
@@ -82,12 +70,6 @@ static int stdvga_outb(uint64_t addr, ui
         s->gr_index = val;
         break;
 
-    case 0x3cf:                 /* graphics data register */
-        rc = (s->gr_index < sizeof(s->gr));
-        if ( rc )
-            s->gr[s->gr_index] = val & gr_mask[s->gr_index];
-        break;
-
     default:
         rc = 0;
         break;
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -114,7 +114,6 @@ struct hvm_hw_stdvga {
     uint8_t sr_index;
     uint8_t sr[8];
     uint8_t gr_index;
-    uint8_t gr[9];
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;
 };


