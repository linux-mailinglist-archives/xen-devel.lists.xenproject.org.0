Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92EE86705B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685412.1066065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reY1h-0002nj-WD; Mon, 26 Feb 2024 10:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685412.1066065; Mon, 26 Feb 2024 10:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reY1h-0002ll-T7; Mon, 26 Feb 2024 10:16:01 +0000
Received: by outflank-mailman (input) for mailman id 685412;
 Mon, 26 Feb 2024 10:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reY1g-0002lf-Uy
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:16:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098541fc-d490-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:15:59 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so496715166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:15:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n23-20020a170906089700b00a4272b24812sm2258419eje.215.2024.02.26.02.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:15:58 -0800 (PST)
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
X-Inumbo-ID: 098541fc-d490-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708942559; x=1709547359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTvNZ3HGge1k6bKR+L3E3EUXp3IM01FdabSPSgnlCNY=;
        b=YtXogyHqBMvUD0f+gViNsGzY1h9Rpv+0El5ViVO0C6qp1HYLhSJONcWDiTR8qRECkq
         94rZo9jYIpKicqcuURXYLaLPcfZYngpgLhVhM+OZHSCTNWjUjrsK5561m+hCbkOf2+Z0
         FUlXfxoZSsHDw2TipJv4kCz+tHrNUBxziryA2noJEpx6/E95A16qpH0eFWia8BBUe1YA
         DS8G1Kh4dfrMMNmAZnwCfwwen6ZiKUQQ5XYHPOFE+ehsEUmSnQ1D5BZ6h4rcpWnKhOG+
         l24oOE+Hj9z8P9iERQG10eWt3hZKBZeqBv4p3Ajr7pcX/fqdeLdpFxI18m8v1SUlF/fR
         aecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942559; x=1709547359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTvNZ3HGge1k6bKR+L3E3EUXp3IM01FdabSPSgnlCNY=;
        b=O+f28OLIik6WC7ld99RH7i6PhhAI3K9ugktiz1y6cmOgipu7oo9933Dx28XQnwYF2r
         vtYb1KLci7pDfS7Mmm07cWTNdbf+YHUxNZqgtWr12g1ziaBXo23+QbZxwDto6VvYf6MZ
         wpb3MQcUPoWqsmAXHQ99Q7N5mNnm8Lg7Cg6ObvpB5DMFznDn7+d+AoM5C2nz+Yi+7iNa
         /l3Ym6d/hp0Ys+Ooln1ctrDwQEOeCNwGc4td6VTHzn9WeZ7A6Sm1hD+4a6PSrcMhbh0k
         jh2IRm7zzeoSEKQAYfdJji6ZcUQMivf2ynKQfz5JQ7qpaBpnWtPOGRwBC4TbPbilfm2X
         TY/g==
X-Forwarded-Encrypted: i=1; AJvYcCV5qRoWNLszvPFkFuTACVcCK4lzaMJZFWBgNaweE9qwL1LqcA12baF7UjqqnHGrHjQH0I5e/nhKljJAgs+3Vgkxyw+Sxc74Nlh6bmxTkuc=
X-Gm-Message-State: AOJu0YzM0dya1ulR2z9ERQ25hsL0HMiRZqTQ0OV8ObFoZpYiZaBbyNhO
	u50MO7carREB00e5Y7YjCLqnKe/EUAnJhoyzhq7s1llyEx6bgrzyXmAKTaSUPg==
X-Google-Smtp-Source: AGHT+IFSm/jfPK8Qnis1RqYbCgioJ8Mwp1ZgSrrjvebqu0GTTsIY22NL9I9oHFuUANZfjgnd5FdnIA==
X-Received: by 2002:a17:906:28d1:b0:a3d:6eb4:9769 with SMTP id p17-20020a17090628d100b00a3d6eb49769mr4556319ejd.15.1708942559115;
        Mon, 26 Feb 2024 02:15:59 -0800 (PST)
Message-ID: <d8666d36-cf27-4b4b-81e5-0eaba58f6669@suse.com>
Date: Mon, 26 Feb 2024 11:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-3-roger.pau@citrix.com>
 <3dcb9afe-7f3f-495c-b182-b4242b4cb337@suse.com> <ZdxVQRMRyQOEc581@macbook>
 <076cac3e-097a-4994-b68f-888b491c82a7@suse.com> <Zdxgf-1BvPQsnTVb@macbook>
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
In-Reply-To: <Zdxgf-1BvPQsnTVb@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 10:57, Roger Pau Monné wrote:
> On Mon, Feb 26, 2024 at 10:33:14AM +0100, Jan Beulich wrote:
>> On 26.02.2024 10:09, Roger Pau Monné wrote:
>>> On Mon, Feb 26, 2024 at 09:42:58AM +0100, Jan Beulich wrote:
>>>> On 23.02.2024 13:06, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/spec_ctrl.c
>>>>> +++ b/xen/arch/x86/spec_ctrl.c
>>>>> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
>>>>>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
>>>>>  int8_t __read_mostly opt_eager_fpu = -1;
>>>>>  int8_t __read_mostly opt_l1d_flush = -1;
>>>>> -static bool __initdata opt_branch_harden = true;
>>>>> +static bool __initdata opt_branch_harden =
>>>>> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
>>>>>  
>>>>>  bool __initdata bsp_delay_spec_ctrl;
>>>>>  uint8_t __read_mostly default_xen_spec_ctrl;
>>>>> @@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>>>>>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
>>>>>              opt_l1d_flush = val;
>>>>>          else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
>>>>> +        {
>>>>> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
>>>>>              opt_branch_harden = val;
>>>>> +#else
>>>>> +            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
>>>>> +            rc = -EINVAL;
>>>>> +#endif
>>>>> +        }
>>>>>          else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
>>>>>              opt_srb_lock = val;
>>>>>          else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )
>>>>
>>>> While looking at patch 3 I noticed another inconsistency: Wouldn't
>>>> "Compiled-in support:" better also enumerate HARDEN_BRANCH then, just
>>>> like for thunks both CONFIG_* state and actual runtime choice are
>>>> logged?
>>>
>>> Yes, I guess we would also need to expand "Compiled-in support:" to
>>> include HARDEN_ARRAY and HARDEN_GUEST_ACCESS.
>>>
>>>> Or alternatively, should logging of thunk runtime choice be
>>>> suppressed when the Kconfig setting is off?
>>>
>>> Hm, I think printing "BTI-Thunk N/A" is good enough when the thunk has
>>> been built time disabled.
>>
>> Good enough - yes. But redundant with the other log line. And since all
>> of this output is getting longer and longer anyway, omitting whatever
>> can sensibly be omitted might be at least worth considering.
> 
> I can add yet another patch to remove that when not built-in, this
> cleanup is turning into a never-ending exercise I'm afraid.

Just to be clear: I'm not meaning to insist that you also clean up the
thunk part. But I still wanted to mention such as I noticed it.

Jan

