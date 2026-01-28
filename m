Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHmICSAmemlk3QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:07:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B5A3842
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215777.1525898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl78A-0005QG-52; Wed, 28 Jan 2026 15:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215777.1525898; Wed, 28 Jan 2026 15:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl78A-0005Ne-1E; Wed, 28 Jan 2026 15:06:54 +0000
Received: by outflank-mailman (input) for mailman id 1215777;
 Wed, 28 Jan 2026 15:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl788-0005NY-D6
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:06:52 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f94c4a2c-fc5a-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:06:51 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-480706554beso6946575e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:06:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806e2d1d64sm1467845e9.13.2026.01.28.07.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:06:49 -0800 (PST)
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
X-Inumbo-ID: f94c4a2c-fc5a-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769612810; x=1770217610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jG4sfr+1ldP4fYlgJBRDbUJDlToChRYazDXEqzEqij4=;
        b=StTQ7lap6Ypr5nc0p2l2FP/1lw/E0LfslZj+88kZPMdlDT+1x+RsQv66rUUVaWmDe4
         LUi/lY0gHUgDmj+aXnlUa8IyPmDaw97WWhEQriaJniE4xxa1VUsY6r2vE+AYhX5RfSyS
         HjMwv8U8/1cPzeXQH9mVKU6nZL5TEJ1SAOZZS0f1N3Y/ihaRD4VTCAXAnpV176omXi7r
         9vT3daLWHhXEWdYXv/wCIqB9AnR4u5EQzaXjOteYqotaKfP9AlHmRkY14/6ItPvlLBbC
         8phB0FZo00EOpc/XS6r4eysTCG4Op7DA0teMIZeh0ZTSAimwyYnHfE+hY0tpRvadpKs3
         mWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612810; x=1770217610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG4sfr+1ldP4fYlgJBRDbUJDlToChRYazDXEqzEqij4=;
        b=okqdPTwjpLyO/MkTiJdHfyITdMNs+UFyfV/SR8arHRA6+dXtqAuuMV/EX3aV41LuGH
         bBlcCl2zb2ljsO59MIyytfDmofcJfng0pf9wTE3ZI6ETNA6h29Rhm43NBORuU8SDyNgK
         sM232l71QTHbhOmuwwrDF38fuS225EkdPs4TmGuhloUktBwKdnXTWZo5nSs1WeO83l84
         InoqbWQlh4Utlx+njXJLn5zByc/QLJAooHg/jbwiJqQmHDcNYoSmacEcOfuLWLhm2iwn
         NEPvlVobIQSzYmU02OUwsTad6WH8eeMdn+/atjO4VpssozCj2PpE7joDa0tTMPGjZrLk
         8tRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGHwAMoa9UYUvSEU90M+g+kllFaCJ/he7PVz/IS/Xa8Szt8Dl/rVUMM4hh3DbtKTix/YKaoKc0PrA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1n8nSTLVZgbXw1EejKThFrxG+gTzITWWLvNbKYYilpVhUQC7a
	FoQyB20yUUTe41qQJouJZcIxJcFNIB927kJQ13qckmAPk+pmXR2m7EVstRz/GtYj5g==
X-Gm-Gg: AZuq6aJ1VXvA+TqZohk3VkvvPBz3g6fuGOHIjTwgXPASVQVY6EIoLnzAy3nMgIfNNEZ
	cQhoXTv5SY1t5h8pPF2qrhw5mG3mLkMJxuZGXIlKrFPBfMoM0NwNtw2vhoQONpoRfD8hJ07gGi3
	QVyWuKIbEhvLaOnzeolE49yOf+ZnJF6vcBfLfqTvI+7HlMnTkpS/mLdhgLKctcOHdN87nZiqE8D
	U30XTL/4d772is21ufpOaBQfgE0k2cdsZlS6+JkFl4W2W8ZNiJEQCg78vSurOd98E+RbvnXI9Ws
	dIShQc0QV96hVbTKweF2aF+/tYdlgQDxKUg/ueb7hG++0U/p5FoFED0oJ7IqzuE7mbmCY8h2IOf
	F0AqQEkDPEWw1NgfMwxGU16B3N41e/os7uJeRy9BIAU0bQxdBDCsk66XIcoVkyvF+yt1eCi4vhZ
	mrJVs0z8Y1LHVjGU/ZdGL8qEFORqsa5/BFNNd1T9lDiuaRTYuZYA411ZqJJL/cNmo9ngRWBt8fG
	rP3hkhLII3aqw==
X-Received: by 2002:a05:600c:350b:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-48069c0def9mr72664325e9.6.1769612810163;
        Wed, 28 Jan 2026 07:06:50 -0800 (PST)
Message-ID: <0e919562-0e13-4f3c-b09b-156a0822eb53@suse.com>
Date: Wed, 28 Jan 2026 16:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a11e692c-2bfe-440d-915b-818b133874c2@suse.com>
 <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
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
In-Reply-To: <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5D1B5A3842
X-Rspamd-Action: no action

On 28.01.2026 15:35, Jason Andryuk wrote:
> On 2025-04-01 06:58, Jan Beulich wrote:
>> Leverage the new infrastructure in xen/linkage.h to also switch to per-
>> function sections (when configured), deriving the specific name from the
>> "base" section in use at the time FUNC() is invoked.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks, but ...

> Though I have two suggestions below.

... at least the latter really needs addressing.

>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -102,7 +102,7 @@ cc-option = $(shell if $(1) $(2:-Wno-%=-
>>   # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
> 
> Maybe expand to illustrate extra flags will also be passed 
> (-DHAVE_AS_SECTNAME_SUBST)?

I'm not sure here, but I can certainly add another example.

>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -48,6 +48,13 @@
>>   
>>           .section .text.header, "ax", %progbits
>>           .arm
>> +/*
>> + * Code below wants to all live in the section established above.  Annotations
>> + * from xen/linkage.h therefore may not switch sections (honoring
>> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
>> + */
>> +#undef SYM_PUSH_SECTION
>> +#define SYM_PUSH_SECTION(name, attr)
> 
> I put this through CI and it passed as-is, so it doesn't need to change. 
>   However, included in a different branch with some --gc-sections 
> experiments, I needed to add SYM_PUSH_SECTION re-definitions like above to:
> 
> xen/arch/ppc/ppc64/head.S
> 
> or ppc failed the linker script
> ASSERT(_stext_exceptions == EXCEPTION_VECTORS_START);

Yes, and exceptions-asm.S as well, to keep the code in .text.exceptions.

> And these:
> 
> xen/arch/riscv/riscv64/head.S
> xen/arch/arm/arm64/mmu/head.S
> 
> riscv and arm64 built, but hung when booting in CI tests.
> 
> There are also these:
> xen/arch/arm/arm32/mpu/head.S
> xen/arch/arm/arm64/mpu/head.S

Yeah, I need to re-scan the tree for all .section directives in *.S files.

This is getting out of hand, I fear, so rather than putting such overrides
in perhaps dozens of places I shall try to think of some less intrusive
approach.

I further think I need another prereq change. Right now e.g. PPC64's
.text.exceptions would collide with the code generated for a hypothetical
function named exceptions(). I don't like Linux'es .text..* etc very much,
but unless I can think of anything better we may need to follow that model.

Jan

