Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CAB25D5B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080911.1441088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSQF-0001Af-VD; Thu, 14 Aug 2025 07:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080911.1441088; Thu, 14 Aug 2025 07:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSQF-00018o-Qw; Thu, 14 Aug 2025 07:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1080911;
 Thu, 14 Aug 2025 07:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umSQD-000180-I1
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:30:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99094e6f-78e0-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:30:48 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b733bbaso1199861a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:30:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076724sm2533464466b.23.2025.08.14.00.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:30:47 -0700 (PDT)
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
X-Inumbo-ID: 99094e6f-78e0-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755156648; x=1755761448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T7+Q09yDuED16beZA9ZWGRMzNng+JHSe+S7kCEwdoTE=;
        b=Vi3LrxqTbbn1OsLdZ7wtOuT9f/4Ol4IUOxfD9CFwDJuaAXZNAvYDLceQWnYwPaOoez
         PusxMmHCRr9GY/jlYWg8WwFXIdbdxTlDm+JWIzrl0heLEj1NDgHvfhU+LAUOlO3IrdHW
         VplqKo2taNxU1w7sVKHpGW1ghSuqgC4lJhNE8r14GWbtt2GnwNhmI51XpPAnZWlApphu
         Bw79eaJeXypIXTRHpV+xbU5HpI3fkE0TQ0/rsD/1IgiD38eC6naCnL5eNpIuRGfZkfp3
         GZnK8Wnr5iuM/x7rVPzsaMXJESo6tYr7Bynk9bKvwliqwwoeMQSpjTkbf+xEWwZYU8F9
         eo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156648; x=1755761448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7+Q09yDuED16beZA9ZWGRMzNng+JHSe+S7kCEwdoTE=;
        b=cQeq6sUzucFPu4oNCWjHgVyu9GhzbY2NB6dHtCazldAuCrRKjZarCqUCx1KNzCLtIs
         yKwK6gRafEvH2IwKflg2lWDmw30Od1X+p2aTP0SIpmWs02auCcbt5vrzBlXzPxTbShsL
         vMp2/WJz7BiH+UHS/W4ZPxBieYX1H6a3pcsF4zmjLEulfe6cRR+VRQ8P2WJia25z4kyj
         o9XHmh/wifh4SIRV9GIR2rTpYrZWI52sH35FxOW4N8BBuHNeMoj+8kEWb7MqcTrrtwGo
         1zvTVsWiyX3H++53C2/Ntcq2fL/8smKo/RQVqf7ia0t+ODd418+CIZS40kQKntbnue1Z
         9ztw==
X-Forwarded-Encrypted: i=1; AJvYcCWvpTgoQNsNM7ToVuOM+PFYzhzQZstPTT4zFUlFjWB30SV+hEE83YQjEpUnyp34Vuj0U8zhWCwH15s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFq/kYVq0EocJzJzApt9omME8Wffx5jPh5A9NMra7cdYgHGut/
	TZW19GSh7mXAlBBHU2GPQGdrYwRVv+efEOAEHpZGN+THD7ErSb7fZ95Qf2SLuVrbcQ==
X-Gm-Gg: ASbGncst4Id0O3os8vVd7d4Nq0YlI5z8DZPjom+jWHhK02TtRfCahTwAaqopO3MNX7f
	ckml2pv2b4PKZkdGE6T3jFLTdo+U39HFBQd78Lg4ipxUOVqpkAxjDRxqUrFmEUAcanFdnmIwN44
	W+vbISbQE9lMGuchy5FGpP/gaqDG6SZF2fHB7rwRmNB4spJYoScbGk8SNkDF6/LeLT6zma+UyWH
	Y6vWNxRkgUTFteqWkI7gyNziTCx3xb7anEmB7cM+tWigc/NImyAcI6V2D5AKX3QIxn2G1i6eDFD
	MtXsHJ7f6adS6UEa7LiRGWsa0L0VK2BhGjQwZt6vCc4U6Mv1JegwhC+1nwI4gaug+1gjNWNK6cx
	kMc8sGi6QUzE+lru6VlD6mjHZ8QaQT+M+F2aGMx23hwwgcjlHwYYTY0m43fY/jbYHC8fWKu7w0k
	3UmZNTOfc5UYM5WzGSoP4Vk2+RDIet
X-Google-Smtp-Source: AGHT+IFH3wWHno/EYQsynWpw4z8+CfkvLFp6PHMm0BnVRmmVDKt8VvR3PHigGVkBJUp8vQFkXzQs9w==
X-Received: by 2002:a17:907:94cd:b0:ae3:6651:58ba with SMTP id a640c23a62f3a-afcb98e1ac5mr156026966b.35.1755156647925;
        Thu, 14 Aug 2025 00:30:47 -0700 (PDT)
Message-ID: <c63c34b2-d294-4710-8c2f-c59ea4775a13@suse.com>
Date: Thu, 14 Aug 2025 09:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <0beb69c9-9286-4780-951a-cc47b9a4624b@citrix.com>
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
In-Reply-To: <0beb69c9-9286-4780-951a-cc47b9a4624b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 14:28, Andrew Cooper wrote:
> On 08/08/2025 9:23 pm, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index a45ce106e210..90cbad13a7c7 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -57,6 +57,10 @@ config HAS_CC_CET_IBT
>>  	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
>>  	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
>>  
>> +config HAS_AS_FRED
>> +	# binutils >= 2.41 or LLVM >= 19
>> +	def_bool $(as-instr,eretu;lkgs %ax)
>> +
>>  menu "Architecture Features"
>>  
>>  source "arch/x86/Kconfig.cpu"
>> diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
>> index 61a5faf90446..2e5200b94b82 100644
>> --- a/xen/arch/x86/include/asm/asm-defns.h
>> +++ b/xen/arch/x86/include/asm/asm-defns.h
>> @@ -4,6 +4,15 @@
>>      .byte 0x0f, 0x01, 0xfc
>>  .endm
>>  
>> +#ifndef CONFIG_HAS_AS_FRED
>> +.macro eretu
>> +    .byte 0xf3, 0x0f, 0x01, 0xca
>> +.endm
>> +.macro erets
>> +    .byte 0xf2, 0x0f, 0x01, 0xca
>> +.endm
>> +#endif
> 
> Seeing as I know you are going to be unhappy with the Kconfig...

Well, we've got several, so adding one more isn't going to be the end of
the world. What we really need to do is finally settle for one method,
and then switch everything over to whatever it is going to be. I've
taken note to set up another design session on the topic in San Jose.

> I think I'm dev complete on the PV support now, and there's not an LKGS
> in sight.
> 
> We don't strictly need the conditional in asm-defns.h, and if we don't
> need it in C either then we can drop the Kconfig entirely.

Yeah, might be best for now.

Jan

