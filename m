Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BECEA93670
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 13:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958925.1351481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jlZ-0004AP-Ng; Fri, 18 Apr 2025 11:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958925.1351481; Fri, 18 Apr 2025 11:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jlZ-000485-Kf; Fri, 18 Apr 2025 11:20:17 +0000
Received: by outflank-mailman (input) for mailman id 958925;
 Fri, 18 Apr 2025 11:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNZq=XE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5jlY-00047y-R9
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 11:20:16 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a458e10-1c47-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 13:20:15 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so21287025e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 04:20:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5cf2easm18698005e9.31.2025.04.18.04.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 04:20:14 -0700 (PDT)
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
X-Inumbo-ID: 1a458e10-1c47-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744975215; x=1745580015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJj8Rfgi9EbV15zm3T8GaXom1YrGzd0C3xNCTSZPHuE=;
        b=Cp/YEC+B5xj7BU/4xrl80v4q9Lzs+tLUT4dbnocd8isBUzOZi15eUOmpQnpl3WMKof
         vw64DhTyFeGH8onqhjoY17003/GA8qSH2pfZQcLMNlPY4gmDZG0B0syQXfaPEPEGZjpz
         nk0DVtpxwoSd0roE3pZZ6YoeK042Xlkev1SBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975215; x=1745580015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJj8Rfgi9EbV15zm3T8GaXom1YrGzd0C3xNCTSZPHuE=;
        b=PrRIqbjXlwq6WtHx4HRt4pX7OJt4+PMr3UHUuaB3s9PobBuaThsxvB6GzglWaRTz3P
         fwCyufxxfR+zqFso4NGa6d+j6meP0B1V8ECL9gfn1hvy4YcNkFBTBCwF/xQ3nrsVSkbJ
         XhuRbT6Mg1dOYcjTPu1Twes9n/wHBjNoRIl1T07kUTdoyzDXgaZjdKAa+BBJAtYUcIp+
         Die4ZwPFXedHMBZBLIUHoXymYHswNWwki2Kx8PVNfPPS9KYTEmQk5NhksXvB3/bI4cQZ
         nf8fbRLmXIJzO0M8oByK1HJjL31eieTllKaZ2YsT5tgRo3aVAM1zshdoorjI7VFSr1K1
         bWyg==
X-Forwarded-Encrypted: i=1; AJvYcCUel9St7/OkTYzBI9+lbDtYvC46dpcgNd3m2nmTc357z9GqzFP6vOsL+Fk6lHaBdhpFjRFaBPdYi3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmI/iAqkNY7nRZU0uYwcX9BshpW+gxiajYK/P8BiAjZakf6kwa
	Rl9HfmdiJlWOeLzfYwivu470OzMNZgea7trZ9wPfb05qkGltgV07Bl50pdwhVyM=
X-Gm-Gg: ASbGncsHwMzkyy6V7AfV1yz0NrtjJFjorQ1NMfHI1WVFKIrexEcHhS5LhpX7MnXaRBz
	TaQ1QOlEXA0tnyowGsvkhRn2O0pT+8cAVrsixf18kjLuUKZU+SjN9+KMcN1aM/4LtsYw6swdkxR
	Y6Ut/9h0l5NwM88wdFPlSY097oER5kS04HapVANTv3pNg/9oVfMFl06D3wl3/ahk7bSu5ZLcz0W
	nkqawGrbl9/bt0JbxbfKjBf+qz5cy9Auok55TPhjWdb/XXf6A4YIu05k3Kth86NGJyWY4oWA2M0
	3/Nd65pyfA5BxH6+Krf5legSJdYas1g/lE+ngVgsvMsGKc94jxo6HYD3Qjz1zaepCT6j5/42wRP
	J0lYXWw==
X-Google-Smtp-Source: AGHT+IEH86lkzDB8iD2jcwBv9xObYazBn81tO8e62htfmOl2I85kmXIxDh76Itbbny1GahYRs6qSCQ==
X-Received: by 2002:a05:6000:184f:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39ef9466f36mr2679870f8f.24.1744975215276;
        Fri, 18 Apr 2025 04:20:15 -0700 (PDT)
Message-ID: <4fb6d880-3d5f-4d42-8419-dcc697949a10@citrix.com>
Date: Fri, 18 Apr 2025 12:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -tip v2 1/2] x86/boot: Remove semicolon from "rep"
 prefixes
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-video@atrey.karlin.mff.cuni.cz,
 xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Martin Mares <mj@ucw.cz>
References: <20250418071437.4144391-1-ubizjak@gmail.com>
 <50bf962c-2c9e-46a2-bbac-cba9cf229e79@citrix.com>
 <CAFULd4ZNiRdARn8O98zROQRWoL1ASQ+iPPTTmLRxjo9SGRHyRg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAFULd4ZNiRdARn8O98zROQRWoL1ASQ+iPPTTmLRxjo9SGRHyRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/04/2025 12:15 pm, Uros Bizjak wrote:
> On Fri, Apr 18, 2025 at 12:24 PM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>> On 18/04/2025 8:13 am, Uros Bizjak wrote:
>>> diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
>>> index f2e96905b3fe..0641c8c46aee 100644
>>> --- a/arch/x86/boot/video.c
>>> +++ b/arch/x86/boot/video.c
>>> @@ -292,7 +292,7 @@ static void restore_screen(void)
>>>                            "shrw %%cx ; "
>>>                            "jnc 1f ; "
>>>                            "stosw \n\t"
>>> -                          "1: rep;stosl ; "
>>> +                          "1: rep stosl ; "
>>>                            "popw %%es"
>> Doesn't this one still need a separator between STOSL and POPW ?
> ";" is a separator as well.

Yes, it is.  I've clearly not had enough coffee yet.  Sorry for the noise.

~Andrew

