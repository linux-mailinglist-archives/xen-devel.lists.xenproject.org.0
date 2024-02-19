Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243585A30A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 13:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682819.1062009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2bf-0004Jm-0V; Mon, 19 Feb 2024 12:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682819.1062009; Mon, 19 Feb 2024 12:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2be-0004HK-U2; Mon, 19 Feb 2024 12:18:46 +0000
Received: by outflank-mailman (input) for mailman id 682819;
 Mon, 19 Feb 2024 12:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc2bd-0004HE-Rq
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 12:18:45 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 069badd0-cf21-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 13:18:44 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso15934841fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 04:18:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 js21-20020a05600c565500b0040fdb244485sm11066418wmb.40.2024.02.19.04.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 04:18:43 -0800 (PST)
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
X-Inumbo-ID: 069badd0-cf21-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708345124; x=1708949924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFksg9v+48EyT1bwVhVYyRpB/kruATCnUqr7x+UCQOI=;
        b=Zs912XdQta0rjpY2j4hXzFmOU2bozqnc8Bl/su7l6JD5Abu0Sj5EUJaC/4bIq3sRx1
         HV4EjN9mZN6QmpKWwcQ6/VT1vwBK1/gszjzYABABBT0VH2AW/IS4UoJc7cRRc/MBzeyM
         OunmGhoLLzXIDeD97q/k/+gjRmTu6h2573QatsVxob2HLqKaYYfUD25pJzvLAqMot+w5
         QVh6qOiYzoYO2Bf9BqPXwx89LCvza/HdQjBfgN5T+yWqcRMMtlq7/q2fDNedhlE29aqO
         IetlLCpSNUyS1MQ5G0h+R1+E0E73dQk5XCdcjijOAsYhkcIMDux1Ogm5561UY/0j/Frd
         Wkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345124; x=1708949924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFksg9v+48EyT1bwVhVYyRpB/kruATCnUqr7x+UCQOI=;
        b=IbvNhhiaQRCbmJAloTED9GLtRwXEEmolOfrAtyH7mO8+eSX8RyuEH4JmEXJbC3194n
         Mm6/Zwy5VXJbhUSuHzTTm9XBLDSBQjqeeZLTib1S916+ogqrbRz0z+Q6qXHY/4LF5GuQ
         HaA27R+6IFus17pyb/+Dsoyf0Jasdze1y4bNBU+GbyUMcqzOMkvdTuZarbkFPVbTOz31
         OsNzwkcM4cIkgRq+pZM6GlFNtReZMzAViDpCoMm0J2XXX5mTLs9Xpf8sh2tm/dkkcDTZ
         ruuP7Xat2hA11ERAodH+zOppx1Hq+NZL9R0IYYRN4JzfT8RgKjQQrSahUj60NWBlN/4D
         VBdw==
X-Forwarded-Encrypted: i=1; AJvYcCUfgKLar4r3iQ+W/c8rGwNN/gCbtH1kBL5qCVyQaV/WmPY7BOFSuov21jd2uf2vDK9ATZDjmxMrwISVUEO1Kwrxu0zQ/s4mIYUb21WvWaw=
X-Gm-Message-State: AOJu0YzlsfDfUs442KISV49dEGjfCXhkiW0LQSN4SP3GKTVc4to//htw
	4v1mPdYnILZrfqK1dDD01Es1phz2H6HZ4okykoaK0e/M2WCcdGmVDQ8K6amg6Q==
X-Google-Smtp-Source: AGHT+IENjwWLcmiGaPMEf3C+Bwow3hWX+bUqZ4/B94VXSCNCx+1LazEjpTnDBv84OrO0j6SiTTrF3Q==
X-Received: by 2002:a05:6512:234a:b0:512:b1b7:a285 with SMTP id p10-20020a056512234a00b00512b1b7a285mr2991195lfu.51.1708345124250;
        Mon, 19 Feb 2024 04:18:44 -0800 (PST)
Message-ID: <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
Date: Mon, 19 Feb 2024 13:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
 <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
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
In-Reply-To: <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 12:59, Oleksii wrote:
> Hi Julien,
> 
> On Sun, 2024-02-18 at 18:30 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> Title: Typo s/introdure/introduce/
>>
>> On 05/02/2024 15:32, Oleksii Kurochko wrote:
>>> The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
>>> so it has been moved to asm-generic.
>>
>> I am not 100% convinced that moving this header to asm-generic is a
>> good 
>> idea. At least for Arm, those helpers ought to be non-empty, what
>> about 
>> RISC-V?
> For Arm, they are not taking any action, are they? There are no
> specific fences or other mechanisms inside
> evaluate_nospec()/block_speculation() to address speculation.

The question isn't the status quo, but how things should be looking like
if everything was in place that's (in principle) needed.

> For RISC-V, it can be implemented in a similar manner, at least for
> now. Since these functions are only used in the grant tables code ( for
> Arm and so for RISC-V ), which is not supported by RISC-V.

Same here - the question is whether long term, when gnttab is also
supported, RISC-V would get away without doing anything. Still ...

>> If the answer is they should be non-empty. Then I would consider to
>> keep 
>> the duplication to make clear that each architecture should take
>> their 
>> own decision in term of security.
>>
>> The alternative, is to have a generic implementation that is safe by 
>> default (if that's even possible).
> I am not certain that we can have a generic implementation, as each
> architecture may have specific speculation issues.

... it's theoretically possible that there'd be an arch with no
speculation issues, maybe simply because of not speculating.

Jan

