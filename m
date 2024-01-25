Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1283BAEB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 08:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671339.1044624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSuOK-0006kK-Ln; Thu, 25 Jan 2024 07:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671339.1044624; Thu, 25 Jan 2024 07:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSuOK-0006ht-J2; Thu, 25 Jan 2024 07:43:16 +0000
Received: by outflank-mailman (input) for mailman id 671339;
 Thu, 25 Jan 2024 07:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSuOJ-0006hn-8A
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 07:43:15 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63450968-bb55-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 08:43:10 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cdeb954640so78552931fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 23:43:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056e02194800b003627f685d1dsm2516020ilu.39.2024.01.24.23.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 23:43:10 -0800 (PST)
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
X-Inumbo-ID: 63450968-bb55-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706168590; x=1706773390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63RQ+M57HbberoytkjsN2ecRdeKnenHpzQByihc0hSM=;
        b=H7nmr5A3ZdimUkRO952HstEjuyPWirbMt2ItL80mN0p5mrEelSHSYYPBRzjsxgqx0b
         uligtiXqx8XArW622pSxcgmtgAjuqVRi9gAiRPVXDV8yABmbQSbXU6EYlyg+C9bEl2iM
         FFtOvBfJU+dbVFg2lGgMenhYW9Oe9kKhe9otnDmMyULkRM2R8SN0EuxxDMhHY7XFPzKy
         eErErlrBEShoiVZy/rcYxTn20HvgJp13z1hHwQvQDmcnTNFWzoYJBcBSpPyPgta5uhWY
         HSLgxYhLYY2uAAc0YKITOVk43IZWSBAtJWGVMvd2Xsn+R9n8bt9u3Cj2EcG7hSBiYFO3
         FLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706168590; x=1706773390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63RQ+M57HbberoytkjsN2ecRdeKnenHpzQByihc0hSM=;
        b=Sr67RltyMrXkXoDQwyOZTMSXHJmR4AuoASewiJvaNEBYdkdIXTB+dgvOehJYWRKqXq
         mvBjKVDZwv7c1YH9T8PvAofezj1A1O+8OXLkLcfYXmtVWjdO+a6bcgjHBAEBnCugnbV2
         2OZ1AcFKacrCbNdpa+JwJIgqh0Emj9hw/cpVdSZE03xbOn8YhWhNZZINf00iZHK4P5q3
         wRg5C/0U+H0C4E63SXrkrmzUJgGCNk1Gi526zZ95WnF/KE5W35SdJSNGq0b/vtzylBK3
         VbHCZadMET43evKhANCvwpZ8n7G3kvyLKjhpT5rK+MHqf8pLKO2mHOpnSdaqD14iqZvi
         COrg==
X-Gm-Message-State: AOJu0YxhnRMGjqWL6tyysrUveTK6bDwMkTNaxr7/WfmeYOdBEGIzW6E+
	H62W+oHh0YF2qattXtvr7qg3UGNcuxf5mWdHj14mcexJfo2YiiOm8/zuodhEXA==
X-Google-Smtp-Source: AGHT+IExOEfx+11MoK3uxVnzR7iTGGUfUvTIpDBxcDssBiFE/UFxa8/pYTLzSQvJgG8Tfr8uQZVlTg==
X-Received: by 2002:a2e:a99c:0:b0:2ce:fc2b:c739 with SMTP id x28-20020a2ea99c000000b002cefc2bc739mr392169ljq.104.1706168590551;
        Wed, 24 Jan 2024 23:43:10 -0800 (PST)
Message-ID: <fa7df700-06f1-4110-bc76-c59d59e5d887@suse.com>
Date: Thu, 25 Jan 2024 08:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <715e40c9-1776-4677-9565-dac1565a2aa8@suse.com> <Za_WGzS14Eqt8yZF@macbook>
 <ae7a57f2-2433-4b75-ab45-c8be55d489c9@suse.com> <ZbDXXyucJhLJ4u9H@macbook>
 <a3233487-965b-49ae-bebe-e5476fcda29c@suse.com> <ZbFOE6kV7NXFrNjb@macbook>
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
In-Reply-To: <ZbFOE6kV7NXFrNjb@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2024 18:51, Roger Pau Monné wrote:
> On Wed, Jan 24, 2024 at 12:34:10PM +0100, Jan Beulich wrote:
>> On 24.01.2024 10:24, Roger Pau Monné wrote:
>>> On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
>>>> On 23.01.2024 16:07, Roger Pau Monné wrote:
>>>>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
>>>>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>>>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>>>>>>  {
>>>>>>>      int irq, pirq, ret;
>>>>>>>  
>>>>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>>>>>
>>>>>> If either lock is sufficient to hold here, ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/physdev.c
>>>>>>> +++ b/xen/arch/x86/physdev.c
>>>>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>>>>>>  
>>>>>>>      case MAP_PIRQ_TYPE_MSI:
>>>>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>>>>>>> +        pcidevs_lock();
>>>>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>>>>>>> +        pcidevs_unlock();
>>>>>>>          break;
>>>>>>
>>>>>
>>>>> IIRC (Stewart can further comment) this is done holding the pcidevs
>>>>> lock to keep the path unmodified, as there's no need to hold the
>>>>> per-domain rwlock.
>>>>
>>>> Yet why would we prefer to acquire a global lock when a per-domain one
>>>> suffices?
>>>
>>> I was hoping to introduce less changes, specially if they are not
>>> strictly required, as it's less risk.  I'm always quite worry of
>>> locking changes.
>>
>> In which case more description / code commenting is needed. The pattern
>> of the assertions looks dangerous.
> 
> Is such dangerousness perception because you fear some of the pcidevs
> lock usage might be there not just for preventing the pdev from going
> away, but also to guarantee exclusive access to certain state?

Indeed. In my view the main purpose of locks is to guard state. Their
use here to guard against devices here is imo rather an abuse; as
mentioned before this should instead be achieved e.g via refcounting.
And it's bad enough already that pcidevs_lock() alone has been abused
this way, without proper marking (leaving us to guess in many places).
It gets worse when a second lock can now also serve this same purpose.

>> Even if (as you say in a later reply)
>> this is only temporary, we all know how long "temporary" can be. It
>> might even be advisable to introduce a helper construct.
> 
> The aim here was to modify as little as possible, in order to avoid
> having to analyze all possible users of pcidevs lock, and thus not
> block the vPCI work on the probably lengthy and difficult analysis.
> 
> Not sure adding a construct makes is much better, as I didn't want to
> give the impression all checks for the pcidevs lock can merely be
> replaced by the new construct.

Of course such a construct could only be used in places where it can
be shown to be appropriate.

Jan

