Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD786E44F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 16:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687730.1071507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4oz-00045Q-4M; Fri, 01 Mar 2024 15:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687730.1071507; Fri, 01 Mar 2024 15:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4oz-00043o-0x; Fri, 01 Mar 2024 15:29:13 +0000
Received: by outflank-mailman (input) for mailman id 687730;
 Fri, 01 Mar 2024 15:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg4oy-00042U-AO
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 15:29:12 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74040eac-d7e0-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 16:29:11 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56533e30887so4110613a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 07:29:11 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q12-20020a056402518c00b00563ec73bbafsm1649234edd.46.2024.03.01.07.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 07:29:09 -0800 (PST)
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
X-Inumbo-ID: 74040eac-d7e0-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709306951; x=1709911751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkF6Nzs3alqJskCA0a76NE9opSG5DMrPOK53HFJFRpc=;
        b=Bcd7bzA9CzcbAVU8i48QMZi68xnt8uHRduHMu314wkDYRP+/P9+nkKcd8Yr6u/DMkG
         fadIU0lP/wp934vHcwMYPn6/c95517h+bGpZgOW8oF8BrXWQdWNwGrH3brdNNZwdYFS8
         gIFecblB4LJtN/C3fdF5p9dhN4Ey6DXQTauqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709306951; x=1709911751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkF6Nzs3alqJskCA0a76NE9opSG5DMrPOK53HFJFRpc=;
        b=bJugbwu8B8TwvMCHvF/OxD8lDqUdH0HvzRtCzyYY+tdbBa9zFzDIMWF9sr9MN98KJr
         eexb6Sx0nWkiW0Bka6kWnaItJs0C1kIqPkcCUw5ij5aV/w9DLOZhXHjwWGyrUi9w0X/R
         OOwyfXt8gPUyEGQqgqL7EYms5ZWKzuJbw1r9QMCaAWwmL4gjwzuLoTJTXc2VliTtrN3d
         epW1w4aSKFgl4U7nvcr7jO2zlGO+VYKRrujeXDeoAG22bmhiQbhbGXNRsKWH5VJYFfQA
         GlffCfUl0t44Q7LcJSuTcEFddQUeVD6QKqeQPWpRnH25MtpF2dqZToamvVzfbwwNkbJn
         unNg==
X-Gm-Message-State: AOJu0YyB8l/Eja0Mc+Dw0Zbwnlxd1vXXrChwewgrSDAipl7sakurAphH
	gwDEhjAmMx5kKWixKTWytiLS7PA7veN2DJFfpolXYUUM5LPMvRRJwVxLJfV3zZ/B+RFLJlhbVQM
	1
X-Google-Smtp-Source: AGHT+IEvfGZTG5r4zJYTe8OZ3zbexguf8MHnRmi6BSktSY/hjcmECaXyNtZFb8nCBiwrxKgdlzF2Xg==
X-Received: by 2002:a05:6402:40d0:b0:566:d6b6:f905 with SMTP id z16-20020a05640240d000b00566d6b6f905mr1728723edb.13.1709306951049;
        Fri, 01 Mar 2024 07:29:11 -0800 (PST)
Message-ID: <c1187c2f-cc1f-49e8-b303-8ab75be9effb@citrix.com>
Date: Fri, 1 Mar 2024 15:29:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Hide x2APIC from PV guests
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240229221448.2593171-1-andrew.cooper3@citrix.com>
 <ZeHGAJfw0HLnkB0p@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZeHGAJfw0HLnkB0p@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 12:11 pm, Roger Pau Monné wrote:
> On Thu, Feb 29, 2024 at 10:14:48PM +0000, Andrew Cooper wrote:
>> PV guests can't write to MSR_APIC_BASE (in order to set EXTD), nor can they
>> access any of the x2APIC MSR range.  Therefore they mustn't see the x2APIC
>> CPUID bit saying that they can.
>>
>> Right now, the host x2APIC flag filters into PV guests, meaning that PV guests
>> generally see x2APIC except on Zen1-and-older AMD systems.
>>
>> Linux works around this by explicitly hiding the bit itself, and filtering
>> EXTD out of MSR_APIC_BASE reads.  NetBSD behaves more in the spirit of PV
>> guests, and entirely ignores the APIC when built as a PV guest.
>>
>> Change the annotation from !A to !S.  This has a consequence of stripping it
>> out of both PV featuremasks.  However, as existing guests may have seen the
>> bit, set it back into the PV Max policy; a VM which saw the bit and is alive
>> enough to migrate will have ignored it one way or another.
>>
>> Hiding x2APIC does also change the contents of leaf 0xb, but as the
>> information is nonsense to begin with, this is likely an improvement on the
>> status quo.  The blind reporting of APIC_ID = vCPU_ID * 2 isn't interlinked
>> with the host's topology structure, and the APIC_IDs are useless without an
>> MADT to start with.
> AFAICT the APIC ID in CPUID leaf 0x1 %ebx is only reported to HVM
> guests, not PV ones (see the dynamic section of guest_cpuid()).

"reported to" is complicated for PV with CPUID Masking, because host
details will leak in for both the xAPIC and x2APIC IDs.

> This paragraph might need adjusting then, as it reads to me as if PV
> guests could also expect APIC_ID == vCPU_ID * 2.
>
> With this change no x{,2}APIC ID gets exposed in CPUID for PV guests
> unless it's for compat reasons for guests that already saw the x2APIC
> feature.

I'll see if I can find some better wording.
>> Dom0 is the only PV VM to get an MADT but it's the host
>> one, meaning the two sets of APIC_IDs are from different address spaces.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

