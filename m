Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064F4C67DB4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 08:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164447.1491407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFsq-0003za-O4; Tue, 18 Nov 2025 07:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164447.1491407; Tue, 18 Nov 2025 07:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFsq-0003y5-L9; Tue, 18 Nov 2025 07:12:12 +0000
Received: by outflank-mailman (input) for mailman id 1164447;
 Tue, 18 Nov 2025 07:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLFsp-0003OX-AR
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 07:12:11 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e65b875a-c44d-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 08:12:10 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so2598509f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 23:12:10 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae16sm30408981f8f.3.2025.11.17.23.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:12:09 -0800 (PST)
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
X-Inumbo-ID: e65b875a-c44d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763449930; x=1764054730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg4OCMZTFuwf/W2EQSjEUN9FmHitJpWENRIhvcvyDy4=;
        b=aQSkbSM9CmfcYtxekybHQTqP9tovCmq5QTBpRZCPv0i82aAUHu0pFrOG0VE58IvDo3
         REIGT23DpTD1zMpitgZN3fhQoVyTNeAwLtNHcE1rk2TJ8v1htohduf1K7E/V/2Bg2vys
         WGvWwzkgPjLztTR1ZuIMN35r3ap3DTHhJpZf+YF87XlxMneg4ZIikbQiWtlYRTl5FuQ2
         cZV+WqzNPsZ8cMRMhlocPMkDoTqimw0zD0aw1AIm5KpFQiH7bnCUTKNP8EzuOwPaNj2a
         xuwDquxr2Z+qmRjZXqQFH+R9jZNm+waMjn1idtOEPtDird5O8EqqmQTTDR78aObKj5tt
         iw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449930; x=1764054730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg4OCMZTFuwf/W2EQSjEUN9FmHitJpWENRIhvcvyDy4=;
        b=OteQXQsx/Hk51lzTB7KAscqKP7vGWefdlMCKK1QAD0AJz1EOTvEX6PVfJJwaGt4nXb
         qsEiFt/ci1LGY8uuxYG/J12VC0CgOS+zMKfKsXD8mzeUJvIJ4BG2JSe3P45hNScGB7p+
         IwNftE2UFj6VUM38nVweUwmYPO0FVZW+LQtpyHvoWss75BepXlcb2RRL3ZMi2GKu6EVd
         qAt2rBpMrkRd3ro2ahDLKw58E3eUO2aoPLZvUodan44lflbFljeKoyrZQYrB147Bq59z
         vYlRMVBKTx4lwScYmWJFI75vDljYk/eUyeK0GsSA3gd4NrByBQy3SF+moJqzf4CDctcw
         raOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJy9+bmCqxXtQnvvfvztdy2K7ac6385W8edcqPsB6dhfWQJ33HsrgX5v210FuysveOjKLfUIzQHqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqjfbAHQJ9yasQPTr62lffKK12JhvZbm9Q4yZ5ybCCK6HILK+L
	PO7UeTgq9dBc+5Kxc7psg8zog64HhhmuCCTHt/bZhn/mTMVH7mDl4QbO/HuH0XJSsg==
X-Gm-Gg: ASbGncsr66Id9ZV49daabMMV31WL/F17fXFKh/2L35QymEDoH+d8g+To3iX2CdR2uvM
	jCua3exulV2R1pRBj1L5mSH+SgaH7nxuLAHE6C1EhoAgE/JOhHc5bokCs5ZgO24zLHGPWM6h1L6
	apcBVs5uIrAaJv8jkbLboTSDlHxAK3IL7qVew1rKSPUF+/6gw1RLk2Is6/c/RGwS3mmNNBSj29C
	nQM+NIDi5doQBIfM1bUDQ4y43E3AARdjuFe7YBxJOYcsHjEv9nmMHMFg5BAbzNn/qP32hZnpLqM
	bzVdCZwrVam8hOiNppUGYbn6ObAh5cReon50/Kin0IVdfcd1TES4iC+aN4R09pXma6Z5pZUttVS
	R88PgSZWGtak7MQzh114nyyF1JDmjGBjBcYDIFe0doZhlfjmqztiKyuRMmbliFOybMi4LOTbcqm
	/gdIBE1reLiKd0FDb3vMGAi5CAUORC72sK5/ABGnvHfUA2SESBH+aM9KDXuGQN40GrAOK/y6StU
	BCPI+RsROU3YkdkoaP8ewgz15u7GRrIk8AJ+BaM0kAX5TCg0fGtfeeDVBA=
