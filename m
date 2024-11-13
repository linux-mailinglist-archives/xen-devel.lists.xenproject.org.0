Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D09C6EEA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 13:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835539.1251406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBCLX-0007dQ-Nh; Wed, 13 Nov 2024 12:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835539.1251406; Wed, 13 Nov 2024 12:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBCLX-0007bg-K9; Wed, 13 Nov 2024 12:19:43 +0000
Received: by outflank-mailman (input) for mailman id 835539;
 Wed, 13 Nov 2024 12:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBCLW-0007ba-Sh
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 12:19:42 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c7e1b30-a1b9-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 13:19:37 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aaddeso8083545a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 04:19:37 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a194dasm853542166b.3.2024.11.13.04.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 04:19:36 -0800 (PST)
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
X-Inumbo-ID: 8c7e1b30-a1b9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhjN2UxYjMwLWExYjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTAwMzc3LjE5MzQ5LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731500376; x=1732105176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=weItZhRknoTJndUCubjmFZddpjxkqH3+j+W1wp4tRKw=;
        b=MBchYVEoxKaOZ9yF0qU/bkJCbFhrRmGunwVrGXfVgoorX72OoTz2aNF9mxm+M55a5V
         f9uVhq+bRwrv3tUFidWNYQ7HX/qo27pG01tDp4sPQ1Q6qsS/wP72b93nwOu/Aw2sMs3+
         uXizO+pon3umL9P8sxkaX0+oPvRcyJInlDVAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500376; x=1732105176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weItZhRknoTJndUCubjmFZddpjxkqH3+j+W1wp4tRKw=;
        b=SzlTe9HUDtvpgnQyH4XOr4g/34NmKrhfJa6VZPkHTMnmI9fOQvop3Ufm4MEuU1wytV
         VLi0AvWsWspTMFUIHj/LPrEm+doWpn8g5QpR7aiZuBN3g6JPKaVAFPTGA0N3D283Eai4
         Nqi+SVkJqFrevB9tFZKCPpt4KwwCaoUnpolTU5B3sFmSqr09qAtkqCLaFfrTw1n/Kc42
         sd50gkvifZawNf+gIX0KIMyXTiVbM+ll63YKC5bKRh3QtaKT1X7rG0waR4ctzNyM4Hsi
         RfT6pYxWhZZxjYvj0rO+Qio8jzknqrW6Nnj2OuPJMpkbkwTzh6q75VdiuieCfmlpE9Kt
         qsug==
X-Forwarded-Encrypted: i=1; AJvYcCXstfmvkX1qrVACjAv7e2t4Zm+UmyPkGAlrqrpytDe5vKr2rtL7UeozByh4OZmwr1Ubd1b6ck86wg8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNQHn0kXwzLRBu4pffno0PDQrrl3DbkjQ4gPF3g6Aa5RKa0kwg
	hBQ7TSoRwVlA871FO/QVVUsl/upnKRs9M9urcR/b+NAr0Z1Rdu96+HNIXP40TQU=
X-Google-Smtp-Source: AGHT+IG+COHURLVf8T8IkcM7kh2PFLad+sCENpWa0gY972cILpUTITO7F1fQq1uRoDJlU7EzmkM1rQ==
X-Received: by 2002:a17:907:7f91:b0:a9e:b86f:c478 with SMTP id a640c23a62f3a-a9eeff44f3amr2063083566b.36.1731500376500;
        Wed, 13 Nov 2024 04:19:36 -0800 (PST)
Message-ID: <4bc2744b-81e5-4923-8321-ab9a95182b71@citrix.com>
Date: Wed, 13 Nov 2024 12:19:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ARM] preparations for 4.19.1
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kelly Choi <kelly.choi@cloud.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <4aa24b39-5734-4b0a-8969-dc3eb4942975@amd.com>
 <718c2a9c-15b0-4f21-941a-5094c06787c7@xen.org>
 <FD24D223-1EDF-414F-BA41-112A72F894CD@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <FD24D223-1EDF-414F-BA41-112A72F894CD@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2024 10:14 am, Luca Fancellu wrote:
> Hi all,
>
>> On 12 Nov 2024, at 16:11, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 12/11/2024 16:00, Stewart Hildebrand wrote:
>>> On 11/12/24 08:00, Jan Beulich wrote:
>>>> All,
>>>>
>>>> the release is due by the end of the month. Please point out
>>>> backports you find
>>>> missing from the respective staging branch, but which you consider
>>>> relevant.
>>>>
>>>> Advance notice: 4.18.4 ought to follow about two weeks later.
>>>>
>>>> Jan
>>>>
>>> Looking for Julien's input on this one:
>>> 35c64c3dce01 ("xen/arm64: entry: Actually skip do_trap_*() when an
>>> SError is triggered")
>>> As mentioned in the post-commit notes [0] it's a candidate for backport.
>>
>> In the past, Stefano handled backports for Arm. I am not sure if this
>> is still case. Stefano?
>>
>>> [0]
>>> https://lore.kernel.org/xen-devel/20240806124815.53492-1-julien@xen.org/
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
>>
>>
>
> Regarding back porting to the 4.19, there is a regression for Arm
> discussed in the ML and on Matrix, do we want to address it now?
>
> [v5,1/3] xen/device-tree: Let DT reserve map entries overlap
> reserved-memory - Patchwork
> <https://patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com/>
> patchwork.kernel.org
> <https://patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com/>
> 	<https://patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com/>
>
> <https://patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com/>
>
>
> xen/device-tree: Allow exact match for overlapping regions - Patchwork
> <https://patchwork.kernel.org/project/xen-devel/patch/20241106134132.2185492-1-luca.fancellu@arm.com/>
> patchwork.kernel.org
> <https://patchwork.kernel.org/project/xen-devel/patch/20241106134132.2185492-1-luca.fancellu@arm.com/>
> 	<https://patchwork.kernel.org/project/xen-devel/patch/20241106134132.2185492-1-luca.fancellu@arm.com/>
>
> <https://patchwork.kernel.org/project/xen-devel/patch/20241106134132.2185492-1-luca.fancellu@arm.com/>
>

That regression does want addressing ASAP, and wants to be included
within 4.19.1.

But first, the ARM maintainers need to agree on what the fix should look
like.

~Andrew

