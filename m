Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C1895833
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 17:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700203.1092960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrg4X-0001dC-F9; Tue, 02 Apr 2024 15:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700203.1092960; Tue, 02 Apr 2024 15:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrg4X-0001b2-C5; Tue, 02 Apr 2024 15:29:13 +0000
Received: by outflank-mailman (input) for mailman id 700203;
 Tue, 02 Apr 2024 15:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l5ae=LH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rrg4W-0001Zf-Fn
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 15:29:12 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2c6b51-f105-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 17:29:08 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-568c714a9c7so6271216a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 08:29:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a170906669300b00a4e299dea48sm6091258ejo.199.2024.04.02.08.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 08:29:07 -0700 (PDT)
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
X-Inumbo-ID: bf2c6b51-f105-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712071747; x=1712676547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/QljjjALfTRpeEJgh1rcbafvSyAA7R1aCImlaqo454=;
        b=Ar6yFDgtH193WpY5FO9KhJ81+T8/KYU42HXC8EzJBuXfFWABU0AB7o+jBywIHVOcMF
         xac7qiwatpomyx8PHM2qn8uCFzDxhgdSH8EsgYIXvd2UvNRtOdQBjvvxrbOsqaAhxR/b
         9/KCTeS2n1nZ6+PGu4VjRdI2TLizt/m5E9go8RFxQqxOY6XVuTw1iC4bClKfv4VK1U2Q
         tuEEny/uF9o/qp7Dj8KkDlErSYAnpp6+puKGefG99+I8yohvaXBIc5hzGYkVBZ/tg3g4
         kwmexBYMYxL/kGKeHYK1M88kGDDQqZgVtfkrl/LgHPLe4VZxN1wXcbXYvdJ7YZzEVQsl
         4G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712071747; x=1712676547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/QljjjALfTRpeEJgh1rcbafvSyAA7R1aCImlaqo454=;
        b=mQGJC/kovSnp+evDY6EzsM1hd/75zmAycobLOG2Z3jiyiBTgZQh81zN2YRwgDyVRu5
         qBs7elmjpmwwPDcpXMKga64IbZdB1V7opUqC1G3fIEXGV/OzdMLWYaLsiDwjOIMgc5Z9
         ZOlwI9dHAv3UCMqsv2iNFyT1oEPD1+6J4hBry5CLPHXdzbLVCl3pUukMZrk9x1k+NcEa
         PaCQjSFT7lxhOt5zaa39Bopq7eaxZIdLNQUzNpAYkMSPus9LclDaD+t+ETKX+Tb94+IU
         R1wR+cGr6nhhla87O4pgsu5eMljzyTlR0E3RKpJ+W3g92wNqrx5FY2ZYPjfOTB1GFm9i
         Okcg==
X-Forwarded-Encrypted: i=1; AJvYcCWLgsGb2Mf88qV9vLWByMpzoEYMaI8kbPIHkj9bPNVEfpGisZAf5oTXOh1VwL9AwCJYTQXX5fwGNR1ltokV7yQ2/ZTObXIj3tYv+0vdKlU=
X-Gm-Message-State: AOJu0Yx9rXpUUonpKC1xuMfZ1nEapTCfDqAnW05/4WoHOE9fpcquNudu
	eykepg5ZGqNr5Pzv+XnPsRG6g2a0I4wuQwt8eU2My++uBGJ4LSp7sMjrVmlbz9U=
X-Google-Smtp-Source: AGHT+IGAWxX5Gemnxbp4jp9SIBGErwqjwv+OGJ5uSe7svP8B9lFU5LluzF9+5OwUvICuwRyXiCTgvg==
X-Received: by 2002:a17:906:160c:b0:a4e:8c19:2ceb with SMTP id m12-20020a170906160c00b00a4e8c192cebmr1333228ejd.6.1712071747493;
        Tue, 02 Apr 2024 08:29:07 -0700 (PDT)
Message-ID: <afef3207-deff-4eb0-ae28-49b49cbcd2be@suse.com>
Date: Tue, 2 Apr 2024 17:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-8-jgross@suse.com>
 <7e94482d-2c03-41ac-827f-af92a94796af@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <7e94482d-2c03-41ac-827f-af92a94796af@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.04.24 16:52, Jan Beulich wrote:
> On 27.03.2024 16:22, Juergen Gross wrote:
>> @@ -36,14 +36,21 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>>   
>>   static inline bool _is_write_locked_by_me(unsigned int cnts)
>>   {
>> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
>> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
>> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>>       return (cnts & _QW_WMASK) == _QW_LOCKED &&
>>              (cnts & _QW_CPUMASK) == smp_processor_id();
>>   }
>>   
>>   static inline bool _can_read_lock(unsigned int cnts)
>>   {
>> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
>> +    /*
>> +     * If write locked by the caller, no other readers are possible.
>> +     * Not allowing the lock holder to read_lock() another 32768 times ought
>> +     * to be fine.
>> +     */
>> +    return cnts <= INT_MAX &&
>> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>>   }
> 
> What is the 32768 in the comment relating to? INT_MAX is quite a bit higher,
> yet the comparison against it is the only thing you add. Whereas the reader
> count is, with the sign bit unused, 17 bits, though (bits 14..30). I think

You missed:

#define    _QR_SHIFT    (_QW_SHIFT + 2)         /* Reader count shift */

So the reader's shift is 16, resulting in 15 bits for the reader count.

> even in such a comment rather than using a literal number the corresponding
> expression would better be stated.

Hmm, you mean replacing the 32768 with INT_MAX >> _QR_SHIFT? This would be
fine with me.


Juergen

