Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A36A762B2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932249.1334416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAmv-00034C-1z; Mon, 31 Mar 2025 08:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932249.1334416; Mon, 31 Mar 2025 08:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAmu-00032X-Vb; Mon, 31 Mar 2025 08:46:32 +0000
Received: by outflank-mailman (input) for mailman id 932249;
 Mon, 31 Mar 2025 08:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzAmt-00032Q-Ml
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:46:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3cc07ad-0e0c-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:46:30 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so3487253f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 01:46:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e1b0sm10569740f8f.75.2025.03.31.01.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 01:46:29 -0700 (PDT)
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
X-Inumbo-ID: a3cc07ad-0e0c-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743410789; x=1744015589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4XWaGEjsTvHjrR76ANIOckdg8Yl32EYXYAqSXMIJ3PY=;
        b=AeGeOF0lvNIKqxWXrinOBQO2IZ/TYKmJ/TzWiNcaCO4CdXUsbEGo+wp4u30AUL/9oF
         a/vnQYxIQPOnqW6d0o4iYe5nPToHf2CyiaaxJ0+FRGTrYBv0atdHGhs+61Y+pt/4c7GA
         O3sVHyVQSiqNZhWB9eD9ucFJt+uXjqDjxY5yWlGhrz1upN3rSfLBFZvY9ZA6CAVMMKCA
         gGCvUsnCengRS4mYeXqfEX/XHV06I2AW21djA7Cfbq2SKk0gXfdu4YeLKZ+UtsWZA5Y7
         QoRc8A0nhB3yQJg98c68rf5Vs1eoLQO7p/gLptK6cIFR8r0/wbtqJ4S3sywFrrJ1g7BP
         gEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410789; x=1744015589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XWaGEjsTvHjrR76ANIOckdg8Yl32EYXYAqSXMIJ3PY=;
        b=UZJVlSJWFjcQizGDUGubxe+SpjtKvsoEiQi5WXmMKZccUWm2JK6Tgp7hZNmd/pPGfa
         UopcHbDBrn2/YtR8Zp/0TW3YJgE2GeAunXBbhMFtVBTODgP5sDfu8B1I9PNj9UsR7Zqo
         JkcgmzEWpsB3Nl8MKPweNCRaoo9vXG4JVJTpYLqZ2X0EL3O+WtJcPhMajnW2uKeG6qFF
         Fe9wS8BJJnx+ynFEcBEyxY8o0RjZjMuN2KqRX7ldUhhJfD1hzURA3e+Dsq4pIOlYQ8Yw
         Pb9ODBasEBKOIgOW9Y3S31HB9r/+4cXGo/PFTa98KscLLx2JxaMpQlK9gWoRZJhkH+lL
         SpdA==
X-Gm-Message-State: AOJu0YwHrvFCtVddfEw+86OXl/XZdMefatOy8n2Q2yqfo/C5pSuMpoeO
	olrMLR1dvn+ddwjh8DyVJ2fd3EszU/TvA7d43/7zzfDfvSFXDwANxTAXIB8/7w==
X-Gm-Gg: ASbGncv1JEJ7wRuF/pEwsAjytZJ+uBlzTHd+7/oPDY18VfHPzJ/2a9Wl2l/OEk4aXxT
	ftsUxN/pPAZvPy2JxCyjGHO7wzZSe+USx+lyq1/zbnxJV0Ke9xxIKM2QFLxkfd+9dJicDFb4wGC
	nNXAzNIHB+mcWqBYLBU2bWwRJIUOQ2Yz+AcrMa3YQdnE7YCY7VEceJ1vC93Cr8C34wGQyuvE00b
	Hv0soaoiSCjEM3sy2LiTW/Ty9J+E654CavMbJvWqn4Bz2VgJExFKoxDXsJ7aw67Za24Iy3PXs9H
	u1NiVz7gSUUrqsVyaDEjhkS1KbT/girtmbh15j8mQ9vZwBf3Wm9JQNgJyz57I4u4YOyadXXvAgg
	uDBPOLnTu+bVqKdLpp3A3YsW1aOGBLg==
X-Google-Smtp-Source: AGHT+IFEt+LIHtOJTSWpd3NjLWeE3XbpTxceRrS/bzi8VudJ9nEcYTHBPDLuoaM5rC2hHkHgT+UkrA==
X-Received: by 2002:a5d:5848:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39c1211d5bbmr5383257f8f.54.1743410789425;
        Mon, 31 Mar 2025 01:46:29 -0700 (PDT)
