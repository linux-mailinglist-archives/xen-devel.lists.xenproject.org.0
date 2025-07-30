Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBFB159F8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 09:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063478.1429186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1YL-0005f8-2n; Wed, 30 Jul 2025 07:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063478.1429186; Wed, 30 Jul 2025 07:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1YK-0005dh-W5; Wed, 30 Jul 2025 07:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1063478;
 Wed, 30 Jul 2025 07:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh1YJ-0005db-EH
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 07:48:43 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c496301-6d19-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 09:48:41 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so2653948f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 00:48:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f567d1fsm8647296a12.14.2025.07.30.00.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 00:48:40 -0700 (PDT)
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
X-Inumbo-ID: 9c496301-6d19-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753861721; x=1754466521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXBpnwkNwfVdk9hL7gDoV1K1Jyzjeuez8pOrTfUtbxM=;
        b=KPF1S7C30W3T7KKy3qmSrPq16L3NVFfEmpH9fw1aF1Gdv1LcY+6RRBxh2/vKcP86lV
         XFiqQBbZgt/05iLd7wHr4SpYky34mzjHH6ADSHc5+rTxA4ERtxy5kmAfjkVlHhPZTS7D
         GyBRygwMGjvTvOCnIiJSuUYDYNhlUn4XpCC5gc+gaYK8XIwBAglP1NWFxnQ4U5HX3JCl
         IR04CmWlj5B2mKd+PxMbVALiSinQRypkoYonvIvk/nfsrJ1LGs5Nr2k2pqlv0o9bAHMe
         d79Cdhy+3ZXho56iJ/7Xjb7j2bE7Kke1N9G2GtCBlewVxDLOXc47ZbdMO5H5fDRPkTa2
         jXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861721; x=1754466521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXBpnwkNwfVdk9hL7gDoV1K1Jyzjeuez8pOrTfUtbxM=;
        b=KHXg7paOxRYhSVWKW3rheYYEMNRHruYs9FJ7XqviJptkP2mB1rVwWmwR7rMEY6L86D
         q8I1L1yqFmpAr07YaNYpKOZY2W19mGqy1/RhH6IAa+2gswZQujWlbqbx1SRliD8kU0kZ
         DI08/URgRmUcUsGwIXN+n/GvC6ipWi8GnlWnVprq5mLkkAioe8mIE5k7MAsHzfTfVd9I
         eSgy3D61KfvQcumHiczca385VzLCnf+mQt2UIHYT5XscFWRjXOZjtuT7v2lmhC2aBz7Z
         XN3Xn6Li/pLQ/rXqKhb964U99/BBbxLxUW1krpm8L7Gl9b4T9cnNrQaXAxcC7i7ce9xw
         Wv+w==
X-Gm-Message-State: AOJu0YwQoP83FghcgDG0Jo5h1KsLD9cJ6H5h9Il6Bj+Q0TXMYNK+Sjte
	z8MSbahLXcwih0M5pZRBWPBCYxwzjXVTmgxj2gSzgwDkTsk7QUSJ0RnXV4+BwuI08w==
X-Gm-Gg: ASbGncuM/4LdX/909vL+tkW/dwNh78/j5pUErORwBpSsYiHBaVr5UPlsFt4aGXA9WOX
	QJUifSwItuogyUhyLsmvxSJNxWMyliSSpmCucsAfd99M8ihs9zQ4pAFGnkj2guqqsGGoNCwuLP4
	LD6y8Fl//8tELlrz4GQJLkXzu9qmP8JVtKi7J1mcoevNibF3EjfDqUofliEUqEkq7BfALgpHr4+
	JNH/yxl7rNcMZCMym4KFxpwiUHCzIWSpBnz6hmNxus50ToGW/rjn/505FYW1jGr2ge0VPV04Mro
	1BfJnmowEdD0qDLA+x01KQ4rlDRzQDarTGOZMTCnJwEz/Nk2W/7d1t/7+BDZfank8WdDiTUgBAc
	s9uDQdHPA1Jl1S6HV7+JzoTHZd8eKMxWFMax81FyJv7/HtoKNXe63NPJrEOtZSStZJEyxgf072Z
	qQUB//56w=
