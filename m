Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5557D75C2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 22:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623289.971018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvkZd-0002AT-2v; Wed, 25 Oct 2023 20:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623289.971018; Wed, 25 Oct 2023 20:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvkZc-000279-Vc; Wed, 25 Oct 2023 20:33:52 +0000
Received: by outflank-mailman (input) for mailman id 623289;
 Wed, 25 Oct 2023 20:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iZwN=GH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qvkZc-00026z-80
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 20:33:52 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cccb7085-7375-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 22:33:48 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-540105dea92so179393a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 13:33:48 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w12-20020aa7cb4c000000b0053e7809615esm10028874edt.80.2023.10.25.13.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 13:33:47 -0700 (PDT)
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
X-Inumbo-ID: cccb7085-7375-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698266027; x=1698870827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qqEwLbJ8TurjDqmUH7zFgZUfJwSWLZFMxrJ4HKi5tck=;
        b=ucXY0U3kKSDHEVWgLnRRw2HEvGoz1EAGelHO2XU5pnXP6tjyfohn2vEkWdBld2wOvK
         r9CgZ7m2L7dX0CLkKjdT4Heob2Dk/b6G4juWcKms7ZJOjOLobzFZgcesylACX0XHjwZ7
         hYipb1r1Z+DbcIUoK4xzao700HkCcxWeg27dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698266027; x=1698870827;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqEwLbJ8TurjDqmUH7zFgZUfJwSWLZFMxrJ4HKi5tck=;
        b=O9x/S42uhr6Nm+mpTbPbbTliFaLIupS8tHToWZxzuwGAV+ZLufwodY/IE9+65UvhXk
         ZzUdBB9HonF2c/dnDtTnKrW9hHPKlSI0EPH3nAP/r7zURmJe2FKx4S/rSUY8EXDyBGi+
         9jS1CSwKo8+CtvkD46hjMuC+mkojCm6oyr4zF0VCF3sI8xd2BQJQtqLCslzCm/cjtFrC
         bDxu/f/KNllmdiNn+Uu/l4EK3BVBao+ceC7gAGZ7dFH1r7mvOK0pnCBxEroGq1swc0X1
         Z5L4ZQoP1dmE4xYdnh3RV/vFlzhmXX6cUTJZ5IasgW+Zd8kPDrcOqAFUIwsb5xWJwyDX
         8IZQ==
X-Gm-Message-State: AOJu0Yy0gw2NqQPUbGxgE49OYq9QalUh36rVzPkiJcNzZa8oIY9pW+LB
	ndEZliP7y6/21Szwe/DdY35yhg==
X-Google-Smtp-Source: AGHT+IEt/R71+n+6E0sw68/YTnvmELLSfvgok73QF1dvC5GT+zjyHsYyk1Qu7c4QiloiRRfTHyEv3w==
X-Received: by 2002:a50:c251:0:b0:540:e588:8243 with SMTP id t17-20020a50c251000000b00540e5888243mr2139848edf.20.1698266027567;
        Wed, 25 Oct 2023 13:33:47 -0700 (PDT)
Message-ID: <596186ca-53cb-4ccf-b719-95a587018c38@citrix.com>
Date: Wed, 25 Oct 2023 21:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 01/22] x86/msr: MSR_PLATFORM_INFO shouldn't claim that
 turbo is programmable
Content-Language: en-GB
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <17a99e1da838a2edeeffa5a988e22c6fcb31406b.1698261255.git.edwin.torok@cloud.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <17a99e1da838a2edeeffa5a988e22c6fcb31406b.1698261255.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2023 8:29 pm, Edwin Török wrote:
> From: Edwin Török <edvin.torok@citrix.com>
>
> Xen forbids writes to the various turbo control MSRs, however MSR_PLATFORM_INFO claims that these MSRs are writable.
> Override MSR_PLATFORM_INFO bits to indicate lack of support.
>
> See Intel SDM Volume 4, 2.17.6 "MSRs Introduced in the Intel Xeon Scaslable Processor Family",
> which describes that MSR_PLATFORM_INFO.[28] = 1 implies that MSR_TURBO_RATIO_LIMIT is R/W,
> and similarly bit 29 for TDP control, and bit 30 for MSR_TEMPERATURE_TARGET.
>
> These bits were not all present on earlier processors, however where missing the bits were reserved,
> and when present they are always present in the same bits.
>
> (Curiously bit 31 that Xen uses is not documented anywhere in this manual but a separate one).
>
> Backport: 4.0+
>
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>

p->platform_info never has any bit other than cpuid_faulting set in it. 
We still don't even report the proper raw value, because we don't (yet)
have clean MSR derivation logic.

I'm confused as to how you managed to find these set.  Even back in Xen
4.13, PLATFORM_INFO was covered by the msr_policy (later merged into
cpu_policy).  Furthermore, even patch 3 oughtn't to have such an effect.

Sadly, the whole of this MSR is model specific.  Vol4 2.17 is only for
one SKX/CLX/ICX/SPR.  Technically its wrong to treat the cpuid_faulting
in the way we do, but it is enumerated separately, and we intentionally
don't have an Intel check because we need to emulate CPUID faulting on
AMD hardware to make PVShim work.

~Andrew

