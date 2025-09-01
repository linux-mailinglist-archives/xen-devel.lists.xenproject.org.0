Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4680B3EAA8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105082.1456052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6XN-0004ez-01; Mon, 01 Sep 2025 15:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105082.1456052; Mon, 01 Sep 2025 15:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6XM-0004bx-TB; Mon, 01 Sep 2025 15:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1105082;
 Mon, 01 Sep 2025 15:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut6XL-0004bp-26
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:33:39 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07a39ec5-8749-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 17:33:38 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3d87cea889dso422616f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:33:38 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33add7f2sm16754817f8f.32.2025.09.01.08.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:33:37 -0700 (PDT)
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
X-Inumbo-ID: 07a39ec5-8749-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756740817; x=1757345617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zx2QQAvvVcXJNlgzbTF7FYeXSqopqU3LUDHZrsk1Pcg=;
        b=D8pWEnwCAuR2bdfTJC7AmQ4Yh97i6q9RYuCJVYM3RHlyCREKBDBvUPDkT084IRfn9r
         uVFV/k8FghakBtGXkqx+FgAEnboI1YGfU1lva12IBYhmW0500B94JGEZltmRxrk7UqvN
         TqzP/4NT0Yr6kFnAssvo6Nu2OL0aI4iqG5p9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740817; x=1757345617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx2QQAvvVcXJNlgzbTF7FYeXSqopqU3LUDHZrsk1Pcg=;
        b=kSeYX4J/ZLpIX2fyyLvfR282Jx1809XaY0gPBIJTY5RGs7Q2jNbskbCi4KwjJ45JTu
         4/Cfldnqh/OUixQPmj99HKAOfr+G4eAI7eeadA1+cf3T5A6lM7wt3zfoSgGjYsoN5EZ/
         kA6xCO1gNLEzYeQTSNsjaOF5HDEyHL8zAwZAwI1DuEtPdt/rkzD661ErWyxZ0lYbmcBr
         qeSe5tIn8XxJuSINJY77L3WmYA9xov66JC8eFUtJI/v6jPLc1bSNLYw01BqTi3ON9U79
         wDCP/hdaLzHwsKSvkYcRQT+NL56dx6+/bIEAL7xB/VFjKb9cY08ZL0nClWux5YfalRpc
         xvrw==
X-Forwarded-Encrypted: i=1; AJvYcCVHs8LqB7woLnIXkwJ95YSQN/47pzat3vid+uHEODTj4XO28HfHGwJ1Pb5/u7TegntrkeddW9EWy0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7Ltby616X5lt3oSNqeSq8v3fVmefQ2K9ZIRTNnR7MfJs0YrB+
	kv9MaWuXMGVv8OG5dfI+shsK9+wAtorFZ150odjnXOqMe2ImSYcqqNa9a67yfWFeg5U=
X-Gm-Gg: ASbGncu3lPrAH7lMxhm642Oqa1Mksve1JjGy5XLbuaB+/hwdp3H0j9PeEsZf0QR2Eae
	Hc+gAohZWbl032dVl+BDo5kCvc3sjFvwfo6mnnAWI4t17h4oAhsOYArULc+TbCYq1R+zmngUCgX
	FuExBU4BFr8K4vveRVT920IeecfwwOeRzEBv6RpT7GR8IBNpuwRoHJCD2U1wZ8mqtU0W++MZ8Vv
	ESfFd7rImDdSVgCZEnEyjBQ48HQ2Yy16WR09UrIDkPDJp+6uWwspvkjKkJ6tGLmSyXWmkyTVL1u
	kfqALpEkmEp3S6T21QqskzEBgk1Wftw/xPI114PyaLDQtFKwJS5yG/zoSPjQilK1eabmLzriKjq
	+el1ngHd6hNAU1EzHM9dOUY1EhVd9GJyC77Q8Yar92jOYfH9iBuKgzyYe5Xw2kblA4nBD005sIF
	ssR1E=
X-Google-Smtp-Source: AGHT+IGOs+VZ+3Xdy9SE4ld36dNFPa9ZUwIp26qwrn9Ax5EVfBBoSD4ayc5003AnRO6SyvNX0MJVQg==
X-Received: by 2002:a05:6000:400d:b0:3d7:7def:8437 with SMTP id ffacd0b85a97d-3d77def8d1bmr2277215f8f.38.1756740817398;
        Mon, 01 Sep 2025 08:33:37 -0700 (PDT)
Message-ID: <18e139ce-36a5-4a0c-8a9c-440ef1c1e29f@citrix.com>
Date: Mon, 1 Sep 2025 16:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] x86/boot: Use RSTORSSP to establish SSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-8-andrew.cooper3@citrix.com>
 <9322056d-9f09-4f5b-801b-6f0fdad5ead9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9322056d-9f09-4f5b-801b-6f0fdad5ead9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/09/2025 10:28 am, Jan Beulich wrote:
> On 28.08.2025 17:03, Andrew Cooper wrote:
>> @@ -908,7 +909,29 @@ static void __init noreturn reinit_bsp_stack(void)
>>      if ( cpu_has_xen_shstk )
>>      {
>>          wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
>> -        asm volatile ("setssbsy" ::: "memory");
>> +
>> +        /*
>> +         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
>> +         * therefore by the value in MSR_PL0_SSP.
> Beside not being overly relevant here afaict, is this last part of the sentence
> actually correct? Patch 06 doesn't write different values into the MSR.

It is correct, but also well hidden.

#define MSR_FRED_SSP_SL0                    MSR_PL0_SSP

I suppose I should should write MSR_PL0_SSP/MSR_FRED_SSP_SL0 here to
highlight the logically different names for the two modes.

~Andrew

