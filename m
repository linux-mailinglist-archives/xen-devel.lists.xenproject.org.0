Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB5A28838
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 11:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882110.1292287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcpo-00024L-Op; Wed, 05 Feb 2025 10:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882110.1292287; Wed, 05 Feb 2025 10:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcpo-00021r-LM; Wed, 05 Feb 2025 10:40:44 +0000
Received: by outflank-mailman (input) for mailman id 882110;
 Wed, 05 Feb 2025 10:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kcl=U4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfcpn-00021l-II
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 10:40:43 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5df261a-e3ad-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 11:40:42 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5dccc90a52eso2584899a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 02:40:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0006sm11083684a12.2.2025.02.05.02.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:40:40 -0800 (PST)
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
X-Inumbo-ID: a5df261a-e3ad-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738752042; x=1739356842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9mnjaQ/8+BK/67XuIalllqG9bhRSimSxagOZaLcxSP0=;
        b=TxdUs4wjmfh7kCTRZ+zVySrDyQ8LTfRHif3TqNiCgVILQ4hS2FBwxLXkopZPNMw5D1
         J4sUYY8kn8mytv1td/1MpJgwzOUOtAfFgdmnkWanIz+1fQD2D9wYvjBeH/+LbcEH1XXp
         0CxLC5x2mG/hwKDOeSITWhgC9u8j/iHAxdZs4q9F/ONvNRga/aZpEpxu9zvjm6XVEZbE
         +69Xy5KrwOtITdR+tgQGFk66pl7lY0j808ap31Z1tvpDmvoIspIz6yqEXgqGyxIDSsKt
         NUJhXgGbaV9Vl7HU8RbNF1UY5VahaSjZVhikC2dHgK4CqtvOKVtRHgXJ1S4WwYBKCGLq
         HxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752042; x=1739356842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mnjaQ/8+BK/67XuIalllqG9bhRSimSxagOZaLcxSP0=;
        b=bT8tPpc8rxsn9SeIvZl4rHNO3A0IljIhRoOVtHAE6t9zkPF54eSYj7D7kKs8KctcP9
         gboqIMHNb745g1IlLZSPtlbiKI9w9N9ins4ERR6Lt6jj4hky5HDunBiCys+Gp4rbHiLL
         1M/MTe0jkk5gggdfgW0DwYNbYtd/WoPK64DjdRoe8ZurzVB8jF9AAy6nHEscF8ugbqey
         EvvF1nAqYx4eevYTpNyF8Cdvs9/5o9QdCVaHePVhcFD5NnK4BCwFOrrD5Z3O400wIdSe
         XsVQ4fR1p4Te+ZKAM35UasLfY0KGZb6NMTCqCUx07Kiv6athiTN9rx7p8LzBF3nf7J/u
         ga7A==
X-Forwarded-Encrypted: i=1; AJvYcCW3h/lY4ANzjeaimsYvCjRgD6Vg4JM3Jhahg7Ca8mNMQZjyToH5BRrGFXw8r6kzzgxAaMc3D/aBgqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAm7AZjs2RRJqYHTN+ps0hW4P5/S683w3JuUyEklL3ijI+cTIO
	utxD/CDp1yqtDnNTYbSDve0tIRoWr3g3RQZnZXsuwPCCcd3426pz24S3iYqvkA==
X-Gm-Gg: ASbGnct3id1KOrvZdx+hf7cX++eseDa3LeGcpe02/X5E2XJxSrRVApfoNNYk8/Yhcbf
	vsci/1pDdsG4AChgLBga/w7kQ1UV/WqSGWsZQyDP8Ek7iNQBHRyreqwKM0HaX1hXrmjrA+Rw4Ns
	WZ1a8UvE9H+zqLxlFcIKN6USsdLcszLvmY8B4zbIE1phnep7L2+0GwWHaMvOJRsduxug9aspig9
	k05c7OVGa8mJWUS8S+qApotR3nYXJvRDHr0XCVVzSddRueNA2N2KvLiKswQKF532yr5QE0H6jzh
	H+kyGpdrpP1WheY6+o02/IzeTSRPKgNrZqAXrQyGQBm6UI4e1Q3gmpPonbhAD2Uw8FY8LB5O6q/
	N
X-Google-Smtp-Source: AGHT+IHhA3J/Of3WlcEluKK+7AZjZzd518ZqgRbIAmXbQlpBjxBQudVUeDzewAtovhhxO7qqHDVb/g==
X-Received: by 2002:a05:6402:40d6:b0:5cf:bb9e:cca7 with SMTP id 4fb4d7f45d1cf-5dcdb7770c8mr2867189a12.28.1738752040361;
        Wed, 05 Feb 2025 02:40:40 -0800 (PST)
