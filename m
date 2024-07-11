Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF3B92E8C1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757453.1166379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtT3-0008Rj-3F; Thu, 11 Jul 2024 13:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757453.1166379; Thu, 11 Jul 2024 13:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtT3-0008PW-0a; Thu, 11 Jul 2024 13:04:13 +0000
Received: by outflank-mailman (input) for mailman id 757453;
 Thu, 11 Jul 2024 13:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRtT0-0008PQ-Mx
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:04:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f409088-3f86-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 15:04:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so1047209a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 06:04:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e13sm3398292a12.67.2024.07.11.06.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 06:04:07 -0700 (PDT)
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
X-Inumbo-ID: 0f409088-3f86-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720703048; x=1721307848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=33akNImJ0SeO1Gggp+2U/woHCclDuH48D6lMXzKYncQ=;
        b=Yrcb3kcFZ7uGhcNywVA50aQZQ+aR6LYTYtxqfJu/chnxqPKAmP50Tom3qrU4efXUoy
         nKV/SeI3wNu/k2P52DxiN5X4DUFPIbknoZD4HwYuNSPJ/jvhMtRzzW+pNFoH5feIF69m
         rGXD1d81I8o0fL5gbhL7B9NP15jCxdd+ggdiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720703048; x=1721307848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33akNImJ0SeO1Gggp+2U/woHCclDuH48D6lMXzKYncQ=;
        b=CZpw4uTL3JIxl2ZgOzO8a9BkCLZkUnnmh0iRtlVN/qW6kqxP3nDeAoDvWMakOhROyw
         Fzyak2PynQFMZHaPIVcYypmqFc5ODJ+4Fg1jvx/NuaEGsJ+cfUYBuGNzy3AYk8e+AIXk
         tuYtrOJUGdinMICKWb5d0SSzyFO5bH07QEb6eR0lA7CuAf8BbldTMd5nlqBhxc3CaRw1
         rDZtp4zMq31dKN+48WeRi3xJxhzaofYKi3b6RntECduOd6xNddYfjQUQ/Gcz4EXHilEH
         baPtug6J6fZiMFNPxnjO/9vq4f9Eya9NQgYDX757Fxf6jAWRHOEC7Irza6vmw5exnz/6
         WVdg==
X-Gm-Message-State: AOJu0YxIhA1y4OsWcvDSdv2uQFMgn+3SyXTfQVSDnDfbf1nvb/uYNk7I
	T2seS4FvB5jHhY6gK/B29XeS5exLhiwgOLgTUmLPES0QCiXPY5IPQMq3rfhoexc=
X-Google-Smtp-Source: AGHT+IEHd2hDLJmchdTOuhirEeriRB0uilU6wkoOwmSUM6vQ4d4EFuntpWn44WW3oBhG6lRsSiJeEw==
X-Received: by 2002:a05:6402:1ed6:b0:57d:4fd8:db59 with SMTP id 4fb4d7f45d1cf-594b7e7ce0bmr8256288a12.0.1720703048132;
        Thu, 11 Jul 2024 06:04:08 -0700 (PDT)
Message-ID: <24c09811-71ae-44e9-89d4-cec2c0f5a210@citrix.com>
Date: Thu, 11 Jul 2024 14:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
 <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
 <f0bdd5ca-3f85-4998-9476-18e768352bec@citrix.com>
 <71164270.2157213.1720700315521.JavaMail.zimbra@inria.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <71164270.2157213.1720700315521.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 1:18 pm, Fonyuy-Asheri Caleb wrote:
>>> Please do you mind giving me more insight on the logic currently implemented
>>> and maybe what is wrong with it? It will be important for me since what I'm
>>> doing is research work.
>> See 9e6dbbe8bf40^..267122a24c49
> What reference is this please?

It's a git commit-range. You want:

$ git log 9e6dbbe8bf40^..267122a24c49

to view them.

>
>>> How do the values evc->size and xfeature_mask relate to the source and target
>>> processor xstates (or xstate management)?
>> The lower bounds check is for normal reasons, while the upper bounds
>> check is a sanity "does this image appear to have more states active
>> than the current system".
>>
>> The upper bound is bogus, because "what this VM has" has no true
>> relationship to "what Xen decided to turn on by default at boot".
> I see. My initial question about this was more of understanding how this information
> is gathered. Is it directly related to the CPUID of the VM or does depend on the state
> of the VM at the moment of migrating it? 
>
> If it is related to the CPUID, how is it constructed? 

The size of the xsave area is a function of the *current* value in
%xcr0.  (On Haswell.  Lets ignore MSR_XSS on newer systems for now.)

However, because guests can modify %xcr0 and turn states back off, Xen
has to track xcr0_accum which is all bits we've ever seen the guest turn on.

CPUID (and in particular, the guest's CPU policy data) controls which
states the guest is permitted to activate, which in turn influences the
size.

Xen's normal CPUID handling logic *should* make it impossible for a
guest to see features which hardware isn't capable of, and should block
migration to a system which is less capable too.

I suspect what's going on here is that the destination has one or more
of AVX|SSE|x87 disabled somehow, and this check is failing before the
more coherent one which should explain why the VM can't migrate in...


>
>>>> To start with, which version (or versions?) of Xen, and what hardware?
>>> Xen version 4.18.3-pre
>> As you're not on a specific tag, exact changeset?
> I am on the stable-4.18 tag.

That's a branch which moves, not a tag.

What does `git show` say?  Just need the first few lines.

~Andrew

