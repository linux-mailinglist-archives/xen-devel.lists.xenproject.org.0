Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A455C93FCCF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 19:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767057.1177626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYUX2-0003Z5-VV; Mon, 29 Jul 2024 17:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767057.1177626; Mon, 29 Jul 2024 17:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYUX2-0003Wk-Sn; Mon, 29 Jul 2024 17:51:36 +0000
Received: by outflank-mailman (input) for mailman id 767057;
 Mon, 29 Jul 2024 17:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+rL=O5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYUX1-0003We-SW
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 17:51:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316157ee-4dd3-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 19:51:33 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4281f00e70cso7820605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 10:51:33 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367d9576sm12952910f8f.31.2024.07.29.10.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 10:51:32 -0700 (PDT)
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
X-Inumbo-ID: 316157ee-4dd3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722275493; x=1722880293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jF1MrwtNaChbQg+KF324+dQeLVOpu3FAPmGNawyI/1Q=;
        b=Uz6+CbDq/j5oxRphMfigofNroaK2cB2dAmu4/vPMdOQ1cUgAwHIukb78wpBVQNZiTJ
         XXHnu7V9Mx7s9F0QJz7sldip6hkXgb/9RzbrSxtl4Ef4WmYJAvqB7QFGgwnBscrSS6xs
         8w/OWpvM8qY9HwRXRR1gVbHYqBfftOa2S6U0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722275493; x=1722880293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF1MrwtNaChbQg+KF324+dQeLVOpu3FAPmGNawyI/1Q=;
        b=woLAVdWqFH+GCX87E2V4SNlJBIr23F18/LoO9VZFe/bPgu4wSlEyUA32t1S19k/33a
         2RS6bdqehw1eZwLPlXYDu4d6BAd4yDWewoDuICDntadWnnKRCId7Ou/VF/OV76a11zyn
         shkFMiD9jz8vdmyZsjgrVi2SBaQNsqc0vCIwDiaajeRyK2X4ECdVQGh78ad4nXgeWHdo
         tHw3d2qFM7cRix7dKukTudyQr2Osn/AKZPfEtw1uY67bub45KnGiDajwHSF6eDiUvF1a
         NV9iNV6akJHlCr/zBfoXLiT1n29KgQlSHdgT0Dm8dwZk7IXsttdTuIkGr9psuzCRa0Fh
         NiLw==
X-Forwarded-Encrypted: i=1; AJvYcCX4MKXMeMqJS5fZTwVSyvkGQWjXQxIYwSniOoi5L8tsc076zt6pKpK4HuGDYYTM5BLEJTCLAGXeHMOogdCuYk9rcVYhvpPL3diQSY/6cWs=
X-Gm-Message-State: AOJu0Yyc4deIeCJfKwtd6m3NBnpETBR0ewUiGagTy8ZwbrNR/rkfZZbx
	D619t6suD11R2JGm3LmKv76BpkUIYM6ukWpfGeLbi/QStUCRa/UQ3qMKSpOLs+U=
X-Google-Smtp-Source: AGHT+IFgZReSXzQR3V1ms2jn3NdMEb51xhy/KS6cshqTc8JauKclPeJJrUt+UIFPwZIH3w5DbCImPg==
X-Received: by 2002:a5d:6787:0:b0:362:d382:2569 with SMTP id ffacd0b85a97d-36b5d08f68bmr5297976f8f.44.1722275492705;
        Mon, 29 Jul 2024 10:51:32 -0700 (PDT)
Message-ID: <542807c8-425b-481f-b02f-dd657c12ef5d@citrix.com>
Date: Mon, 29 Jul 2024 18:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, alejandro.vallejo@cloud.com,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
 <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
 <5aad5f48-e32e-4a59-bcef-05adec0ecbec@citrix.com> <ZqfA714LUFgZOYqw@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZqfA714LUFgZOYqw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2024 5:18 pm, Roger Pau Monné wrote:
> On Mon, Jul 29, 2024 at 04:52:22PM +0100, Andrew Cooper wrote:
>> On 29/07/2024 12:53 pm, Jan Beulich wrote:
>>> On 26.07.2024 17:21, Roger Pau Monne wrote:
>>>> The PVH dom0 builder doesn't switch page tables and has no need to run with
>>>> SMAP disabled.
>>>>
>>>> Put the SMAP disabling close to the code region where it's necessary, as it
>>>> then becomes obvious why switch_cr3_cr4() is required instead of
>>>> write_ptbase().
>>>>
>>>> Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
>>>> guest context, and hence updating the value of cr4_pv32_mask is not relevant.
>>> I'm okay-ish with that being dropped, but iirc the goal was to keep the
>>> variable in sync with CPU state.
>> Removing SMAP from cr4_pv32_mask is necessary.
>>
>> Otherwise IST vectors will reactive SMAP behind the back of the dombuilder.
>>
>> This will probably only manifest in practice in a CONFIG_PV32=y build,
> Sorry, I'm possibly missing some context here.  When running the dom0
> builder we switch to the guest page-tables, but not to the guest vCPU,
> (iow: current == idle) and hence the context is always the Xen
> context.

Correct.

> Why would the return path of the IST use cr4_pv32_mask when the
> context in which the IST happened was the Xen one, and the current
> vCPU is the idle one (a 64bit PV guest from Xen's PoV).
>
> My understanding is that cr4_pv32_mask should only be used when the
> current context is running a 32bit PV vCPU.

This logic is evil to follow, because you need to look at both
cr4_pv32_mask and XEN_CR4_PV32_BITS to see both halves of it.

Notice how cr4_pv32_restore() only ever OR's cr4_pv32_mask into %cr4?

CR4_PV32_RESTORE is called from every entry path which *might* have come
from a 32bit PV guest, and it always results in Xen having SMEP/SMAP
active (as applicable).  This includes NMI.

The change is only undone in compat_restore_all_guest(), where
XEN_CR4_PV32_BITS is cleared from %cr4 iff returning to Ring1/2.  This
is logic cunningly disguised in the use of the Parity flag.


Because the NMI handler does reactive SMEP/SMAP (based on the value in
cr4_pv32_mask), and returning to Xen does not pass through
compat_restore_all_guest(), taking an NMI in the middle of of the
dombuilder will reactive SMAP behind your back.

~Andrew

