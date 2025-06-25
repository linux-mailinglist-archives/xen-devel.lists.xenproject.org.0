Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426DFAE7E9E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024605.1400441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUN4i-0000OR-RP; Wed, 25 Jun 2025 10:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024605.1400441; Wed, 25 Jun 2025 10:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUN4i-0000M0-OW; Wed, 25 Jun 2025 10:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1024605;
 Wed, 25 Jun 2025 10:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUN4h-0000Lu-FD
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:09:51 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8715533e-51ac-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:09:49 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so5044114f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:09:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5426bfbsm1333473a91.24.2025.06.25.03.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 03:09:48 -0700 (PDT)
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
X-Inumbo-ID: 8715533e-51ac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750846189; x=1751450989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nxpelb5lmsHUzuwhvxF3XvwkzaOQ7mp/Y+YwY3O5WB0=;
        b=QOlddUzQ0Who4DnCVrTGbrjiJX5cz1P7pjkDQT4sU4B2+9ItePl5J10Lg7t9jYs2RH
         7C8ht7judBC5w7kTjhspAyasgAbmF81ZDj3E4S2PgQlROJS1OPc/aoBcSYX5niJLGXUz
         gRknLms3p/nq3cfO1ggTTOU5mmh38RkVinkW7CCUXWwDyB6yD2joDiSEJr1GcblGzp72
         QK0hmpwPUZixEthy/TYsOvnb8gz0kZ9W9/c2Z8xbn8hT+DgFoe/lCuSSiQiMV4LSDmo9
         Jtq9tBCl3VkyEu53kpBGO0rEI65oIfjeoFX96FUJf9okAaq70djUwwgGceW5Jve57hk2
         Dcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846189; x=1751450989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxpelb5lmsHUzuwhvxF3XvwkzaOQ7mp/Y+YwY3O5WB0=;
        b=mvOBElRmj/yAEoCPZ7gExDM0CesKjoZwt6UB5/4mxh9GBelHcYkCkqyZdnAGmKGR/c
         6W8d/C9SfIMK60Gl7Kmf3P5d6toMdk0Nq78Xjeky5uGezJB/pqZh5tkwy2O5DqVN2opb
         gYQrFpMurI5dV+bXH4jA7qNpBNsQ6+cRzAzyeH+H8o7vgTjk8wgC6MQ2Zlf5NATJBq5A
         TFSVVLNMHnLwTFDsk7f/hvMJfTlgeNwlMb7mO1R+WILTb9RxW+PzvLJuqJMiiMcGmP/j
         IGvAeBoerV54oWzJHCQK4ZTZ0JSiTNPQ+ssGE1fxG55PqcZyMyztZ/22mLQBQd/y5idu
         kK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLk8+GT/fZjaKSvVfa+gY1rcogGIsWg/bfUw/lWFb3Xl2+cEVAzTtxAYE51ppIAJqbYPJN/DYt8Q8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfefdBQ26KkZYS589yuCoxMgJvxgEBLmIqo6Q7+fsEGbBZcfpl
	KdYRaM+hPvOO9AwMIVPUS5UZLayEqflhMqQgVsMmPaRLeBFf0PhlCxlO9SI8HupQbw==
X-Gm-Gg: ASbGncvNgEC5YK9GwEREARjXyE9vEAeGqZT41BRXmXov5PuqXi+M4E/T8iISCmNx3ik
	QQlYjwIQsqTczae9g5qaEijSALZHlNoyQK/wwGQsiqO3ofe1QBHy/8dHLqGVPtwODSm0cISg85S
	Bl1iwM8Pxtf0VFDmv52wguYjMNwp9ng1wNsTxI6MywGfxanbW0Bpg0BNs9vOGx76TKCMohLJRUH
	eroaQXOwaAw/0nEEQRzYiDolZlBAmgRApvfyk1xjI4czIrrGViGRBEiaCkw/QMDdRXqIzrJWQer
	GDc0Yy04R9ItFiHtb7yACSmFgZuII2fwjzf9XxQgdqrr4evQqrlJIiSRKqAFG/xR3CiVVkvFxE5
	VcfYOPWvFxIwzF2PlRBqBsp16JYVWWY2z9QZdsVYgtG5l254=
X-Google-Smtp-Source: AGHT+IFExYa00bXuyHac/TpkDQ64LH4arzyqqwSPaN83068etj84IFeXJkQ9XRgduneKjv7kWcqk1w==
X-Received: by 2002:a05:6000:200e:b0:3a4:f6ba:51c8 with SMTP id ffacd0b85a97d-3a6ed5ee613mr1945143f8f.14.1750846188567;
        Wed, 25 Jun 2025 03:09:48 -0700 (PDT)
