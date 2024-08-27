Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432229613A6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 18:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784242.1193648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siyj6-00083j-Qk; Tue, 27 Aug 2024 16:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784242.1193648; Tue, 27 Aug 2024 16:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siyj6-00081A-N8; Tue, 27 Aug 2024 16:07:24 +0000
Received: by outflank-mailman (input) for mailman id 784242;
 Tue, 27 Aug 2024 16:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siyj5-0007zW-Et
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 16:07:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ce9652-648e-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 18:07:21 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a86933829dcso646560666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 09:07:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d878sm126332166b.119.2024.08.27.09.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:07:20 -0700 (PDT)
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
X-Inumbo-ID: 70ce9652-648e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724774841; x=1725379641; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GSlOYRYOQV+Hp5y5cuE+6TSIU8mS+8Dx/yBelA6NMJQ=;
        b=QOMH5xPsrrHmWTp8t6CpzbO5zZIelHN13NMGdAgV6rBU6QKSA9ZeYmn9NDXSiSTmln
         E3+H0LS6KLvvxaxON0fzr+zY2Lan8w3wgQ2J8VaJmbvogm9bfoSfiCjGHwAOf7wpAHg/
         0yq1iVncgDHL8qaEoGaqVOWpPXl20wqJYqJuQCtJS/MO2NPMdD/6Izutp0j2uWNpD6Fc
         J/Y2SMLYUZgUk6Dd8HasU56bW4PCy5pl/cCCGMr8vxrd7pn6v/OF0DEKDbv+vCbS8hLu
         guGDl/JUph7c0bRIdfs10HANOH4M/GswipSr+f0hzIPpRS4PqswSc1EiG/+Ms5uC+RkZ
         c6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724774841; x=1725379641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSlOYRYOQV+Hp5y5cuE+6TSIU8mS+8Dx/yBelA6NMJQ=;
        b=w13J1efPtMHKQgHoLUIuDON9lfIBsPHg2jkXQC6tXB17xlHK81EwHdlFKQLNj8RNaS
         QkY7QSC3rmVUTgaQnbvuZauyfhXqXhx7que/3Qup73w6n1Da0CvcFQpiYFQ4Ir/cn6Ff
         lznew3SrNNmiR88UCyP86H0V0wvkiEWzvUxAnRHncvzMueLDdTAmXcuvCG4cgiSI3mvg
         mhM/WVMxDDZyfPUhiysaFZHZj0d7OrpjNPzr79D7qp6xuCwM2e9Eg5B2aqUWWKphkKC8
         KB7e3Cp/GI68hrukneSKIjswTaLEcqrDJYNwZWZ71o/8GM7VfRkC0pb3QRayb55bF5Ho
         +PzA==
X-Forwarded-Encrypted: i=1; AJvYcCU620mcDO3lkxOiciyhtTvVtqqmfuF8SbD35NIUnVKwjDGREGu7yoCt/EGE86gMroubHPiKRnbaXGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGyUT6BYjjvLMUn6/Us9agrQ+M9RQIEIV+iVRmmIsWjkMAdi+/
	cd+CKYvXTiiEX60v5d3IAOTRK5EqCkR8Y2nRrVkJLCcmND4sp7ATPoEGZMqxBwV1exp3+hahP5o
	=
X-Google-Smtp-Source: AGHT+IHjv5IJomM9PEVZ6FJbbqU8v2hS+YKnHFGKr696Y5gtfZhJofIqFE87HAvkX22811eNrW9t2A==
X-Received: by 2002:a17:907:e268:b0:a86:7983:a4a7 with SMTP id a640c23a62f3a-a86a52f08eamr949356266b.38.1724774840662;
        Tue, 27 Aug 2024 09:07:20 -0700 (PDT)
Message-ID: <a92063db-fc28-4162-83bd-33617bbfcfbe@suse.com>
Date: Tue, 27 Aug 2024 18:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240827135746.1908070-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 15:57, Andrew Cooper wrote:
> ... which is more consise than the opencoded form.
> 
> Also, for production VMs, ~100% of emulations are simple MOVs, so it is likely
> that there are no segments to write back.
> 
> Furthermore, now that find_{first,next}_bit() are no longer in use, the
> seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
> they do need to remain unsigned int because of __set_bit() elsewhere.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Pulling current out into curr is good for code generation.  When using current
> in the loop, GCC can't retain the calculation across the call to
> hvm_set_segment_register() and is forced to re-read from the cpu_info block.
> 
> However, if curr is initialised, it's calculated even in the likely path...

That's a little odd, as I don't think I can spot what would force the compiler
into doing so. As a wild guess, ...

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2908,18 +2908,18 @@ void hvm_emulate_init_per_insn(
>  void hvm_emulate_writeback(
>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>  {
> -    enum x86_segment seg;
> +    struct vcpu *curr;
> +    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;

... is the order of these two possibly relevant? Yet of course it's not the
end of the world whichever way it's done.

> -    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
> -                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
> +    if ( likely(!dirty) )
> +        return;
>  
> -    while ( seg < ARRAY_SIZE(hvmemul_ctxt->seg_reg) )
> -    {
> -        hvm_set_segment_register(current, seg, &hvmemul_ctxt->seg_reg[seg]);
> -        seg = find_next_bit(&hvmemul_ctxt->seg_reg_dirty,
> -                            ARRAY_SIZE(hvmemul_ctxt->seg_reg),
> -                            seg+1);
> -    }
> +    curr = current;
> +
> +    for_each_set_bit ( seg, dirty )
> +        hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
> +
> +    hvmemul_ctxt->seg_reg_dirty = 0;

Why is this suddenly appearing here? You don't mention it in the description,
so it's not clear whether you found a (however minor) issue, or whether
that's purely cosmetic (yet then it's still an extra store we could do
without).

Jan

