Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E146B3EE22
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 20:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105345.1456253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut9fG-0006FQ-Vu; Mon, 01 Sep 2025 18:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105345.1456253; Mon, 01 Sep 2025 18:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut9fG-0006CG-T3; Mon, 01 Sep 2025 18:54:02 +0000
Received: by outflank-mailman (input) for mailman id 1105345;
 Mon, 01 Sep 2025 18:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut9fG-0006CA-1m
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 18:54:02 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05865fd3-8765-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 20:54:00 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so13531755e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 11:54:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf270fbd01sm16712581f8f.13.2025.09.01.11.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 11:53:59 -0700 (PDT)
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
X-Inumbo-ID: 05865fd3-8765-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756752840; x=1757357640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ouFIbD5mcmQxPlqhU+hFCwx0s9hFhtNs2O1nZiItwY0=;
        b=vD43XnZ4OUhymZRqiq4jhuaCVLWVCdViJTEenMVkrM5WOv08ZVZTfYRQeQYAHKr38j
         rVtFfwTJXa4rIabbcsu2Ek0mGFEGFFKAYVMe/cIR+kaO1Nic9CPU0U5RiL8vayJBwelu
         WrvKgXLktXDATeV2+KYQgSLra/TzJqwcldMKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756752840; x=1757357640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouFIbD5mcmQxPlqhU+hFCwx0s9hFhtNs2O1nZiItwY0=;
        b=YrHk65wdQCmVO0VnVhWAlTJ1lHXt0qJpc+WT/vDnIJhkAxL8mWlzuuT3+3OxFES0tc
         iqQJLGooyfjoc8umDB7ubBijZduDlSpc7IiXxJF1dRAOubvaQHxWchwB3XS1ObMslFqe
         xrZWvEOII8A0uZQNdqgXdmMdSYXnHbfgUJt1rvsZ5vKfo2NlU8dCxTa4Fr6ncuFk9BRw
         dHi4VYIfGJSw1UBLgXCXlLNwLkVzViR1DH+b92g/MZqWiZwBQGbPala4K8xDglWBCNZi
         oswuGRWhCZtvxkMdI3b+NUe0uw541YlSyCmzO1HgrcCy9jtlvbGzcMESrrTW5Jqcf+7t
         nW/g==
X-Forwarded-Encrypted: i=1; AJvYcCVLOLAvzfufDSokAYUJWz6hBG6lNAZk5LUtt7G1TKQ4YqCrlJ30+EiuDeOo9+5BfEZd4WecDvAqYCI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyvubc+8AKWn2puxNDkQIjxAMoiyOKpgAONwx10mRHXjM2YcsJt
	xUluSyiuyW1WzxWExyUyZ4T+mqoiKbe7Gl9fCjSehNyM5WB8y/eiYKmJwkM4FR9Aiu8=
X-Gm-Gg: ASbGncvOpFe8d4pFWPn4LSAHyIda87j/VvZ2aaEMTNfkVbmVIDVCdUGZOLSqT2VKhJ3
	aWLLdObkj9riPYwIkBItQCqpca0Sj6S8qH+Eznh09byof8xQU/6I0qXy0KGYq1fke1RU93lMq6Z
	sU9v+Okf2uTN0NKBc/h61nDe+sBpDxgdAJtzQCnRL/QR7Uz04YJFxlfkHxKkXAi96gr2ou2PpNq
	4v51Bp7S09oQ0MAekPyX4IWT/r48iOeCVIi/ocgONs9mDkJtBLuZRajnMIxUFhkFt4tf69wOij7
	nS5gkNWlsZnZeeD56LcXAlB5L0mNyNxO89q4b7kH3kSXM8IPS/rbnpdrgI1m74AP14VvIlqZCBF
	//ObVNIcP2QoP5OJC7N8uq1zs5pz/JRbEzuJVKe4GMPi4TT65kUhc1d54oY+06/tkZ5073+0yDN
	XSHD0=
X-Google-Smtp-Source: AGHT+IH6AagXuTt4W1eGSarw1rXBz3sqMlrmj5WO8yWJE1dF7Gwdumi22/tBzemnqJkQhRS4+a162Q==
X-Received: by 2002:a05:600c:35ca:b0:45b:8939:8b19 with SMTP id 5b1f17b1804b1-45b89398d7amr57002895e9.8.1756752839713;
        Mon, 01 Sep 2025 11:53:59 -0700 (PDT)
Message-ID: <935c5307-86c4-48ae-80da-a4454f28398d@citrix.com>
Date: Mon, 1 Sep 2025 19:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] x86/boot: Use RSTORSSP to establish SSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-8-andrew.cooper3@citrix.com>
 <9322056d-9f09-4f5b-801b-6f0fdad5ead9@suse.com>
 <18e139ce-36a5-4a0c-8a9c-440ef1c1e29f@citrix.com>
 <595a24ff-9eb8-40f3-9108-dca02e5a7a2c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <595a24ff-9eb8-40f3-9108-dca02e5a7a2c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/09/2025 4:41 pm, Jan Beulich wrote:
> On 01.09.2025 17:33, Andrew Cooper wrote:
>> On 01/09/2025 10:28 am, Jan Beulich wrote:
>>> On 28.08.2025 17:03, Andrew Cooper wrote:
>>>> @@ -908,7 +909,29 @@ static void __init noreturn reinit_bsp_stack(void)
>>>>      if ( cpu_has_xen_shstk )
>>>>      {
>>>>          wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
>>>> -        asm volatile ("setssbsy" ::: "memory");
>>>> +
>>>> +        /*
>>>> +         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
>>>> +         * therefore by the value in MSR_PL0_SSP.
>>> Beside not being overly relevant here afaict, is this last part of the sentence
>>> actually correct? Patch 06 doesn't write different values into the MSR.
>> It is correct, but also well hidden.
>>
>> #define MSR_FRED_SSP_SL0                    MSR_PL0_SSP
>>
>> I suppose I should should write MSR_PL0_SSP/MSR_FRED_SSP_SL0 here to
>> highlight the logically different names for the two modes.
> But the code following the comment doesn't access any MSR. That's what
> first tripped me up. It was only then that I wasn't able to spot the two
> different writes. Now that you point out the aliasing it becomes clear
> that until patch 14 it is simply impossible to find that other write.

I suppose the MSR value isn't relevant now that neither paths write the
value.  The first iteration had both writes here.

I guess I can drop that paragraph, and just have the second?

~Andrew

