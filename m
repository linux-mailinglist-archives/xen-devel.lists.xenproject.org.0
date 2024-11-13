Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB059C779C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 16:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835866.1251725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFak-0007EY-1O; Wed, 13 Nov 2024 15:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835866.1251725; Wed, 13 Nov 2024 15:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFaj-0007CT-Us; Wed, 13 Nov 2024 15:47:37 +0000
Received: by outflank-mailman (input) for mailman id 835866;
 Wed, 13 Nov 2024 15:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBFai-0007CL-Dy
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 15:47:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 976ab2da-a1d6-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 16:47:30 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so335783566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 07:47:30 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0abf305sm875194166b.86.2024.11.13.07.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 07:47:13 -0800 (PST)
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
X-Inumbo-ID: 976ab2da-a1d6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3NmFiMmRhLWExZDYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTEyODUwLjkwNjk3Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731512850; x=1732117650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CT3OrSIXV96I6ybBWz0Wf1RD7IzBkgoIW5Cm+Og5S/k=;
        b=tU/6fGD9F/ow/Bp8XQagm684L5pw5SMFE4xllbgh0eWksUnoo1HsYjT3lp7HfGKQ7V
         cllUePlxc6rR34iZVgrzzQalBCy5U/9kELVv9sPb2lSdsrkN96QQ9KmiTsCXeJ/B4+uj
         8BbPVayq3VlHX0nuXxep77c0ek07HXeyDVBC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731512850; x=1732117650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CT3OrSIXV96I6ybBWz0Wf1RD7IzBkgoIW5Cm+Og5S/k=;
        b=C0PLX95VGaNuj6Cq5jqxEg4rfl/NSSqYTwh7XHJmDyBW8Jp5oSWzJXE66VnGY0aNnC
         BpugLjNFHywiwCVa7si2iCGeH42rNzBJQG/8kdlGAHaIcc2L8RvTVcvkd5QP8oXcPmnE
         Vrs+J3H8yU+Fkvo1LMJZoFqjr6AsXhbnnOaf9JIbwYK61Lg9+UhJ89Z4A+MGCpoxkQ6J
         cTadmEq/XebrcgxfuDnr60nj29S8P3NCwyw5W9KMClkOxXa4Gi+Tnsd3fyapI18B7ouf
         Ra8V+gRT95kbOGya7F755yGihzCb8DSlgfp2uKbxDIhiIyETi84JOlcIGwfNnP94nxD8
         0iAg==
X-Forwarded-Encrypted: i=1; AJvYcCULA8ZLwaRaSvtGo7m36ZekEpphcFhU/GV1BV8XoPfpVefQvFAacNQiH/fqm3fkZe2qmdOMkOvvPyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6olj3C9xT2Ukr1nOxnxRxkB7G+ghABryD3bicexSAReA4UFma
	M4Ibc7sOjfj47K2NwyJYwaCkPledUYtWvCOsTyi3JWMn5GGxFsJR7X+Hz2y3sPE=
X-Google-Smtp-Source: AGHT+IENwQcEYm2E5HoFeL4Ds3AQCjxGmsYOTN3hSbDWgzy9WyRjMrZ6G3ZsCkSacr6gRlwsbF68cA==
X-Received: by 2002:a17:906:dc89:b0:a9e:d539:86c4 with SMTP id a640c23a62f3a-a9eefeb2bb7mr1779937066b.9.1731512834135;
        Wed, 13 Nov 2024 07:47:14 -0800 (PST)
Message-ID: <f91fe1b0-5f35-4cbf-afc1-4c1989dbf2d7@citrix.com>
Date: Wed, 13 Nov 2024 15:47:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [August-October]
To: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>
Cc: Kelly Choi <kelly.choi@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
 <14df2192-9736-4c1c-8aac-2853467ea330@suse.com>
 <814c2168603cd48e32fde6fff0cad2ca58fc2c9d.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <814c2168603cd48e32fde6fff0cad2ca58fc2c9d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/11/2024 2:43 pm, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-11-13 at 10:48 +0100, Jan Beulich wrote:
>> On 12.11.2024 17:16, Oleksii Kurochko wrote:
>>> https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
>>>
>>> *  Reuse 32 bit C code more safely (v4)
>>>   -  Frediano Ziglio
>> Same question here.
> For this patch series my script found to patches which are not in
> staging:
> $ git log --grep="x86/boot: create a C bundle for 32 bit boot code and

This is aa9045e77130

> use it"
> $ git log --grep="x86/boot: Clarify comment"

This is the one remaining patch of the series, but it's superseded by
https://lore.kernel.org/xen-devel/20241113093058.1562447-1-andrew.cooper3@citrix.com/T/#u

~Andrew

