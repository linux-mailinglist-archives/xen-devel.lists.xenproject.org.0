Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3A950015
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 10:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776063.1186214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdn5b-00078N-Pe; Tue, 13 Aug 2024 08:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776063.1186214; Tue, 13 Aug 2024 08:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdn5b-00075c-Mw; Tue, 13 Aug 2024 08:41:11 +0000
Received: by outflank-mailman (input) for mailman id 776063;
 Tue, 13 Aug 2024 08:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdn5a-00075W-4s
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 08:41:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c691c27c-594f-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 10:41:04 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso560387166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 01:41:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411bdc0sm50082166b.118.2024.08.13.01.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 01:41:03 -0700 (PDT)
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
X-Inumbo-ID: c691c27c-594f-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723538464; x=1724143264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=acoNRe3G/vhn1uXVYzhdFT5TIlUsChnSlM3vT1sP/oY=;
        b=U8olnw1RwHZVKXjkAiSiDdjDnn57wzihxJ2vG0dIfGajtA54iPgTgyk26kKDlhklhD
         7gfeq4tr7SS6YExto3FvVFsXweNOKZrbpDhuILo42UGi82VfAlPAeg//+nOnDuoF+xfb
         bzLW6Qr3hhJUyoeX+RtF1nfjWBMrC/iVVmaiRCZZcpLC7rJevKl+jKGaND9K0f5DjHm8
         EstjSiJCtZwxmlQC298LNL1b/VU2tYO+0mrZDGimm9X2OssrAFahGJKzEb/OCLcdU11X
         L4MUfbjjTBLDI5HN/PCTjgdiCbtHxKXNVdj3f1ibWTZhHePPSS3zx9r8MKFfXFBAMtT7
         pKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723538464; x=1724143264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acoNRe3G/vhn1uXVYzhdFT5TIlUsChnSlM3vT1sP/oY=;
        b=WgfIE0SynRR2qcDm+Q8QdE+4lpS5/oqrNVIZQUf1AwJtRjbjTOZXdO8hrDq4L0FnDA
         VQmWhDEI4juZzm2RuNZRe878TgWR94dbCMzkE2Wmc9/33RChgc02NLsqT20pktyTTUGh
         vxbUugzKt2JClvJyekAHsGbzH5TFE/NHzB/+gqC5uj0TXrYowkdRo0GRRnkSeNtqOU9Q
         6zslG0wncZ4x3Tkv765kAT+LKljQXqz6i51L05qLJpq6xZlkE1Fwm38v4emwIo9s0OXS
         flvmVulHNA2x8zqOEiSxvRvE3Gui4VvBL0wdCq+lgm0cb5l54DNRWggm7xA8MtL0Rhhx
         F8pw==
X-Forwarded-Encrypted: i=1; AJvYcCVml6F61vEMksoPrjcr9IzGvpwxTKZOso2bUFTFVvDe055UNpKiLNw13FMbRHLwRjeEu7mo0VsNnb8CncklAfNiMjl2OrK1B5NanuZWU5M=
X-Gm-Message-State: AOJu0YzzwWw55p2YivDWQvWZHEcH0A3O7YIQEH6cxgvnuXOp8oTxOg/q
	0+u/qgYIgixqHKAgW5P+QBLY9VJZNemxABwKVKMhrdBacKybDeSkjqqIcME3gQ==
X-Google-Smtp-Source: AGHT+IGz6ajwaY3wAezNqo18Usbmf7A4MqtSKdDAHzl6aExf/QmycG+rWvQhnXwvyzrKCv99tf3hBA==
X-Received: by 2002:a17:907:efe5:b0:a7a:aa35:408d with SMTP id a640c23a62f3a-a80ed1d679dmr212640766b.20.1723538463462;
        Tue, 13 Aug 2024 01:41:03 -0700 (PDT)
Message-ID: <441f2f8c-28ff-4f79-b812-aa7b8df6a53b@suse.com>
Date: Tue, 13 Aug 2024 10:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] xen/riscv: introduce asm/pmap.h header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <2b4481a52aa260a95df9eaef3cd249a274699809.1723214540.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2b4481a52aa260a95df9eaef3cd249a274699809.1723214540.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 18:19, Oleksii Kurochko wrote:
> Introduce arch_pmap_{un}map functions and select HAS_PMAP for CONFIG_RISCV.
> 
> Add pte_from_mfn() for use in arch_pmap_map().
> 
> Introduce flush_xen_tlb_one_local() and use it in arch_pmap_{un}map().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Changes in V4:
>  - mark arch_pmap_{un}map() as __init: documentation purpose and
>    a necessary (but not sufficient) condition here, to validly
>    use local TLB flushes only.
>  - add flush_xen_tlb_one_local() to arch_pmap_map() as absense of
>    "negative" TLB entrues will be guaranted only in the case
>    when Svvptc extension is present.
>  - s/mfn_from_pte/pte_from_mfn
>  - drop flush_xen_tlb_range_va_local() as it isn't used in this patch

Just as a remark: This and ...

>  - drop mfn_to_xen_entry() as pte_from_mfn() does the same thing
>  - add flags argument to pte_from_mfn().
>  - update the commit message.
>  - s/flush_xen_tlb_range_va_local/flush_tlb_range_va_local

... this don't go together very well.

Jan