Message-ID: <67527f17-6477-4cd4-b6f2-21487ad153f6@suse.com>
Date: Wed, 5 Feb 2025 11:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <Z6Mn2pWdp6aquAmY@macbook.local>
 <PH7PR12MB585419F320DC4EA364EC79ECE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <bce9e718-36bd-4bb6-9a9c-97115f453c1a@suse.com>
 <BL1PR12MB5849C558A2F667D2F09E6BAAE7F72@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849C558A2F667D2F09E6BAAE7F72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2025 11:31, Chen, Jiqian wrote:
> On 2025/2/5 17:58, Jan Beulich wrote:
>> On 05.02.2025 10:12, Chen, Jiqian wrote:
>>> On 2025/2/5 16:56, Roger Pau Monné wrote:
>>>> On Wed, Feb 05, 2025 at 03:42:30AM +0000, Chen, Jiqian wrote:
>>>>> On 2025/1/27 23:08, Roger Pau Monné wrote:
>>>>>> On Mon, Jan 27, 2025 at 03:52:31PM +0100, Jan Beulich wrote:
>>>>>>> On 27.01.2025 15:41, Roger Pau Monné wrote:
>>>>>>>> Ideally errors here should be dealt with by masking the capability.
>>>>>>>> However Xen doesn't yet have that support.  The usage of continue is
>>>>>>>> to merely attempt to keep any possible setup hooks working (header,
>>>>>>>> MSI, MSI-X). Returning failure from init_rebar() will cause all
>>>>>>>> vPCI hooks to be removed, and thus the hardware domain to have
>>>>>>>> unmediated access to the device, which is likely worse than just
>>>>>>>> continuing here.
>>>>>>>
>>>>>>> Hmm, true. Maybe with the exception of the case where the first reg
>>>>>>> registration works, but the 2nd fails. Since CTRL is writable but
>>>>>>> CAP is r/o (and data there is simply being handed through) I wonder
>>>>>>> whether we need to intercept CAP at all, and if we do, whether we
>>>>>>> wouldn't better try to register CTRL first.
>>>>>>
>>>>>> Indeed, Jiqian is that a leftover from a previous version when writes
>>>>>> to CAP where ignored for being a read-only register?
>>>>> Sorry to reply late, I just came back from an annual leave.
>>>>> Did you mean: why I added handler vpci_hw_write32 for CAP?
>>>>> If so, this is a change since V2, that you suggested to add it because there is no write limitation for dom0.
>>>>
>>>> Indeed, if there's no write limitation, you can just drop the addition
>>>> of the traps, as the hardware domain by default gets read and write
>>>> access to all PCI config space.  IOW: there's no need for a
>>>> vpci_add_register() call for PCI_REBAR_CAP if the handlers are just
>>>> vpci_hw_{read,write}32().
>>> OK, I think so.
>>>
>>> Hi Jan, can this change meet your opinion?
>>> Not to add register for CAP, and if fail to add register for CTRL, then "continue"
>>
>> Well, Roger as the maintainer has indicated to go that route. That's okay
>> with me. My only request then is to add a comment there, summarizing what
>> he said earlier on.
> Thanks.
> How about adding below comments near adding register for CTRL?
> 
>         /*
>          * Here not to add register for PCI_REBAR_CAP since it is read-only
>          * register without other specific operations, and hardware domain
>          * has no limitation of read/write access to all PCI config space.
>          */
>         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>                                rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>         if ( rc )
>         {
>             printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
>                    pdev->domain, &pdev->sbdf, index, rc);
>             /*
>              * The reason of using continue here is that ideally failing here
>              * should hide ReBar capability, but Xen doesn't yet support that,
>              * and using continue can keep any possible hooks working, instead,
>              * returning failure will cause all vPCI hooks down and hardware
>              * domain has unmediated access to devices, which is worse.
>              */
>             continue;
>         }

I consider this too verbose. How about you start with "Ideally we would hide
the ReBar capability here, but code for doing so still needs to be written."
Later in the long sentence there's then "will" which I think you mean to be
"would". The "unmediated" otoh, needs further qualifying: It's not "devices"
aiui (but just the one device we're dealing with here), and I think you mean
"entirely unmediated" (as opposed to "unmediated access to just this one
register").

Jan


