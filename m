Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6354945B28
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770826.1181419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZojL-00060T-Et; Fri, 02 Aug 2024 09:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770826.1181419; Fri, 02 Aug 2024 09:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZojL-0005xu-C5; Fri, 02 Aug 2024 09:37:47 +0000
Received: by outflank-mailman (input) for mailman id 770826;
 Fri, 02 Aug 2024 09:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZojJ-0005xo-Rf
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:37:45 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de34ec4e-50b2-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 11:37:43 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so412017a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:37:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839716490sm881791a12.5.2024.08.02.02.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:37:42 -0700 (PDT)
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
X-Inumbo-ID: de34ec4e-50b2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722591463; x=1723196263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hYE8daY2atLpvpqeoutGssR2085BBUEClZ3nf/XHhzA=;
        b=JQLQRHa/2ouZLNDTDoUXh+kc+sXwsepNGVC6dRVoeaswJPA+MogC2d5t0w3jA9/BWL
         X5q/XWvA4t7rn2qDc/an5zU1lr2P0g/MyOqY7+7d9h8jNMhSkuZ61YIxpoQq/c8oseIb
         hq0M3jUSsVrYBC2bIrZcAi0iWgEVS52RmDhSpomTQTbm08K8n7tm3KNpYsLjEEt3W9P2
         CP78TvOpWAukjC2okS2ww3kUoclM3xymdewaUn3+IgNM17pPXWsUVWZ4lgAZFtrEfjx+
         7MqDRjShkZjpkT9s8lShQHJUbeIu6Bi7XA+409Jv9n0GiOag4FbZ2Pr8alq2swqnZvXF
         dA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591463; x=1723196263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYE8daY2atLpvpqeoutGssR2085BBUEClZ3nf/XHhzA=;
        b=wTTYHttc16YNIvDZTv1WwcOIsZ/hbfBeAuPFoAFxaAjPn+3wQ6lJEy40EwoLa4OfHW
         XD9N+NPLtIAIMw8kB/F9GtWCAhGLVKNhqngM2O5KD2KoUJ1mhDnZ0nX3Ll/xfc4oydic
         9/FRDgqpe3vxH0h9UpJ22XYzHap8t3fev9eJz4TsqHisD5SmloeISRnZ/LJlhXBERtV2
         rdz8OIEKbcxnDJwcigoj1Yo6BbmbuU8xha92ylEwXiliAOSFsOlIbfpCDw72Ob4W0Ci0
         veXY1DlDLoizmEurTYWf6KaBfkDiBT59BvmcueXWVsSuUCKSfDYMf07zGhu3OC+jAHgr
         1kUQ==
X-Gm-Message-State: AOJu0Yzn8I+ZgxSQX43Ym893YtJ+U/wIGpMeqehdY9LuDKqD/i3mIJpe
	xvUxx7sEaCY8ITbr0UKRd6qk7xjlZAjKUxf9TJuSeehmJcPGpYDHNb4+1FU4/MN0HAFPiwFHAv8
	=
X-Google-Smtp-Source: AGHT+IHFXSA5F2rVH+ytOp2whHS/UmaqqkDm7L/2CwEXo36QV/1g8RYkLLNORQB8r6SoTGOmT2ysUA==
X-Received: by 2002:aa7:cd98:0:b0:5a3:8c9:3c1d with SMTP id 4fb4d7f45d1cf-5b7f3bcfc21mr1981697a12.14.1722591462723;
        Fri, 02 Aug 2024 02:37:42 -0700 (PDT)
