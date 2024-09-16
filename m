Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C846C979C6C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 10:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799302.1209259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6hO-0005Ht-5Y; Mon, 16 Sep 2024 08:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799302.1209259; Mon, 16 Sep 2024 08:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6hO-0005GN-2d; Mon, 16 Sep 2024 08:03:06 +0000
Received: by outflank-mailman (input) for mailman id 799302;
 Mon, 16 Sep 2024 08:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq6hM-0005GF-EU
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 08:03:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1924be40-7402-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 10:03:03 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so4587572a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 01:03:03 -0700 (PDT)
Received: from [10.9.6.216] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb49a4esm2303937a12.9.2024.09.16.01.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 01:03:02 -0700 (PDT)
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
X-Inumbo-ID: 1924be40-7402-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726473783; x=1727078583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A21wVh1JbNS2Ic1TGBy/4v+aBix6n4zyraJ0bz/Cx1Y=;
        b=SHwr4TW2buu8gpRgNE+r8Y1bw3bOU7HreLW3HS2EUxubCEG0WR2zHQZr8GORAqw1Cj
         3j5EahWBBdORro4ZoCyXBaSTSDlkUmTiMeAF2RrW65ffp+o4SmcjsJEsdmQebAdR0/Wq
         knWOK0cRLMFR4yGaMQt2ly07vktSQffHt8ho1HBY3Fqvcfzwf+NnzjFjWJwkkRRcQZWj
         IfJ3kUzAJ/ELYvQ4h4PA8EoDEPGJ2aHi5X0FKnySQRr6pCgLdtBlQpZYgNdebFz5dqfo
         AyxpoVZ+PRfJHt4tw2bBOLwJcQMb9HqjroQF8YSG3KDixPACf3DGjfuzhaN7dspFGyBk
         LF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726473783; x=1727078583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A21wVh1JbNS2Ic1TGBy/4v+aBix6n4zyraJ0bz/Cx1Y=;
        b=CNJo0ctsy8XTkBNROg/222FldCNiPSD4OOQ3wViYRSPwaHeM2KLPrBQw2A+LDka31P
         ci+uhnYqtooIlVrJKsSpb5w4QSSO9QOfg0d7axqgbVQMnHrnNf/lBXBmpWgEH3E7+P2+
         Jc8BzyN1v4jPf2vnbGwVLUyjAyEVF4kyoBlke/+c3sHq/Vgd3lVv9LCdfMu4i4a0Cme6
         JVEe5CEH7tZw0ABQjya69pf1VM8PQx8xKALkHQx5g/I8Gm070+NjHm7EyNym1dg3YLfe
         +wsVADRUeMl9a2K+HFxn07Sy0EQMiJvINkhrRDaDdNC17LNlrEf+yL4/0xxR5P/R4v6Z
         W0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXaB/pFbE57Wud9pyKD96czygTB2EFeMbuiQduPWLpBWpgSAXhE8qMTnycEbmooTAR71e8UzOOAQF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywnaa1JqUogZkr7V0kvz+w9lVatcKVZJyAfOXR9tysk/o+u/0jF
	Il6dp9zOmehlHspnGtQA1Kzz8/HFAldSgk2J35ml0tPOc0Ci0Oj5cKumSDCR+Nmf78uwChjnB5g
	=
X-Google-Smtp-Source: AGHT+IFf3eEsR0eYFBzNz3EWHa1GdFWMc8/4R/wF5h8MjPKSfpI/53doATv8wvAFhKy/b3dYNIFDoA==
X-Received: by 2002:a05:6402:26c5:b0:5c3:d908:98f0 with SMTP id 4fb4d7f45d1cf-5c413e05fe5mr11119315a12.3.1726473782536;
        Mon, 16 Sep 2024 01:03:02 -0700 (PDT)
Message-ID: <0cebbf81-ea4d-4039-acae-4972e5c9d176@suse.com>
Date: Mon, 16 Sep 2024 10:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: Initialise BSS as soon as possible
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-2-frediano.ziglio@cloud.com>
 <76d6d359-d856-4c31-b7ef-30084d7a735c@suse.com>
 <CACHz=ZhLNc4xUcLxbvZ+1G_+Y1peYsOpQAgcihWuV7wZ8u=T9A@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CACHz=ZhLNc4xUcLxbvZ+1G_+Y1peYsOpQAgcihWuV7wZ8u=T9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 09:44, Frediano Ziglio wrote:
> On Sun, Sep 15, 2024 at 7:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.09.2024 18:16, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -231,6 +231,27 @@ __efi64_mb2_start:
>>>          /* VGA is not available on EFI platforms. */
>>>          movl   $0,vga_text_buffer(%rip)
>>>
>>> +        /*
>>> +         * Align the stack as UEFI spec requires. Keep it aligned
>>> +         * before efi_multiboot2() call by pushing/popping even
>>> +         * numbers of items on it.
>>> +         */
>>> +        and     $~15,%rsp
>>
>> You don't use the stack below, so it's not clear if/why this needs
>> moving. If it does, please add the missing blank after the comma
>> (like you nicely do everywhere else).
> 
> Fixed the blank. The reason is more clear if you look at the last
> commit in the series, at least for the EFI part. For the BIOS/PVH part
> is less clear, but the rationale is the same. The commit came from a
> larger series where BIOS/PVH is mainly written in C so there is more
> clear.

If there's need to do it _here_, that need wants spelling out in the
description.

>> Apart from this there's the question on the precise placement of
>> the calls - see respective comment on patch 2 (which I needed to
>> look at first to have an opinion here).
> 
> I think you removed too much context, not clear what code you are
> referring to, last hunk above is an "and" instruction.

This comment was on the patch as a whole, and I thought it was clear
that it would refer to the two calls to the new function. The details
of my concern there are, as said, in comments on patch 2.

Jan

