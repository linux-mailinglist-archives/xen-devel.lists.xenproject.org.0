Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31687CAF5E4
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 09:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181257.1504334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vStZI-0000tO-Io; Tue, 09 Dec 2025 08:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181257.1504334; Tue, 09 Dec 2025 08:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vStZI-0000qS-F5; Tue, 09 Dec 2025 08:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1181257;
 Tue, 09 Dec 2025 08:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vStZH-0000qM-2a
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 08:59:35 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60b6d32a-d4dd-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 09:59:32 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so3239716f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 00:59:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d330b20sm29591179f8f.29.2025.12.09.00.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 00:59:31 -0800 (PST)
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
X-Inumbo-ID: 60b6d32a-d4dd-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765270772; x=1765875572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iSudaLxSC12/glrex1pnn3uP4+VBeveqnn8TBYWgYII=;
        b=I91N8t0QBEj6poajNlD9TNwTt9P7LY+tSLFdmGpCPCT0AGMQykUPrp+xMSKL7I6xDt
         uT0Aa4yHjo/2UavFdH1XYbjpddo/DI3jSgpjXD6gJB7PC//lPk9gp/pSnncn2PKMSoS/
         TjoQ9qDqcbynepga2HsXVl/th96WpgA8gW9SYZD0ZBK5LlyWjd5dYFYBQv34oWWab4M2
         FiNhh8Xv6tXH16rorijT2z1m6dNHgfzscbnDRMiUw18irSpI0idyGkGTFTqu8JCfMeRP
         tQ90zQP/FRaGlHPBo5uQ296muTb02kqjqlLSvgBBywb+W4tYEtvFSOrZCjlzkXnCGcXO
         aaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270772; x=1765875572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSudaLxSC12/glrex1pnn3uP4+VBeveqnn8TBYWgYII=;
        b=k7JrKT4jWEieyZWFlNLZ+LdzUgWqd3MsMOZqbQDvrfkiqtJuk8w7g39Mz09JUBfGJO
         GUDkZQvv686kcbUjwU4vu3FzFl/yXm4p+kMQa12FMzOlDhnUYUBpc7kmyfNhxeEJrWfg
         cQdvAhP7GXLzjhjD9uH/Evo8kw3DDBfwOObEP0iU42xOywF0X16jkn80z1mSuq60bDHY
         nYcOW8o43abVaPMaos6ZAWBwJDlwLkyAh/dbyhaiHWvaZvQCFHagBIfxiwr9NS3YnWbk
         K11lUFZdPvselZbU0rwuqoCayuJh+83Z//Ug2UmRBsF3pA0bZgtev7Zk4o02HkvHdro0
         dNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEtWTiO0+CatuJ9BBcf2945DKZ/gUpd2Rq5pulve0uqiG5tserSoNn2RXaG95fP9roUK351zzFbmg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5sc3Rnq/2FQwPdRSpoyORem37E+z0rMhTNKThJFIUE+NBQSwU
	c/Yl9SPtoJx+kK+76mXUDsPE7kOKP275Ar/BerMk8mHtuWzuXnVavnh1SujTXWcq6A==
X-Gm-Gg: ASbGncsNk5hSe9/m83syRrBNEDghTJRc3pZOcGpLOagqThqPd50I9ZkJBT8MzquKomI
	pL5VcdcIB90R+yoCGywKTOY1Iay1gf8DQPcMcdN0bV3mACoH2ADPbNPcfVKYba8tYWjCXRd+JLb
	5wnxw8GaejxLU073L3PVh1KxwL6WqUIbwumjLYYw991nHR0kRIdppmGvVyJ1uV02a+5razfTGFF
	OwDJ3xNWJUponCeZjxTpAjYFv2uqkDwTINjMATivSsSmDKBsDpM4YEAwmX+4RKYBctYuorNvW9t
	lP40bx/DIdMdpFTwZKf6igofGgXbhi55vIYcmcxZqiqybFfIkVDGb3X6RDoJ1X3Ogrg99JULLR1
	+gPppwms6lVIcf6Np1U0q85C0VQhFG0h+kuniO+Ih2tQ9pl83aAOfV8mmsZFwvSkjF8VI+5+wRc
	Am3Ybvc0HrEMwR9VJE3PiIhpc5Xb4WR1PG8OFk49s7PyLx1/tt34j14ioy3/OaMrLojNAnkQfu4
	9w=
