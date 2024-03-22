Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E0886778
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 08:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696669.1087770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZIJ-0007Ja-WD; Fri, 22 Mar 2024 07:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696669.1087770; Fri, 22 Mar 2024 07:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZIJ-0007I1-Ta; Fri, 22 Mar 2024 07:26:27 +0000
Received: by outflank-mailman (input) for mailman id 696669;
 Fri, 22 Mar 2024 07:26:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnZIJ-0007Hi-56
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 07:26:27 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7db527ef-e81d-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 08:26:25 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56890b533aaso2139107a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 00:26:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1709066b0200b00a46c1dd36f0sm716150ejr.173.2024.03.22.00.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 00:26:25 -0700 (PDT)
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
X-Inumbo-ID: 7db527ef-e81d-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711092385; x=1711697185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQMZ8de7SAwPfLPn7Gq5ffe7xaOgBVkw3zMTnDc8cMI=;
        b=RGALkCx2VQ9SYQ8hwcXPukfds8Z0gBAu/K/AKT8RJS/qp9hTjVUCFlkdn9pwcZpYqV
         n8Iq1rW0XSfKgJdFPMCr2uuJRmH3Slxb4HXYBQbaxi/A1WMOI6nm3TA//goTWBOtflmV
         QmhOYfovP6RRRVIGEck5reTNBGw6z3jyl7TtaRshsz2zwCidTZGyAPuA/642K5T3R5hs
         CDgRVNPwj7BPtM+N+HY1OsaZbk25EfKZPt5eeZ2cz1VFsr9etKUYx+IUAHEZmhdbklOC
         LfsX/cJCvBxP5ZEY0PXA5T3Ud9Hek5IbbNTJmLy91L2zCBD776b+Lnmr1sHavzMh8+kT
         8y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711092385; x=1711697185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQMZ8de7SAwPfLPn7Gq5ffe7xaOgBVkw3zMTnDc8cMI=;
        b=wAFsNl7+tiiU0StxY+NGwI7Ymk7Q8mHjDRPLERypfO1lIgnqZdbJOQ9Jo6fDZm/PYn
         THQt5VWMKV1DXSYxjogzXSRF+dtCMRXxwD/C5ICksqLND3e73spydyCrgrgzDBFrD+pj
         6ZcAZvPP2UHPitqmbXa6ZQqbYyw/e49GCHjDFN2xPbIMebYQmvk+pIMgcOYWN9tThr4Y
         dM8F0kOBTdv9F9ocRLaY7B6D/CgWCXzD8EJgckK2li7BJ7Tjcl7D0qIs6pKicZUeph52
         Adeya8UDA2gATMK54XmjUuI6Dza3w7ObEI2LJXTapQcT6/gxcdDOqHuRiKEz5fKLFbju
         MZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyTEYAwL3dnqqg7G1JerNzGXAmXq27ni2m9+lCM1CCMHCAxwcOri9Z3nmpVpW/aSw8AmNqd3VpGuYHA+VhZ7JAvaJUA+qCF82K3xnEOKM=
X-Gm-Message-State: AOJu0Yy8Tz0TDutuZw23AKxmx0Thxj+1WQk/9RkWDSRrEsosGwym7t+U
	qNoNn+sCO6Gw9dTyubzhqLWgVFrrTNePj+f3Ha2ZKGCRf+W8wKtAKJC5dN1HFw==
X-Google-Smtp-Source: AGHT+IGrY0rpGEGZNbwFoDsaMbHyOVkCeJZ25gzMOEvjS53DH2f4Gqh20iTdn0baU8N2NiVpdnt7wg==
X-Received: by 2002:a17:906:2553:b0:a47:2087:c26f with SMTP id j19-20020a170906255300b00a472087c26fmr992755ejb.73.1711092385357;
        Fri, 22 Mar 2024 00:26:25 -0700 (PDT)
Message-ID: <22ab32bb-b0d0-4d68-8918-5fcb42cc0f88@suse.com>
Date: Fri, 22 Mar 2024 08:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech>
 <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
 <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
 <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com>
 <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com>
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
In-Reply-To: <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 18:31, Carlo Nonato wrote:
> On Thu, Mar 21, 2024 at 4:57 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.03.2024 16:04, Carlo Nonato wrote:
>>> On Tue, Mar 19, 2024 at 4:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>>>>
>>>>>  Specify a list of IO ports to be excluded from dom0 access.
>>>>>
>>>>> +### dom0-llc-colors
>>>>> +> `= List of [ <integer> | <integer>-<integer> ]`
>>>>> +
>>>>> +> Default: `All available LLC colors`
>>>>> +
>>>>> +Specify dom0 LLC color configuration. This option is available only when
>>>>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
>>>>> +colors are used.
>>>>
>>>> My reservation towards this being a top-level option remains.
>>>
>>> How can I turn this into a lower-level option? Moving it into "dom0=" doesn't
>>> seem possible to me. How can I express a list (llc-colors) inside another list
>>> (dom0)? dom0=llc-colors=0-3,12-15,other-param=... How can I stop parsing
>>> before reaching other-param?
>>
>> For example by using a different separator:
>>
>> dom0=llc-colors=0-3+12-15,other-param=...
> 
> Ok, but that would mean to change the implementation of the parsing function
> and to adopt this syntax also in other places, something that I would've
> preferred to avoid. Anyway I'll follow your suggestion.

Well, this is all used by Arm only for now. You will want to make sure Arm
folks are actually okay with this alternative approach.

Jan

