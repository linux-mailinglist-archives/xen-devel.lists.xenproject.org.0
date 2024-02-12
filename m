Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB9850F40
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679362.1056788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSEz-0006LY-Tj; Mon, 12 Feb 2024 09:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679362.1056788; Mon, 12 Feb 2024 09:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSEz-0006JV-Qk; Mon, 12 Feb 2024 09:04:41 +0000
Received: by outflank-mailman (input) for mailman id 679362;
 Mon, 12 Feb 2024 09:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZSEy-0006JP-Kp
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:04:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe02ff5-c985-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 10:04:38 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so2163997f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:04:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bp9-20020a5d5a89000000b0033b4796641asm6227691wrb.22.2024.02.12.01.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 01:04:37 -0800 (PST)
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
X-Inumbo-ID: bfe02ff5-c985-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707728678; x=1708333478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3mCtQgf9bplc7MhJ5AYousP7UL1yZNDiGkHf1pEsFQ=;
        b=Oa6JA38J2e33S3kljNE16DzDvhzuczdc8YsIrpfLPxVhfFPopEd/9TXFDKQOHilLyI
         uDOPLg8Rn+ux+mgjehuandQYi4cY/b/M8xL4pBYatN5E4ldBrsOF/MGci1Pk/Q2wTTun
         MRd1mk7qU0l9GHo3pJT8xwbatBNibDuN/ydjU8YMEUNRV7jxoIABjQmzzEuUCwKnV7fN
         D537eW8qtjU43iVJ3L0kkeEEqWYKPxszqw+AEPPItGa889wanjDEVNznK6lsuGcJn4+Z
         4J23G7tDaiPBfygZU6FD/tU94LuTRHGQRonpzIDui9mY8TwoncA7+gwViFq7i0Tsopet
         FmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707728678; x=1708333478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3mCtQgf9bplc7MhJ5AYousP7UL1yZNDiGkHf1pEsFQ=;
        b=GUKbUTIScAdY/Ni9h2Bf/1GSsM5DUQ0TjTP5/1mWzY6TkUr06xafSkdMGTrfkbO9h5
         283DCKMh7ZZKyS15fZQwLwEltNAhWC2Ha7lk1yL08iVpyJTS2mf/SCj4rvPPqBy2PbRn
         wByyQpAHX+0o9FciiBPdJrbphe8tnHm0z410rrBLoUcnKTkuENNYG3/ohGkap24xl1Rd
         MaCnC/SHbbwTN5fu6PU7F+s3pQUgzOF3uQ9JRcdg5SGCy36NU0Ut47T2senqQgdA0DOX
         GVF1M4GZln78xbf4cFtqRzlFTLaQ47pNTCTuxe4F+GfwU9CDLNdeRv9NdDCjRSftM46s
         M7UA==
X-Gm-Message-State: AOJu0Yzcrko82VBtxywRAL93f8D6Wn8FdCOkFgxyaT5y5AYfujK659Tm
	iFmel4OxqLO7Ptfb+FQNtGnqRTaExbc8wo4raX/+RWuPHNs6hLfJJb9X+xhy6g==
X-Google-Smtp-Source: AGHT+IHtNGPldtkREn0sSMd9qikx3orZ5nEqCaEq3vWfLsWawau+rPH88zLz6eiwaAsOpWNWSfqfiQ==
X-Received: by 2002:a5d:4808:0:b0:33b:4382:c4b with SMTP id l8-20020a5d4808000000b0033b43820c4bmr4157355wrq.63.1707728677743;
        Mon, 12 Feb 2024 01:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnpvoVW4d/Z6a0IYJ5thZwsRQAoK7y/B7chg8/wTEZag+/uqqhNVBU7yfOx2Fl60CZn4xE/YlJ6uLAbkuPnE4ZAOACQmQ8/RPYuVmAbo9c8VzXfMtwoEPqUdlwl1E1Zrt+15sSEK9qy2IhnL/tiLcHKNYvyPWcV3NY9AUEq2LfF0hGiZqObcSf/3o08HGIt9wY3o0mCK5dvSp2hwJhaeeAP+ujD/spoeYe35+u5A==
Message-ID: <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>
Date: Mon, 12 Feb 2024 10:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
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
In-Reply-To: <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 23:00, Julien Grall wrote:
> On 05/02/2024 13:27, Jan Beulich wrote:
>> In preparation of dropping the register parameters from
>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
>> register state needs making available another way for the few key
>> handlers which need it. Fake IRQ-like state.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
>> other console poll functions we have, and it's unclear whether that's
>> actually generally correct.
> 
> Is it? Looking at ns16550_poll() we would pass guest_user_regs() if 
> run_in_exception() doesn't exist. But looking at the caller, no-on seems 
> to care about the 'regs'. So is this just a latent bug?

What do you mean by "doesn't exist"? ns16550_poll() assumes it exists.
And I can spot any use of guest_user_regs() on the respective generic
or Arm-specific bug.c paths.

> BTW, do you have an idea why the poll function is not run in an 
> exception handler?

"The poll function" being which one? If you mean the one in xhci-dbc.c
then that's why I had Cc-ed Marek. Moving him to To: - maybe that
manages to finally catch his attention.

>> Andrew suggested to move set_irq_regs() to BUGFRAME_run_fn handling;
>> it's not clear to me whether that would be (a) correct from an abstract
>> pov (that's exception, not interrupt context after all) 
> 
> I agree with that.
> 
>> and (b) really beneficial.
> 
> I guess this could help to reduce the amount of churn. I can't really 
> make my mind whether this is worth it or not. So I would keep it as you did.

Good, thanks.

Jan

