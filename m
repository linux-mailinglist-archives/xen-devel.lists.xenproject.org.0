Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FCA97A2C7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 15:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799510.1209499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBZ9-0006py-MY; Mon, 16 Sep 2024 13:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799510.1209499; Mon, 16 Sep 2024 13:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBZ9-0006o3-JX; Mon, 16 Sep 2024 13:14:55 +0000
Received: by outflank-mailman (input) for mailman id 799510;
 Mon, 16 Sep 2024 13:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1kI=QO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sqBZ7-0006nx-Lx
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 13:14:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8377d3c-742d-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 15:14:51 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so535123066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 06:14:51 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e5731sm315898166b.183.2024.09.16.06.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 06:14:50 -0700 (PDT)
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
X-Inumbo-ID: a8377d3c-742d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726492491; x=1727097291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=to7kL1JAxR4Pm0+VqnJQEFIfpXJ6qJ5GypDNaQO4ZHk=;
        b=YZcVm8kbMdB4ThjDHemLT64oi53HHNKr/p3uAD4N/4GjMAgxIgPHXFGZFQuNfItMXD
         T0+6PezEcePU2qRsuC+l5dMtQbhARxIkLmATmj4mADZcYrq9HMHx+1L85F3uUO8eoixv
         aTXmOxtD/1KniX3SDKFeeIQt9Z7WZ886hePv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492491; x=1727097291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to7kL1JAxR4Pm0+VqnJQEFIfpXJ6qJ5GypDNaQO4ZHk=;
        b=Q4iqO+UzzBvrdx+FlxGuMysTSGxHOLwm3BZ04356J8cPTJvvFuqf8AIkoNgwAX7oGo
         PzyFuQGxGPMYvPLeszXfzlKu/+6S0vljpQAgPfKT3n8VKreiXcUtJkfZN6/9S1lV1QHi
         DeRbrf4yziHjVWKMmUwFcpJFspH9BuTiV0nHhQTCJdPDXX25Bi7n5cCYDP536aERdxuj
         zK2RJDyRxDwJRi9XiSgr/8CDhHf3XXmHjq4fOqOwucAl0P/6O6Rx/cAwZj/VhIiMPevH
         9n4UPmJiuws9UqAFjWJx9M0oY7WTW4Ylc02waH7TV5L+mg+fwLslotMn1BbrwJi+upps
         jozQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVr8C0ErzcSwrsaINGmnOVCM7FbM7Q2fD5kGNj6xqMApch6UvLyyY7GZcs7dzYrT4yaai7nTpNJak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcS/GKFk7hK87vq3r/4j6fuZ2HaxhF5NDcpXxnH65YLCbAXAWZ
	8ssxw/udUkuoQoiEi2GNPDqa7GloMFXVQGUrE3jXtnYpylGMdU9YIp0VJTQPHvQ=
X-Google-Smtp-Source: AGHT+IHnzjEiQK12AOU0od6sUFtD4ssbzOzNh8+WcmzhvYmJgbeVwyxZJjWHO8r4+Xm7cnngLPPgaQ==
X-Received: by 2002:a17:907:94c4:b0:a8a:3f78:7b7b with SMTP id a640c23a62f3a-a9029440920mr1475178366b.14.1726492490724;
        Mon, 16 Sep 2024 06:14:50 -0700 (PDT)
Message-ID: <8262b927-5ab0-40e5-8af1-791a5037408f@citrix.com>
Date: Mon, 16 Sep 2024 14:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] x86/time: prefer CMOS over EFI_GET_TIME
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240913075907.34460-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2024 8:59 am, Roger Pau Monne wrote:
> The EFI_GET_TIME implementation is well known to be broken for many firmware
> implementations, for Xen the result on such implementations are:
>
> ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
> [...]
> Xen call trace:
>    [<0000000062ccfa70>] R 0000000062ccfa70
>    [<00000000732e9a3f>] S 00000000732e9a3f
>    [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
>    [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
>    [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
>    [<ffff82d040203334>] F __high_start+0x94/0xa0
>
> Pagetable walk from 0000000062ccfa70:
>  L4[0x000] = 000000207ef1c063 ffffffffffffffff
>  L3[0x001] = 000000005d6c0063 ffffffffffffffff
>  L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)
>
> ****************************************
> Panic on CPU 0:
> FATAL PAGE FAULT
> [error_code=0011]
> Faulting linear address: 0000000062ccfa70
> ****************************************
>
> Swap the preference to default to CMOS first, and EFI later, in an attempt to
> use EFI_GET_TIME as a last resort option only.  Note that Linux for example
> doesn't allow calling the get_time method, and instead provides a dummy handler
> that unconditionally returns EFI_UNSUPPORTED on x86-64.
>
> Such change in the preferences requires some re-arranging of the function
> logic, so that panic messages with workaround suggestions are suitably printed.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This brings us better-in-line with the rest of the world on the matter.

~Andrew

