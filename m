Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1C98C1AE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808295.1220189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sverO-0006Ws-S4; Tue, 01 Oct 2024 15:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808295.1220189; Tue, 01 Oct 2024 15:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sverO-0006VE-Os; Tue, 01 Oct 2024 15:32:22 +0000
Received: by outflank-mailman (input) for mailman id 808295;
 Tue, 01 Oct 2024 15:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sverN-0006V8-Rq
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:32:21 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58bde725-800a-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:32:20 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c88c9e45c2so5202965a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:32:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c294834asm728528166b.108.2024.10.01.08.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:32:19 -0700 (PDT)
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
X-Inumbo-ID: 58bde725-800a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727796739; x=1728401539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMddPRirk9O8o1+nW/AzFzSC2Pb05IM6+++jYd0CHEE=;
        b=YzmmZxY+Z8kxjYzGVxPp186SkqwnsugMrFUvWYfe9kgUWv/EkW3Ac6iHuH9wfRTnD+
         YqZqTHkvbgUmHy9XUxcua1AiS9tGSqMbE2i0AzVwmlSBvb6mBI+d32EzdJUSARGT58fT
         E3GpU/X3Xwq1OtpinjymzO3Zh9IUG5WKhMPxl/GdXrthdctdwa4czVLG9OD0xmV5LCMB
         ccy25pSUuQq1xiyvYKyzZz4wv3P/8tkAeYelHdcPTI9lgxLXGgSP/Y6JSEiVp3X2YhIg
         b2y4JmjLi0G6kkkbX1/kIc/US8uEQg68lYmid7Kvaz98ta9FlDp2tcOAlB3FZ03+5f9l
         EmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727796739; x=1728401539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMddPRirk9O8o1+nW/AzFzSC2Pb05IM6+++jYd0CHEE=;
        b=SgspMPdJIt2CRH8gyPpSIxs1mMspcLy/WIEl4jF7KxIndBNrfRDmoNVyGubZkliSTx
         SkI7B6vpWzGeanJrph6KM9ue9QIjhXWh2p9iAquSo3Lfr6WOcnHtwZ5FnaTAtO/S/YgI
         BJOtcPSii+/hPLZCvzRB2KPexEAEpnhAIOXmom9OhZeTIkcHv5zBfoL1k9bfHWKPMz1h
         9yHlhqXhiFhmCuecu7F+EKkTaV9sggiiae+ZxCvGUz8d5PVf63RAlqvheWRGoRsa9plG
         84xi4nZQA29cUQJWovpfA7+EQwLANw0aVwu7HemHT2Ee7hDOBQTizOax8Or+yGg+qGEt
         KycQ==
X-Forwarded-Encrypted: i=1; AJvYcCV398iiG5ADVyIePEu1lUqTIb/SAVw4I6m6C+y4hCQtUSVuoKUUQxo1EcOyEn/LT6lOyw051y7pnbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7BxKDroRKdHtz8L3NG4EftaEVsRDy4dQhOqvWK27Sa3huqdWi
	qLcfX0y1XgA67QWXseaQZge7ncHTE9p06zlJg4vlwmVSjpUVUP4dCnsosIOPJA==
X-Google-Smtp-Source: AGHT+IFG82M5uShHaZC479IGe3GGSILZSwF/byMPNoGga8U1Dwa76J1utt43S00cJjQU9/MTpAptOA==
X-Received: by 2002:a17:907:60d4:b0:a8d:2281:94d9 with SMTP id a640c23a62f3a-a967c086898mr393659866b.23.1727796739453;
        Tue, 01 Oct 2024 08:32:19 -0700 (PDT)
Message-ID: <2e366771-31d4-471f-89d4-6076cf024de8@suse.com>
Date: Tue, 1 Oct 2024 17:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727781468.git.oleksii.kurochko@gmail.com>
 <55244e67032d3a8f6064aeccff44ebb0138cafaf.1727781468.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <55244e67032d3a8f6064aeccff44ebb0138cafaf.1727781468.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 13:21, Oleksii Kurochko wrote:
> Implement map_pages_to_xen() which requires several
> functions to manage page tables and entries:
> - pt_update()
> - pt_mapping_level()
> - pt_update_entry()
> - pt_next_level()
> - pt_check_entry()
> 
> To support these operations, add functions for creating,
> mapping, and unmapping Xen tables:
> - create_table()
> - map_table()
> - unmap_table()
> 
> Introduce PTE_SMALL to indicate that 4KB mapping is needed
> and PTE_POPULATE.
> 
> In addition introduce flush_tlb_range_va() for TLB flushing across
> CPUs after updating the PTE for the requested mapping.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



