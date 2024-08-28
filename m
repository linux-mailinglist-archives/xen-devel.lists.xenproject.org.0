Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49943963083
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 20:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785080.1194491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjNqi-0005Nv-H6; Wed, 28 Aug 2024 18:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785080.1194491; Wed, 28 Aug 2024 18:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjNqi-0005MH-Dt; Wed, 28 Aug 2024 18:56:56 +0000
Received: by outflank-mailman (input) for mailman id 785080;
 Wed, 28 Aug 2024 18:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjNqh-0005MB-0W
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 18:56:55 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49ed2166-656f-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 20:56:52 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f3f07ac2dcso78045141fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 11:56:52 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1e2685sm2553439a12.29.2024.08.28.11.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 11:56:51 -0700 (PDT)
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
X-Inumbo-ID: 49ed2166-656f-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724871412; x=1725476212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GG+26ZRDHt2JvbBOiUkTB9caTmrHTiy54JyBlCCkuNg=;
        b=jWMITR2BUFBxlzDuCRE3dJ+8TVJWv+eqG+i6mc4bvuCmQ0e+W89SW6CxoPrHHvvUSC
         uc3Bfj6uJq5Rdc5ueGc/sR4mbxGv5X5SB5d/HVDQ3BDzJwiq3DWqp81tn9S34G5hIPIF
         oSBsk7oyjBilb1lQg58+dFqdrFy0BTkEHwI4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724871412; x=1725476212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG+26ZRDHt2JvbBOiUkTB9caTmrHTiy54JyBlCCkuNg=;
        b=aZpEZSk3oQe9d9kAeCSVobGgXyEQTiZr8cjLI5OKPSyUif0bCyLTebBcT6IlCHYpgm
         G95miwAVJd6NcU8ZcbuKpQAqqDXqq8J0vz6DXUU7RJ1ub0E/XLqwDp30Ao/jDfKU/aTH
         YndY2WSySVwTXdy1P0PUyZp2Ib9opy3v7A9u0mAjilbtDwjJ80P2aTmAIrfLAkWjHLXf
         DHQRIWyiN//w4K9Y0NBhoK+AQzpffIM5doHjL5FEEBIGhbfjIIAz9nkL3/KT2XD9zEEz
         bwjViPgrfXNLOs4q+WcSPko6rFHLQJzejHD5F6fQkPu3bcI6tBZcbhSTyGDdumKzU3+1
         WkIg==
X-Forwarded-Encrypted: i=1; AJvYcCVg9J9lY5vNxicKlkwBqZ1cvkpnIs920vWfdVcklst8iPl+SUVY04YYR3bR3mCgGN1bDHNxn2jll/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLN/vMrPDw59BUwCL5rPJjwNI0yX+Q54qI6q9XrHsozcnpx6Nc
	I5HHdqtvB4Q/zsZo0u0V3CvoKAkBj8lvKebVOz6bMplSkX2Iheg0CTu51Ff5t3I=
X-Google-Smtp-Source: AGHT+IH7OPV/oB83+67MnEd133rMpTYtVi4NhaS/AcC+eTlahIUTQNCyuI7Gk7Ggr/Y//VNU39SyPA==
X-Received: by 2002:a2e:460a:0:b0:2f2:9f39:3e58 with SMTP id 38308e7fff4ca-2f61054b2c5mr4079511fa.48.1724871411869;
        Wed, 28 Aug 2024 11:56:51 -0700 (PDT)
Message-ID: <17a98dae-51d4-4da0-a35a-1ddf94a06168@citrix.com>
Date: Wed, 28 Aug 2024 19:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-3-andrew.cooper3@citrix.com>
 <a92063db-fc28-4162-83bd-33617bbfcfbe@suse.com>
 <8f34109f-1718-47e5-99c5-a6010d7ebe51@citrix.com>
 <09742cbe-4c06-49d4-8b26-7ce9076063a1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <09742cbe-4c06-49d4-8b26-7ce9076063a1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 3:56 pm, Jan Beulich wrote:
> On 28.08.2024 16:44, Andrew Cooper wrote:
>> On 27/08/2024 5:07 pm, Jan Beulich wrote:
>>> On 27.08.2024 15:57, Andrew Cooper wrote:
>>>> +    for_each_set_bit ( seg, dirty )
>>>> +        hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
>>>> +
>>>> +    hvmemul_ctxt->seg_reg_dirty = 0;
>>> Why is this suddenly appearing here? You don't mention it in the description,
>>> so it's not clear whether you found a (however minor) issue, or whether
>>> that's purely cosmetic (yet then it's still an extra store we could do
>>> without).
>> Oh, yes.  Nothing anywhere in Xen ever clears these segment dirty bits.
> hvm_emulate_init_once()?

I meant after emulation.  The value is initialised to 0 at the start of day.

>
>> I suspect the worst that will go wrong is that we'll waste time
>> re-{VMWRITE,memcpy}-ing the segment registers into the VMCS/VMCB, but
>> the logic in Xen is definitely not right.
> I'm on the edge of asking to do such clearing before emulation, not after
> processing the dirty bits. That would then be hvm_emulate_init_per_insn(),
> well centralized.

Specifically, hvmemul_ctxt should not believe itself to be dirty after a
call to hvm_emulate_writeback(), because that's the logic to make the
context no-longer-dirty.

That said, the more I look at this, the less convinced I am by it.  For
a function named writeback(), it's doing a very narrow thing that is not
the usual meaning of the term when it comes to pipelines or insn
emulation...

~Andrew

