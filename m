Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C598C150
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808230.1220083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svea7-0005eU-72; Tue, 01 Oct 2024 15:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808230.1220083; Tue, 01 Oct 2024 15:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svea7-0005bo-37; Tue, 01 Oct 2024 15:14:31 +0000
Received: by outflank-mailman (input) for mailman id 808230;
 Tue, 01 Oct 2024 15:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svea5-0004dm-I5
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:14:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da5d649d-8007-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:14:29 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso925675966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:14:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a98f03d2d09sm98861766b.142.2024.10.01.08.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:14:28 -0700 (PDT)
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
X-Inumbo-ID: da5d649d-8007-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795668; x=1728400468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1sMHq5SkOLfKERWmUNKjj0SjILhRkZ7SZvJKkcD0p8=;
        b=K+fNZCDLSaROg2g7ct8gy4SPAz4r6YI43y+FMs8VFMYmEWPGg0btJh3zOgcuqn3Bmi
         u4pFWGAgbipygFkKINDCj+OhNNDeNsjhB7eyWXwfmnHf0FpkOGBuuvvKisQhj95ss5pc
         /FB4+hF9Mz+xDV+aFoSSL9ULBKrxK4JvtLG5z0erxkBxV85mh8TjWSeOYF20Q/ij9Rph
         Z0LMqgDVMwhoGFZKPWQYqLSCMvHIA/SjsSsSJJohqn5NknqZ4As+hM0q6U2GsuOZUY3i
         NNpnv1ZPwWji9+LWwuB7lnMJLBCTn2hXjZAM7G4VV0dyQmpU6+/DyYrjrtnEBZWCHTLR
         rpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795668; x=1728400468;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1sMHq5SkOLfKERWmUNKjj0SjILhRkZ7SZvJKkcD0p8=;
        b=vON2NyeQDMm2CWs4ZVl+tzb7j63dT93QHKQrlyEHSxVR2SvR3MelRJ+mdTNvyVUQIR
         Opi8iguCPPgPnp/gNrtByfxpfTxYMzyMoQ2tll1nWPyDuSE0j7+h+KK3HYxNLqBvPrti
         FVU5gqeUH+B+z1jAbIX5dsAHZVhjYFMnmRAXTuZ4tVtGdNsBgA4f1y1FeTo3ZvGhIyJ8
         nLrlSJuVC1WXbeu5LsJq8paT8hp3cWuvRaUqBiAi9+wSIHCeKklYI4jX9C/LJDVPacZX
         hwVaqKc+bFpOrSk57R7dzPZUQAblEHKAUiHLs6ufXifYoa3yq7lC+NccMV6yQzLqpDa8
         /NAQ==
X-Gm-Message-State: AOJu0YwIHWPq+85OLEu0p0fvvq/N88DdUAuRD6LFWnwGq1MEunMQjEZG
	Q8t8/NyubvrjDuYquptZ0BPBhoO52sDxpoZdczwkdmS+7qv5hXyaUe0NvltfPDNFz7dpasiQDXQ
	=
X-Google-Smtp-Source: AGHT+IH3vPayacs67JqhwZPHClOh3KvjoiHo+KWHRNUAlmyuxDfmeDMTzhLKW/7A+aiULAqmoZ2RLw==
X-Received: by 2002:a17:907:9493:b0:a8d:4db8:9eed with SMTP id a640c23a62f3a-a93c4a67777mr1601806866b.51.1727795668395;
        Tue, 01 Oct 2024 08:14:28 -0700 (PDT)
Message-ID: <4f828e91-aa90-4b44-b778-234812e4f8e1@suse.com>
Date: Tue, 1 Oct 2024 17:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 03/11] x86/ACPI: annotate assembly function/data with type
 and size
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the generic framework from xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Make do_suspend_lowlevel() a single function.
v6: New.

--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -7,7 +7,7 @@
         .text
         .code64
 
-ENTRY(do_suspend_lowlevel)
+FUNC(do_suspend_lowlevel)
         push    %rbp
         push    %rbx
         push    %r12
@@ -43,7 +43,7 @@ ENTRY(do_suspend_lowlevel)
          *
          * Everything else, including the stack, needs restoring.
          */
-ENTRY(s3_resume)
+LABEL(s3_resume)
         lgdt    boot_gdtr(%rip)
 
         mov     saved_cr0(%rip), %rax
@@ -132,6 +132,7 @@ ENTRY(s3_resume)
         pop     %rbx
         pop     %rbp
         ret
+END(do_suspend_lowlevel)
 
 .data
         .align 16
@@ -142,5 +143,4 @@ saved_cr0:      .quad   0
 saved_ssp:      .quad   0
 #endif
 
-GLOBAL(saved_magic)
-        .long   0x9abcdef0
+ASM_INT(saved_magic, 0x9abcdef0)


