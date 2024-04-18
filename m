Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDC8A953C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 10:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708121.1106728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNNP-0005VJ-Pi; Thu, 18 Apr 2024 08:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708121.1106728; Thu, 18 Apr 2024 08:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNNP-0005Tg-MZ; Thu, 18 Apr 2024 08:44:15 +0000
Received: by outflank-mailman (input) for mailman id 708121;
 Thu, 18 Apr 2024 08:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNNO-0005TY-AM
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 08:44:14 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2e9a973-fd5f-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 10:44:09 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2da0b3f7ad2so8530791fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 01:44:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b00414659ba8c2sm1922030wmq.37.2024.04.18.01.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 01:44:09 -0700 (PDT)
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
X-Inumbo-ID: d2e9a973-fd5f-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713429849; x=1714034649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrzzx0QyqjFOe7CSO6nFVxybZ3cFv/20nhPDhgcV50I=;
        b=fX1vP3mQds3WIllPB8vr4WDKxHm4kpg0Ype6OlPueHC0dH7MTG7IA6RxltOG9RxH8Z
         F9iUzunJYREeqEciQy2NFKphFLKVARaiMq++5Z15rJ+W7h9EqQ8JJqvvRlIq9On0qfwG
         AGaolhEBJciP3eqQHL/Tmkx8CB6e1G5Vt2tuy5wPE7l01eTQsO8qw0D0+bEu8tNeD4++
         Q2hUQVLGABHq6h8BwbBJ5iFjde6yYPZ+thlIxLIJu+iaRxwNqST60lkSGunCpL3C7fLy
         QDSsgHgW4VWPa5O3wU5rYgNyBOZKF84YMkTFQDbzcIzvFc+sTdIw/ku83+MgSIyQquGI
         ER3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713429849; x=1714034649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrzzx0QyqjFOe7CSO6nFVxybZ3cFv/20nhPDhgcV50I=;
        b=pfuQ3cWEmfKW0wAQ6rf1zPAtrQhCnVNHIcY4dQgue3Hf6BPO2t8e8OEyE4xdmB/fis
         1uAaV5iaPNFLdwaChs/mFYpZpaV5TGO9nRnrHhuUl73uPWROL2AU3ZX0pN3CdV5KhY0P
         vHLp4RUZ0mHBLdVAo202RLhP87Vmycx/8Ybu2IB/SW/9wHT7cj+H0Ux94qLqjmz7Ji1w
         j//y7u9u3+vZhYANqmgg5UitDEcFfa3vCQTozLA8uFLIT6RmzqZiT08y6u0Btx/pb4mn
         Ed0QmPg91HumF2H9IC8i2Rr+y25bKuIrcejuss7qmL/H1T+W36OZMHvR+uYxOg8jL4u2
         lJug==
X-Forwarded-Encrypted: i=1; AJvYcCW/G6SL7x57OLmx7ggCv9WeOjSgaJccu+Tcqt6hgsGTufUXOPBqXShLSM7xH/cECotShAin4zmkDznvoPqfo8wZ0RzdrjLPjasQkHmihDQ=
X-Gm-Message-State: AOJu0YwhOKiHB9fGczxTvRFz0nGDU3HasAWIDIeIS4QNTj5eXjuWfoqb
	mClrD6PtYU49s7xWFv/tpchhtx3VF/BLCK2V25IPYHiE4c600Hc2WUrBLrusXg==
X-Google-Smtp-Source: AGHT+IF7OH/rTpiYai0pd0fUuuedBY0W3D8wfRk11+KTbDHuavYB2ENcurjels62MhqMjP60o0kb+Q==
X-Received: by 2002:a2e:9410:0:b0:2d8:5a5e:7c5e with SMTP id i16-20020a2e9410000000b002d85a5e7c5emr996290ljh.22.1713429849204;
        Thu, 18 Apr 2024 01:44:09 -0700 (PDT)
Message-ID: <d45c35c8-7a2e-4d91-9214-32be60e5d020@suse.com>
Date: Thu, 18 Apr 2024 10:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch: refuse to resolve symbols that belong to init
 sections
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240412080722.75971-1-roger.pau@citrix.com>
 <a1444b09-ed0e-47d0-ad21-2b91077abbc8@citrix.com>
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
In-Reply-To: <a1444b09-ed0e-47d0-ad21-2b91077abbc8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.04.2024 12:59, Andrew Cooper wrote:
> On 12/04/2024 9:07 am, Roger Pau Monne wrote:
>> @@ -310,6 +313,20 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>                      break;
>>                  }
>>              }
>> +            /*
>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>> +             * livepatch payloads don't have init sections or equivalent.
>> +             */
>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>> +                      st_value <= (uintptr_t)&__init_end )
> 
> I think you want just < here.  A label at __init_end is the start of the
> next section.

May be, but not "is". It could be a reference to __init_end itself, for
example. Similarly st_value == __init_begin could be a reference to
the section end of the earlier section. I'm afraid the checks here are
always going to be fuzzy, and hence the description needs to discuss
the policy used as to what is permitted and what is not.

Jan

