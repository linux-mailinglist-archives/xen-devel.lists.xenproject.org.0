Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD8A82763
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944228.1342756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WBm-0005oE-VL; Wed, 09 Apr 2025 14:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944228.1342756; Wed, 09 Apr 2025 14:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WBm-0005lc-Sl; Wed, 09 Apr 2025 14:14:02 +0000
Received: by outflank-mailman (input) for mailman id 944228;
 Wed, 09 Apr 2025 14:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2WBl-0005lW-Nx
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:14:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23aa990-154c-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 16:14:00 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3759269f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 07:14:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a69asm1781503f8f.50.2025.04.09.07.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 07:13:59 -0700 (PDT)
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
X-Inumbo-ID: e23aa990-154c-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744208040; x=1744812840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0FkeNA3+l9t5VcrVno45C/8kxu9HzLSg+XeYcvo5PQ=;
        b=NeOSqZdDR1kRJHmxn9ba/xA9gNXiFQfFjWCq5PB10/wbVobLAzKC28HkN4EV5whouL
         SSh0PtNtc/igw3JSv2kTMLvl0zpUcflZ4ulEhufhQDh0G7dladf97AbBicPyJ6yl8Tnk
         RtgO+OqU+xQOxUitUN6V/du2QVMOz5R28kyBcH5lLzSSH9D3yp7p1OdB2+SgQKdcwXJK
         XjTBatCaarKOJPr3ebYISnzwC1OKLooKFZaA8PnzoZR0tJjfFd3DdEWTMk7hIXZLqPCw
         SnPfnBq28wORlVf6joIlpYo57T3hmiLKfwGsxfqZ8SOnTv2S7fSFUQYBDwMIybk3MLxF
         qjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208040; x=1744812840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0FkeNA3+l9t5VcrVno45C/8kxu9HzLSg+XeYcvo5PQ=;
        b=HH9N1OP5q/XvkAFbRM7qXO+2RgQv5j2AHc6BzudcguZwHJtZtvclZ4BgTXWZmr6NDR
         rNWkKZEOxYSNhY2LaBQ1wHZ1KU0uPUDugid72KXvlkKrLERWrYwIX2bwV5bFq2QrXZSc
         S9GWgAMjdqyJucDH2NiqhJgEipVUPA0zK6IXSYfQcEN9LFNSbBGvh8M37AGxDg89bMhG
         yP8DhdCUuwcK6dH1VgYWFiYhCMdr2MviQ+iOneVG3uZsLTNuLtqV8ShgsKDzahH3qqVA
         8o8wIE73KgbmU4KPtYn6Xf0ArIPzXVeaSwT1FkxX8aPfX1a0BivTtjHNGkELxYjVzGQy
         0mEg==
X-Forwarded-Encrypted: i=1; AJvYcCVZNGJp6vx03feV/Gvrq5OpePm4MF7hbK5DzMwqDmHy1QBroDo9UWc5k4XdLV/QIygQb1smOc2eMIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFrayTu1KAaLAiHjigM/d57WWxUCExCf6sMcs+XcuVzHoRxtvK
	sl8/0iM5E8PdF7s0XRH0ogaMmPivE9StRVERIU8VoQM6arq84R/zZgr/UFoowg==
X-Gm-Gg: ASbGncuErDBf2waNl7SwbUufFU2qoai+EBfpg6zWZMyj/FS8rs+hc95RIA3cRLTzcvp
	WefWgrh5vATMrZ4QESOU4e2hCes+yudexFsY9zCyQ3eMRKx4NKESwd+HpkyIlJkeIkAf4lR7e5V
	NvqP5JZJ1CLMSUUEPqliCiYMrRtSRhz6zM/QJgLXldCl76gCXUQPkyv8K4hL97wI/MtfxT9QCDO
	MwgyswDJ1yydouV2Y2BJauc0Nu6BOypLQEZ77KJtYqLm5eEIzMUSN6mhjYZ2wqTscPmTfX5dX+R
	s0EXN1eRZbh8ZBBQVwhuhrRf4L/CHgGZQtiuSRv42wcbfK3bLjR/+JDcX/dBnlHAATUn1LGEXNG
	H1sYp1maeqC7A/QTzAIpxIWjM6Q==
X-Google-Smtp-Source: AGHT+IEacxUjdcucT5LOXJqlILNmdDksisoJ1h+CN7DxB2gHgyX7uGR9SULOBJnNZi910mXJcpr/6Q==
X-Received: by 2002:a5d:64aa:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39d88541852mr2685502f8f.33.1744208040143;
        Wed, 09 Apr 2025 07:14:00 -0700 (PDT)
Message-ID: <bd7d3af5-a140-4387-bc76-2e21f15ad52a@suse.com>
Date: Wed, 9 Apr 2025 16:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-4-agarciav@amd.com>
 <cdf00f8c-2143-48d6-abdc-8f56dafcc84c@suse.com>
 <D9229NGQ6QJ1.18Y8EVWZDY8U6@amd.com> <D922MBDY2JJ4.NQXTTKRAMFEU@amd.com>
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
In-Reply-To: <D922MBDY2JJ4.NQXTTKRAMFEU@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 13:28, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 12:11 PM BST, Alejandro Vallejo wrote:
>> On Wed Apr 9, 2025 at 7:48 AM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>>>>      return n;
>>>>  }
>>>>  
>>>> -static struct domain *__init create_dom0(struct boot_info *bi)
>>>> +static size_t __init domain_cmdline_size(
>>>> +    struct boot_info *bi, struct boot_domain *bd)
>>>
>>> const for both? And perhaps s/domain/dom0/ in the function name?
> 
> (missed this one)
> 
> Sure to the const pointers. But as the hyperlaunch effort progresses the
> point is to turn all this into a more generic domain builders rather
> than having dom0-specific stuff. Changing the name like that here to
> adjust it in a few patches down the line doesn't seem worth the effort.

Oh, if the function is going to fine further uses, that's likely okay.
("likely" because we've seen too many abandoned series, where we then
ended up with pieces that were never gaining their intended final
purpose.)

>>> While this tidies the local variable, what about bd->cmdline? As it stands this
>>> gives the impression that you're freeing a pointer here which may still be used
>>> through passing bd elsewhere.
>>
>> That ought to have been bd->cmdline indeed.
>>
> 
> Actually, it can't be. It's a "const char *", so XFREE() chokes on it.
> I'll turn it into
> 
>     XFREE(cmdline);
>     bd->cmdline = NULL;
> 
> instead.

At which point it can be xfree() again, seeing that the function ends
right afterwards?

Jan