X-Google-Smtp-Source: AGHT+IGNv3wXntVimBoe8Au9/dVypZmS9s5gysTjzg/FnwnUFJkTJglT1nJGb8QapqnpHg776djuRg==
X-Received: by 2002:a5d:64e3:0:b0:42b:2ea5:61b6 with SMTP id ffacd0b85a97d-42f89f53becmr11910974f8f.46.1765270771886;
        Tue, 09 Dec 2025 00:59:31 -0800 (PST)
Message-ID: <a3dcfce1-4695-4064-a1e3-af09bfa04199@suse.com>
Date: Tue, 9 Dec 2025 09:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
 <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
 <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
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
In-Reply-To: <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2025 20:21, Grygorii Strashko wrote:
> On 08.12.25 14:44, Jan Beulich wrote:
>> On 28.11.2025 16:22, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/pv/domain.c
>>> +++ b/xen/arch/x86/pv/domain.c
>>> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>>>               goto undo_and_fail;
>>>       }
>>>   
>>> -    domain_set_alloc_bitsize(d);
>>> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
>>
>> You mention the change in condition in the revlog (but not in the description),
> 
> The updated chunk was based on snippet from Andrew [1], which
> used incorrect condition - I've changed it and noted in change log
> 
> [1] https://patchwork.kernel.org/comment/26680551/
> 
>> and I'm having trouble to follow why ...
>>
>>> --- a/xen/arch/x86/x86_64/mm.c
>>> +++ b/xen/arch/x86/x86_64/mm.c
>>> @@ -1119,26 +1119,6 @@ unmap:
>>>       return ret;
>>>   }
>>>   
>>> -void domain_set_alloc_bitsize(struct domain *d)
>>> -{
> 
> The domain_set_alloc_bitsize() inlined in  switch_compat() and x86 PV domain
> always created as 64bit domain.
> 
> At the beginning of switch_compat() there is:
> 
>   ( is_pv_32bit_domain(d) )
>          return 0;
> [2]
> above ensures that switch_compat() can be actually called only once (at least it can reach
> point [2] only once, because there is no way to reset PV domain state 32bit->64bit
> 
> this is original condition which says:
>>> -    if ( !is_pv_32bit_domain(d) ||
> 
> do nothing if !is_pv_32bit_domain(d)
>   - for inlined code is_pv_32bit_domain(d) == true, so is_pv_32bit_domain(d) can be ignored
> 
>>> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
> 
> do nothing if (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page)
>    - inlinded code should proceed if this condition is opposite
>      (MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)
> 
>>> -         d->arch.physaddr_bitsize > 0 )
> 
> do nothing if d->arch.physaddr_bitsize > 0 (already set)
>    - inlined code will be executed only once, so (d->arch.physaddr_bitsize ==/!= 0)
>      can be ignored

This is the crucial point: It being executed only once isn't spelled out
anywhere in the description, and it's not entirely obvious why that would
be. Yes, nowadays it is. Originally (iirc) one could switch the guest back
to 64-bit mode, then again to 32-bit.

>> ... this 3rd part is going away.
> 
> Another observation: MACH2PHYS_COMPAT_NR_ENTRIES(d) is looks like a const, as
> (d)->arch.hv_compat_vstart is always 0.
> 
> grep -rw hv_compat_vstart ./*
> ./arch/x86/include/asm/config.h:#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
> ./arch/x86/include/asm/domain.h:    unsigned int hv_compat_vstart;

This observation isn't directly related here, is it?

Jan

