Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8049A72B72
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928654.1331332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiZs-0002kC-5g; Thu, 27 Mar 2025 08:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928654.1331332; Thu, 27 Mar 2025 08:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiZs-0002iB-2V; Thu, 27 Mar 2025 08:27:04 +0000
Received: by outflank-mailman (input) for mailman id 928654;
 Thu, 27 Mar 2025 08:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txiZq-0002i3-SB
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:27:02 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4154cb36-0ae5-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:27:01 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso6275505e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:27:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82dedf21sm29927785e9.6.2025.03.27.01.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 01:27:00 -0700 (PDT)
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
X-Inumbo-ID: 4154cb36-0ae5-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743064020; x=1743668820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0rI0MvUf6Y1Z8bBVeUVYbw6emjnFugFJY3sfFZH7c2A=;
        b=Hffi45lxgXLqzbkOz+eO+/zxX8JBSSTBwmSC9YFsauN0IXLCvd0dngouseptGRy+6d
         BbRqJ/dYaHYEDVorpN5HwgGxR+kIQhwwHKLqTjl7Mo9NJncnRMVVj7q699/h4ndgF2GW
         fqbwQiJF8mEOOseOrnBfdI8bTnLa6lmvPstbQbBzP0mMZ3PJB/ukAtfsEjIZZEcKmaD6
         b9jVmprvuIqAjfCqaTnOle6p3D6aBi0vCn8Z3kja963tTa4oYM819OCzyL8DO6jXKp6i
         yISSH/hkJzpKrDCPFa/ILsoiJzNB/vcT2onC2Zzj1WYy5WWOdz2lGRkiQ7TSMJGWLaCS
         AtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743064020; x=1743668820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rI0MvUf6Y1Z8bBVeUVYbw6emjnFugFJY3sfFZH7c2A=;
        b=culD0TZwKOtAjZzEDkRSbJTNF/S4U9XdvPJoYUKxWZbfNwL6U3SaTjX/vNnWh3IVEy
         lDUuXP1OVaRQ4zYedmPGW/sV3i8Vv/XH9jdlCQ+4gBXDtjMOiN0cf73sX+jZPJbTdLrC
         DvB22r44hAOwauINOvOMYeVc27Mf0ld1nqMKy3PNRVBEc4MZludm3H8YHM7amB6gshow
         +rzRf5Qh5O7goD/1cVaQqT3oKqr6NJ1BJ/nsAm3aWJgF6sgz5IgP/Q4q6SNPEw8L/ez1
         2452hz0JaBSlSxiU1nsDgwf/CDRGtQKccgiChlSTQ8y2LmBSU1fgBeQs2znwSOhR9lPT
         E8VA==
X-Forwarded-Encrypted: i=1; AJvYcCUGE3MazXN/quP9/3Yyk1aE+zIff+cBZOlF56Rh88JlsriESSkuvW70EKRw2CN73ircnM7iEGs+q/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa6RnEeV8NuU1DfPpqc6faSdacEB6j7OFs0ffoN0tVltMOmuzN
	Tb02lcUJ/vQZmMAG8TlJTs1xzOFZkeqQDfMh5W09c0VjhOJx0UrNOjVh6NyTrw==
X-Gm-Gg: ASbGncstwLncvpMrvNsjOcVRAo+ct04Ke0vkseUzceQ6hpsZgv+0QdycJOVlwQiFbvL
	z50Yv6n5tljaq/SzBfjStGg0EzYDejmX70OccYkmBN5BkJlWdOxqxehtD33WgvFtDn9GmfKVYlP
	AezQHxJbzuLjj2r8Va6baZOT15U/ooww65yZMccQf8jb3hCcOq9S1da4XzCN+Duxv78AerHTsBz
	+zQr9TSgOaemffbr9T1nKjGTXffu9wNiVxAdEvlUN8AKfxp23SQPw7uf7zZYWeRnrv8ocGfcSeP
	dWEWdfWv7rf5FzrVDKJaeGcZ5BYRxJbmOL49FD9HoeC1kneFNShLfORWi0xtLYCNOFMHHwql2SW
	2o/MqaEC6Tzl9bJk8eOUqfzeE3BFZBw==
X-Google-Smtp-Source: AGHT+IFCM9QoqGokMIinQR/aewa23+ccvooIid/S52q8MJJEOR2N3VfCyzn9Oj02KNlVxJ32Xznufw==
X-Received: by 2002:a05:600c:1d9e:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43d8582c4ddmr20672885e9.13.1743064020401;
        Thu, 27 Mar 2025 01:27:00 -0700 (PDT)
Message-ID: <a0334340-6dc9-4526-ab00-1d9bbb290de2@suse.com>
Date: Thu, 27 Mar 2025 09:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/percpu: don't initialize percpu on resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20250327052241.202167-1-xakep.amatop@gmail.com>
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
In-Reply-To: <20250327052241.202167-1-xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 06:22, Mykola Kvach wrote:
> Invocation of the CPU_UP_PREPARE notification
> on ARM64 during resume causes a crash:
> 
> (XEN) [  315.807606] Error bringing CPU1 up: -16
> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
> [...]
> (XEN) [  316.142765] Xen call trace:
> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
> 
> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
> only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
> INVALID_PERCPU_AREA depends solely on the system state.
> 
> If the system is suspended, this area is not freed, and during resume, an error
> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
> set and park_offline_cpus remains 0:
> 
>     if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>         return park_offline_cpus ? 0 : -EBUSY;
> 
> It appears that the same crash can occur on x86 if park_offline_cpus is set
> to 0 during Xen suspend.

Oh, also - it's not "appears"; iirc Marek meanwhile confirmed the misbehavior on
x86 AMD hardware.

Jan

