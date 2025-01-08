Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F1A06703
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 22:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867740.1279306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVdNJ-0007Zo-Q0; Wed, 08 Jan 2025 21:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867740.1279306; Wed, 08 Jan 2025 21:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVdNJ-0007YA-Lk; Wed, 08 Jan 2025 21:14:01 +0000
Received: by outflank-mailman (input) for mailman id 867740;
 Wed, 08 Jan 2025 21:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrZA=UA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVdNH-0007Y4-Qv
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 21:13:59 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790106d1-ce05-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 22:13:57 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385dece873cso132852f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 13:13:57 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e02b8esm33441955e9.31.2025.01.08.13.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 13:13:56 -0800 (PST)
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
X-Inumbo-ID: 790106d1-ce05-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736370837; x=1736975637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlD8ISfDgyUpmXMt4e8BHzf6yPjiSfj6rl1MZHVbDDg=;
        b=LMaDGIgMEk1l/p1UJjfYvMFxcUQhDYc6IC1+ivBGKd5BDRAOeg/Z01QHwsrDDLvgl9
         3cfHuq34/gYOTq25HHbvv/OtZqiX4PqZrhFAqAaHx/wUCDgUCJuo3jBjGkHil7Ff94ku
         GxhvuDezw0dJVqAUBQXQWwBGMAQ5A8PXRLChs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736370837; x=1736975637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlD8ISfDgyUpmXMt4e8BHzf6yPjiSfj6rl1MZHVbDDg=;
        b=Be8w5mBr3aKE7Q+txH9RkX4fiMiOOl92A2bj9MW5uw7kuHBV7nReqOzJywjyEkvdtD
         4tfV3ouZAkVH7gg5m9z5UajrA9v2owzcI+5dc7mT98gTabbGm5yPsGQmW1h480rM/0sC
         5Liq7clUP2EQHNuyGsBAXSXtwfPcXt5YKJUntUxT9YrZ9wzzngauyi41n7Hvj4PGoqvC
         pxV/BTDhRhxYp61L8OHOnsauxDipymvOM7bkB11kf5W0WOKoD3CznPilDzSygxdfyCwk
         iWyxF4IgxyaerCSMAWJG4NcvgiRiIt7J3uR2tHjZSgtratmXqv9s0Pxv2GR5RoiTtJaO
         V7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXIIN24xjXeH1e7s+tF3tRWud93c7XylmZKbEtSjPieVHjftA054Q4DRbvHp2INs2HcI7ZHPOPcYp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdL45iLjMx4HvZOBD1KwD5gtHluhZl1hPy3lLDgvKB3Jn2Ui1V
	LkvGawHPZOQ38gGVFiAgIKhJD9MI/7QRcoET7LUs6f6CSjdMUiFcx6jxRZOhmdY=
X-Gm-Gg: ASbGncukV9/36hgRiMWS5lT870hU6lbem4WQxNVf387on3FhoOoO2m05YrnHnLqylj3
	2QEPohrA64dzd/GWV3fa+dEo7e1W5+AaGxa7wg6VGm+p8yXNU6pkXToBAJG+G8i5YlCnRirpzrX
	0QU1NfAQ+0dxadLDgT/z9sH5R2cBcOxcTsF8G/5IAWTqGoKgTeqhr0oeHrx80DVQfqINt0X/vzO
	lverK4B0KrdHjM2kCXRFG090QIY2ZCqxYjn/9rQrVCaYIHynx6j95AQlw1J1T6GJ4w=
X-Google-Smtp-Source: AGHT+IGdvLD0JYjbzUqP0drFc1ixeMCLe7WWFEyN9oYEcEu5PKUHYwp1S37VdKosW0SQp16CeeVhmA==
X-Received: by 2002:a05:6000:1f88:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a872f69c7mr3689971f8f.10.1736370836844;
        Wed, 08 Jan 2025 13:13:56 -0800 (PST)
Message-ID: <90c54825-9302-41df-81e0-af7d952f64b0@citrix.com>
Date: Wed, 8 Jan 2025 21:13:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: ffa: fix build with clang
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250108152317.335441-1-stewart.hildebrand@amd.com>
 <D6WT3QSKXNG4.162UPSGMQ1ZIS@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D6WT3QSKXNG4.162UPSGMQ1ZIS@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/01/2025 3:45 pm, Alejandro Vallejo wrote:
> Hi,
>
> On Wed Jan 8, 2025 at 3:23 PM GMT, Stewart Hildebrand wrote:
>> It appears the variable ffa_fw_version is only used in ffa.c. Was there
>> any rationale for exporting the symbol in 2f9f240a5e87 ("xen/arm: ffa:
>> Fine granular call support")? If not, perhaps we ought to make it static
>> again and remove the declaration in the header.
> The only reason I can think of is wanting to have it in the symbol table of the
> ELF file for some reason (livepatching?)

Livepatching can work with static symbols just fine.

Binary diffing is per TU, looking at all symbols in the object, not just
global symbols.

~Andrew

