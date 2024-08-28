Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA00962AC2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784947.1194371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjK0Z-0005mm-98; Wed, 28 Aug 2024 14:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784947.1194371; Wed, 28 Aug 2024 14:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjK0Z-0005lH-6H; Wed, 28 Aug 2024 14:50:51 +0000
Received: by outflank-mailman (input) for mailman id 784947;
 Wed, 28 Aug 2024 14:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjK0X-0005kw-GD
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:50:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9866e7b-654c-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 16:50:48 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8695cc91c8so718699466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 07:50:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5486994sm258523666b.14.2024.08.28.07.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 07:50:47 -0700 (PDT)
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
X-Inumbo-ID: e9866e7b-654c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724856648; x=1725461448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fb/0ZOBQiQlb+u4QQLMjeXGqqA54bgXEtZj2quhmFs8=;
        b=OCHUS0bd0i3LcqifpwRn5iupMzHpqCBK7qipBsPcAaku8HoiiMyCB/L/75J/y6kkke
         NfDylTfbEXhYEsvRUYvuoDPMKvf0/7+GlLrks7HVrHtK2h9jpS2wgeIEEQ/nsJVoCEKG
         v/XYsiNYcE2BMzZTtAJdlcyac6ZSGcxJygiqMbYRdCensC2MDyk2VkpNyn8x81kFJ8uw
         tlFkxb+kh8VK2TMN8zsjRmkoI8hgFgiG9cAFkPh4uOpj/rq6QLHjq8kv9dzeoMT4fuBf
         TZaxnEC1GlU7J9dkiq4FkS1DAug4/tWCiSybudOcHL8SN3R/BUFXiEscyF8rFpERESuq
         ua1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724856648; x=1725461448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fb/0ZOBQiQlb+u4QQLMjeXGqqA54bgXEtZj2quhmFs8=;
        b=N4soQZ3EdiXgQ8aKzujMH8LKjslMPOgYncPyjvhI3XKQHrIc9pvRl2WzLeSs5JX/fU
         HVA9ozCromD03uTGoglYN4+asYgRXT3sOLcTCeasySPc9Q+hAnKaM2/Zn3f0k8RgEGFF
         hdl0vrKYcLOkbyJTxyEoWB0E3JGEbUwaKRcQ17DsOgIQsneHwye/Ku6SlpFyBlH7SvnV
         pRsUSZ6C84+atpvkAwnK7siWYiFKnVKZCz13UipDiRLFSNHwwQkSXZR+qEf7Vukgkdnh
         14ByHZCk/YkvFGUkhhkE60ZGbH2kewNgBw3KuJ1FZhFNVhx6weL8y4ppWE1P4RjQqs1W
         F/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVirpviLVVBa8oH4jbIAfA+acex+agIs1HYZTqFHFZcmmuNYNsNjFDrT1L8lGtImerGoBmwoljMnzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzkmv4EdtToLepJuwXvBMWNxU9O8hrC6moDcmU2xo+VZ72I7kb5
	iyLk6Gb2JUuE6ES7JStlYme063m7ZRqK1TXQrDQjr/4RSdWJTavfue+NC4iuRQ==
X-Google-Smtp-Source: AGHT+IFWOATNkyxFxGi7ZkGmiVcyEBpDdAmPAewfmRHl2l9K7qxthZycsALyAqvRnCW3gdhJBOsB7g==
X-Received: by 2002:a17:907:31c4:b0:a86:7021:1368 with SMTP id a640c23a62f3a-a870a9ba5dbmr194676466b.21.1724856647582;
        Wed, 28 Aug 2024 07:50:47 -0700 (PDT)
Message-ID: <1eae8fa0-2d4c-4cf6-8120-fd7fefa523ed@suse.com>
Date: Wed, 28 Aug 2024 16:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/bitmap: remove comment-based deviations
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
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
In-Reply-To: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 15:12, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -565,6 +565,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
>  -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>  -doc_end
>  
> +-doc_begin="The expansion of an argument surrounded by tokens '{', '}' and ';' is safe."
> +-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
> +-doc_end

Not the least because this is quite a bit wider than ...

> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>  #define bitmap_switch(nbits, zero, small, large)			  \
>  	unsigned int n__ = (nbits);					  \
>  	if (__builtin_constant_p(nbits) && !n__) {			  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		zero;							  \
>  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		small;							  \
>  	} else {							  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		large;							  \
>  	}

... what's needed here, I wonder if we're not opening up avenues to
problems by generally permitting that pattern. Plus in the description
I'm missing a statement to the effect of why this is (always) safe.

Jan

