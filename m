Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C89B07903
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045323.1415425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3gi-0003MZ-1x; Wed, 16 Jul 2025 15:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045323.1415425; Wed, 16 Jul 2025 15:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3gh-0003Ki-UJ; Wed, 16 Jul 2025 15:04:51 +0000
Received: by outflank-mailman (input) for mailman id 1045323;
 Wed, 16 Jul 2025 15:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc3gg-0003KQ-CC
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:04:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3760715a-6256-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 17:04:48 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so25747065e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:04:48 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b6039bdea0sm9241348f8f.65.2025.07.16.08.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:04:47 -0700 (PDT)
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
X-Inumbo-ID: 3760715a-6256-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752678288; x=1753283088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ByoOYBWePNES8ej870foVh0ALIQNrYqjiT/VOt5y6Fk=;
        b=cJ7uErPm6Z/0V9Kz1yjT6SV3r0kG9vzWjEhufTr6NwPdSJSM4qJVVhAio5bnab9uIT
         WoDe6UNMbDcjB3uSPQJrWjuii18hC66mQvo3pCuV9q/rJhlT2wrbr5sUpAJZL+c4Gpiw
         Gkdy5wbNtMVqpMkrkSDsOkPM/RW2AbEKNonvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678288; x=1753283088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByoOYBWePNES8ej870foVh0ALIQNrYqjiT/VOt5y6Fk=;
        b=XC4rayrxXqbvQKWw2TzvBoIksHq+3+IyXyVydK0m3X2DD5mh6TjZhikP/WrpW2jCvX
         28IK1m2e/E6pOhFzrUHart0z96AakiLM9TknDUiAD3/2dTM7FItwUJuocrGP2UA+oj0f
         Ur4jVmTWmFhoA+W4HQmB28jQyj6EFfwD0v9ZECnA7hNju6Q5gleUMNkzBGHNhNafSWNa
         2X7mg9uEbFnL1LBHIVHmjDNc2huGyrNH8b23f3aQeqGv4dwg3opCZqSDFdAUyQcDpC99
         VSD/ePlgxheE8Se9yHL27T7rTXFRRnobPaQVMiCwjBIlrAR7p3c89/5yiUEisxtaAMYu
         WHhg==
X-Forwarded-Encrypted: i=1; AJvYcCXoqFNl2yIIRrzWmdhbsrKX6WfnXYHy5YZggUH2lzQBQCXR30hBLjiR3HfzyHHkRBp3/tKVSavt5tw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkG2PsrU9RqaO7aAvxbY4X4xLjpRQHrntFrrofmuMDtmfi5kcN
	7Ioqm3pM/bbiK/eUwt7gIEuRC92p4MJiXi2nYn2OliEZ7R36nuP1xNEncXmPvVhgyDo=
X-Gm-Gg: ASbGncvFDtKfE7NQLavUFZMp68vQ5LgS6ghimLNOh1vsKUiq/ts8AQ0+6xgefeExWB5
	I01bYcR84tLPiKAi8ms2G7xu1t38Ut5MQ5jCXxvlcjWWi2BQlMkNZjC7dDfCX/jihkARYZJOUJK
	8fGoYtLDiVM9Jf81H/NlrhgMH52t5lO9clKhBgHhg12CcVT1kD2R/ZfNR3VZunWPenZ0NxwCgN9
	RqvuwHYkDEL5XpQd2Gg/FTt7drajY2rCgyZmN5m4GUpygD+ncmi3UT0qtyxLm74eT3JCs5qlXPB
	mM+r8T2sOrD5YY4dOcXOJXSvzGGK7Q3Pp1cbsDfpR+2zSC2+TEwydRimuNxpJU4MTIgngfAQS1N
	VpSJG1dc4u+L0iC0aUD+UZvqFDi84cI1KtDnMoeEnrOmX9NfIrB0dBYuB8cdVQ1F5B81h
X-Google-Smtp-Source: AGHT+IGt8hmNtt24PDiaahHRYqlosEmN2D5frSfYWCyP+ghOaup1cIFEumDZRuvUpfV1G6JSFrpBaA==
X-Received: by 2002:a05:600c:4ecf:b0:456:1d4e:c161 with SMTP id 5b1f17b1804b1-4562dfd7de7mr42692875e9.2.1752678287857;
        Wed, 16 Jul 2025 08:04:47 -0700 (PDT)
Message-ID: <ac7ab6a4-0fdf-4164-94c8-dff4d53a66cf@citrix.com>
Date: Wed, 16 Jul 2025 16:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/MCE: adjust x86_mc_get_cpu_info()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
 <53bb631d-134c-4670-8bc2-aa5b5c4b558a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <53bb631d-134c-4670-8bc2-aa5b5c4b558a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2024 12:53 pm, Jan Beulich wrote:
> Move logic independent of c->apicid's initialization status out of
> the if/else, leveraging that cpu_data[] now doesn't start out zero-
> initialized. Constify c and have it have an initializer.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

