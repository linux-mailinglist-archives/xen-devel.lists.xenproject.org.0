Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC041973A23
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795704.1205172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so22t-0004Qe-LT; Tue, 10 Sep 2024 14:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795704.1205172; Tue, 10 Sep 2024 14:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so22t-0004ON-IL; Tue, 10 Sep 2024 14:40:43 +0000
Received: by outflank-mailman (input) for mailman id 795704;
 Tue, 10 Sep 2024 14:40:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so22s-0003oG-Bp
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:40:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7854523-6f82-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:40:42 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso537780866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:40:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25830f09sm486005566b.31.2024.09.10.07.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:40:41 -0700 (PDT)
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
X-Inumbo-ID: a7854523-6f82-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979241; x=1726584041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EtyWpgBFgoc9BlhXkBCsVjBPxqDYbXt4OGznf+FjOTo=;
        b=Q2oaTxTW3P91OqLqU7AWBdg5+/L6Yz9Nw1fFVBAqvMmoXSwUEeSHwisnFcitGcDJD1
         g0J+f9kfC+rY2L71w28JVHVBMXb7SlROpHK6TF4CswJIac0s4rqRk1Y7wg5DtgS4ohEf
         e0dsBPjV92AzgIglDhm1OcS1Eng0XthNcwVc0Rcy76LGdOq3CNkKtbzXwQ4nk4ZYEqdJ
         flVJxH4pax0diITs2D5GmoVFMCYOBMHcyuHy/3UhvA6r4NHmAGmxnbbhbRWTUixYLKOc
         O6MiTpgfUj6BCXbsTxM3OoMuvxMJ9zKppXj3Aprri9/aQJCwqKGQzgekudFPB1oeOaBO
         J5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979241; x=1726584041;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtyWpgBFgoc9BlhXkBCsVjBPxqDYbXt4OGznf+FjOTo=;
        b=WMDxIN44v4z5ZHlh82ztmjb7HEp7GvQY1PVMJ6zb7D5+RU1eijqZq4vtjlY/x29ape
         7/jSQz/f10+t0dbPgwEB0Ewz0T0GjwldarFGa5oaEXAjAp343l0FXRg7yb76rhmM6ZWI
         Wa+MU9Eoi5OTwa8/b6w3T9sLJ12jx58/Me22PEbV+H9eN7Vxw5DahbIPgdcLgogsMgfe
         7WFOSWKRz2xRRWyBuo1nopjagzCO3mkycb8YsebViJqYTsUM0xhXsniiDm2U5eH4gpkM
         7rchyEjwcHBKPhGW1Dg78XWCgu3lYOFowRP9e/KNxXtu+UOVo/VNytu2Tgi/SW7TOC68
         5cjw==
X-Gm-Message-State: AOJu0YwrJX78Zt+h/Mh6W2fPAcJCcwTmP/e2KzOB51n5lIOey9PEyM0Q
	Z0psLZYHeChEnXagvjnY0qCXLA5MB8SAFFE8uYxQe5mqjc+eBS4qMei1YWmzILy+z7RKs1iA2a0
	=
X-Google-Smtp-Source: AGHT+IE20oeMh8XF8jYQEAdn3un4pb8WuJLiK6TAO262rrRvKizHOWshbcpKYpt55EpkKBJZE+2Jgg==
X-Received: by 2002:a17:907:9717:b0:a8d:2c00:949a with SMTP id a640c23a62f3a-a8ffaa983a6mr113293766b.9.1725979241248;
        Tue, 10 Sep 2024 07:40:41 -0700 (PDT)
Message-ID: <0d1fa212-8f99-461f-92ef-0647ecfcc899@suse.com>
Date: Tue, 10 Sep 2024 16:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/7] x86/HVM: drop stdvga's "gr[]" struct member
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
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
In-Reply-To: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No consumers are left, hence the producer and the array itself can also
go away. The static gr_mask[] is then orphaned and hence needs dropping,
too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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


