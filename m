Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F224AFAEBD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035332.1407572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhMA-0006c2-93; Mon, 07 Jul 2025 08:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035332.1407572; Mon, 07 Jul 2025 08:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhMA-0006ZU-5W; Mon, 07 Jul 2025 08:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1035332;
 Mon, 07 Jul 2025 08:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYhM8-0006ZJ-5o
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:37:44 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a67278fd-5b0d-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 10:37:43 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so2415682f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 01:37:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359ecd6sm8817441b3a.24.2025.07.07.01.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:37:42 -0700 (PDT)
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
X-Inumbo-ID: a67278fd-5b0d-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751877463; x=1752482263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4vZI2jLyyvAVgRlAdrnF1+n8vif273xRjwgfeFYSUo0=;
        b=Wg7L1Dttlu3VoyrvEemDjGOu29g8yt0vkUptdYh/G3Weay1r2wCOAHD30p61TGoYCC
         Qf7lwtAlSap3v3v04Yeng4/wp/k43LKPKe7PwhqhQE/GxHspuhhbqpbpHS9u21JHI3OJ
         sRKcskPdZT1gV4RlneXRcUdjDnvrZMkt/i7FItBFxUgy+iLhUOH2jIok/VlWTLti0VUt
         RB6WpIrzKryIZ4+wRUDNPbxNFZMpFtRgjLFvdd1gsEdxanptY6YlIdzh67AsJ+UwGmSG
         K0wlgnwTQid9TGdkbwZukipgvCaiJCOA04Gin+TowrLj8u/RpBls9cqYLYniUotAimoq
         zKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877463; x=1752482263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vZI2jLyyvAVgRlAdrnF1+n8vif273xRjwgfeFYSUo0=;
        b=Wh6lDh7dvoH0Ezh8XIfT+Nsccv4O/6vlRgvV4Czrf6J5MbergyPb84lCZ/6ahWTVkp
         1qk7ClPQNeiCEVTTfCVYw+WXmyb9YtUsxKGA4gbjvImlrL2z6huZfkhtVRB0ZXf/T1af
         EIweEdO+D5EDrb+QQ28Vh0ye83h40cHkNVN8awm0hQXUsfIRoXaJMlD2680xqDPqoOIu
         8lus167w7ERWAw8LmBePqPYMQfp2L5dRSIvkBVIWaNZiVriIw9hHwT1WBPjeYtBqgFsk
         91OAZEeWGSfSTr1ZRRfMjpxD0L8gj7w9ce8PxCffTJTfh2b/l4OGvIokHw1BtsBdENmR
         1W/w==
X-Forwarded-Encrypted: i=1; AJvYcCUcRjE0dyRYBUXDkoF1180FBKbx/KalIu9L8iDmY6YWgLie7Z5zcTn3i7ysDS3phzGkMAv+KouVMyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0tlyvez1H6qcki+u8cklwVjqM70cUaMqLMoV0WA2sOp/jSIy5
	xSfd2nMkvS40lvT9xRJmLU1+h3Wi5a3d1mlPyuaxMrHsWBU9TF9+FSoKXZI3r96h6A==
X-Gm-Gg: ASbGncteUz/P8NX5BJ/plb3+Nvdx8UdZA97E4prG6+7xRU4IIvcVcqcu8jINCkg97tv
	FuFvwsppPCSAlCd12QtFFetkpGvZql/P/C3eg10KBvMWsl/0VBgRCLXI2mqoqBP/VKKr82mrJfc
	V4P3RHoV1jHZclYcSPFOEiJUcYJs3Zyb2Dsz3prLNn9Ouyi4dtLZLv0VEKNygiZMCGAFvlCnofv
	/Yl817f4a2phPkjkQx8SOphXMMFE4XkqFzTILGE/g0JosF7GhMzU3whEgD5pUZVmuU01KCoHQRk
	wCn15ncIqL7mtcSbn7M64UOe4oc/KnEaSkYeHpPQGyzT3c+nJHhYXE0XMzUCrIRDHsB4XW9p3Fu
	qtDoEWlQ6oKQjamygw5wtNvOgX00aY9wM1BA5oG4oyr0ca94=
X-Google-Smtp-Source: AGHT+IHWqoGQevTt+x5ZOf76hL3ghypCUoocQuApPqczzsRXt8jqJAIlRvUNbUoXPS3IB+0TNV7Ozg==
X-Received: by 2002:a5d:5f96:0:b0:3a4:f607:a5ad with SMTP id ffacd0b85a97d-3b4955846b6mr10148301f8f.19.1751877462840;
        Mon, 07 Jul 2025 01:37:42 -0700 (PDT)
Message-ID: <2eea2ae4-d7c7-4ccd-a042-8eb6fb55ca3b@suse.com>
Date: Mon, 7 Jul 2025 10:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] x86/slaunch: restore boot MTRRs after Intel TXT
 DRTM
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5b6b9bf165a4fd9444dc53848fb8faa2cea30781.1748611041.git.sergii.dmytruk@3mdeb.com>
 <d18fd33e-da42-4f05-a6f1-c03e5f2f34de@suse.com> <aGrw3G1Y8wztcrMW@MjU3Nj>
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
In-Reply-To: <aGrw3G1Y8wztcrMW@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.07.2025 23:55, Sergii Dmytruk wrote:
> On Wed, Jul 02, 2025 at 05:11:26PM +0200, Jan Beulich wrote:
>> On 30.05.2025 15:17, Sergii Dmytruk wrote:
>>> @@ -442,6 +444,9 @@ static uint64_t __init mtrr_top_of_ram(void)
>>>      ASSERT(paddr_bits);
>>>      addr_mask = ((1ULL << paddr_bits) - 1) & PAGE_MASK;
>>>
>>> +    if ( slaunch_active )
>>> +        txt_restore_mtrrs(e820_verbose);
>>
>> How did you pick this call site? Besides it being unrelated to the purpose of
>> the function, we may not even make it here (e.g. when "e820-mtrr-clip=no" on
>> the command line). Imo this wants to go in the caller of this function,
>> machine_specific_memory_setup(). Or you want to reason about this placement in
>> the description.
> 
> I think the motivation behind using this location was related to
> printing debug information in a fitting place.  The possible early exit
> definitely ruins everything here, thanks.  Will move at least to the
> caller.

Of course debug info logging will want to remain somewhat sensible. So, just
to mention, besides moving the call site there is also the option of simply
explaining why it needs to be here.

>>> --- a/xen/arch/x86/include/asm/intel-txt.h
>>> +++ b/xen/arch/x86/include/asm/intel-txt.h
>>> @@ -426,6 +426,9 @@ void txt_map_mem_regions(void);
>>>  /* Marks TXT-specific memory as used to avoid its corruption. */
>>>  void txt_reserve_mem_regions(void);
>>>
>>> +/* Restores original MTRR values saved by a bootloader before starting DRTM. */
>>> +void txt_restore_mtrrs(bool e820_verbose);
>>
>> This parameter name is, when the header is used from e820.c, going to shadow the
>> static variable of the same name there. Misra objects to such. But the parameter
>> doesn't really have a need for having the e820_ prefix, does it?
> 
> I don't think it's possible for a parameter in a declaration to shadow
> anything, but the prefix is indeed unnecessary.

Considering that without a prior forward decl

void test(struct s);

gains a private declaration of struct s (scope being just the function decl),
I expect the same applies to the shadowing caused by parameter names.

Jan