X-Google-Smtp-Source: AGHT+IHIY0l8AnpyOsKH+v8kty+DpKTqDNtxXsZhwI6cjIM/3vzt8fQuYsAgA4VKbEOKBejQ2cpOZQ==
X-Received: by 2002:a05:6000:144a:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3b795033b1fmr1643806f8f.42.1753861720693;
        Wed, 30 Jul 2025 00:48:40 -0700 (PDT)
Message-ID: <0006e9f6-49af-4aef-b680-2042fb0d5213@suse.com>
Date: Wed, 30 Jul 2025 09:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local> <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
 <aINi024baOV5LQgn@macbook.local>
 <ba1de9a2-09b1-4332-b27d-0e485d0c8ce5@apertussolutions.com>
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
In-Reply-To: <ba1de9a2-09b1-4332-b27d-0e485d0c8ce5@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2025 23:29, Daniel P. Smith wrote:
> On 7/25/25 06:56, Roger Pau Monné wrote:
>> On Fri, Jul 25, 2025 at 12:02:18PM +0200, Alejandro Vallejo wrote:
>>> On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monné wrote:
>>>> On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
>>>>> Later patches will keep refactoring create_dom0()
>>>>> until it can create arbitrary domains. This is one
>>>>> small step in that direction.
>>>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>> ---
>>>>>   xen/arch/x86/setup.c | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>>> index c6890669b9..6943ffba79 100644
>>>>> --- a/xen/arch/x86/setup.c
>>>>> +++ b/xen/arch/x86/setup.c
>>>>> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>>>       if ( IS_ERR(d) )
>>>>>           panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>>>   
>>>>> -    init_dom0_cpuid_policy(d);
>>>>> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
>>>>
>>>> You possibly want this to be:
>>>>
>>>> (d->cdf & (CDF_privileged | CDF_hardware)) == (CDF_privileged | CDF_hardware)
>>>>
>>>> To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
>>>> and not to the hardware or control domains.  I assume it should be
>>>> possible to pass a different set of cpuid options for the hardware vs
>>>> the control domains.
>>>>
>>>> Thanks, Roger.
>>>
>>> Why only a hwdom+ctldom, surely a single hwdom should get it too.
>>
>> hm, not really I think: a late hardware domain would get any custom
>> cpuid options from the toolstack that created it, or in the
>> hyperlaunch case from the provided configuration, but not from the
>> dom0-cpuid command line option I would expect.  Otherwise you have two
>> different sources of cpuid options, the inheritance from dom0-cpuid,
>> plus whatever is provided from the hardware domain configuration.
> 
> Yes, this has been a sticking point for me and never got any good 
> answers thus far. Should the dom0 related xen command line options only 
> apply when not booting via hyperlaunch. If the answer is no, then you're 
> in this area with some dom0 options that really are applicable to hwdom 
> vs ctldom and vice-a-versa. Some could even be suggested to apply to 
> both. And then, I don't believe there really is a consensus one which 
> options apply to which domains. Over the years working on this, I have 
> been an advocate that commandline adjustments allow for quicker 
> troubleshooting by the user/administrator. In the last version of the 
> multidomain construction RFC, I am growing more and more to advocate for 
> my initial proposition, that dom0 options only apply when not using 
> hyperlaunch.

With the hyperlaunch plans, is there something that's still properly
"Dom0", perhaps under certain conditions? That (and only that) is
where I would see respective command line options to apply. IOW no
more than one specific domain (i.e. in particular not to both hwdom
and ctldom, when they're separate). In cases when respective options
are entirely ignored, I think some kind of warning would want issuing.

Jan

