Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FEA6BA9C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 13:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923962.1327318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvbOr-00052u-HG; Fri, 21 Mar 2025 12:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923962.1327318; Fri, 21 Mar 2025 12:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvbOr-00050c-Dc; Fri, 21 Mar 2025 12:22:57 +0000
Received: by outflank-mailman (input) for mailman id 923962;
 Fri, 21 Mar 2025 12:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tcq=WI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvbOp-00050U-Pu
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 12:22:55 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3669c3be-064f-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 13:22:53 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so12991385e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 05:22:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm76174345e9.32.2025.03.21.05.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 05:22:52 -0700 (PDT)
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
X-Inumbo-ID: 3669c3be-064f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742559773; x=1743164573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tSQGGj7lIYEKxhddVGQ2NybS7mGRNuDmurLAfwFYhW0=;
        b=FG+kVYmPP7sE0AZXTiYNZG07vcIrtdAM2rJa7t7c3e+V0Ov0OBEYSHFF3X0OsyiTKo
         TDsHj3+ydXMl0rdPvIv8T1YLdZq/dg2V559VYQDuQxlkVMDXY9rVklwwHprCL2cMfOYm
         hQjK+mI6y9VfK/Sv3PuVO20hUBnq0WxdTtcHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559773; x=1743164573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSQGGj7lIYEKxhddVGQ2NybS7mGRNuDmurLAfwFYhW0=;
        b=VvnlM+VZpYTE7up4wPFXoWyaRV0UdBVeYu6Nl7G7DyA/a8pPnZcfyp3VgczrsM43R4
         c9R7lJkEDp8DYyhm8+dL6i6N19dpJGMrKrrAIoIVOGfyE7F3sL5YFO+0wHXHmIx52tEx
         Sr5H4ld2+bINiTBd77MeIsKQMb8M95SHLEFKDAkLqhetbvUrd6tnQbgGutrkNPOWRRaU
         wsKNj8l/VJbl9KRrDpfMpu6sas1qV65fM0pgDkotGeigvKcUnIOgNTGWPXQiWqyFiN2V
         kMhi6v2buvUruYN0lsAG2DIvJHIbXUQg+/Cqy3izTKVwr+h9ls02LzbGBFa3SihWx7F9
         xoPA==
X-Forwarded-Encrypted: i=1; AJvYcCWkgEePsnf0dDz6yUrIMqHTopqRwLULLY9w1fKrK+WP/+PA3G4L1QAu9mdvI/Yist7moRF8AxkHrc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLgaptZ0ML0SBIbzjprqZpotIFKufTD0uHaDrYnKzzn+anuKPP
	lMdwIT0nhM9zZ+S745JvVvHNqMn9ggJbFHAFX0H+YpXqjzPItuNFL4Na+sV4j6s=
X-Gm-Gg: ASbGncsDf2r91zX6r6UfZgelqYp+41HOf8uU15sEujvzFdoS66Kfbov0z6EC85nUlpl
	SZJhWnIZQhpePE5BeOAHD4x+X7r36RVBSoUU/0oG66RbGW8ArozxQENE3NzIVQWPA5XcW29xLgP
	sHRcdItl5bithcD+biuX1/qCUUBZDVqOjfuuEsk0nF1tv3mWtAiOYERIxtN/P82iQT8E0eQ98Fy
	zJh5En5gdk4drPvY9W6QJlgh6CP5HC0icB32pnBRNDBlJm8vu3DpMDy6U2UFT37gAbXnXhQJ2Td
	7Z502InE9C5rwTEuKXYzFCNPSgJFl9ZwXT7LFQQob3WEnJiVwS7Rz63yDDlaS3rYwTgFTwsRjdU
	3NhKkvqx9kg==
X-Google-Smtp-Source: AGHT+IETRHSkk3aGU+tv62LIN98IxxMiJzJALn6Q2lT3v0L3EcXANtz8wzVk5s+6Oc9ANUE3kQUFKQ==
X-Received: by 2002:a05:600c:3ca5:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-43d509ec5a9mr27312785e9.11.1742559772791;
        Fri, 21 Mar 2025 05:22:52 -0700 (PDT)
Message-ID: <d60dcca1-f6eb-4f81-bba4-0f5ca447c9a5@citrix.com>
Date: Fri, 21 Mar 2025 12:22:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/traps: Introduce early_traps_init() and simplify
 setup
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-5-andrew.cooper3@citrix.com>
 <801007e0-2c02-48f8-856d-8f06eb698fb5@suse.com>
 <29d645e3-f8ae-4f55-8371-aa67da295ff8@citrix.com>
 <c2923773-ae95-4baa-a441-6bedc25be32f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c2923773-ae95-4baa-a441-6bedc25be32f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/03/2025 6:52 am, Jan Beulich wrote:
> On 20.03.2025 18:56, Andrew Cooper wrote:
>> On 18/03/2025 3:26 pm, Jan Beulich wrote:
>>> The sole dependency is percpu_init_areas(),
>>> which runs - as even visible from patch context here - ahead of
>>> early_traps_init().
>> percpu_init_areas() isn't even a dependency.  Notice how it only starts
>> from CPU1.  CPU0 (which is what this_cpu() refers to in both of these
>> functions) is correct (i.e. 0) at build time.
> Oh, right.
>
>> I still intend to remove percpu_init_areas().  It's all build-time
>> constant; it just needs doing by the assembler, rather than the
>> compiler, as (-(long)__per_cpu_start) is not an integer constant expression.
> Except that this value also cannot be expressed by a relocation, afaict,
> so the assembler would choke when trying to write the object file. (Same
> for x86'es alternative initializer.)

Yeah, I found that while experimenting.

However, the PROVIDE_HIDDEN() trick I used for IDT autogen does work.

There are a couple of nasty thing.  While we have ASM_INT() now, we
don't have ASM_PTR() or equivalent, which is needed because this is a
common file and we can't just use .quad.

Also, because this is an asm() block in a C file, we can't use any of
linkage.h; opencoding it isn't too bad, but it also appears that
__read_mostly doesn't honour -fdata-sections.

~Andrew

