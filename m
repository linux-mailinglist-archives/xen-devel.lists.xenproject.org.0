Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673EF8FAAB5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735153.1141319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENcH-0002GO-Q9; Tue, 04 Jun 2024 06:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735153.1141319; Tue, 04 Jun 2024 06:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENcH-0002E9-Mn; Tue, 04 Jun 2024 06:25:53 +0000
Received: by outflank-mailman (input) for mailman id 735153;
 Tue, 04 Jun 2024 06:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENcG-0002E3-5N
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:25:52 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49b65bc0-223b-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 08:25:50 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso4446749f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:25:50 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd066ff77sm10526121f8f.117.2024.06.03.23.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:25:50 -0700 (PDT)
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
X-Inumbo-ID: 49b65bc0-223b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717482350; x=1718087150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ye2oNNCCTk3NquB+RcNnnO9FibV1EaflNrAJcs5QPqk=;
        b=UVCYxuC9xvOROp6VP7ZsrBds98Z0OrfJsmyqRBle9OLVASptjLYrR+z8ByaAudU2Og
         P3JYsykPVIoqaBsCsj/0uN2XZW4y3aWwUM9kUTQMJ+M7BY9xLOQ3GtMgzBftnqugWiVj
         FMbYdMO2dMLMOWXXAONF36f5b9RXlxPz2b7kWu+ABIdVCLdQE/4MVfqt4pCsVR8zHo6y
         Cfu5mGSqGQl9NKBE3OFe2PgWba56pMgkQXRIYS+FnF/MoruC3BEY1CiADYs/JWNm3KeI
         VqSfrd+//xj9UNc3tBQF7EH+vYClHG/Yk7kcqFaDdW+7xeAGHfTKqAtdOsfu/VMGeLaK
         vocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717482350; x=1718087150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ye2oNNCCTk3NquB+RcNnnO9FibV1EaflNrAJcs5QPqk=;
        b=Rkr5HNLsuqiyp/6LnDQEj3m5t968u9kP/P3kZ44AL+LRkZPIiA9D0/0dgKc/ub4APz
         adYn17oeE15cawwD/LLmFxcDO+tgW7FRHz+PHOYUPCMi51yEwhpaMpwoMEjTLjq6HZWH
         5YzZhomQ4FgxlBTAzkGJfdp2cEL2mk6PZ0E9T/eUaTBqyvpyEIfzdz14JyRXAm9jSufZ
         jUeFQDDRONSUdLFwK5by06GegkrZCNqP846QgoKAna26ahdiX2O5B3RWfamKORv0byEz
         x2UgS20hIhNxjLVqQhY615xhsnBZNQ1wyPs89pJOFN6Cjd0lIXAbKqAVXlvwvxDwTOm5
         7rNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8A3YltJ9zBPsCnAnv0M5xrplvfiOmLVhWI2dmpoXMRvmdKdD4KiY2DFlegdPgqOhQb3ISn5Vh0F2SXmRBnDkMby3eosrdck3O3CYIayA=
X-Gm-Message-State: AOJu0YyqpL42vh2J2azNQU6yqei4woinQwH3pZQsBEvZMeVWgP6yyM09
	HT3uaR0RmEWXC/UgR8WJJtDULVTBw39W6Ux+R8shA1lgqXm/iawHdfWXp8UeFg==
X-Google-Smtp-Source: AGHT+IGKcqzt3ZuVw8gG3upQPLpnvnbqrRvH9ZWvLFd/Z0Cumf+r4++TYGV7LmRfHRoznplFBVj+bA==
X-Received: by 2002:a5d:47ad:0:b0:355:1e8:4512 with SMTP id ffacd0b85a97d-35e0f31888cmr9518895f8f.43.1717482350230;
        Mon, 03 Jun 2024 23:25:50 -0700 (PDT)
Message-ID: <e612d581-9f5f-4776-bfa0-9cc174973ee2@suse.com>
Date: Tue, 4 Jun 2024 08:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/8] xen: introduce generic non-atomic test_*bit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <526d2a5a76f03aa0e3cc7ee3192b1c87834f0e9e.1717008161.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <526d2a5a76f03aa0e3cc7ee3192b1c87834f0e9e.1717008161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 21:55, Oleksii Kurochko wrote:
> The following generic functions were introduced:
> * test_bit
> * generic__test_and_set_bit
> * generic__test_and_clear_bit
> * generic__test_and_change_bit
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> The following approach was chosen for generic*() and arch*() bit
> operation functions:
> If the bit operation function that is going to be generic starts
> with the prefix "__", then the corresponding generic/arch function
> will also contain the "__" prefix. For example:
>  * test_bit() will be defined using arch_test_bit() and
>    generic_test_bit().
>  * __test_and_set_bit() will be defined using
>    arch__test_and_set_bit() and generic__test_and_set_bit().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit I think you cound have gone further ...

> @@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
>      return oldbit;
>  }
>  
> -#define test_bit(nr, addr) ({                           \
> -    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> +#define arch_test_bit(nr, addr) ({                      \
>      __builtin_constant_p(nr) ?                          \
>          constant_test_bit(nr, addr) :                   \
>          variable_test_bit(nr, addr);                    \

... here, as constant_test_bit() is functionally the same as
generic_test_bit(), afaict. But that can well be cleaned up
subsequently, in order to no further delay this work of yours.

Jan