Message-ID: <c990a47d-42df-4116-8402-e0d7a648cd33@suse.com>
Date: Fri, 2 Aug 2024 11:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <Zqn014wCEfWhyo1-@macbook>
 <8ff685a6-0cbd-45cd-a818-4535a040c478@suse.com> <Zqn7HEuooChgRCuf@macbook>
 <d65ae152-22ee-4a57-8ff4-43ef0c234f5f@suse.com> <ZqoF55yapMxGN_WM@macbook>
 <fa33fbf8-32b6-48dc-a30c-dd76b021a76d@suse.com> <ZqogJVHV36ytYVP1@macbook>
 <ff922c7a-aa66-4b23-8b9f-63b0b403ff14@suse.com> <Zqo2N7CDshL7ZoMK@macbook>
 <BL1PR12MB584914D078416A5F0ECA0AE0E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZqyUxv7UcaRcksCG@macbook>
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
In-Reply-To: <ZqyUxv7UcaRcksCG@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.08.2024 10:11, Roger Pau Monné wrote:
> On Fri, Aug 02, 2024 at 02:37:24AM +0000, Chen, Jiqian wrote:
>> On 2024/7/31 21:03, Roger Pau Monné wrote:
>>> On Wed, Jul 31, 2024 at 01:39:40PM +0200, Jan Beulich wrote:
>>>> On 31.07.2024 13:29, Roger Pau Monné wrote:
>>>>> On Wed, Jul 31, 2024 at 11:55:35AM +0200, Jan Beulich wrote:
>>>>>> On 31.07.2024 11:37, Roger Pau Monné wrote:
>>>>>>> On Wed, Jul 31, 2024 at 11:02:01AM +0200, Jan Beulich wrote:
>>>>>>>> On 31.07.2024 10:51, Roger Pau Monné wrote:
>>>>>>>>> I agree with (a), but I don't think enabling PVH dom0 usage of the
>>>>>>>>> hypercalls should be gated on this.  As said a PV dom0 is already
>>>>>>>>> capable of issuing PHYSDEVOP_{,un}map_pirq operations against a PVH
>>>>>>>>> domU.
>>>>>>>>
>>>>>>>> Okay, I can accept that as an intermediate position. We ought to deny
>>>>>>>> such requests at some point though for PVH domains, the latest in the
>>>>>>>> course of making vPCI work there.
>>>>>>>
>>>>>>> Hm, once physdev_map_pirq() works as intended against PVH domains, I
>>>>>>> don't see why we would prevent the usage of PHYSDEVOP_{,un}map_pirq
>>>>>>> against such domains.
>>>>>>
>>>>>> Well. If it can be made work as intended, then I certainly agree. However,
>>>>>> without even the concept of pIRQ in PVH I'm having a hard time seeing how
>>>>>> it can be made work. Iirc you were advocating for us to not introduce pIRQ
>>>>>> into PVH.
>>>>>
>>>>> From what I'm seeing here the intention is to expose
>>>>> PHYSDEVOP_{,un}map_pirq to PVH dom0, so there must be some notion of
>>>>> pIRQs or akin in a PVH dom0?  Even if only for passthrough needs.
>>>>
>>>> Only in so far as it is an abstract, handle-like value pertaining solely
>>>> to the target domain.
>>>>
>>>>>> Maybe you're thinking of re-using the sub-ops, requiring PVH domains to
>>>>>> pass in GSIs?
>>>>>
>>>>> I think that was one my proposals, to either introduce a new
>>>>> hypercall that takes a GSI, or to modify the PHYSDEVOP_{,un}map_pirq
>>>>> in an ABI compatible way so that semantically the field could be a GSI
>>>>> rather than a pIRQ.  We however would also need a way to reference an
>>>>> MSI entry.
>>>>
>>>> Of course.
>>>>
>>>>> My main concern is not with pIRQs by itself, pIRQs are just an
>>>>> abstract way to reference interrupts, my concern and what I wanted to
>>>>> avoid on PVH is being able to route pIRQs over event channels.  IOW:
>>>>> have interrupts from physical devices delivered over event channels.
>>>>
>>>> Oh, I might have slightly misunderstood your intentions then.
>>>
>>> My intention would be to not even use pIRQs at all, in order to avoid
>>> the temptation of the guest itself managing interrupts using
>>> hypercalls, hence I would have preferred that abstract interface to be
>>> something else.
>>>
>>> Maybe we could even expose the Xen IRQ space directly, and just use
>>> that as interrupt handles, but since I'm not the one doing the work
>>> I'm not sure it's fair to ask for something that would require more
>>> changes internally to Xen.
>>>
>>>>>> I think I suggested something along these lines also to
>>>>>> Jiqian, yet with the now intended exposure to !has_pirq() domains I'm
>>>>>> not sure this could be made work reliably.
>>>>>
>>>>> I'm afraid I've been lacking behind on reviewing those series.
>>>>>
>>>>>> Which reminds me of another question I had: What meaning does the pirq
>>>>>> field have right now, if Dom0 would issue the request against a PVH DomU?
>>>>>> What meaning will it have for a !has_pirq() HVM domain?
>>>>>
>>>>> The pirq field could be a way to reference an interrupt.  It doesn't
>>>>> need to be exposed to the PVH domU at all, but it's a way for the
>>>>> device model to identify which interrupt should be mapped to which
>>>>> domain.
>>>>
>>>> Since pIRQ-s are per-domain, _that_ kind of association won't be
>>>> helped. But yes, as per above it could serve as an abstract handle-
>>>> like value.
>>>
>>> I would be fine with doing the interrupt bindings based on IRQs
>>> instead of pIRQs, but I'm afraid that would require more changes to
>>> hypercalls and Xen internals.
>>>
>>> At some point I need to work on a new interface to do passthrough, so
>>> that we can remove the usage of domctls from QEMU.  That might be a
>>> good opportunity to switch from using pIRQs.
>>
>> Thanks for your input, but I may be a bit behind you with my knowledge and can't fully understand the discussion.
>> How should I modify this question later?
>> Should I add a new hypercall specifically for passthrough?
>> Or if it is to prevent the (un)map from being used for PVH guests, can I just add a new function to check if the subject domain is a PVH type? Like is_pvh_domain().
> 
> I think that would be part of a new interface, as said before I don't
> think it would be fair to force you to do all this work.  I won't
> oppose with the approach to attempt to re-use the existing interfaces
> as much as possible.
> 
> I think this patch needs to be adjusted to drop the change to
> xen/arch/x86/physdev.c, as just allowing PHYSDEVOP_{,un}map_pirq
> without any change to do_physdev_op() should result in the correct
> behavior.

Plus perhaps adding respective clarification to the description, as
to exposing the functionality to wider than (presently) necessary
"audience".

Jan

