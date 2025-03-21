Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F88A6BC23
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 14:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924034.1327386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcpW-0007oi-V7; Fri, 21 Mar 2025 13:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924034.1327386; Fri, 21 Mar 2025 13:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcpW-0007lZ-S7; Fri, 21 Mar 2025 13:54:34 +0000
Received: by outflank-mailman (input) for mailman id 924034;
 Fri, 21 Mar 2025 13:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvcpV-0007lK-Dl
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 13:54:33 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 036bc144-065c-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 14:54:31 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3996af42857so2045272f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 06:54:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b4ce9sm2472443f8f.53.2025.03.21.06.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 06:54:30 -0700 (PDT)
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
X-Inumbo-ID: 036bc144-065c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742565271; x=1743170071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s0dHYabbBCmUA+FL5/nGfB/zmKf8mJVb9iNPYow5cxY=;
        b=fIi4mXYZorM6lMWTuqiBAOs64SWlp6gLB4p978LrFA1lVXtOT8L4rMmXbrX97fuBEz
         3I7/mEDXh7TUPCzxCQxtf4pvTZpuxKpFBrZGaL/vz0+Fs4wzYfbst9QHdGHctvZTj+fc
         Hdid4Ok8U7vFSvXVEQhn5vG5Tb2PnNZdd9UYmPDcEy930MrKD/D2MTBmAObCdDWnFBfs
         4E+rD9bbvY6MQXFG7JZUfB7ntoRSom72JBCnQjbgrdReP6XduERVNISTZtHBXdUIV7uP
         I3NeUBLa6DSkL0avWsrtuQpBk5OShvSMV4IaltYQ1u0VwpoL5nsDiswD9N5RcTfWLBoi
         uz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565271; x=1743170071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0dHYabbBCmUA+FL5/nGfB/zmKf8mJVb9iNPYow5cxY=;
        b=R2m46Mk8s0IaTjIFa9QAk3g7Ems6Ts3N2NDEsjGF581w03EYbKxAl2mF1k9Em3r+dC
         6Ars7g/yz8RGhta6GbvbE5wEy44L0VOAf4kXg0PXObsdGel7+UiGOSRIXw668Sg07+CQ
         8zACZxT1CSHqio3XWcJxBKgos5wPC5V02GeQfCVfNAL/m/MCVxa2lG8md5yvCcHTAD7E
         TcIcK1Rv81d9myihzOY6EPZ0IeQyJCgMyNLFC+LGsRL5SwOb+WnJ043CuQlryINdmdPw
         h6Hmt7OHLj8UYJjakWZmgyfTvC3dASg1/rlynllq8TmY6rvUehQiNFFr2JPrUH8gynCV
         NWcg==
X-Forwarded-Encrypted: i=1; AJvYcCUhvrx28wbKj1Ib5ZLDSLxTusSjkREa0fReJLUZ/tNgj6Y4kI8/oMRtVAXrWZpB/12la83LGUt7Os0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5AapUMQ70LqO0pMX6Ul9GL8mroJGYNgMJERMcXbvJhnuWkKnB
	9xrHIqzIuRBICQ9w8m+m0KV+LspCzl47ezLOWOJilLUJgM20zI4WxYj9mHyAGQ==
X-Gm-Gg: ASbGncvZlns/r6OhZoVDQu8URYNU3WSu7SQx5NepB/dXgJX322UgZzkr49rb70xj+qH
	ll/4dgTIS/9tWMhci+tXlcfqtmyeXeHT78nOIgddBMPWSQ8HkZQnaoLnfCDT7AjPSOCCyCkFRmi
	pc/VMKYR+nSiw6k9ZoFgiIme6JtPMc7taHCeXv2TTKP77KyWh2Iivu9ckltwoA13lBwdEaRWzY0
	7UjkAGEmEdpWlLGrPfbYd9EMV/cxmLqimlUL0qoFEtji+bm6Gg2j3JnCk/JbeIQGqIH4kti7RWu
	pTXKWychEvlqegpdpAJp5fxdR+CuZCjief767S+GO+nZH3nOYBDyumj+n68sBaybp0K7JTA8APR
	FN5q1ZU3Emp8PO27Mt2zlSZ+BomeJQg==
X-Google-Smtp-Source: AGHT+IE6h0VU10/V+Gxi6bm1JgQkr0uySubfImjRGlRbej+QrSDFXrdbheZ3BwK05fUrOLmhKVMP4w==
X-Received: by 2002:a5d:6c63:0:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3997f9103dcmr2541431f8f.17.1742565270657;
        Fri, 21 Mar 2025 06:54:30 -0700 (PDT)
Message-ID: <6f8b385a-447e-42c3-b942-ba4e9271de11@suse.com>
Date: Fri, 21 Mar 2025 14:54:29 +0100
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
 <08cf29e4-8029-4c3b-bb32-f84bcb6d3678@suse.com>
 <CAGeoDV_sq-BuYF0fp8KByzit6CySgn_1X3VnL2jXBdoGDnNsDA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_sq-BuYF0fp8KByzit6CySgn_1X3VnL2jXBdoGDnNsDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 10:48, Mykola Kvach wrote:
> Hi,
> 
> On Thu, Mar 13, 2025 at 6:20 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.03.2025 17:05, Jürgen Groß wrote:
>>> On 13.03.25 16:54, Jan Beulich wrote:
>>>> On 11.03.2025 21:59, Julien Grall wrote:
>>>>> On 05/03/2025 09:11, Mykola Kvach wrote:
>>>>>> Invocation of the CPU_UP_PREPARE notification
>>>>>> on ARM64 during resume causes a crash:
>>>>>>
>>>>>> (XEN) [  315.807606] Error bringing CPU1 up: -16
>>>>>> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
>>>>>> [...]
>>>>>> (XEN) [  316.142765] Xen call trace:
>>>>>> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
>>>>>> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
>>>>>> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
>>>>>> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
>>>>>> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
>>>>>> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
>>>>>> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
>>>>>> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
>>>>>> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
>>>>>>
>>>>>> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
>>>>>> only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
>>>>>> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
>>>>>> INVALID_PERCPU_AREA depends solely on the system state.
>>>>>>
>>>>>> If the system is suspended, this area is not freed, and during resume, an error
>>>>>> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
>>>>>> set and park_offline_cpus remains 0:
>>>>>>
>>>>>>       if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>>>>>>           return park_offline_cpus ? 0 : -EBUSY;
>>>>>>
>>>>>> It appears that the same crash can occur on x86 if park_offline_cpus is set
>>>>>> to 0 during Xen suspend.
>>>>>
>>>>> I am rather confused. Looking at the x86 code, it seems
>>>>> park_offline_cpus is cleared for AMD platforms. So are you saying the
>>>>> suspend/resume doesn't work on AMD?
>>>>
>>>> Right now I can't see how it would work there. I've asked Marek for clarification
>>>> as to their users using S3 only on Intel hardware.
>>>
>>> Seems as if this issue has been introduced with commit f75780d26b2f
>>> ("xen: move per-cpu area management into common code"). Before that
>>> on x86 there was just:
>>>
>>>      if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>>>          return 0;
>>>
>>> in init_percpu_area().
>>
>> Ah yes. Mykola, can you then please address this by adjusting init_percpu_area(),
> 
> Do I understand correctly that I should move the system_state check
> inside init_percpu_area?

Well, I can only say as much as: To me this looks like it's the best thing you
can do, given how the code is structured right now.

>> adding a Fixes: tag to reference the commit above?
> 
> Sure! Should I send it as a separate patch to speed up its merging?

Doing so may indeed help.

Jan

