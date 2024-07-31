Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF094295A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768350.1179121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4t9-0002eb-0P; Wed, 31 Jul 2024 08:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768350.1179121; Wed, 31 Jul 2024 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4t8-0002d7-U2; Wed, 31 Jul 2024 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 768350;
 Wed, 31 Jul 2024 08:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ4t7-0002cz-N1
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:40:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d6c928-4f18-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 10:40:48 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ab2baf13d9so7869404a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 01:40:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad426aasm739247666b.105.2024.07.31.01.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 01:40:47 -0700 (PDT)
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
X-Inumbo-ID: 95d6c928-4f18-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722415248; x=1723020048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=st3uwd8QzOr0xOoPY7vy9sq3Tagd7aCi0LWl1MM9P/E=;
        b=FuyVqHwR9+o5AJs0lvj5fbqhv3IlpzaNX2GrH1KNEyYRz1yWOPdn65T10C4H5t31Uk
         zAbr2cSHd8kY5/R/a4nIfyx+t5j2fq8oVMIc5ERnep6yrAuiAs0sqMQ1+kD0nJNBL7GY
         46zz7uZ8sGAlfypjEaHnJvwM+NxOZsO0X7c8wAO7vflaFJ19pqP7dx0yIWe9PcubW2zS
         XEvFIb77ALwJMejoFeADsnWMbz+5LMHQFhuZr80aLbFuzbhFAURYODtLSq75BqZV7Qfz
         c5ERRfvBRmBmAoCvjJmgE9NA/KtVpUAOYwyPWtL4QfUdnxuLxgM3ytheN5/dOS+cfgRS
         UztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415248; x=1723020048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st3uwd8QzOr0xOoPY7vy9sq3Tagd7aCi0LWl1MM9P/E=;
        b=Bixv2201Wi8ZmRC9Eb3BL2UVdToCVu5kIRL51Gnz2Uwy/lBwPtlJ4wTGuyEBUhHq9B
         /U+MGRbnq3SOdqCUddow2dAoFU6kvCmyZ7HvtccXhxpniHKRYvdHFANOU2YmC+qO39Ow
         085+a6L0bBsgKZU9ZjkJnIiAV9yKrmmgA+WH4igiwc42rZwhaizxmK3LD5S8RjzIwdtx
         +PFpXVtDlri8DddCTqyuERRzsbPB7Ef/1ue/lwSZTETXqZRnkGhK9M2Ri+cBGNYWonmo
         XySUS3dTHZV/7IupYRT2v21LOsgnJd02X4gpd9dLNFqqIRks5JzeUDMEVArYHr+or2KK
         3fuw==
X-Gm-Message-State: AOJu0YzAq9rLgFAoH+dpguH/NZ2KH9k7Llysc3hWuhWpBBIUghkd9jYO
	JKQqwigr6EavspYkwNe+7UIfBlaA0lrL1LmiNFtvm5cXSkKuQLCb3ATQxGK/0w==
X-Google-Smtp-Source: AGHT+IH6tviFtadzufiNTmSDbTmiyPl4w0+4rDWiFZh4sqIXM3WcKFNpIiF4bHhKOKzesWgqhEEmGw==
X-Received: by 2002:a17:907:9720:b0:a7a:97ca:3056 with SMTP id a640c23a62f3a-a7d3fff8d5fmr1067951666b.16.1722415247810;
        Wed, 31 Jul 2024 01:40:47 -0700 (PDT)
Message-ID: <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com>
Date: Wed, 31 Jul 2024 10:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com> <Zqnswi7ihOhMxPsi@macbook>
 <0aa0982a-30b3-43cd-9a9e-4542d7cb583f@suse.com> <Zqn014wCEfWhyo1-@macbook>
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
In-Reply-To: <Zqn014wCEfWhyo1-@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 10:24, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 09:58:28AM +0200, Jan Beulich wrote:
>> On 31.07.2024 09:50, Roger Pau Monné wrote:
>>> On Mon, Jul 08, 2024 at 07:41:19PM +0800, Jiqian Chen wrote:
>>>> --- a/xen/arch/x86/physdev.c
>>>> +++ b/xen/arch/x86/physdev.c
>>>> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>          if ( !d )
>>>>              break;
>>>>  
>>>> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>>>> +        /* Only mapping when the subject domain has a notion of PIRQ */
>>>> +        if ( !is_hvm_domain(d) || has_pirq(d) )
>>>
>>> I'm afraid this is not true.  It's fine to map interrupts to HVM
>>> domains that don't have XENFEAT_hvm_pirqs enabled.  has_pirq() simply
>>> allow HVM domains to route interrupts from devices (either emulated or
>>> passed through) over event channels.
>>>
>>> It might have worked in the past (when using a version of Xen < 4.19)
>>> because XENFEAT_hvm_pirqs was enabled by default for HVM guests.
>>>
>>> physdev_map_pirq() will work fine when used against domains that don't
>>> have XENFEAT_hvm_pirqs enabled, and it needs to be kept this way.
>>>
>>> I think you want to allow PHYSDEVOP_{,un}map_pirq for HVM domains, but
>>> keep the code in do_physdev_op() as-is.  You will have to check
>>> whether the current paths in do_physdev_op() are not making
>>> assumptions about XENFEAT_hvm_pirqs being enabled when the calling
>>> domain is of HVM type.  I don't think that's the case, but better
>>> check.
>>
>> Yet the goal is to disallow mapping into PVH domains. The use of
>> has_pirq() was aiming at that. If that predicate can't be used (anymore)
>> for this purpose, which one is appropriate now?
> 
> Why do you want to add such restriction now, when it's not currently
> present?
> 
> It was already the case that a PV dom0 could issue
> PHYSDEVOP_{,un}map_pirq operations against a PVH domU, whatever the
> result of such operation be.

Because (a) that was wrong and (b) we'd suddenly permit a PVH DomU to
issue such for itself.

Jan

