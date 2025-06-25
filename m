Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB59AE85C0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024947.1400699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQou-00019N-Qt; Wed, 25 Jun 2025 14:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024947.1400699; Wed, 25 Jun 2025 14:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQou-00017e-O0; Wed, 25 Jun 2025 14:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1024947;
 Wed, 25 Jun 2025 14:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUQot-00017P-F7
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:09:47 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bfb81f7-51ce-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:09:45 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so717761f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:09:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f126b6fesm12895728a12.71.2025.06.25.07.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:09:44 -0700 (PDT)
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
X-Inumbo-ID: 0bfb81f7-51ce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750860585; x=1751465385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=suP9PxE4wqeKgefOdzrc4creCLiYWB11VMlQkiWel0g=;
        b=Fvnqrg5GbIZzrZt6PcohboR8EEV8m51zh4zdZd/OXcz4U7jNKwrU3esRkFzB2RhDpo
         lq1VMtLYf4/2lzLeS94mMN1Yy+jRc5InPuOy33cQ1ihiZ026mhmIpNucRR58fNXVkD5u
         2+5N7XybO8FEjjGCHuV2Uz0sJirCbYY6F4Od4ymAHmYSWm7VzjQ+0eAIoKj9POFYljQx
         HD+O91KBn4i3Ekoxvq/lD7v+GvpiBV/wqiQ2xpHCBe2/S5hGTyz9guVFK1mwmJYD0XkV
         kBMkf5pWMjRofoMACjes4am4upS0kJ518kT69EBU/uNdAxNBbXX1wf6BmffNEtIRn+YM
         1ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860585; x=1751465385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suP9PxE4wqeKgefOdzrc4creCLiYWB11VMlQkiWel0g=;
        b=FeejhtIh3XwD2pLWBxnA/BjSajDYfdQwUNn5WwLH7bnWmZIJaCbFWAfawPLDxzYTl6
         IkqAyQildGcReYOyKrgR0ukTPIOCRScma1OeEzdrZKtLSO+X2CDSRIM9xXTznS+rFi4B
         rSwRRzirEaNJ8jL6PxjRXT9IOfKidXNQUMcuyGUDiXpE3guNIsP4O/Y+Np41shSA9xhv
         byjnKuqc43XAL0ZjTpL2qxv+wXJOavJ5BEUnM+W8BgQPCYzASXemKu6/r2ww1nzMvhXQ
         oYy/wWQfos7oxQwU2tWr1a4TmgsnD/peUVQRP2iV+u7dJF+oNUA9h8Z+dvcLeUMIJAOA
         cCJw==
X-Forwarded-Encrypted: i=1; AJvYcCXHkFDmsI0des6/R7Tv4el0rLPO34jqzNIrPWGu1VS4m3xkIP0m9fgb9WAKlY96DDwopVn4JjxX3Lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw92Pi6DZ/e7Ri+UnrmMX+r8/WNNbtUldDcCHvbZ4B0SZkkHVTG
	ulIoxm5AYrtGK4n1KdxryiNMO34D5tTJKu0ny+ANGAfUPbYbCVICd2Ez6pDzwjK8XQ==
X-Gm-Gg: ASbGncso+S0HWXSdqzwB1mhB11i7BNXtCIbTBfXEaRTQLcLOhPnlLCI9gE6o8UHZGqA
	I2ahzqe8xZbHxinQNU01V+Y+lMPQXmVKzV3WSqwMKe2kVoXd7kgG+cbhwsBjShV3oi7hcoKDG9K
	hAo+TPqb4c7UckJ+v3wJFWKtAGuybULBCwF09zX4hu5reqieDifMXKhfFJSqta8flHUzzcH2wy0
	DoXjDQWoUGjvymA5OK0Zie55knNATdZ6WAi56Er95ZqgXnfuRHf/3MPYj5l5F6HgJ0CT9mGQWvX
	Iq85HrK2v7GocNQL2Mbk0lzFA7Z7vHu3FGmJwVs2sQJIVnkHYY3oPGUDSWVNiO/8uusNLjVfER8
	PNHc+XPWMAnrPXlh0TV74PpPmiWCrQm3f2G/M7+IrWUWITu4=
X-Google-Smtp-Source: AGHT+IFo40wWU5TIyErfvDJhP72AWQTN02ixbA6h/ZLLLk+L+NVVXbKGe4gyap1N2WtuP+KOpKR8qA==
X-Received: by 2002:a05:6000:1acc:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a6e720de4emr6516727f8f.24.1750860584785;
        Wed, 25 Jun 2025 07:09:44 -0700 (PDT)
Message-ID: <531ff40d-ab69-4eb6-8e61-3c1c23ccf95e@suse.com>
Date: Wed, 25 Jun 2025 16:09:37 +0200
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
 <a128b6b7-1930-46f2-a696-02ce5432f9ec@suse.com>
 <BL1PR12MB5849851F7EF0AA4C7BDA3703E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849851F7EF0AA4C7BDA3703E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 12:26, Chen, Jiqian wrote:
