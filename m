Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D1A2FD0F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 23:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885027.1294788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thcJj-0006gX-1B; Mon, 10 Feb 2025 22:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885027.1294788; Mon, 10 Feb 2025 22:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thcJi-0006ec-Uw; Mon, 10 Feb 2025 22:31:50 +0000
Received: by outflank-mailman (input) for mailman id 885027;
 Mon, 10 Feb 2025 22:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHzs=VB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1thcJh-0006d3-BS
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 22:31:49 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb54bebe-e7fe-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 23:31:39 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-38dc5b8ed86so2081939f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 14:31:39 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc09fc2d9sm12487149f8f.6.2025.02.10.14.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:31:37 -0800 (PST)
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
X-Inumbo-ID: cb54bebe-e7fe-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739226698; x=1739831498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JRfaLCy0lZOVeRW5KLCxUVhRsXRk5mXQqX97RxPjGnQ=;
        b=kjsTLTLgS4on2e+gS20spJBxOX59ImAr/l8xyDje7KNUju+2FBZT4dpEkwAFnCF3ni
         z/mrRsMeD49DuSoiKLzmzFYYU5U8F4H+0omxdOfrgF0WPH5zFOSwR/giZPDCUvQd87gb
         D/gY1XXNd+ty6D8MHDrKy+VqRzHR/uDJIRH48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226698; x=1739831498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfaLCy0lZOVeRW5KLCxUVhRsXRk5mXQqX97RxPjGnQ=;
        b=nDY6I6E8PtFfnYVKyeTljfGBNaY1X1DPJFw1RdxfFVU4bdZedqL6N6hRH/drJ/ndjq
         VtpsW94On4NNTZOYbo7oNfc3OddoM6aYBdGfG8gLwvg3V89f9iw9RFmQq0/X/mHZuZ7L
         0kjc5WlE2ZXd4uYuMQJFjcqqJAq0ktlf5D95rec8/Vtj08IDtzR1YGTZjPqRC31XjwIe
         7WALM7lEfq65/hvomiINyzJFpVIZDgR4vvA6HSQIpXUxAB3QImbHn6GZ4ddFj6CZ9SFd
         OGhoKtNWEDrH8pvxHM1LwFscuFjOXf2K71P2EgRDrPl8MLVWNjFeH4dOOC62gsLdTA3d
         tksg==
X-Forwarded-Encrypted: i=1; AJvYcCVpyxoady3q7ZdFzU+wOgjhdGtNhjnQUBEiMikv8E1tqZD7alLLNxtJahGJWjycOW5LAPYJ95HNLHo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUYNkh5l0zwMct4NXdd8VDeoZGL4JBOeiH0VVh9BoTnh86J3i8
	EzAkGG3Ik/ouuMrHPC8uncAJBjzZomQTqOvKwOGoMYPga3TQ46qhyw+VZsrgfkE=
X-Gm-Gg: ASbGnctjuDUol9lU2KLS3CmHSo6BF8HbriIq43mRuIJ9ilIn4rP6y0v5VgKc+vX8AcC
	jw4+JUTJjpSS18dw2s6VX+oBEvyVEMMJnuRSPm1tHufXs3DH1dHwoKmSCM82TxYPMMlo2J+mkuI
	UZwpk5SLrVpgPxWnIW5PeSUMV5p73I2aLe6Nnq6/Q4QvMjbCGNGygwBoNFMja/HrlTYYhKAJJhW
	FgZDnu8gJLnK7191T25RIfOTShBXE5JV2vGw0TDtyd8aInR8RQ+Xkm16nZ5GLaZGnavpIlHoP6d
	noxUFnK1Eg4j7PjFpykG1LbTpZWC2PROY+xe447G+82eQqL19fQ5zLg=
X-Google-Smtp-Source: AGHT+IEtdZwZ0O0blWk6Xbvd5hYXgW24F4qZufdKtUCWb76/pvwoGX+MagSKH9K91HbYNYozyjClOw==
X-Received: by 2002:a5d:64a9:0:b0:38d:b1e5:7e09 with SMTP id ffacd0b85a97d-38de41c5439mr1153167f8f.49.1739226698460;
        Mon, 10 Feb 2025 14:31:38 -0800 (PST)
Message-ID: <37634e0f-3bc2-46d7-96df-f9bf4be3e6cb@citrix.com>
Date: Mon, 10 Feb 2025 22:31:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/4] ARM32/traps: Fix
 do_trap_undefined_instruction()'s detection of kernel text
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-2-andrew.cooper3@citrix.com>
 <b829abd1-e0b0-4f36-bc27-0f632deedbab@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b829abd1-e0b0-4f36-bc27-0f632deedbab@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 10:13 am, Orzel, Michal wrote:
>
> On 08/02/2025 01:02, Andrew Cooper wrote:
>>
>> While fixing some common/arch boundaries for UBSAN support on other
>> architectures, the following debugging patch:
>>
>>   diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>   index c1f2d1b89d43..58d1d048d339 100644
>>   --- a/xen/arch/arm/setup.c
>>   +++ b/xen/arch/arm/setup.c
>>   @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>>
>>        system_state = SYS_STATE_active;
>>
>>   +    dump_execution_state();
>>   +
>>        for_each_domain( d )
>>            domain_unpause_by_systemcontroller(d);
>>
>> fails with:
>>
>>   (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>   (XEN) CPU0: Unexpected Trap: Undefined Instruction
>>   (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
>>   (XEN) CPU:    0
>>   <snip>
>>   (XEN)
>>   (XEN) ****************************************
>>   (XEN) Panic on CPU 0:
>>   (XEN) CPU0: Unexpected Trap: Undefined Instruction
>>   (XEN) ****************************************
>>
>> This is because the condition for init text is wrong.  While there's nothing
>> interesting from that point onwards in start_xen(), it's also wrong for any
>> livepatch which brings in an adjusted BUG_FRAME().
>>
>> Use is_active_kernel_text() which is the correct test for this purpose, and is
>> aware of init and livepatch regions too.
>>
>> Commit c8d4b6304a5e ("xen/arm: add support for run_in_exception_handler()"),
>> made run_in_exception_handler() work, but didn't complete the TODO left in
>> commit 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON").  Do so, to make
>> ARM consistent with other architectures.
>>
>> Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> You should have mentioned that this patch requires [1] as a prerequisite.
> Otherwise this patch fails to build on both arm64 and arm32 with UBSAN enabled.
>
> [1]
> https://lore.kernel.org/xen-devel/359347d3-9a5f-4672-98d6-4c497d960059@gmail.com/T/#mc75e1b1ff6ccf4b0c7e10f55eedb7cacffca1c3d

That is unintentional.

I'm going to split this patch in half, because it's clear that the
run_in_exception_handler() problems are more complicated than I expected.

The fix in do_trap_undefined_instruction() genuinely is entirely
independent of UBSAN.

~Andrew

