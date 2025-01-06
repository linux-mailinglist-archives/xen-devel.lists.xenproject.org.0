Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC41A0293B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 16:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865800.1277078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUoul-0005rt-GY; Mon, 06 Jan 2025 15:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865800.1277078; Mon, 06 Jan 2025 15:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUoul-0005pE-Dj; Mon, 06 Jan 2025 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 865800;
 Mon, 06 Jan 2025 15:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUouj-0005p8-Dv
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 15:21:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da78fa6a-cc41-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 16:21:08 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4368a293339so112177325e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 07:21:08 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4d7sm570158885e9.34.2025.01.06.07.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 07:21:07 -0800 (PST)
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
X-Inumbo-ID: da78fa6a-cc41-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736176868; x=1736781668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EH1shQVRc07v2WniIk/ZX+xJdmK7Hf6LR7Uk8d7Kc7U=;
        b=FVe8JomsESXUcA4Oa9/EtLO3vd6hS3Gh94HlN8hMsBAmT8MiZM8Vovd9Y2y4seRdGa
         lPGMlOFxP37OxnnUifIlaT3UYmHvrnnqvid8nOaK/twnD2YcsBa9WvP2Nn4yW+O87aFG
         BlylrfEtNM2B2u/KBayuzjfyLpTgYb5wzVk3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736176868; x=1736781668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EH1shQVRc07v2WniIk/ZX+xJdmK7Hf6LR7Uk8d7Kc7U=;
        b=dI32cKTvHiQYc7FXmWijYALx5rg4ml0TcrD3nq+JVSh1QRsBhjfloiiIGOAGvhszU2
         zkx/UZP8wa3uh+nSXCGWrnSPPj5NcEojzlL7011MehCHhVI/lXYpBAdaQ6CTGPjh2AC+
         OTrj1MVWq9IQhyi2TXDklHDXMT6EPoefBF8QbmgcQpxzZdzQkEnpkrpKnu+guujACAcp
         X0UNCRGnEpwMlRSIFSAcYQ84h5RKtuUwF6iO2xNGo1AT1wmhuyeS3yl+UAVbFtTIgvM0
         l7gEpzNkkr0q3rB6NlsA6ovzyKSYxwCosxNUF+NPuJ3p6TQKER9rhJ0nXvlgpQuZXIWZ
         X2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV9ePRbo6GUoDhVergsY00tjxgTLtxCMUJaYdq31Lf5rFjcw0J4ftw7JJh3hjANawlr9MvXicS0jmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvU/IUyPRonBnhsmK5EXP5ibaYC/SBL6FjR4xwL29qtQyFhsrz
	JhFObYVatJnGVWVnJxz6hFHoFDyLzyApO+/PfPmADnD9JGinnwZC0wvvRWRZsvs=
X-Gm-Gg: ASbGnctB6ZgBtc3fpoIgXRG+vw7eh/d4jf8pFoyCScBYd2WLeUSBaG0++cCJteAjIgf
	CewT49d1T8j7s5HEPXyo3vD+STbFVIcolfuB7NY+MD51hMRTAuz5a9Kjt8RaYjrq1rxt6+l5z61
	TEuAzaAxLOAjcCzVJS0X1PkeQVyDu1Z97LOkFbtP/y9Td93GA3Gpb9G1kVxzfnSatiZt65Mu0al
	0lW6Zvt0YHq4TlWrGSeSJsI0/llfIH/MqWim6NBOP3Ips7/oVTG1D+Dwqk1wclBd02j66p3owbO
	cShVPAAU8eJwqNfOEdV8
X-Google-Smtp-Source: AGHT+IEWmmRpu+OwIoAHpSZXUorjqcEk2hSxGjFlqUe3wZe0T2C/XXKv3340bwqzejDpH4NcIj0Kbg==
X-Received: by 2002:a05:600c:4e4b:b0:434:fa61:fdfb with SMTP id 5b1f17b1804b1-4368d6941femr393044025e9.18.1736176867787;
        Mon, 06 Jan 2025 07:21:07 -0800 (PST)
Message-ID: <0c9fbbc9-7276-4ffb-8f48-521ba68d1508@citrix.com>
Date: Mon, 6 Jan 2025 15:21:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/amd: Misc setup for Fam1Ah processors
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106141929.615831-1-andrew.cooper3@citrix.com>
 <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
 <b9e16f7f-9af5-4faf-b4f2-88913cb35910@citrix.com>
 <1a64a0a8-1f03-439c-8979-37315e147f2f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1a64a0a8-1f03-439c-8979-37315e147f2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/01/2025 3:17 pm, Jan Beulich wrote:
> On 06.01.2025 16:12, Andrew Cooper wrote:
>> On 06/01/2025 2:41 pm, Jan Beulich wrote:
>>> On 06.01.2025 15:19, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/cpu/microcode/amd.c
>>>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>>>> @@ -114,6 +114,7 @@ static bool verify_patch_size(uint32_t patch_size)
>>>>  #define F16H_MPB_MAX_SIZE 3458
>>>>  #define F17H_MPB_MAX_SIZE 3200
>>>>  #define F19H_MPB_MAX_SIZE 5568
>>>> +#define F1AH_MPB_MAX_SIZE 14368
>>> Yet another pretty odd number. Are these actually documented anywhere?
>> In the PPRs.
> So to find the number to use it's really ...
>
>>> And what has come of their plan to make ucode size available via CPUID
>>> (for which I even sent a patch quite a long while ago)?
>> This check in this function need to work for any microcode we find in
>> the container.  Knowing the size of the current CPU doesn't help parsing
>> others.
>>
>> And talking of, I've just found another Fam1Ah processor with an even
>> larger patch size.  This limit needs bumping to 15296.
> ... digging through the PPRs (and hoping no later model will have yet
> larger size).

Correct.  I'd prefer a better approach, but alas.

~Andrew

