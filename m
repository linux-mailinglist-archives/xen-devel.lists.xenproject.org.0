Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB596B1B0D4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070191.1433838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDng-0004Cu-4P; Tue, 05 Aug 2025 09:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070191.1433838; Tue, 05 Aug 2025 09:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDng-0004AT-1X; Tue, 05 Aug 2025 09:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1070191;
 Tue, 05 Aug 2025 09:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujDne-0004AN-TW
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:17:38 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 020bf85a-71dd-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 11:17:28 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61564c06e0dso8001497a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:17:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e89a6sm870583366b.73.2025.08.05.02.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 02:17:27 -0700 (PDT)
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
X-Inumbo-ID: 020bf85a-71dd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754385448; x=1754990248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xzpkgUv+tbfllsCx7on+wJb+3q5l4xEijfswrLzarYs=;
        b=Xh99StgBHsBsIbXDFXjEC9utd0vl62ZHNo6u+nK/idltb75aDguL+ZKp4kmZq6X8za
         8KxFFo166LaJTY0AvwAElR+PWHUdRR9wDLId6yRhhnpXFCy2g9m33BQIjx51O6XCj1sF
         uO44TuRSaITU0RQBLSHqd6Rf4QmQ79XoozLmtoAkR87QrzY2Zp9XqLaEHmE+ld6YYYk6
         36kgejShMi/AkJBZ/BDu7oMNCD8/gERiXPJOYqwmiJD9SMU7OYEMs/iNlMSOSKm+WFvX
         F1MHYdc0AT1RSxSQfM+SY8d+CzVmPTazG0DJQpK+3xwkIQ6bIs4qxvboinThZmc3yhDf
         +rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754385448; x=1754990248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzpkgUv+tbfllsCx7on+wJb+3q5l4xEijfswrLzarYs=;
        b=HkM30ukzs4bEgAC6j/6xr19LcnLZII37Z61lchDbWnQ5aJh69T/gLxaWoE/TNuf2gT
         xW5B8lxw9GJYLcKxRO/kWMOtHVveDYOEsZzpSa2e9UIN0GYC67fdxI0K3hanzHGQ5/aR
         PIGsoKLTwH0RUpYGNwNCCCCepLc77vlU44l7mXCZE38IGfxFUbNlbTjrJl65OaaALVZZ
         QkgV8I5UkTXOdnwzaC3/191qIo32IH13Fxxps/4Ql3nYwghxr2F0NQZ0IQTtGAe/Xxie
         5fUmyzdwlbrtV30KAJo0oGxiIG9mFxB/6WlsXiGlDtsPN/Do3Yi9pt7rJf4w7rka+9Iw
         FsBA==
X-Forwarded-Encrypted: i=1; AJvYcCUNqJ6k2KWNwpcyE5Kh9QF7rCFWvc9w5pXdMiJfrDHThM+6wRUDIphFPOCIJntzEs1SHKOadZdHce4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+btzLqwlgGJE0a7LaQhwX3nNO/MRDt1lk8jceqsxBX+78MRBf
	cqT4oKL5hfI3feigayia/qfgjfeI72sEfNIYUoIlLspJsXMq++MEPvzTd1d475sUmA==
X-Gm-Gg: ASbGncs8w7qgJO+tlV4yfzrpqcOQ7z1R3T+6pTKuS86Au+HLOmcaJRqE9/hGLvchuLE
	OrzOwOn9RIuI4GwMWzzBukLH734rRfG9rHmF9GnXDGGkM7hDqznOODxErIve4CViollOxdYrduB
	XhOPc1EjObzKnnJgkVnONYcOD50fDfRCVw4i12TWl96hFIjzWy6hL2zOBLrs7o+Sl4+kArQ6xJT
	mb9ny6PaVWyhnlQlTQI6WqRpEHeseoMYkD2rxmTMN4cSbXA3m0qx8WGhG660cYqbv81Uxdjq2LS
	WMzXJxzTZZcIrHWLCzUU+9pRzoCbj3DMD+2figX5dJDXKjLIqHD0TDkLgumHZvViG1HoLPuCjhz
	QncJf8fc9nTeEd5LOjE/5C3IK9kkuiIwIRJrveQHU+GNelmRG4fNno838j0kA5J133F+feem+5n
	+8jpoeUlY=
X-Google-Smtp-Source: AGHT+IHMRiuXpVhT/CbaRslYxFNpzx+PcMmzYk+HQYUnLSht8Ix79/lOkHCHscEq9R21Y4uvmp9Kig==
X-Received: by 2002:a17:907:2d86:b0:ae6:ddc2:f9f4 with SMTP id a640c23a62f3a-af93ffc5f54mr1259392066b.6.1754385447948;
        Tue, 05 Aug 2025 02:17:27 -0700 (PDT)
Message-ID: <cefc96a0-b095-4bc8-baa6-4d929ffaa1a6@suse.com>
Date: Tue, 5 Aug 2025 11:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
 <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
 <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
 <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
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
In-Reply-To: <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 11:06, Stewart Hildebrand wrote:
> On 8/5/25 03:44, Jan Beulich wrote:
>> On 04.08.2025 18:57, Stewart Hildebrand wrote:
>>> On 8/4/25 03:57, Jan Beulich wrote:
>>>> On 01.08.2025 22:24, Stewart Hildebrand wrote:
>>>>> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>>>>>  {
>>>>>      struct sched_unit *unit = v->sched_unit;
>>>>>  
>>>>> +    if ( !unit )
>>>>> +        return;
>>>>> +
>>>>>      kill_timer(&v->periodic_timer);
>>>>>      kill_timer(&v->singleshot_timer);
>>>>>      kill_timer(&v->poll_timer);
>>>>
>>>> What if it's the 2nd error path in sched_init_vcpu() that is taken?
> 
> ^^ This ^^ is what I'm confused about

If sched_init_vcpu() took the indicated path, the if() you add here won't
help, and ...

>>>> Then we
>>>> might take this path (just out of context here)
>>>>
>>>>     if ( unit->vcpu_list == v )
>>>>     {
>>>>         rcu_read_lock(&sched_res_rculock);
>>>>
>>>>         sched_remove_unit(vcpu_scheduler(v), unit);
>>>>         sched_free_udata(vcpu_scheduler(v), unit->priv);
>>>>
>>>> and at least Credit1's hook doesn't look to be safe against being passed NULL.
>>>> (Not to speak of the risk of unit->priv being used elsewhere while cleaning
>>>> up.)
>>>
>>>
>>> Are you referring to this error path in sched_init_vcpu?
>>
>> No, given the context I thought it was clear that I was referring to
>>
>> static void cf_check
>> csched_free_udata(const struct scheduler *ops, void *priv)
>> {
>>     struct csched_unit *svc = priv;
>>
>>     BUG_ON( !list_empty(&svc->runq_elem) );

... we'd make it here (afaict).

Jan

