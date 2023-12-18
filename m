Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1239A816A83
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655763.1023522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAVy-0007mL-BG; Mon, 18 Dec 2023 10:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655763.1023522; Mon, 18 Dec 2023 10:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAVy-0007j0-8e; Mon, 18 Dec 2023 10:06:22 +0000
Received: by outflank-mailman (input) for mailman id 655763;
 Mon, 18 Dec 2023 10:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFAVw-0007is-Uw
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:06:20 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16a514a1-9d8d-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:06:19 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336417c565eso2539776f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:06:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t13-20020a5d6a4d000000b0033651e6a74dsm8666264wrw.27.2023.12.18.02.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 02:06:18 -0800 (PST)
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
X-Inumbo-ID: 16a514a1-9d8d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702893979; x=1703498779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKwQ3k72rxhe/ksMxkMfX6FAU9m4gB/GR3kZ7/hmvP4=;
        b=S4/vKoNKjYfymlt6OAYVR6o9x+iYV8ogFiKWCqpKbdtg6Hf7xryDa+tDv1a57PM82W
         bnNqBtiXv2LiSGnGifC7by/q3oFcbChq/+IAA4tMqDAzPPA6a7caBgpS99tFaynoeOky
         zJ8pNGrREw50x2lUEIitRKVowD3ZbsbS0eOkf4JNrWNLoy3BjvSGkdijQ1DlIw9Fx+DP
         eP//lAQQRFa6XAiLMaUrPaYv/lBWUf99kOVFKgqxaWJbStcX4oE4eqeoMwBFTaUfr2KQ
         TLvNmgNHhpz03oS+ZSPPoo8rnhrWuz57rHQK0nJG7vD95qOU8FUNROUGK8kPCeXlntbJ
         abrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893979; x=1703498779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKwQ3k72rxhe/ksMxkMfX6FAU9m4gB/GR3kZ7/hmvP4=;
        b=hqVkBre1klelisdEPgTpojL867wg7reBbnWS5QLNAPZzI9liaNsFy1eh0/QLLGNJPZ
         J4/J01J9QWCs2nKhCW+bgj1lrvrC1pViPqswe+mFLAgn9sPcQc6PXhgQT5dXWkaowvl7
         eJ8BivyAYZ3B+R8Eq4NExPPY/7z4TJjT0bQnDENN0o8Mtg0g43T5w/ysfEg61tMdpnRc
         RFvCfedwW4T9FEN/PrhHsAyF8VnTbC/qwKssHdezBY2ylZWNUOGQY89Hn8S5feQqYdtS
         JjMsRxfVJSQUg6U8lSjul375JpUD96rL6dhNXpD0PCe9yKfp3ng11lF/y+e/rV3VlwB2
         k03g==
X-Gm-Message-State: AOJu0Yy/2XAABihGSV4RkAzlbWOEurU+JCe7jEdVN81xAIQawNdLR5K7
	xEhfYB3mUOV29ARGjzBL+oQQ
X-Google-Smtp-Source: AGHT+IEAf2pQpnkobchMHmrmB/wyqgwoCVsARSmy5VZ4UyHXs8ZJR7sUurbtzPNP57au0aaXrmmusQ==
X-Received: by 2002:a5d:4587:0:b0:336:5674:13a7 with SMTP id p7-20020a5d4587000000b00336567413a7mr1621891wrq.207.1702893978736;
        Mon, 18 Dec 2023 02:06:18 -0800 (PST)
Message-ID: <093f1893-c675-4cde-b762-081c70c5d436@suse.com>
Date: Mon, 18 Dec 2023 11:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/39] xen/riscv: introduce bit operations
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <20732007fb103115c0e01cefea7d113b8a7ad8e9.1700761381.git.oleksii.kurochko@gmail.com>
 <ab8479db-b9f0-43b2-a751-349c7a59287d@suse.com>
 <5d9896c04a906c7ee379d6788e4c854e90cef363.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <5d9896c04a906c7ee379d6788e4c854e90cef363.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2023 10:56, Oleksii wrote:
> On Thu, 2023-12-14 at 14:27 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Did you write this code from scratch? If not, you need to at least
>> point
>> out the origin. But: None of this looks RISC-V specific, so shouldn't
>> it
>> instead be put under xen/lib/, as a fallback implementation for arch-
>> es
>> not having optimized implementations? Looks also at least very
>> similar
>> to Arm64's, so that one perhaps then will want dropping as well? We
>> surely don't want to carry two (almost) identical copies of the same
>> logic.
> No, I took the code from Arm because as you mentioned it doesn't have
> RISC-V specific things.
> 
> I think we can move it to xen/lib. Would it be better to as part of
> this patch series?

Doesn't matter much whether it's separate or part of this series, I'd say.

Jan

