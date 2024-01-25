Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843183C0B9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 12:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671454.1044803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSxpC-0004n9-Ji; Thu, 25 Jan 2024 11:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671454.1044803; Thu, 25 Jan 2024 11:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSxpC-0004ka-Gw; Thu, 25 Jan 2024 11:23:14 +0000
Received: by outflank-mailman (input) for mailman id 671454;
 Thu, 25 Jan 2024 11:23:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSxpA-0004kU-I9
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 11:23:12 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ec7297c-bb74-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 12:23:10 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cf3ea86423so2650621fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 03:23:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u26-20020a6be41a000000b007bf4344cee1sm5961349iog.4.2024.01.25.03.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 03:23:09 -0800 (PST)
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
X-Inumbo-ID: 1ec7297c-bb74-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706181790; x=1706786590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWInFb1XN6PqU5zz44BXW3fM/C0z6yBDwDik3RGrddA=;
        b=PRXa51pR/y/d7d3vhP/seaN3rsKisAUtAsandr0L9l2qmk8dmm9BIZ9M2nmT38zOwt
         TYFj6oIrSQzWeNw2RMiueByJEvEziRtn6yjFXiBt2fBqrjGI+8Gi+KwnSlINzQ8YvZwX
         6AFZR8+3UV0UmDhAoCBYI77BkUJgrZ6SPSdN8nAP7fl1JoJMv2B8o5YRNeks0NIzcipH
         n66CdqWmy+STB2pugL10LqIAJXspgn0lIsxdyfVBaJoTGb1Y0bDD37oggBC++L7yV1iI
         GsR/VbDmg/3V1r4SsOsdBvHIGOWTQ1C6ia84EhvERaVeJUMGBrLhOABhXOhqPXINkgjH
         F8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706181790; x=1706786590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWInFb1XN6PqU5zz44BXW3fM/C0z6yBDwDik3RGrddA=;
        b=kNGoTmoCNXZSqZWhU3Ndm24WzsLd+5ZdX85StHufC01I6gfGiDc2TnIBHWAkQSNxTQ
         VNVR9kUPZc2KlWPLEMeY75U7XE5kdjTdhmYR8mJR1YFGrgFDE/q3ByC5AFF4XbT4Qt2N
         VJzIjWwo8RHwTBIscTJnZ3TBdnGQ2LlRzwF3iSsbrbD9pJvEGIw3skq4zih0tbJJ4HoF
         Nu6sxTY+LT4QQ4gkBFSirhohlSGNrv/AX9JY0zFkFOJiDcsMh+G9pvaq4tq2HA+opnK3
         pVrQoziB/ceAUGRADN1+Pu318rXgiTt7OzrGRhrknBs3Flsn2Oj+3vHOkzAHvN9nOjPz
         7NBg==
X-Gm-Message-State: AOJu0YwDiUE3JAv1fRWAXNSdGQCn+Fl4gKIAGpLPszfVey4HC+aUCgNF
	F47kcx5Tltz8YMCQD3xTWLV48h1F1IdiTHpbXotSJ5a9vhXZYxF0PLwSThGUMA==
X-Google-Smtp-Source: AGHT+IFczN7veABRfQNDQex7in09sujyWMAAuahfzmm/bTTckwpyQwCBL26YMhB0jGIlKqbmFwoDFA==
X-Received: by 2002:a2e:995a:0:b0:2cf:725:f93 with SMTP id r26-20020a2e995a000000b002cf07250f93mr413778ljj.88.1706181789741;
        Thu, 25 Jan 2024 03:23:09 -0800 (PST)
Message-ID: <247df339-e631-4c50-85e4-b6a486235564@suse.com>
Date: Thu, 25 Jan 2024 12:23:05 +0100
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
 <fa7df700-06f1-4110-bc76-c59d59e5d887@suse.com> <ZbIkVcYkcuT2iF8e@macbook>
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
In-Reply-To: <ZbIkVcYkcuT2iF8e@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.01.2024 10:05, Roger Pau Monné wrote:
> On Thu, Jan 25, 2024 at 08:43:05AM +0100, Jan Beulich wrote:
>> On 24.01.2024 18:51, Roger Pau Monné wrote:
>>> On Wed, Jan 24, 2024 at 12:34:10PM +0100, Jan Beulich wrote:
>>>> On 24.01.2024 10:24, Roger Pau Monné wrote:
>>>>> On Wed, Jan 24, 2024 at 09:48:35AM +0100, Jan Beulich wrote:
>>>>>> On 23.01.2024 16:07, Roger Pau Monné wrote:
>>>>>>> On Tue, Jan 23, 2024 at 03:32:12PM +0100, Jan Beulich wrote:
>>>>>>>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>>>>>>>> @@ -2888,6 +2888,8 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>>>>>>>>>  {
>>>>>>>>>      int irq, pirq, ret;
>>>>>>>>>  
>>>>>>>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
>>>>>>>>
>>>>>>>> If either lock is sufficient to hold here, ...
>>>>>>>>
>>>>>>>>> --- a/xen/arch/x86/physdev.c
>>>>>>>>> +++ b/xen/arch/x86/physdev.c
>>>>>>>>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>>>>>>>>  
>>>>>>>>>      case MAP_PIRQ_TYPE_MSI:
>>>>>>>>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>>>>>>>>> +        pcidevs_lock();
>>>>>>>>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>>>>>>>>> +        pcidevs_unlock();
>>>>>>>>>          break;
>>>>>>>>
>>>>>>>
>>>>>>> IIRC (Stewart can further comment) this is done holding the pcidevs
>>>>>>> lock to keep the path unmodified, as there's no need to hold the
>>>>>>> per-domain rwlock.
>>>>>>
>>>>>> Yet why would we prefer to acquire a global lock when a per-domain one
>>>>>> suffices?
>>>>>
>>>>> I was hoping to introduce less changes, specially if they are not
>>>>> strictly required, as it's less risk.  I'm always quite worry of
>>>>> locking changes.
>>>>
>>>> In which case more description / code commenting is needed. The pattern
>>>> of the assertions looks dangerous.
>>>
>>> Is such dangerousness perception because you fear some of the pcidevs
>>> lock usage might be there not just for preventing the pdev from going
>>> away, but also to guarantee exclusive access to certain state?
>>
>> Indeed. In my view the main purpose of locks is to guard state. Their
>> use here to guard against devices here is imo rather an abuse; as
>> mentioned before this should instead be achieved e.g via refcounting.
>> And it's bad enough already that pcidevs_lock() alone has been abused
>> this way, without proper marking (leaving us to guess in many places).
>> It gets worse when a second lock can now also serve this same
>> purpose.
> 
> The new lock is taken in read mode in most contexts, and hence can't
> be used to indirectly gain exclusive access to domain related
> structures in a safe way.

Oh, right - I keep being misled by rw_is_locked(). This is a fair
argument. Irrespective it would feel better to me if an abstraction
construct was introduced; but seeing you don't like the idea I guess
I won't insist.

Jan

