Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1ACC88410
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172244.1497338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO8tx-000363-Mk; Wed, 26 Nov 2025 06:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172244.1497338; Wed, 26 Nov 2025 06:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO8tx-00034c-JQ; Wed, 26 Nov 2025 06:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1172244;
 Wed, 26 Nov 2025 06:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vO8tw-00034P-Aq
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:21:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0f31de-ca90-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 07:21:11 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so59944405e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 22:21:11 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52?
 (p200300cab70c6a15dd939ad410e5cb52.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add608bsm25135245e9.5.2025.11.25.22.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 22:21:09 -0800 (PST)
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
X-Inumbo-ID: 1a0f31de-ca90-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764138070; x=1764742870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BYfasfMG06ZYWlpgML9VVHJGpVoNXMnxmAtR4qtxtA0=;
        b=RKfHvf89lTUUz3vooVIcmk2DqufHjgdQcUTPOfR1Hgm9D/HnNA0SStU/K6PxoXTyu/
         koTquk87J426jYAliQv3UmJwd46JyB58KVFz8noj34IPLe0ABC4qPOZdgFO8eAA9c3f+
         +tDCQNhGuP4RUeYrtexSNAskyqZ/h4X9EoN7UWsBkzCCk4UY0+Hxf4RnHu0sodiZFYrK
         lzRLCVU7Jh/35i40rw2fxtMOhjaH192mYQPGCh2Rm+EsljOAz2UbEgWLq04ZmkSXHRPS
         PKtbHbqAcBI0xV0QnjO8cn/QtjG/NH8cc2x7PnVn+5TUTxfgIP1Fx5ltLlf6vBUkRywZ
         AzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764138070; x=1764742870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYfasfMG06ZYWlpgML9VVHJGpVoNXMnxmAtR4qtxtA0=;
        b=BUEQnkMUQ7euMzcXifAzjmXgaiU2jXi6tRJ+PUBSv6Sj0R1EkesNGFar+XR0ZxpOmL
         7TLP4bDHr1Ns29Xqrwb+8ht4zTOJpf4ZQWm1yYwRPqfQSDZkTK4ddLXpaKqYnWX/2zaV
         9ieaYPs6Dczaad3ydCU/cefYAuqdX+yxGudssN+saCBRmnPZrhHWp3k2kztmpE6Umn/f
         g2bh+wTjtexQutxBqR8sDYMF5/Fyj8qO0KIt42M+F5n0Qno3dWcOc5MuxwH7wbR2NxNL
         d2hN9NjeVepyPyc/yTn4S5rqzM/p08+qMVhf3xvTd9zMuPhR7jAXyujcN/OTkBuusjmN
         q0yA==
X-Gm-Message-State: AOJu0YwNyz00qh7Y9t7s5n33CMbZym79xJYP/Kk5uqCQfp/p8t2LjdsM
	1UeQzTC4xqUucrA8B0kPG46L7bQDMD338MkNymcAvCge7DDZasFrzI/FRL225P5Q/w==
X-Gm-Gg: ASbGnct/JNndbdkuCrdceu1iw4Ylsu8LWkGMfKm27OPw/sX854TSGPxHf5Jq323HVMM
	os8mcfHaTdl4noZHLSzRzjbgRpcwHhTMMiYme56pYcwhXCLhlFe52YZtEiEvY1jDcD7gG99VzSX
	XYg80i7IMsVWnBKdOcWwsGo7fEwOabVYg5Zidu8wz4LPwHomfDqP4PDgV/o75ORzijGX3jomRwj
	SetHegkRni8HWY6f+8Bdq0Fk8yjQewONZVwtRFuxsMKiMA88RMWe9ZwKogkmUCInA9k8kkDv97P
	x23euzCu1AUyr/Q6Ux2YqFPE84fnLd294RUk4DuKp7eU8vbWLBt4cT6vtSe8nsJ2NyGe/1iIjv9
	a9Qfu77KH5FdBRbTBVgj75u6872sTE9yS5QWRzXOupSJbL7NzDK8R3JPn6G4gWbDsGaCJWWKAFg
	HMp0GT5pUS4YWDi6MDvAWcWhqkMG5Xi50896tLPxoPv+pExnotKTl4wk/uxKq2/0WHlDYvNRwk9
	j9QlOSR2FjmzyFejNj8sNBZDo5NWD6dM1vdDH5h8r5xu0b7juiCbZkG7Uo=
X-Google-Smtp-Source: AGHT+IEHS7CpqY6F7P8bdMTOGHiCLkI0D+HffVu+gYkeyRtMWzpGz7CUikM9R0kJhDB+6aHgWXusCg==
X-Received: by 2002:a05:600c:5491:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-477c110e391mr171833135e9.10.1764138070280;
        Tue, 25 Nov 2025 22:21:10 -0800 (PST)
Message-ID: <e23aa2e1-078b-477b-9176-28b4babec9e2@suse.com>
Date: Wed, 26 Nov 2025 07:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] symbols/x86: don't use symbols-dummy
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
 <3618c458-d9ec-4cc6-a800-0741ade461a1@suse.com> <aSXpJ3yqSWfNgElC@Mac.lan>
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
In-Reply-To: <aSXpJ3yqSWfNgElC@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.11.2025 18:36, Roger Pau Monné wrote:
> On Tue, Nov 25, 2025 at 03:14:27PM +0100, Jan Beulich wrote:
>> In particular when linking with lld, which converts hidden symbols to
>> local ones, the ELF symbol table can change in unhelpful ways between the
>> first two linking passes, resulting in the .rodata contributions to change
>> between the 2nd and 3rd pass. That, however, renders our embedded symbol
>> table pretty much unusable; the recently introduced self-test may then
>> also fail. (Another difference between compiling a C file and assembling
>> the generated ones is that - with -fdata-sections in use - the .rodata
>> contributions move between passes 1 and 2, when we'd prefer them not to.)
>>
>> Make tools/symbols capable of producing an "empty" assembly file, such
>> that unwanted differences between passes 1 and 2 go away when then using
>> the corresponding objects in place of common/symbols-dummy.o.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> LGTM, not sure whether you want to extend to other arches in this
> same patch, or simply guard the build of symbols-dummy.o for non-x86
> arches.

I think I'd prefer to mirror it to other arch-es, but in separate
patches (so they can go in independently). Then once all are in, ...

>> ---
>> May want mirroring to other arch-es.
>>
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -134,8 +134,10 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj
>>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>>  
>>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>> +	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>> +	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> -	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
> 
> It would be good if we could now stop building symbols-dummy.o as part
> of extra-y.  Maybe you could guard it with ifneq ($(CONFIG_X86),y) in
> the Makefile?
> 
> Or otherwise remove this from all arches thus removing
> common/symbols-dummy.c.

... I'd remove symbols-dummy altogether. I don't think there's a need
to transiently disable building of symbols-dummy.o for just some of the
arch-es (like foe x86 right here).

>> --- a/xen/tools/symbols.c
>> +++ b/xen/tools/symbols.c
>> @@ -672,7 +672,10 @@ int main(int argc, char **argv)
>>  				warn_dup = true;
>>  			else if (strcmp(argv[i], "--error-dup") == 0)
>>  				warn_dup = error_dup = true;
>> -			else if (strcmp(argv[i], "--xensyms") == 0)
>> +			else if (strcmp(argv[i], "--empty") == 0) {
>> +				write_src();
>> +				return 0;
> 
> Oh, that was easier than I was expecting for symbols to generate a
> working empty assembly file.

Yeah, I also expected it to be more intrusive. The file isn't exactly,
though - two of the tables (the ones with 256 entries) are emitted
nevertheless. I didn't consider this an issue, though.

Jan