> On 2025/6/25 18:09, Jan Beulich wrote:
>> On 25.06.2025 11:47, Chen, Jiqian wrote:
>>> On 2025/6/25 17:15, Jan Beulich wrote:
>>>> On 25.06.2025 09:16, Chen, Jiqian wrote:
>>>>> On 2025/6/24 18:17, Jan Beulich wrote:
>>>>>> On 24.06.2025 11:49, Chen, Jiqian wrote:
>>>>>>> On 2025/6/18 22:45, Jan Beulich wrote:
>>>>>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>>>>>> --- a/xen/drivers/vpci/msi.c
>>>>>>>>> +++ b/xen/drivers/vpci/msi.c
>>>>>>>>> @@ -193,6 +193,33 @@ static void cf_check mask_write(
>>>>>>>>>      msi->mask = val;
>>>>>>>>>  }
>>>>>>>>>  
>>>>>>>>> +static int cf_check cleanup_msi(struct pci_dev *pdev)
>>>>>>>>> +{
>>>>>>>>> +    int rc;
>>>>>>>>> +    unsigned int end, size;
>>>>>>>>> +    struct vpci *vpci = pdev->vpci;
>>>>>>>>> +    const unsigned int msi_pos = pdev->msi_pos;
>>>>>>>>> +    const unsigned int ctrl = msi_control_reg(msi_pos);
>>>>>>>>> +
>>>>>>>>> +    if ( !msi_pos || !vpci->msi )
>>>>>>>>> +        return 0;
>>>>>>>>> +
>>>>>>>>> +    if ( vpci->msi->masking )
>>>>>>>>> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
>>>>>>>>> +    else
>>>>>>>>> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
>>>>>>>>> +
>>>>>>>>> +    size = end - ctrl;
>>>>>>>>> +
>>>>>>>>> +    rc = vpci_remove_registers(vpci, ctrl, size);
>>>>>>>>> +    if ( rc )
>>>>>>>>> +        return rc;
>>>>>>>>
>>>>>>>> This is a difficult one: It's not a good idea to simply return here, yet
>>>>>>>> at the same time the handling of the register we're unable to remove may
>>>>>>>> still require e.g. ...
>>>>>>>>
>>>>>>>>> +    XFREE(vpci->msi);
>>>>>>>>
>>>>>>>> ... this. There may therefore be more work required, such that in the
>>>>>>>> end we're able to ...
>>>>>>>>
>>>>>>>>> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
>>>>>>>>
>>>>>>>> ... try this at least on a best effort basis.
>>>>>>>>
>>>>>>>> More generally: I don't think failure here (or in other .cleanup hook
>>>>>>>> functions) may go entirely silently.
>>>>>>> Does below meet your modification expectations?
>>>>>>
>>>>>> Not sure, sorry. By "more" I really meant "more" (which may just be code
>>>>>> auditing, results of which would need writing down, but which may also
>>>>>> involve further code changes; see below).
>>>>>>
>>>>>>>     rc = vpci_remove_registers(vpci, ctrl, size);
>>>>>>>     if ( rc )
>>>>>>>         printk(XENLOG_ERR "%pd %pp: remove msi handlers fail rc=%d\n",
>>>>>>>                pdev->domain, &pdev->sbdf, rc);
>>>>>>>
>>>>>>>     XFREE(vpci->msi);
>>>>>>
>>>>>> As I tried to indicate in my earlier reply, the freeing of this struct is
>>>>>> safe only if the failure above would not leave any register handlers in
>>>>>> place which still (without appropriate checking) use this struct.
>>>>> Hmm, but all handlers added in init_msi() use this struct.
>>>>> So it doesn't exist the case that when above unable to remove all handlers and still require xfree this struct.
>>>>
>>>> Well, in the end you say in different words what I did say, if I understand
>>>> correctly. There are several options how to deal with that. One might be to
>>>> have those handlers recognize the lack of that pointer, and behave like ...
>>>>
>>>>>>>     /*
>>>>>>>      * The driver may not traverse the capability list and think device
>>>>>>>      * supports MSI by default. So here let the control register of MSI
>>>>>>>      * be Read-Only is to ensure MSI disabled.
>>>>>>>      */
>>>>>>>     rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
>>>>
>>>> ... what is tried to be put in place here (and like "no handler installed"
>>>> for other registers).
>>> According to your suggest. What I can think of is when vpci_remove_registers() fails,
>>> then lookup the MSI related handlers,
>>
>> What exactly does this mean? Aiui if vpci_remove_registers() ends up failing,
>> it may be the lookup which is the problem. Which isn't why this wasn't what
>> I suggested. Instead I suggested to make the respective handlers deal with
>> the case of vpci->msi being NULL. Which of course in turn would require
>> passing pdev->vpci to the respective vpci_add_register(), not pdev->vpci->msi.
> 
> Like below?
> 
> @@ -37,7 +42,13 @@ static uint32_t cf_check control_read(
>  static void cf_check control_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msi *msi = data;
> +    const struct vpci *vpci = data;
> +
> +    if ( !vpci->msi )
> +        return;
> +
> +    const struct vpci_msi *msi = vpci->msi;
> +
>      unsigned int vectors = min_t(uint8_t,
>                                   1u << MASK_EXTR(val, PCI_MSI_FLAGS_QSIZE),
>                                   pdev->msi_maxvec);
> @@ -239,7 +250,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>          return -ENOMEM;
> 
>      ret = vpci_add_register(pdev->vpci, control_read, control_write,
> -                            msi_control_reg(pos), 2, pdev->vpci->msi);
> +                            msi_control_reg(pos), 2, pdev->vpci);
> 

Yes, with control_read() also suitably adjusted. And assuming there are no other
caveats.

Jan

