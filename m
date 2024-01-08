Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C8826A9F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 10:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663274.1033137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlt0-0004zM-9E; Mon, 08 Jan 2024 09:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663274.1033137; Mon, 08 Jan 2024 09:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlt0-0004x0-4Q; Mon, 08 Jan 2024 09:25:34 +0000
Received: by outflank-mailman (input) for mailman id 663274;
 Mon, 08 Jan 2024 09:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMlsy-0004wr-Ic
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 09:25:32 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddb54cd8-ae07-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 10:25:30 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so15529261fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 01:25:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k26-20020a02c65a000000b0046ce54fea8bsm2106362jan.131.2024.01.08.01.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 01:25:29 -0800 (PST)
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
X-Inumbo-ID: ddb54cd8-ae07-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704705930; x=1705310730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gF9CCR7H+Az15QRHhdf9DjkpV3O/2sSLbxA4yeErqk=;
        b=SnQkcVn44uWvoLFchR0y+dztn4EJpbI+Wa2x+LWQtrRGkOU/F3xfUc8RJbbEQVVgUp
         xtdA9zn/cN9YfpeM0md3F0XLLrBAAGUpZmZLp8nZGwNHr3/cJjn71tJBU8WDHT2jxt6q
         XBcXct7CZagbNL6bscVfSb+DoJRokHKqDD3v7rsujcvcpmu0TIuImjKnPuBI+2OX7d0c
         dwYkfaW05P0Zj01tgRjQFp63oSR+nQrKWi2yVbwL9ltwYU5GbCnCziJEITV4vGZZZW+8
         i/XWvz17De8+aFqB7VZCgsSmdefznHxxrqutxhnEeuN88MtNiK42TtI2mAPk7dhYyoZJ
         0gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704705930; x=1705310730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gF9CCR7H+Az15QRHhdf9DjkpV3O/2sSLbxA4yeErqk=;
        b=L/5BJgQHpRN96OWL3KuHmcUUGVDfWxpe6wmjSOH44LyDKh0MiJM+l0CAHKw3mEz1Y/
         TaqT80q7KGJzO2ATCbZj8GQKhbypfXKvFtUSeMq2K6fmR2CYqsjndLK0GYKYewqI0xKi
         1FIsXckKFGuBruiz+7GQrIqWB4iuZ4cf8Y/35zgAJE8JR3m1WdqfvVeXHd2mHdT5ApmQ
         aj8RypQ8xhj2odeenlP5MBNLSNf3npmW0gqsqlpG82Rdzb/p01Jsb/p0XK7KeT5EKmKg
         aua740k2K7QFxyj9IXigQwy7wIf/B4qWmAXlCFOlLtN9FKi4y4AT/PhWmQsvP1kAWJNK
         U1Ng==
X-Gm-Message-State: AOJu0YxqY9Exq7SuOGtrW9dHj/BIgZPEaKyOW+QQwxr1aIfAyIY0fjyJ
	nxNtD4FU7XgGXEnlhgBVWjPsFOrR0SOi
X-Google-Smtp-Source: AGHT+IGrYIi6ztjTEn5+bmQNPHmZLYPS0KcFmKOBek95tAbmssYoxPYBvmJfVvKtL85Mc1mDcS3qNw==
X-Received: by 2002:a2e:b7d6:0:b0:2cc:d45a:48d8 with SMTP id p22-20020a2eb7d6000000b002ccd45a48d8mr1109798ljo.43.1704705929828;
        Mon, 08 Jan 2024 01:25:29 -0800 (PST)
Message-ID: <14986c92-7479-4258-be59-8606018c5885@suse.com>
Date: Mon, 8 Jan 2024 10:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller
 isn't DOMID_SELF
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051639240.3675@ubuntu-linux-20-04-desktop>
 <242dbf1f-ef3e-42cc-906e-5c5bb01d8e31@suse.com>
 <BL1PR12MB58495C90CEC83B6EF66651A0E76B2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58495C90CEC83B6EF66651A0E76B2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2024 10:15, Chen, Jiqian wrote:
> On 2024/1/8 16:47, Jan Beulich wrote:
>> On 06.01.2024 01:46, Stefano Stabellini wrote:
>>> On Fri, 5 Jan 2024, Jiqian Chen wrote:
>>>> @@ -72,8 +73,30 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>  
>>>>      switch ( cmd )
>>>>      {
>>>> -    case PHYSDEVOP_map_pirq:
>>>> -    case PHYSDEVOP_unmap_pirq:
>>>> +    case PHYSDEVOP_map_pirq: {
>>>> +        physdev_map_pirq_t map;
>>>> +
>>>> +        if ( copy_from_guest(&map, arg, 1) != 0 )
>>>> +            return -EFAULT;
>>>> +
>>>> +        if ( !has_pirq(currd) && map.domid == DOMID_SELF )
>>>> +            return -ENOSYS;
>>>
>>> This looks OK to me although there is already another copy_from_guest in
>>> do_physdev_op, but I don't see an easy way to make it better.
>>
>> How can double reads of hypercall args ever be okay? The new check clearly
>> needs to be inserted in the code path where the structure is being read
>> already anyway.
> I also tried to add this check in PHYSDEVOP_map_pirq in physdev.c, but pv has no flag X86_EMU_USE_PIRQ too.
> If want to add it into physdev.c and combine Stefano's opinions, this check may be like:
> 
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 47c4da0af7e1..c38d4d405726 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -303,11 +303,19 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_map_pirq: {
>          physdev_map_pirq_t map;
>          struct msi_info msi;
> +        struct domain *d;
> 
>          ret = -EFAULT;
>          if ( copy_from_guest(&map, arg, 1) != 0 )
>              break;
> 
> +        d = rcu_lock_domain_by_any_id(map.domid);
> +        if ( d == NULL )
> +            return -ESRCH;
> +        if ( !is_pv_domain(d) && !has_pirq(d) )
> +            return -ENOSYS;
> +        rcu_unlock_domain(d);
> +
>          switch ( map.type )
>          {
>          case MAP_PIRQ_TYPE_MSI_SEG:

Well, yes, perhaps kind of like that, but with rcu_unlock_domain() called
on the error 2nd return path as well, and without abusing ENOSYS.

Jan

