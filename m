Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4E87EAD2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:23:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694749.1083821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDtR-0007St-8F; Mon, 18 Mar 2024 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694749.1083821; Mon, 18 Mar 2024 14:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDtR-0007Qf-54; Mon, 18 Mar 2024 14:23:13 +0000
Received: by outflank-mailman (input) for mailman id 694749;
 Mon, 18 Mar 2024 14:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmDtQ-0007Pn-1U
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:23:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bd73bc9-e533-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 15:23:10 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a46aaf6081fso235499866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dl19-20020a170907945300b00a44b90abb1dsm4826650ejc.110.2024.03.18.07.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:23:09 -0700 (PDT)
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
X-Inumbo-ID: 0bd73bc9-e533-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710771789; x=1711376589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzKDrBCNe4KDT0EZdUfGfCbruNaSk8Ji1ErhSE7z6i8=;
        b=MYC9JM99pinJ+t0pgtcN3qd/oW94ehTpJqRLasTKXVP/fXfT81dXGeB4XvaIS5v53c
         mcx+GeMzFivT+yLWKVlGGfdKehepWla+K8aFkzGh8limaCIAvKzvhLBhHaKcKc1PCFyB
         qdSFFY3mXOsWUp/aJGxsZgJomyTuuYG7s9ZAebU1tWPq8zsdv5KAjeJ1SfnHCeLhrEz1
         5Sq01W+sIwlptovd8OvKrrL2CkTu6SnLF9bHqTszJmDKfgkNQOvo5kJZRt6gM6lLD10u
         CAa0uFyW4RTdUiTMJcA1tkIg7FXKOhLi72F+3nha4uwbflKtI4U7I0P7ehAYSWC76cIJ
         w/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710771789; x=1711376589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzKDrBCNe4KDT0EZdUfGfCbruNaSk8Ji1ErhSE7z6i8=;
        b=QmcOU7n5kXJypcFt45mtigHK8LFOBj8MYxovdieZNohlmuyLWkrhRQq+6LQQkiCfC6
         xppkcped0xaPCPTDJK1W3k+3miAFiq5cOLksSsq6IMJRi43Kmjg12kg73f7gtz7fAOSP
         +99990Y0cKxUIcQf89YjgjHZxUfGxrY7mRnqbNhdAU5QupV1xxys/JN8WQ3oJTILSSOI
         X8IGREWhWLSH7cxhSE7W25yWrcEA1/jw+TOH3DN2oabPfMTZeCwtJFqi6ojyIt9E/4b3
         NHJr2nKJj2tcZ6hyaP9YXq5XJlP/Aa8tJKOvEgvhskRCNv7hAUMsjnYZd/85bQlF3CU0
         +mvg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Ppe+bEjT7cTxM4DV6AkWDG/Wq1u8ACMfQ2g40wAw49HWDtf7gBheyCxmPQO7xmempJXRk35zUwtZxAkuR6ppgFiCTQEjZd41/XWEccI=
X-Gm-Message-State: AOJu0Yz37jT59fXZunRnvdjF+CVolqrqbGFXgtjCiuJVmJ4vKZg7XHIk
	BS2cYMaalICp3djMQkS9C/xk5q/DJtt9AHrOVzLUT7IbUVGA5eMz4ezdo56GiQ==
X-Google-Smtp-Source: AGHT+IHR+RklMTX9K/qyQa0NuSMNJruYJjqhll/N6ysX+BzdBwvF7Kr0AvixSVOLEg7AJWI9kTIJFQ==
X-Received: by 2002:a17:906:2291:b0:a46:9395:de1f with SMTP id p17-20020a170906229100b00a469395de1fmr5811986eja.62.1710771789501;
        Mon, 18 Mar 2024 07:23:09 -0700 (PDT)
Message-ID: <d49ec73d-9a10-4c2d-a8ce-0c16f0bf749a@suse.com>
Date: Mon, 18 Mar 2024 15:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/virtual-region: Drop setup_virtual_regions()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-5-andrew.cooper3@citrix.com>
 <047ecaf2-66c6-4d07-ab14-9c50acfc1f9a@suse.com>
 <14accd85-d549-4551-a95c-6c8bcee92db5@citrix.com>
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
In-Reply-To: <14accd85-d549-4551-a95c-6c8bcee92db5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2024 14:49, Andrew Cooper wrote:
> On 18/03/2024 1:29 pm, Jan Beulich wrote:
>> On 18.03.2024 12:04, Andrew Cooper wrote:
>>> --- a/xen/common/virtual_region.c
>>> +++ b/xen/common/virtual_region.c
>>> @@ -39,6 +39,11 @@ static struct virtual_region core = {
>>>          { __start_bug_frames_2, __stop_bug_frames_2 },
>>>          { __start_bug_frames_3, __stop_bug_frames_3 },
>>>      },
>>> +
>>> +#ifdef CONFIG_X86
>>> +    .ex = __start___ex_table,
>>> +    .ex_end = __stop___ex_table,
>>> +#endif
>>>  };
>>>  
>>>  /* Becomes irrelevant when __init sections are cleared. */
>>> @@ -57,6 +62,11 @@ static struct virtual_region core_init __initdata = {
>>>          { __start_bug_frames_2, __stop_bug_frames_2 },
>>>          { __start_bug_frames_3, __stop_bug_frames_3 },
>>>      },
>>> +
>>> +#ifdef CONFIG_X86
>>> +    .ex = __start___ex_table,
>>> +    .ex_end = __stop___ex_table,
>>> +#endif
>>>  };
>> My main reservation here is this x86-specific code in a common file.
>> Are we certain both RISC-V and PPC will get away without needing to
>> touch this? If so, I might consider ack-ing. But really I'd prefer if
>> this could be minimally abstracted, via e.g. CONFIG_HAS_EXTABLE
>> (selected by x86 only for now).
> 
> This isn't the first bit of CONFIG_X86 in this file.  However, I'd not
> spotted that we have CONFIG_HAS_EX_TABLE already.  I can swap.

At which point:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

