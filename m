Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C3963B15
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 08:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785468.1194911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjYPU-0007cj-76; Thu, 29 Aug 2024 06:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785468.1194911; Thu, 29 Aug 2024 06:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjYPU-0007bE-4D; Thu, 29 Aug 2024 06:13:32 +0000
Received: by outflank-mailman (input) for mailman id 785468;
 Thu, 29 Aug 2024 06:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjYPS-0007as-3L
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 06:13:30 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf3643cd-65cd-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 08:13:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86abbd68ffso49179666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 23:13:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196895sm32578566b.124.2024.08.28.23.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 23:13:28 -0700 (PDT)
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
X-Inumbo-ID: cf3643cd-65cd-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724912009; x=1725516809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vtOIuYV7UtLtgJzoz3lPgxTu4VXpbICmI2DcuM8MaJk=;
        b=GEq50BHiE8EGU6p2cOb+S7yLDnxgYnyB1pUXD/oCa2n5FmxHgCyRYtaFlO+14BLLyx
         jek7kOGJRWnK0JPVv9S7QGK/eZIXgv1oS5WDIwHKkJ21fTqgIN+GniEjUuhtQ9NhPS5n
         HUbi2lmHVvjoE0pbhs+kqE2DeY0/WnsOOXQU+kKhikjd+04vP5kg+f6kOVhsSVXb1S0W
         29aLvosgPdDUtshWqBiyo1xTExlNDGDwlNzLJkiiDPEGsKTuhGfAU41pkcT4/4rQVMT4
         AzJ9pt42uWFZPkgyEUFPLjCMjH8EKfRZVuV3IQo8FxntmqmTg8kKnpNABpJBvt0nMSiH
         XhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724912009; x=1725516809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtOIuYV7UtLtgJzoz3lPgxTu4VXpbICmI2DcuM8MaJk=;
        b=IqBoVVxSzGkdfnqPViA/TArXf+no44vona/0zX7JG+Xg4y2sQLqhHryoeS4Iay2nUF
         +M5cWL7Mq4tCCLxHGUvkRYAa4BeOPCzSl2JM1ymj2jO/pqssa4D5yaNGREUKhxo+HphX
         gHXxqIc1shrP64zsi9IEpVwKsGgzg5gN5GEzgGzeuukwYXkrbclJ+b+fEF/77kUFxY43
         y6Du55zG2QC1UsW8A2q48mDtZ/KXFsQE/jFj5zvQYS59A1pC745XQBJLwBxVsXDxV9Ee
         QhHJiA97P7Fv2vDno8G7dGbBw/8P1ZMIIVZ4J/6XButoTigdg3Nd2eIcjI2T2Ox4U6/b
         FSug==
X-Forwarded-Encrypted: i=1; AJvYcCWokVLMGVcGtSgtMpKM1aTi3fKi8RE0xr2NyquWgzzxReLX0Yv2QeeKqHK9ciG+xAttmHv8lpXZObs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFYNyYTkYbSeJIxIvueCixXT6N7BfLs7dguzXCAZV6lhMGLvvb
	0TGEbivAIx83VGBTkQJzl9X418jpJsWnLfvFmt7aKsL7txlodZnEIyn2vYfp8A==
X-Google-Smtp-Source: AGHT+IG+HTHG/I5JxjFlwFyEmhiJMF6weZ7gKXjHv5AC9AlWundSGoSy5ztAnFiIFh1YBzgASWmdhg==
X-Received: by 2002:a17:907:608c:b0:a7d:8912:6697 with SMTP id a640c23a62f3a-a898231cbe5mr159482566b.3.1724912008558;
        Wed, 28 Aug 2024 23:13:28 -0700 (PDT)
Message-ID: <20aeddd3-5a87-42d3-8eb4-478fbdb30321@suse.com>
Date: Thu, 29 Aug 2024 08:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-3-andrew.cooper3@citrix.com>
 <a92063db-fc28-4162-83bd-33617bbfcfbe@suse.com>
 <8f34109f-1718-47e5-99c5-a6010d7ebe51@citrix.com>
 <09742cbe-4c06-49d4-8b26-7ce9076063a1@suse.com>
 <17a98dae-51d4-4da0-a35a-1ddf94a06168@citrix.com>
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
In-Reply-To: <17a98dae-51d4-4da0-a35a-1ddf94a06168@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 20:56, Andrew Cooper wrote:
> On 28/08/2024 3:56 pm, Jan Beulich wrote:
>> On 28.08.2024 16:44, Andrew Cooper wrote:
>>> On 27/08/2024 5:07 pm, Jan Beulich wrote:
>>>> On 27.08.2024 15:57, Andrew Cooper wrote:
>>>>> +    for_each_set_bit ( seg, dirty )
>>>>> +        hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
>>>>> +
>>>>> +    hvmemul_ctxt->seg_reg_dirty = 0;
>>>> Why is this suddenly appearing here? You don't mention it in the description,
>>>> so it's not clear whether you found a (however minor) issue, or whether
>>>> that's purely cosmetic (yet then it's still an extra store we could do
>>>> without).
>>> Oh, yes.  Nothing anywhere in Xen ever clears these segment dirty bits.
>> hvm_emulate_init_once()?
> 
> I meant after emulation.  The value is initialised to 0 at the start of day.
> 
>>
>>> I suspect the worst that will go wrong is that we'll waste time
>>> re-{VMWRITE,memcpy}-ing the segment registers into the VMCS/VMCB, but
>>> the logic in Xen is definitely not right.
>> I'm on the edge of asking to do such clearing before emulation, not after
>> processing the dirty bits. That would then be hvm_emulate_init_per_insn(),
>> well centralized.
> 
> Specifically, hvmemul_ctxt should not believe itself to be dirty after a
> call to hvm_emulate_writeback(), because that's the logic to make the
> context no-longer-dirty.

That's one aspect, yes. Debuggability is another. For that retaining state
until it strictly needs clearing out may be helpful. Plus ...

> That said, the more I look at this, the less convinced I am by it.  For
> a function named writeback(), it's doing a very narrow thing that is not
> the usual meaning of the term when it comes to pipelines or insn
> emulation...

... as you say here.

Anyway - I'll leave where to put the clearing to you, just as long as it's
at least mentioned in the description.

Jan

