Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A64818A04
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656935.1025448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFb9d-0008OI-7V; Tue, 19 Dec 2023 14:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656935.1025448; Tue, 19 Dec 2023 14:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFb9d-0008L4-4d; Tue, 19 Dec 2023 14:33:05 +0000
Received: by outflank-mailman (input) for mailman id 656935;
 Tue, 19 Dec 2023 14:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rImv=H6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFb9c-0008FG-9y
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:33:04 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8488d992-9e7b-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:33:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c6a71e88cso58276915e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:33:03 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b0040c57e4ea28sm3159894wmq.17.2023.12.19.06.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 06:33:02 -0800 (PST)
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
X-Inumbo-ID: 8488d992-9e7b-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702996383; x=1703601183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7wyqcXbaJebRgtmhIg2N+UyZFqChSG4v2RS+bAgX2Qg=;
        b=l58BRkz2ou7PnbSwwUrxegnPkMr5c0We6Cr00yIiQnjLkxeU7nGxXdAsgeG9bm1/XX
         CKrNVgGEbRyUdQdNR+JtCUZc/M5RGNQEE6wkJkh9jMwbTS3NwPiK5+CLJJjeJEFIyZl6
         z6jMmTF5vPhLLt35vYjHwLHIfsTdSLqmXsSFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996383; x=1703601183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wyqcXbaJebRgtmhIg2N+UyZFqChSG4v2RS+bAgX2Qg=;
        b=J+tNotulVxiWsmg1LBUPlwJVRFgUISWEK4OaVywBCOGji/ooFguQJVMF5iEkU22yyx
         CJGGlOviBRHE7/VVYVhQ1Qb6Rwmjn3E6pspvun5k4l/9+3Q86ZrGQO9PsgZs7MwvrDZr
         8cRNaE+9Zmyt5u1nWuFlFnSeXK0qqtux4F6QoF3JFnHh1mBmg6KXN07H6tsy60Xob/N7
         Hrza6b/6RLM39D+YaIRsjttZsEztHNFtQXxIcS6Nbi9fLMOaWRR0yFP2oy9Y5iIF0QNl
         prUAWPIjXtJqVX1dfvoBCkKAkxnDnoqYG4UVcA94ScOSRL/CmUl5TqGe4uMJcBjskd2/
         iJNg==
X-Gm-Message-State: AOJu0YxoiJKG9KxZw5uxAYkfMvPCnAW+/O9/besCkcO6RY9I1IylLkck
	Jt8YpjzLF/rSt3wk1xhYT67ePw==
X-Google-Smtp-Source: AGHT+IEjoxBbaaj28/8BmwCu1CEthCiM3cw716YfGipvt0XSedVh7UzkjsWbvCa62HtqJfvvqm1Jmg==
X-Received: by 2002:a05:600c:4f4d:b0:40b:5e21:dd34 with SMTP id m13-20020a05600c4f4d00b0040b5e21dd34mr10891702wmq.98.1702996383175;
        Tue, 19 Dec 2023 06:33:03 -0800 (PST)
Message-ID: <5beee36e-781e-4a95-8401-8af7657b8dce@citrix.com>
Date: Tue, 19 Dec 2023 14:33:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <6dbce90b-69c8-4899-9b69-da3b50c17b40@citrix.com>
 <c45d2f87-0670-4975-84e0-a3b462b8e4a7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c45d2f87-0670-4975-84e0-a3b462b8e4a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2023 2:25 pm, Jan Beulich wrote:
> On 19.12.2023 15:19, Andrew Cooper wrote:
>> On 19/12/2023 1:48 pm, Mykyta Poturai wrote:
>>> This patch adds the ability for the device emulator to inject MSI
>>> interrupts into guests. This is done by adding a new DM op to the device
>>> model library.
>>>
>>> It is not possible to reuse already existing inject_msi DM op, because
>>> it does not have a devid parameter, which is required for translation of
>>> MSIs to interrupt numbers on ARM.
>> Ok, so the original hypercall is broken.
>>
>> But the new hypercall isn't ARM specific. It's just better form of
>> inject_msi, and needed for all architectures.
>>
>> So, name it DMOP_inject_msi2 and get rid of the ARM infix.
>>
>>> This approach was successfully tested on a virtio-pci setup with QEMU
>>> backend emulating block devices with following changes from the mainline
>>> Xen:
>>>
>>> This branch was taken as a base for virtio-pci:
>>> https://github.com/xen-troops/xen/tree/xen-4.18-xt0.2
>>>
>>> With added new VGICv3 from here:
>>> https://github.com/Deedone/xen/tree/new_vgic_v2
>>> (although it should also work with the current VGIC)
>>>
>>> And patches from this branch to allow for proper ITS emulation in guests:
>>> https://github.com/stewdk/xen/commits/pcie-passthrough-arm-vpci-v11
>>>
>>> The main purpose of this RFC is to get some feedback on the addition of
>>> the new DM op. Is it the right approach or should we somehow modify the
>>> existing inject_msi DM op to be compatible with ARM?
>> The DM_OP ABI does allow you to extend the structure behind
>> DMOP_inject_msi, as long as 0 is meaningful.
>>
>> However, the semantics of zero-extending are wrong in this case, because
>> it would mean that users of DMOP_inject_msi on an updated Xen would be
>> sending interrupts with an implicit source id of host bridge.
>>
>> So you need a new DMOP_inject_msi2 that has better semantics.
> As said in another reply, the existing structure has a 32-bit padding
> field, which could be used here. In the handler it's properly being
> checked to be zero right now;

It's still not safe to reuse this zero for a source ID semantic behind
the back of older userspace.

>  whether that would want to remain this
> way, or whether we'd expect source ID to also be passed on x86 I don't
> know (yet).

We do need the source ID in x86, as soon as the guest has vIOMMU for any
reason.

It's a design error that it wasn't added originally, but I suppose you
can say the same of x86 platforms in general, having to retrofit an
OS-visible Source ID to HPETs/IO-APICs to make them compatible with IOMMUs.

~Andrew