Message-ID: <bed18044-098c-4408-8024-24b79d760417@suse.com>
Date: Mon, 31 Mar 2025 10:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <Z-UZm5sTIz4nOt4-@macbook.local>
 <BL1PR12MB5849F1134D9E51E6A0F7B4A7E7AD2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z-pVrGLZTCk1ZXb1@macbook.local>
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
In-Reply-To: <Z-pVrGLZTCk1ZXb1@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.03.2025 10:43, Roger Pau Monné wrote:
> On Mon, Mar 31, 2025 at 07:26:20AM +0000, Chen, Jiqian wrote:
>> On 2025/3/27 17:25, Roger Pau Monné wrote:
>>> On Thu, Mar 27, 2025 at 03:32:12PM +0800, Jiqian Chen wrote:
>>>> --- a/xen/drivers/vpci/vpci.c
>>>> +++ b/xen/drivers/vpci/vpci.c
>>>> @@ -36,8 +36,8 @@ struct vpci_register {
>>>>  };
>>>>  
>>>>  #ifdef __XEN__
>>>> -extern vpci_register_init_t *const __start_vpci_array[];
>>>> -extern vpci_register_init_t *const __end_vpci_array[];
>>>> +extern vpci_capability_t *const __start_vpci_array[];
>>>> +extern vpci_capability_t *const __end_vpci_array[];
>>>>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>>>>  
>>>>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>>> @@ -83,6 +83,47 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>>>>  
>>>>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>>>>  
>>>> +static int vpci_init_cap_with_priority(struct pci_dev *pdev,
>>>> +                                       const char *priority)
>>>> +{
>>>> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>>>> +    {
>>>> +        const vpci_capability_t *capability = __start_vpci_array[i];
>>>> +        const unsigned int cap_id = capability->id;
>>>> +        unsigned int pos;
>>>> +        int rc;
>>>> +
>>>> +        if ( *(capability->priority) != *priority )
>>>> +            continue;
>>>> +
>>>> +        if ( !capability->is_ext )
>>>> +            pos = pci_find_cap_offset(pdev->sbdf, cap_id);
>>>> +        else
>>>> +            pos = pci_find_ext_capability(pdev->sbdf, cap_id);
>>>> +
>>>> +        if ( !pos )
>>>> +            continue;
>>>> +
>>>> +        rc = capability->init(pdev);
>>>> +
>>>> +        if ( rc )
>>>> +        {
>>>> +            printk(XENLOG_WARNING "%pd %pp: cap init fail rc=%d, try to hide\n",
>>>> +                   pdev->domain, &pdev->sbdf, rc);
>>>> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>>> +                                   pos, capability->is_ext ? 4 : 1, NULL);
>>>
>>> Are you sure this works as intended? 
>> Yes, I used failure test cases of init_msi/rebar.
>> From the "lspci" result, they were hided from the dom0.
>> But I forgot to test for domUs.
> 
> I assume that's only tested with Linux?  See my comment below about
> capability ID 0 being reserved, and hence I think we should not keep
> capabilities with ID 0 on the list, as it might cause malfunctions to
> OSes.
> 
>>> The capability ID 0 is marked as "reserved" in the spec, so it's unclear to me how OSes would handle
>>> finding such capability on the list - I won't be surprised if some
>>> implementations decide to terminate the walk.  It's fine to mask the
>>> capability ID for the ones that we don't want to expose, but there's
>>> further work to do IMO.
>>>
>>> The usual way to deal with masking capabilities is to short circuit
>>> the capability from the linked list, by making the previous capability
>>> "Next Capability Offset" point to the next capability in the list,
>>> thus skipping the current one. So:
>>>
>>> capability[n - 1].next_cap = capability[n].next_cap
>>>
>>> IOW: you will need to add the handler to the previous capability on
>>> the list.  That's how it's already done in init_header().
>> Oh, I got your opinion.
>> But we may need to discuss this more.
>> In my opinion, there should be two situations:
>> First, if device belongs to hardware domain, there is no emulation of legacy or extended capabilities linked list if I understand codes right.
> 
> Yes, but that needs to be fixed, we need to have this kind of
> emulation uniformly.
> 
>> So, for this situation, I think current implementation of my patch is enough for hiding legacy or extended capabilities.
> 
> It works given the current code in Linux.  As said above, I don't
> think this is fully correct according to the PCI spec.
> 
>> Second, if device belongs to common domain, we just need to consider legacy capabilities since all extended capabilities are hided in init_header().
>> So, for this situation, I need to what you said " capability[n - 1].next_cap = capability[n].next_cap "
> 
> I'm not sure why would want to handle the hardware domain vs
> unprivileged domains differently here.  The way to hide the
> capabilities should always be the same, like it's currently done for
> domUs.

FWIW - I agree with Roger on all the point made.

Jan

