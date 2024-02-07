Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C384D5BF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 23:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677903.1054820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXqHy-00076V-SX; Wed, 07 Feb 2024 22:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677903.1054820; Wed, 07 Feb 2024 22:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXqHy-00073r-PY; Wed, 07 Feb 2024 22:21:06 +0000
Received: by outflank-mailman (input) for mailman id 677903;
 Wed, 07 Feb 2024 22:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Cu=JQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXqHx-00073l-FH
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 22:21:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e20d5e8-c607-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 23:21:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a38291dbe65so134643766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 14:21:03 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h1-20020a1709063c0100b00a372b38380csm1229755ejg.13.2024.02.07.14.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 14:21:02 -0800 (PST)
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
X-Inumbo-ID: 2e20d5e8-c607-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707344463; x=1707949263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFdvdwPMjxP3oO7k0VUfwIFCu1vTihzkXLXv0Jg6QKc=;
        b=DHKeOYMiXRl/Ae/EvtsNFn1ewAxY6djZDQR4TdgVP43G1FPgIL5ugckIoMBduvU7S3
         AzTmrirga2zXjNCCWkGGtks3fLvSiPmPk4JTYfTEY8FjcOP7hUiv9zufdj0vwU6ymHkW
         u36fmu8CoRZLWZ3J7Ui+RbSP/FNv0X2sdEa2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707344463; x=1707949263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFdvdwPMjxP3oO7k0VUfwIFCu1vTihzkXLXv0Jg6QKc=;
        b=RIil/MR1kSPxBYDGmsvczBcngymrySsqI/BHQkbcMNnS8jLSbWKfm1lk0JJQu7TPvT
         8y1JqVAtsyj+fynQRUC8TIp+1ZgujRsV0Uv+0Ua+TMOxoAYZ8NRzDeY4tRGApba5B2HI
         Bwgrl7pA4F6VrT2qcBh3HhcmKuYUZdpUcKvi54ybLRC5yW9Tk1vZneH6j3WAaOFJC4J5
         w0it/ob820nVml/9lA60D38oIw2zPoapkyL/Wnkt9oA9R1wC0yV8tqFetpVYUbLm7aAR
         MsnMVsv/YXqdjDXria0gWklYYYH9D0VTdXzwcFRo7Ne9lnB3/eHLPlWvUe1uMJ5Z03nV
         DhYA==
X-Gm-Message-State: AOJu0YzuRHu3ofLPSvwwcMER2aHlcilVEEdP7Bc6KtZ2UaQFXtunvFvR
	v4odt34iPMQZyFZ34a4cVtSuw7YzF/HpJTem3IOBTRDc+DMowYR8DPetz2KRTPc=
X-Google-Smtp-Source: AGHT+IHN+UsHQfZD4D6AqtFB41/tALY1kKBZyOTuNlPYsV/sbqssHK17Tkm40a9joCpIr9CFfNEevQ==
X-Received: by 2002:a17:906:5a49:b0:a37:78f1:1302 with SMTP id my9-20020a1709065a4900b00a3778f11302mr4792880ejc.70.1707344463233;
        Wed, 07 Feb 2024 14:21:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBXRFM0Eu8TNQm1BN3fk6gg5i4CXf+rWwbd+6U2wjI+dBDpHmdWkqeoUxbTq8GmpUnZOejFmUXqmGyyOHYjup3tPpgUYB1YjyCqOZBJlw+5oLCsU3KqJNOjeFNnQfImnLZnibzTNGrdOm/zCm/IxluOs5fwgRa6NXC4f/f0NNdD8GLCqbZBGv0WfE4VPGUTDt2kmdlh94WQB6dpuee2cjTAETaI7tMuifJYfohQt0KyJnQDG0JPHzMh+YINJwcYJWdI4Hf0OkpgTpP9+ViHxfA7+jNykFLKVx0yWk=
Message-ID: <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com>
Date: Wed, 7 Feb 2024 22:21:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor
 ap2m->default_access
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/02/2024 1:18 am, George Dunlap wrote:
> On Tue, Feb 6, 2024 at 6:08 PM Petr Beneš <w1benny@gmail.com> wrote:
>> From: Petr Beneš <w1benny@gmail.com>
>>
>> This patch addresses a behavior discrepancy in the handling of altp2m views,
>> where upon the creation and subsequent EPT violation, the page access
>> permissions were incorrectly inherited from the hostp2m instead of respecting
>> the altp2m default_access.
>>
>> Previously, when a new altp2m view was established with restrictive
>> default_access permissions and activated via xc_altp2m_switch_to_view(),
>> it failed to trigger an event on the first access violation.  This behavior
>> diverged from the intended mechanism, where the altp2m's default_access
>> should dictate the initial permissions, ensuring proper event triggering on
>> access violations.
>>
>> The correction involves modifying the handling mechanism to respect the
>> altp2m view's default_access upon its activation, eliminating the need for
>> setting memory access permissions for the entire altp2m range (e.g. within
>> xen-access.c).  This change not only aligns the behavior with the expected
>> access control logic but also results in a significant performance improvement
>> by reducing the overhead associated with setting memory access permissions
>> across the altp2m range.
>>
>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Thanks Petr, this looks like a great change.
>
> Two things:
>
> - Probably worth adjusting the comment at the top of
> p2m_altp2m_get_or_propagate to mention that you use the altp2m
> default_access when propagating from the host p2m
>
> - This represents a change in behavior, so probably at least worth a
> mention in CHANGELOG.md?

This is a bugfix to an tech preview feature.  It's not remotely close to
CHANGELOG material.

Tangent.  SUPPORT.md says tech preview on ARM, despite there being no
support in the slightest.  Patches were posted and never taken.

> Tamas, I guess this is OK from an interface compatibility point of
> view?  In theory it should always have been behaving this way.

Given the already-provided Ack, I expect that has been considered and
deemed ok.

~Andrew