X-Google-Smtp-Source: AGHT+IGBNBmz7lbIgsO4BB/MQTtFm1FQCEzqWeHumSi3a4dxlGW7tBQnhb9cT6QwRfg/Y/9/swBXsA==
X-Received: by 2002:a05:6000:18a8:b0:429:eb05:1c69 with SMTP id ffacd0b85a97d-42ca8678447mr1887850f8f.2.1763449929984;
        Mon, 17 Nov 2025 23:12:09 -0800 (PST)
Message-ID: <0ff1d79b-a7c2-4fc0-a335-17cbdb977dfc@suse.com>
Date: Tue, 18 Nov 2025 08:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/28] xen/domctl: make HVM_PARAM_IDENT_PT conditional
 upon CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-28-Penny.Zheng@amd.com>
 <af8eb5b1-80fd-477c-9b50-29041ae93088@suse.com>
 <DM4PR12MB8451BC18FAF3D9B97F84B604E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451BC18FAF3D9B97F84B604E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 07:45, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, October 30, 2025 9:35 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; oleksii.kurochko@gmail.com; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 27/28] xen/domctl: make HVM_PARAM_IDENT_PT
>> conditional upon CONFIG_MGMT_HYPERCALLS
>>
>> On 13.10.2025 12:15, Penny Zheng wrote:
>>> Helper domctl_lock_{acquire,release} is domctl_lock, which
>>> HVM_PARAM_IDENT_PT uses to ensure synchronization and hence being a
>> toolstack-only operation.
>>> So we shall make HVM_PARAM_IDENT_PT conditional upon
>>> CONFIG_MGMT_HYPERCALLS, returning -EOPNOTSUPP when
>> MGMT_HYPERCALLS=n.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> I fear this isn't quite what I suggested. The param get/set are XSM_TARGET, i.e.
>> can be used by DM as well. The particular one here shouldn't be used by a DM, but
>> that's a different question. Similarly in principle the PVH Dom0 building code should
>> be able to use this path; it doesn't right now in favor of some open- coding.
>>
>> What iirc I did suggest was that the serialization isn't needed when no domctl can
>> be used to otherwise alter (relevant) guest state.
> 
> Ah, true, serialization isn't needed when MGMT_HYPERCALLS=n, as no domctl-op could alter the guest state at the same time.
> Then maybe adding IS_ENABLED() checking is enough:

Yes, that or indeed introducing stubs. Which one is the lesser evil I'm having
a hard time determining. Hence I'd suggest that you go with the below, unless
someone else chimes in.

Jan

> ```
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5a50721bd0..4e1b3ee5f4 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4324,7 +4324,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>           * the domctl_lock.
>           */
>          rc = -ERESTART;
> -        if ( !domctl_lock_acquire() )
> +        if ( IS_ENABLED(CONFIG_MGMT_HYPERCALLS) && !domctl_lock_acquire() )
>              break;
> 
>          rc = 0;
> @@ -4334,7 +4334,8 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>              paging_update_cr3(v, false);
>          domain_unpause(d);
> 
> -        domctl_lock_release();
> +        if ( IS_ENABLED(CONFIG_MGMT_HYPERCALLS) )
> +            domctl_lock_release();
>          break;
>      case HVM_PARAM_DM_DOMAIN:
>          /* The only value this should ever be set to is DOMID_SELF */
> ```
> 
>>
>> Jan


