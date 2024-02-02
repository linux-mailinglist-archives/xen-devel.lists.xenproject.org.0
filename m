Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B448469DE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 08:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674852.1050009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVoOl-0006h3-Os; Fri, 02 Feb 2024 07:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674852.1050009; Fri, 02 Feb 2024 07:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVoOl-0006f4-Ld; Fri, 02 Feb 2024 07:55:43 +0000
Received: by outflank-mailman (input) for mailman id 674852;
 Fri, 02 Feb 2024 07:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVoOj-0006ey-Q4
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 07:55:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7579f229-c1a0-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 08:55:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a318ccfe412so197398166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 23:55:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dc20-20020a170906c7d400b00a36cd9624c0sm610402ejb.95.2024.02.01.23.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 23:55:39 -0800 (PST)
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
X-Inumbo-ID: 7579f229-c1a0-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706860540; x=1707465340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyMkE39StgLvA3SInVPI0AARfSkny9Aun6vln2isN24=;
        b=caCr4Ta9mmssafIb6p4wAmjnImJ7nBGHRKZfaVxDX3MLoKXx5cC2xK/A5vqGF/63vV
         Q5L2rZS9RR5Igz2C+SWVLrskXbz3yLYAj0fN2c3v4Ml5swRGJaR2FyMLkiiapBGuBmHa
         SsL7ZBSJd7UbwZyZEOjOf28j74ufMSHvYHHhoAuj9kttzxS1Xqifb2RqQTRu1TBWlHNn
         JtzUcfUzBvGjDzf5d9JAGvpGATxpiuhPRazmo/1hRDvBev3SyJ8tNDOK/9x244eXxAwZ
         rCY3aB0xht7Vf6hA9XJbzjWNzljfYO5chCNv8aZjLVwn4wmnWzL21Ar6WJRbbFSVKbH7
         NpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860540; x=1707465340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyMkE39StgLvA3SInVPI0AARfSkny9Aun6vln2isN24=;
        b=mnYKG4kfJUDxtLoRXfj0axSDhf1MrhPEJbaENK29O2qcXt1uSHAeRuvUTdT7MM3yCl
         lu0+NJXEQJMTksycNMlHo3rl3nQO24/iedtcvSdwCL14+Nd9NhawctQz8K1t9duR2Wm6
         VnHAXI2P9upUzGDTRpxZl3xr/X23XqL59/hm1l/HVvjL9K0hvAs7kDUX2umuxEXjQIY4
         TDFVYe+p2Q5gFznIc20k3v3MZMTBDHTkTpTqrqi9R/pY1usXgpildz4vERoIkfMB/eB/
         Jq94ZsCGTkO8BcjqPWJY67UMOG2X5bh4dyYx2E0PIvFQdjisp2AvWbLFKHAxxXnsfKum
         v3qQ==
X-Gm-Message-State: AOJu0YxihOaSD6rPw6dV8plIF7qnk5lUrsXN5OUFbLERNptI4cB+pfS/
	arPXHvhGl3qOXzoY7BLxcoshulTrzt2mySrjxweNGjOFZNR+8+2ZquhfGp7a6Q==
X-Google-Smtp-Source: AGHT+IG4wdKiNu3Gu8m5mk1omt4OcK7bNheqFkPbehysCvBX0GDy6UX6XToxoJbnXJkQK1QxfzXmwA==
X-Received: by 2002:a17:906:7256:b0:a36:c8fa:45a8 with SMTP id n22-20020a170906725600b00a36c8fa45a8mr978261ejk.24.1706860540122;
        Thu, 01 Feb 2024 23:55:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWfNhn1syeRgH0Sih+5MJL270DZYyPFO08Dcbc8czQ/EJvByM26xiU5/VVJbjCCTEfz4nCXI+APMIjCy+0V6KFLvryBFiuCXlTLgekNDRA5CUOB0Xt4zqTlKsIQOlLWlPm7+5hz
Message-ID: <90e22c7c-866f-402a-ac47-6eb0e094fce4@suse.com>
Date: Fri, 2 Feb 2024 08:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: arrange for ENDBR zapping from
 <vendor>_ctxt_switch_masking()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c19cf600-5971-457b-936d-77a035ab6913@suse.com>
 <e42ee8c5-10b0-4369-8cc9-7b298fa68ef7@citrix.com>
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
In-Reply-To: <e42ee8c5-10b0-4369-8cc9-7b298fa68ef7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 22:12, Andrew Cooper wrote:
> On 16/01/2024 4:53 pm, Jan Beulich wrote:
>> While altcall is already used for them, the functions want announcing in
>> .init.rodata.cf_clobber, even if the resulting static variables aren't
>> otherwise used.
>>
>> While doing this also move ctxt_switch_masking to .data.ro_after_init.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -258,6 +258,11 @@ static void cf_check amd_ctxt_switch_mas
>>  #undef LAZY
>>  }
>>  
>> +#ifdef CONFIG_XEN_IBT /* Announce the function to ENDBR clobbering logic. */
>> +static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
>> +    amd_ctxt_switch_masking;
>> +#endif
> 
> If we gain more of these, I suspect we'll want a wrapper for it.
> 
> Irritatingly you can't pass parameters into global asm, because the nice
> way to do this would be an _ASM_PTR in a pushsection.

While I'm not convinced resorting to asm() here would indeed be a good thing,
for very many years I've been carrying a gcc change to permit exactly this.
I don't even recall anymore why it wasn't liked upstream.

Jan

