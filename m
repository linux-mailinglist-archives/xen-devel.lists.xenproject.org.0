Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5069255B7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752806.1161045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvcd-0007kZ-1V; Wed, 03 Jul 2024 08:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752806.1161045; Wed, 03 Jul 2024 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvcc-0007iB-Um; Wed, 03 Jul 2024 08:45:50 +0000
Received: by outflank-mailman (input) for mailman id 752806;
 Wed, 03 Jul 2024 08:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOvcb-00078r-Iw
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:45:49 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a562c64e-3918-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 10:45:48 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so57024141fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:45:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1598cfbsm97873805ad.250.2024.07.03.01.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 01:45:48 -0700 (PDT)
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
X-Inumbo-ID: a562c64e-3918-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719996348; x=1720601148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EcfcQ+bs+vIY1uuTMe6ACJLGBx+6P+7pissTcD0vBvA=;
        b=WyFiO969rwhEPZulsGDHL1rQpuclQyvtyvnHPuPOVmdg7mX1dNAwLk6IY6wnYkaOeq
         T53Pa7Tm8huBQhEYPYHNDG7Za+eTLp4fTRg2tJ2LG7u+HlX2QHcuDPPd6Stbg2pI27I7
         q7yScyYq5jLJW4aOHeAC5+w71Vh6XivKxb7rL/XZukN+cgEzOWv8pMXwq3gHiWHlyMwZ
         evHWloottmdTPtvFuEhQ+SGBDiODzOvBFqV4w93Nz8FJLWIRvUBzyqfPHL6mHlzrC65H
         j0Ms/w1x/LxORUhGmcsUO9KT7WvxJB6o4+jiCOY/36VWuP3YHpJ3b7MArvy4xvBLdogr
         0doQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996348; x=1720601148;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcfcQ+bs+vIY1uuTMe6ACJLGBx+6P+7pissTcD0vBvA=;
        b=pl+yytNZAPbY4rMBsQcerqOVMbYX4/k0HrlljbqCx+8eavdnfZzGmtsGfIeRqjeBK6
         BjB1MT6BV/4YPnfOjYQYI/gTagk75fTClA0FQlvXWjCTwoCvHleA+5u0ci47sPpiCfYk
         6m1KStrup7fohQV8d4Gd902v/qqdj1FP0jCSS574DqCuqg81eC8RzLzEA6r9zwEa7orz
         BwaPdKhZm1pqNJ56M1i0dkQf2PrIQSBRXD+QSzl0+rJvaIMyhVe0U2DFQJp4NRWQOhDx
         tzWKrHOvKHG8TxYtvnzAfJ6MAnKxZGiWLJdoP1I9qpKsV5LHvWJTUtdztDrLkPy6Vk9E
         QlHg==
X-Gm-Message-State: AOJu0YyKtYpwDFn1OGqMRvSSN4wce3KCoOcduCfwuG0BpJsOErFDVI4K
	Dr1XMx1WGtdKTND9RxhrWxZWbcM9+8J95vH89UPE6lxiXVzLHLU6otOi+mzeSuBJrnKLHnpAbrI
	=
X-Google-Smtp-Source: AGHT+IH6KfGmXMpNReMTfMlwQy8KMoTvARYUf9ANCuVa5uDQa0xWUqbHuISwmiGfR0RRf0AW/X+4YQ==
X-Received: by 2002:a2e:be9b:0:b0:2ec:3dd4:75f7 with SMTP id 38308e7fff4ca-2ee5e6c9a24mr75032071fa.47.1719996348594;
        Wed, 03 Jul 2024 01:45:48 -0700 (PDT)
Message-ID: <de22beee-bd51-4169-b84d-88f4b452473a@suse.com>
Date: Wed, 3 Jul 2024 10:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 for-4.19? 2/2] cmdline: "extra_guest_irqs" is inapplicable
 to PVH
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
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
In-Reply-To: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH in particular has no (externally visible) notion of pIRQ-s. Mention
that in the description of the respective command line option and have
arch_hwdom_irqs() also reflect this (thus suppressing the log message
there as well, as being pretty meaningless in this case anyway).

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Remove has_pirq() check; update comment accordingly.
v4: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1183,7 +1183,8 @@ versa.  For example to change dom0 witho
 hardware domain is architecture dependent.  The upper limit for both values on
 x86 is such that the resulting total number of IRQs can't be higher than 32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
-to use the default.
+to use the default.  Note further that the Dom0 setting has no useful meaning
+for the PVH case; use of the option may have an adverse effect there, though.
 
 ### ext_regions (Arm)
 > `= <boolean>`
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2670,6 +2670,10 @@ unsigned int __hwdom_init arch_hwdom_irq
     if ( is_system_domain(d) )
         return max_irqs;
 
+    /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
+    if ( is_hvm_domain(d) )
+        return nr_irqs;
+
     if ( !d->domain_id )
         n = min(n, dom0_max_vcpus());
     n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);


