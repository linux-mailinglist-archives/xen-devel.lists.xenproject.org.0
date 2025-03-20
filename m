Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152EA6A462
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 12:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921808.1325556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDdZ-0004Qq-ET; Thu, 20 Mar 2025 11:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921808.1325556; Thu, 20 Mar 2025 11:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDdZ-0004O4-BY; Thu, 20 Mar 2025 11:00:33 +0000
Received: by outflank-mailman (input) for mailman id 921808;
 Thu, 20 Mar 2025 11:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvDdY-0004Mq-3B
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 11:00:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8977b10a-057a-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 12:00:30 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso3954695e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 04:00:30 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d46edba08sm35981085e9.18.2025.03.20.04.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 04:00:28 -0700 (PDT)
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
X-Inumbo-ID: 8977b10a-057a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742468429; x=1743073229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g/PR67tITghIVXyqsJ/8hTjYfegg8MPh74Q7CTMEOjs=;
        b=dWy6fcjwyzhu2dOHZuPfKbKl6Jc6xuZbYDopDM4/etaAFIyBU11Oedl/ncydv2VK0T
         d7QVgBxCQxLGDBXOJxSY+p3uJ89f7so/dbZ6J1YcggqOkPXLMLTn6klHHXuxn+DWEE+8
         z9ei+G0+DwBLbFq304dHMS6l1El+6WAbibntM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742468429; x=1743073229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/PR67tITghIVXyqsJ/8hTjYfegg8MPh74Q7CTMEOjs=;
        b=WzWBP6/VehGfV+/4gu6up8X+pkbF6gptRVIuR1ydxR6b1/omQfJRDoNaSZZcTw+zL/
         BHAGfEmQ9YcNz5Zp42kkm3jsk0Agfk0RuTpKdLWsnPScktJKtBO0vHYkeCkKqRe6H+fR
         HVJ7w4LDfIrji/RqG1NKvJeNOmNZIHw/3GIsuHlXD++5NuRx2YwnJCBIPOAHzs1JA54V
         g3ApNVE97pCHmvPuocv2qgOO64dySYo2NDONTKUuCD6zyphFzosjsTcE88rxKmB3KQLD
         yAX1A1JP2TaTD83b0TD/NNB7/3tsKAqyHR7uia/zioeGaYC3X47hYJQekgSl/bJdw0K4
         EzIw==
X-Forwarded-Encrypted: i=1; AJvYcCUIb08FgjpjnJJzPLE6p4DDDLZqOQ2LUY0rsRJJO1bR4IUk6XGGCQo0qiZs1LkmcJQHSqH8fMwM0w8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTsDydYu/u3MeSL+JjIhvxKvg9hALUtQpBd7I7VDLFhq4eTM30
	66HSBtGHwLMH1EDJ5QnQIh0UfY9/G1KaKI5IgS/VBroq0OGW08WstVgqT1Tkycxx+T2q/qhptFc
	w
X-Gm-Gg: ASbGncto01+5aFJP51vT1Pii4WLhxDFZNz3ZqrSQAi38pURhD7Hi4Q3ixcHV3OCWQw5
	rEWYeHoHxnSew6b06UeNnTySN8B8Kw+9nQ0BWOQP1WEjd25KvccybDCl+eDC/hvviNk81ZFJY/3
	mMIpp741JzhWUQdJGonKNK+HACOrMpe3b4vVZuCUXWv9zS3M5nF3C5UDeVRKzRjKmnZTaG0dv7c
	ugmc91AIaqiUFjtigDAGesPk85HK/7FFZpSijOR7GNO9TWcSLEHqLmdesIomjzt5qg1hQ7OFWqh
	ZftD23nRejh9agxbS5Q8DKb4220u3YP9AVG4TtHVgVhn58gbbA8VjEwF/3WbqweIaBh7qf8bqO+
	OBoedJYSeNg==
X-Google-Smtp-Source: AGHT+IHa32jWjYHtMEjuRLNar5rDIgSAZrPD9Ooww8euBBbKKGYVc3kEvrZgCl3240kjLayhc4BwMw==
X-Received: by 2002:a05:600c:4e8c:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43d4916673emr26835235e9.3.1742468429285;
        Thu, 20 Mar 2025 04:00:29 -0700 (PDT)
Message-ID: <e5dcb56f-58d3-4141-ab67-92a690310007@citrix.com>
Date: Thu, 20 Mar 2025 11:00:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
 <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
 <27ebf169-ab63-4def-a98b-751ae1758293@suse.com>
 <Z9vOc5I828aV49rI@macbook.local>
 <0da7c7dd-bfbc-4e41-98ed-6e98793e6f50@suse.com>
 <3bec51cf-e3db-4f1b-ac24-4686e2498fde@suse.com>
 <1903e4c2-6a2c-47f1-a5dd-28f13cc87da2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1903e4c2-6a2c-47f1-a5dd-28f13cc87da2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 10:18 am, Jan Beulich wrote:
> On 20.03.2025 10:53, Jan Beulich wrote:
>> On 20.03.2025 09:34, Jan Beulich wrote:
>>> On 20.03.2025 09:14, Roger Pau Monné wrote:
>>>> I wonder how this worked then, as I've tested with the xen.efi smoke
>>>> test in gitlab CI.  Maybe ovmf doesn't acknowledge the RX sections and
>>>> unconditionally sets all mappings as writable?
>>> Possible. And that would be in line with the mode being call "physical mode":
>>> There are no permissions to enforce there. It just so happens that x86-64
>>> requires paging to be enabled to be able to run 64-bit code.
>>>
>>> My experience with OVMF has been that it's hard to find where certain code
>>> lives. Perhaps I should try whether I can find respective code there. Then
>>> again if I find nothing, there wouldn't be any guarantee that I merely didn't
>>> spot the right place.
>> All I can find is BaseTools/Source/C/Common/BasePeCoff.c:PeCoffLoaderLoadImage(),
>> which doesn't look to care about section flags at all.
> And then there is at least one duplicate thereof elsewhere, or something very
> close to a duplicate. In addition I meanwhile found ProtectUefiImage(), yet
> it's unclear (to me) under what conditions execution would make it there. Plus
> it leading to SetUefiImageMemoryAttributes() leaves open where
> gCpu->SetMemoryAttributes() is implemented. I can spot some Arm and RISC-V code
> with respective names (albeit in distinct places), and MTRR functionality with
> names along these lines. None of these can be it.

https://www.kraxel.org/blog/2023/12/uefi-nx-linux-boot/

~Andrew