Message-ID: <a128b6b7-1930-46f2-a696-02ce5432f9ec@suse.com>
Date: Wed, 25 Jun 2025 12:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
 <773c448a-d814-458f-ad83-e9740e724408@suse.com>
 <BL1PR12MB584989B1F9DF290C15CD2F9EE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c9cdbb69-4b68-4b77-bcca-feacc800e3d6@suse.com>
 <BL1PR12MB58499585BA47004587A34C93E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f03f33a9-4073-4a28-9c33-884baa098e29@suse.com>
 <BL1PR12MB58491B943176F970AA61F310E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58491B943176F970AA61F310E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 11:47, Chen, Jiqian wrote:
> On 2025/6/25 17:15, Jan Beulich wrote:
>> On 25.06.2025 09:16, Chen, Jiqian wrote:
>>> On 2025/6/24 18:17, Jan Beulich wrote:
>>>> On 24.06.2025 11:49, Chen, Jiqian wrote:
>>>>> On 2025/6/18 22:45, Jan Beulich wrote:
>>>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>>>> --- a/xen/drivers/vpci/msi.c
>>>>>>> +++ b/xen/drivers/vpci/msi.c
>>>>>>> @@ -193,6 +193,33 @@ static void cf_check mask_write(
>>>>>>>      msi->mask = val;
>>>>>>>  }
>>>>>>>  
>>>>>>> +static int cf_check cleanup_msi(struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +    int rc;
>>>>>>> +    unsigned int end, size;
>>>>>>> +    struct vpci *vpci = pdev->vpci;
>>>>>>> +    const unsigned int msi_pos = pdev->msi_pos;
>>>>>>> +    const unsigned int ctrl = msi_control_reg(msi_pos);
>>>>>>> +
>>>>>>> +    if ( !msi_pos || !vpci->msi )
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    if ( vpci->msi->masking )
>>>>>>> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
>>>>>>> +    else
>>>>>>> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
>>>>>>> +
>>>>>>> +    size = end - ctrl;
>>>>>>> +
>>>>>>> +    rc = vpci_remove_registers(vpci, ctrl, size);
>>>>>>> +    if ( rc )
>>>>>>> +        return rc;
>>>>>>
>>>>>> This is a difficult one: It's not a good idea to simply return here, yet
>>>>>> at the same time the handling of the register we're unable to remove may
>>>>>> still require e.g. ...
>>>>>>
>>>>>>> +    XFREE(vpci->msi);
>>>>>>
>>>>>> ... this. There may therefore be more work required, such that in the
>>>>>> end we're able to ...
>>>>>>
>>>>>>> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
>>>>>>
>>>>>> ... try this at least on a best effort basis.
>>>>>>
>>>>>> More generally: I don't think failure here (or in other .cleanup hook
>>>>>> functions) may go entirely silently.
>>>>> Does below meet your modification expectations?
>>>>
>>>> Not sure, sorry. By "more" I really meant "more" (which may just be code
>>>> auditing, results of which would need writing down, but which may also
>>>> involve further code changes; see below).
>>>>
>>>>>     rc = vpci_remove_registers(vpci, ctrl, size);
>>>>>     if ( rc )
>>>>>         printk(XENLOG_ERR "%pd %pp: remove msi handlers fail rc=%d\n",
>>>>>                pdev->domain, &pdev->sbdf, rc);
>>>>>
>>>>>     XFREE(vpci->msi);
>>>>
>>>> As I tried to indicate in my earlier reply, the freeing of this struct is
>>>> safe only if the failure above would not leave any register handlers in
>>>> place which still (without appropriate checking) use this struct.
>>> Hmm, but all handlers added in init_msi() use this struct.
>>> So it doesn't exist the case that when above unable to remove all handlers and still require xfree this struct.
>>
>> Well, in the end you say in different words what I did say, if I understand
>> correctly. There are several options how to deal with that. One might be to
>> have those handlers recognize the lack of that pointer, and behave like ...
>>
>>>>>     /*
>>>>>      * The driver may not traverse the capability list and think device
>>>>>      * supports MSI by default. So here let the control register of MSI
>>>>>      * be Read-Only is to ensure MSI disabled.
>>>>>      */
>>>>>     rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
>>
>> ... what is tried to be put in place here (and like "no handler installed"
>> for other registers).
> According to your suggest. What I can think of is when vpci_remove_registers() fails,
> then lookup the MSI related handlers,

What exactly does this mean? Aiui if vpci_remove_registers() ends up failing,
it may be the lookup which is the problem. Which isn't why this wasn't what
I suggested. Instead I suggested to make the respective handlers deal with
the case of vpci->msi being NULL. Which of course in turn would require
passing pdev->vpci to the respective vpci_add_register(), not pdev->vpci->msi.

> and set the read/write hook to be vpci_ignored_read()/vpci_ignored_write(),

But vpci_hw_read16() != vpci_ignored_read().

> and set the private data to be NULL.
> Is it acceptable?

Altering already registered handler properties feels pretty fragile to me.

Jan

