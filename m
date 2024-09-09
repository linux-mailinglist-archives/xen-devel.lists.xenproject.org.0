Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F759718C3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794357.1203221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncyI-0004hi-SR; Mon, 09 Sep 2024 11:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794357.1203221; Mon, 09 Sep 2024 11:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncyI-0004es-P6; Mon, 09 Sep 2024 11:54:18 +0000
Received: by outflank-mailman (input) for mailman id 794357;
 Mon, 09 Sep 2024 11:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sncyG-0004em-UD
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:54:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c8e9e2c-6ea2-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:54:15 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c25554ec1eso5580177a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:54:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd5201dsm2952332a12.46.2024.09.09.04.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:54:14 -0700 (PDT)
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
X-Inumbo-ID: 3c8e9e2c-6ea2-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725882855; x=1726487655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZ/W5am4t3RZQg5k85gUVecIex2pBMJUoQwN3C/lhH8=;
        b=RoZWj/NtUaBccXSlS+j4FCJ/Y9XYJxLDPat+bqpsHnlwD9pl28ivnzSKmVPik20qcv
         d7WaMqSef3sReXaSnQAuGhVtaPIb01UNc+EIHHf+YTRgIh5oPu8BqzJviyye/gM+MQYe
         Fzl0Ggm0Mk5ebY7Tu5hcY4xWtoYqSUdOlRPPB2Jgaia7IgBAQPLXeaycTUJCFxGjuHaN
         A39gduv/JwvnLWDHH5bhi4vJUcZbZpmHK5iQf3y7QU85FofKwwLbdCDL2tGnHTiWXfGQ
         5MJH1wDDjw/77opNimgGKwGvYtuF3V812BG5gFAyxfEjzvcF6pUfcucElfkx+3Ofiy5d
         t6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882855; x=1726487655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZ/W5am4t3RZQg5k85gUVecIex2pBMJUoQwN3C/lhH8=;
        b=InV0ENKzvciBV62ssraFsfkVfiIWgq2GaBfxiDZX9KHXL6+2AaDbp2yP2Uv+/6/MSB
         gzAYMJCZpzmci/HJYgFcTEsRTFHa2I5Ya3D6Gtx7LCCITZmsEHbsouMndRYA049bj/af
         qp1R1PJ7ndIkTdhSzZUSJIXRtRoKzrEz+f5W4ckiNfHbr4JdGvT7kbbTykbD1AIUe+2R
         qw5yR52GWi202qwW7DebSs9fbot5KB4sT42CLi/KwhQbjZP/J7NMahl5B9R5RHouh0Lq
         AOX+lCxBR20lHV2YCH0jwpvAlc4PEgXADr8Eed8ndzncO1gHE6lJZU6lZ28X4grUniY5
         g6lw==
X-Forwarded-Encrypted: i=1; AJvYcCXLKT4vFlsIEq/NGoBUQrfC8sP7HSGcEQRwzpB+AKKwwYfEGVozYdG5y5khulVcJyiMrFW4u3qhQK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMYn7ftQ57+JjRu3qoqA2dkORhYAv6J8ZGc67TNUm+wMmVfFsk
	DPQpDEDWLo6SAIyCvfTh2fEE2LCFX5/yJO08QvjobsKc/QBW1dlliKNmyUIsQw==
X-Google-Smtp-Source: AGHT+IGjlBeWkgrhJJgHuR0eKuCZKhniGuFk5ngiIyhwy2m5OR0C4NHVZjPWvjMOVxPxxSSaO3VQYQ==
X-Received: by 2002:a05:6402:434c:b0:5c2:768d:23e with SMTP id 4fb4d7f45d1cf-5c3e964cac7mr7673743a12.27.1725882854611;
        Mon, 09 Sep 2024 04:54:14 -0700 (PDT)
Message-ID: <0e289283-78d5-439e-81ca-ffeff19a20f0@suse.com>
Date: Mon, 9 Sep 2024 13:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/HVM: drop redundant access splitting
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
 <bcaab3fd-2dca-4504-ad4b-830bc8dcf923@suse.com>
 <71f0d966-7785-4b58-9207-00cd5b5e84cf@citrix.com>
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
In-Reply-To: <71f0d966-7785-4b58-9207-00cd5b5e84cf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.09.2024 20:06, Andrew Cooper wrote:
> On 04/09/2024 2:30 pm, Jan Beulich wrote:
>> @@ -1094,13 +1094,13 @@ static int hvmemul_linear_mmio_access(
>>      if ( cache == NULL )
>>          return X86EMUL_UNHANDLEABLE;
>>  
>> -    chunk = min_t(unsigned int, size, PAGE_SIZE - offset);
>> +    ASSERT(size <= PAGE_SIZE - offset);
> 
> Do we really want a plain assert, or should we go with
> 
>     if ( size > PAGE_SIZE - offset )
>     {
>         /* Callers should have arranged not to cross a page boundary */
>         ASSERT_UNREACHABLE();
>         return X86EMUL_UNHANDLEABLE;
>     }
> 
> This is hardly a fastpath, and it's rather safer.

I can switch, sure, yet to be honest it was already feeling a little
like going too far to have the assertion, considering the obviousness
of all callers guaranteeing this. The only reason I decided to add
one is the remaining concern of there, at some point, possibly being
single memory operands exceeding PAGE_SIZE. Yet nothing comes
anywhere near that right now; whole AMX tiles are 1k "only", and tile
rows / columns are even further restricted. Of course, if and when we
add XSAVE/XRSTORE emulation ...

Jan

