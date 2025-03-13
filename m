Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F23A5FB45
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912786.1318986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslID-0000DM-3u; Thu, 13 Mar 2025 16:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912786.1318986; Thu, 13 Mar 2025 16:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslID-0000Ar-0I; Thu, 13 Mar 2025 16:20:21 +0000
Received: by outflank-mailman (input) for mailman id 912786;
 Thu, 13 Mar 2025 16:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tslIB-0000AQ-Ej
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:20:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bd9f370-0027-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:20:15 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso8289835e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:20:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5cbfsm57734195e9.30.2025.03.13.09.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:20:16 -0700 (PDT)
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
X-Inumbo-ID: 0bd9f370-0027-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741882817; x=1742487617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CN2dl8hKbg4jB89UynxSOh+FhyrGQWCOyXDvUEro5kQ=;
        b=H2Rgu+K1kx04ASGvZlAJXm7c/W3f38D6fVvj4zl54XI0UJ68OtSVWNnY8eiy9GdPq+
         zLv8odHKrAKIbFs2X3XiSx5TBylo2c3w1c65AzrCQ5cIu+SzruhrTc4HJwLaDPz6XdEf
         OWScRoeiT2FBFbk3qn1NBKdnR2+y/EVMTJ1PkyWMSh0PDgWtdvxdmfazTK+60SztgCsQ
         kRCsrc7Xs57/66HbJsYuUTNRMxFCCi77lRvZJQNKtRHVmta+aglmrnxfz/gBQOimVTNK
         0RWHwU2wTNcy8lNZxegRNYpydekXfysqhj8kqWTEoMmj6paMvu3rdJbsR/YqP/topzJ/
         8YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882817; x=1742487617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN2dl8hKbg4jB89UynxSOh+FhyrGQWCOyXDvUEro5kQ=;
        b=MHcqvjCkn+zcc4s1eI8XD5HGXCn0YzD0oaf85Vjdf1k7miZMd/+xjvdnje4Tg75WY8
         6fcxUrYeFsN9qJZhn+PfRO+VSzZRhTw1dukS+/Wli91BdCFqZBSL1vTctJ+0fbQgftUA
         pyQDKgr9UNtrLIAv/bbyd7CxU15Mo/abey5CEtWd6x6Ff8J0GM7uWnETXPZecFzIr5EA
         4t8X264wggYVrOi3AkiEITLYv6e0z6txXyk1Kn7fw83SoPy1oyqCSVM67mWPxQdj5Gpp
         lKGUg7gUddFMQvs1Se+27LAaNGF3vQ/jbqwu8URHqykK83lkdGAmzlMYr8Ozg6Yfin+F
         fAew==
X-Forwarded-Encrypted: i=1; AJvYcCVZM3tlyDA+QdA7i7p9fpOySQeDnK4PLHdxsrEYiUj24rTBZNXZRp+IUYbDLkI9Id1i5A5BsX6jNG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG9x0fPNrp+uzzKZR6aaO5SmqXvC9n00nzS0xj7Xbjrp5UOEzJ
	vTVQi76Rt4F6f4yUCVdsCZx/czdbTXzMWW8SaXJpbuGSQb5/2/vtxk0pB91K9A==
X-Gm-Gg: ASbGncvh4ArakNDIkhVPtOkFdif1zAjP9RzsXE7jDEi2nxJbGItcMxO07oQp9V6uCZt
	MPd2XHdGKF7/aQ3z4JRZDAGZgt2n1pptE+7gyRcPph2WVZD3cjs05YT4xFf1XPE4IK/5DJsoeLq
	KvHtgxTeggi8zcbuCorCP9ukZ/Tfcp3P4cmxrufNXo0o1iwv04fEWE5X73M1dAFpSi+WLFXGnVA
	xIm1iBTY+pgWwcgEg6k5oEZQvEfMGAjrbSQrIDRhVouafQjMqNjcSLp+fxjTgPi90mL3K8d9Gzj
	81UDUMqbVe091KRi7j5uTntOwIK2yl+pOF9cElndPdPgVN0OpDenYAh52BC5FZdOhG2uPSy6rpC
	8UaVZwuSA/9e1Ibabr64GsooHZR62mQ==
X-Google-Smtp-Source: AGHT+IHiAv4zIgw+G18Ng3gwseaAkIWqFTWCIqiJHJ355h6rWe0iRM9d9bXFcZyQWVYP+ZX64dSPAQ==
X-Received: by 2002:a05:600c:1911:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43d1d8c6329mr2609365e9.13.1741882816849;
        Thu, 13 Mar 2025 09:20:16 -0700 (PDT)
Message-ID: <08cf29e4-8029-4c3b-bb32-f84bcb6d3678@suse.com>
Date: Thu, 13 Mar 2025 17:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] xen/percpu: don't initialize percpu on resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
 <c5ccb703-45eb-4fb1-842c-75317354afad@xen.org>
 <e8ddc992-a092-46d8-8c87-6b3c516fe464@suse.com>
 <32989e14-4754-427d-8347-73fc83a8bd62@suse.com>
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
In-Reply-To: <32989e14-4754-427d-8347-73fc83a8bd62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 17:05, Jürgen Groß wrote:
> On 13.03.25 16:54, Jan Beulich wrote:
>> On 11.03.2025 21:59, Julien Grall wrote:
>>> On 05/03/2025 09:11, Mykola Kvach wrote:
>>>> Invocation of the CPU_UP_PREPARE notification
>>>> on ARM64 during resume causes a crash:
>>>>
>>>> (XEN) [  315.807606] Error bringing CPU1 up: -16
>>>> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
>>>> [...]
>>>> (XEN) [  316.142765] Xen call trace:
>>>> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
>>>> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
>>>> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
>>>> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
>>>> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
>>>> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
>>>> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
>>>> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
>>>> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
>>>>
>>>> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
>>>> only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
>>>> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
>>>> INVALID_PERCPU_AREA depends solely on the system state.
>>>>
>>>> If the system is suspended, this area is not freed, and during resume, an error
>>>> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
>>>> set and park_offline_cpus remains 0:
>>>>
>>>>       if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>>>>           return park_offline_cpus ? 0 : -EBUSY;
>>>>
>>>> It appears that the same crash can occur on x86 if park_offline_cpus is set
>>>> to 0 during Xen suspend.
>>>
>>> I am rather confused. Looking at the x86 code, it seems
>>> park_offline_cpus is cleared for AMD platforms. So are you saying the
>>> suspend/resume doesn't work on AMD?
>>
>> Right now I can't see how it would work there. I've asked Marek for clarification
>> as to their users using S3 only on Intel hardware.
> 
> Seems as if this issue has been introduced with commit f75780d26b2f
> ("xen: move per-cpu area management into common code"). Before that
> on x86 there was just:
> 
>      if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>          return 0;
> 
> in init_percpu_area().

Ah yes. Mykola, can you then please address this by adjusting init_percpu_area(),
adding a Fixes: tag to reference the commit above?

Looking at the tags of the patch, please also make sure you clarify who's the
original author of the patch. Your S-o-b isn't first, but there's also no From:.

Jan

