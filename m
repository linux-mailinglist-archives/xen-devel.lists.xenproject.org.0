Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49DB8460A7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 20:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674700.1049803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVcQG-0005x5-Jr; Thu, 01 Feb 2024 19:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674700.1049803; Thu, 01 Feb 2024 19:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVcQG-0005vC-HE; Thu, 01 Feb 2024 19:08:28 +0000
Received: by outflank-mailman (input) for mailman id 674700;
 Thu, 01 Feb 2024 19:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6jM=JK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVcQE-0005sx-HE
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 19:08:26 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 459d5eca-c135-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 20:08:24 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ae3cc8a6aso896970f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 11:08:24 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056000025b00b0033b11e91c0bsm132728wrz.81.2024.02.01.11.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 11:08:23 -0800 (PST)
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
X-Inumbo-ID: 459d5eca-c135-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706814503; x=1707419303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TjUYRwPbanYV4UigJIlfR3BoASsaObFgt/HvfYLJikE=;
        b=uY9kaSkCPWDyoAYBnS7FzZGDnrCu2HR6BRQA6RnmQBfD7VrHgEj6/xykhhGU31ITvv
         4OBO+oVoPJLAqNirHL3hYhi7gSR4YgPFhF4ObCSoj1Y8fM+9ItEDYyVm98KoTSl0+Sqq
         3nLKcKU8XhujvuzPit0ci1j1SXEGesC2za2Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706814503; x=1707419303;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjUYRwPbanYV4UigJIlfR3BoASsaObFgt/HvfYLJikE=;
        b=deaP2MNM7URqXTa2Ns0+q6u7AUMTLIy7P2ANUw8TBaBZrekzLU6UrdmnzrEx2qCHON
         4iwy91Cd1CMpB2x1JjpKrs5W5X7S/LldgzVEUd9QN3ToORkKFUErxhLDp0iutTxwIUGT
         EpJmadwpjJ7sgH662iDjxVnc0i1HPgMGAxv5O4TuBW0nL6h21/jC2GdB9x+Rl2bcDcUN
         yqd0D0SVZw0YEITI553DI6WBrrPKjrasF5vTiVOF/x40iW2I9r0VSdTTAWEJCZT8JWxJ
         NFYNTcT25/d1uoS+y6hhg0wcYeqUift0Mv/nnGgiBbmw/Bl9BjBY/3HqT2A8iqNeE76L
         J/Mg==
X-Gm-Message-State: AOJu0YxzF9CFchZrGdmJZ0lTBzi2OmYaaiSp99LTaBEtmLV6tjjnY4Ya
	J11W83ow1/I/i8TiGweQjaL1hkPO3BmFaloFC51oXkqq0aJ3iR6rlDqiJroMapOpIu+T+sCRKfs
	7
X-Google-Smtp-Source: AGHT+IEQ0r2joF0nW4AsnurSs3Qf2xAu9Y126gSBYOe3bcQnbD5lvSf/jnR5/xNnegM6kp0C6UWlJg==
X-Received: by 2002:a5d:522e:0:b0:33a:e4ba:16f5 with SMTP id i14-20020a5d522e000000b0033ae4ba16f5mr2608244wra.3.1706814503681;
        Thu, 01 Feb 2024 11:08:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX3+fmlm+QzNwJVSp400Cnnt7C4iBe+aMqlg8m1DSqr2mnDEtztiuvBP1cB46ik6Gja8Vr3tLHPC0t3iGG3I2bJqJnVI6laTg8=
Message-ID: <0f3a09a0-142e-4534-8f14-4d73dac00990@citrix.com>
Date: Thu, 1 Feb 2024 19:08:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix some typos in comments
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240201145943.738531-1-frediano.ziglio@cloud.com>
 <e31aba88-1607-4a74-b2f9-66e754c89e9c@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e31aba88-1607-4a74-b2f9-66e754c89e9c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/02/2024 3:07 pm, Andrew Cooper wrote:
> On 01/02/2024 2:59 pm, Frediano Ziglio wrote:
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> ---
>>  arch/x86/include/arch/processor.h | 2 +-
>>  include/xen/hvm/params.h          | 2 +-
>>  include/xtf/console.h             | 2 +-
>>  include/xtf/extable.h             | 4 ++--
>>  4 files changed, 5 insertions(+), 5 deletions(-)
> This looks like an XTF patch?

Given that it applies cleanly, that will be a yes.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and committed.

Thanks.

