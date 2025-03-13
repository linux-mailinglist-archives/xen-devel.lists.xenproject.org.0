Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C080A5FA7D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912673.1318895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsktK-00052R-4P; Thu, 13 Mar 2025 15:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912673.1318895; Thu, 13 Mar 2025 15:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsktK-00050Q-1R; Thu, 13 Mar 2025 15:54:38 +0000
Received: by outflank-mailman (input) for mailman id 912673;
 Thu, 13 Mar 2025 15:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsktI-00050K-86
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:54:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75e9dca4-0023-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:54:35 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso7977915e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:54:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b22f4sm25084265e9.1.2025.03.13.08.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:54:34 -0700 (PDT)
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
X-Inumbo-ID: 75e9dca4-0023-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741881274; x=1742486074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O7OelqZvCdDomWFkDsQuwgjVbqq59df2vBCRCCjmX24=;
        b=To6ANUHftHUGA3qrAnSisuL7wQKvZ9OHWMNT7N0b+CZIhD7l6dD4FfEJwCOhoCd7rI
         iQI/fKVIcxmk3c8vcxOJ1ZVeVyePnNoW+D951rKx9leULZ9lgn5HcFwY+ZmFWPC+kpGB
         bq6WIa+CBpYQjVzp+47G/xER6K+WUN5A/3u9gpLywUObr2zNCcGeRHoJC6Lz5tCLkcWC
         1wZsNldyxjBKxeiHa8yp3agg7oKWJdFHPwKARpUVj5h0kI4FZAJwm09EyAoJ5kwbh0FF
         H6iXKxx0+HGApPXUW+M58HoWXAVSbwlG++dya2VKo2wmA7oNJmeduiJXSI1IAaxaTR1c
         6Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881274; x=1742486074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7OelqZvCdDomWFkDsQuwgjVbqq59df2vBCRCCjmX24=;
        b=uSsdlZnK1o8p3e1vg/5ho5EqozD5GMKVwlULcqMU2pRTWl+WivVoc0qD0fneIutbXc
         7QQiODJbEmOl5/J2nPQXsoS9iV2BkpCTUKTjl/ED9Ax819b0p5kKWvo2E+m2lYEzuQe2
         dD3dK0x2hviUY/JTPKoUcKmw0lZ0F4ER7DY3t78Xt6pC3zR1SNMCEX4uwFGdQgU7RiTA
         gM2fkomSlE2uEV+YBAT0gQ0sABKgMpYCK9ia6MZKZX6nYxSnFmJjqvz59XB86Y7XK9oe
         UwX7dNAcc0KvjxfqVPxaykx0jUALbRlpCdbetNyb4iflbyjvwL8K+kLCn0m3VaF2K+Lt
         YWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrCb2QY6IY28nbgavX/mTTycezUvrJnMdWM9hoJf1TkQHQaorRQIoF5Cl7zAGG+pTNJaF+34yqpXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0MQFA3zoPskCFgOZagck+O4hDEB0pF5xcvp6y7A/dQlx/RxMV
	/mKTIT+/cYF22J7MdcbYIGExsaVnfDTVYHhZ9XaJS9MyCe4d1xY2kTEKW95cKg==
X-Gm-Gg: ASbGncsnkjVHQS6yVdGHAt3we4kjAkyb7VjHJsajZ80u1mRx9aplFrJxsQVPVAjw9mQ
	dmoyeO72mxHUsm6RqkPhtcdtUehu4SrrAskxbyf8Egw+7UZDDAYNNmYlMlzZgVf0panp5EjGWFy
	7Ivd+9Ye+zzv6hQqVWf/pohvJ7AaDccnc1qMZwAndrIsPUres9sLAjfqhYIayXPPjAcu3Rb2Bsj
	aSbfVKzuHyRs5gt8YMNTenz6Hmy0LvH8T/LPCjguPMAnOhSLqK9gsaCVMn2E+yh087WwYgXB/yU
	sUSjI0RxMws0W1H6wpLbysrvyALG3ZVryuRcVWif6AuFfGCz8GR3Cf4R+H7rUN4TqBsQPhAH1/y
	BsEICaye/4n3D/cPhG6jbkMIPHpwu5Q==
X-Google-Smtp-Source: AGHT+IFJ5jFnbg1WSh9MlOJl+4LBZaW4jwjGWlslStwxY636wihrfU+WuNzq9EWOJiSoZpTLg3EJOw==
X-Received: by 2002:a05:600c:4750:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-43d1d8aae9fmr1643995e9.8.1741881274583;
        Thu, 13 Mar 2025 08:54:34 -0700 (PDT)
Message-ID: <e8ddc992-a092-46d8-8c87-6b3c516fe464@suse.com>
Date: Thu, 13 Mar 2025 16:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] xen/percpu: don't initialize percpu on resume
To: Julien Grall <julien@xen.org>, Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
 <c5ccb703-45eb-4fb1-842c-75317354afad@xen.org>
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
In-Reply-To: <c5ccb703-45eb-4fb1-842c-75317354afad@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 21:59, Julien Grall wrote:
> On 05/03/2025 09:11, Mykola Kvach wrote:
>> Invocation of the CPU_UP_PREPARE notification
>> on ARM64 during resume causes a crash:
>>
>> (XEN) [  315.807606] Error bringing CPU1 up: -16
>> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
>> [...]
>> (XEN) [  316.142765] Xen call trace:
>> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
>> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
>> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
>> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
>> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
>> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
>> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
>> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
>> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
>>
>> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
>> only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
>> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
>> INVALID_PERCPU_AREA depends solely on the system state.
>>
>> If the system is suspended, this area is not freed, and during resume, an error
>> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
>> set and park_offline_cpus remains 0:
>>
>>      if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>>          return park_offline_cpus ? 0 : -EBUSY;
>>
>> It appears that the same crash can occur on x86 if park_offline_cpus is set
>> to 0 during Xen suspend.
> 
> I am rather confused. Looking at the x86 code, it seems 
> park_offline_cpus is cleared for AMD platforms. So are you saying the 
> suspend/resume doesn't work on AMD?

Right now I can't see how it would work there. I've asked Marek for clarification
as to their users using S3 only on Intel hardware.

Jan

