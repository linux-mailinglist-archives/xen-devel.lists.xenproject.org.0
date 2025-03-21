Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3DA6C105
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 18:14:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924336.1327594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvfwa-0001JX-D4; Fri, 21 Mar 2025 17:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924336.1327594; Fri, 21 Mar 2025 17:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvfwa-0001Gx-9g; Fri, 21 Mar 2025 17:14:04 +0000
Received: by outflank-mailman (input) for mailman id 924336;
 Fri, 21 Mar 2025 17:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tcq=WI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvfwY-0001Gr-W1
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 17:14:03 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ad373b-0677-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 18:13:59 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so1926893f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 10:13:59 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6445sm2867009f8f.71.2025.03.21.10.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 10:13:57 -0700 (PDT)
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
X-Inumbo-ID: e0ad373b-0677-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742577238; x=1743182038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vk6O7ozv1aYzizJ5s07kHhP05YRSGM/PxJJVxFluRZg=;
        b=Lnj3o+zSwAdy4Z4GeqOtbdoPjATAGTFltfrqmiYUtOjSGIO9KNepe6u6guuDZnnjkb
         uubf81X/J/j725GsmZ2Oy/faU63sDv+Wm6pKk+XvCjkt1EBtDKCAG2BRKsYyPYaMpP1P
         7j5kap80Ghjp/hOu5YfLXQzsK+G03XczG3QrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577238; x=1743182038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk6O7ozv1aYzizJ5s07kHhP05YRSGM/PxJJVxFluRZg=;
        b=IF2gRs3J4tufbEdmls1YM8EVR7rp7gX373YrtwOiWEwT+zH7ZIw9iu9XpaqPU5RzHS
         Qk9e52RTnoldb5qNDce5Wsqi5d0HF1PJsegCdgVggyNNRRBPnHv3+4MkD+5mv/s06lTR
         wD+dfiVNnGY9LjBw0nNpkPge2nyVXTTMiNpRYeJr1VDvCmceUgwQ6tPkk0Lnd62ZQpLU
         rhs9G+fRAWgCKoOR8jUcxMHDKTvfMxlHHFYOA8PdAga3/g2eBvNUwyGhAN44gq7S23zT
         MCYOAzQlXC5JW1uw/iq1cIgaZn7pjnX3QgZ0Qo/sxjMS1AZ7h+Q7YH2oxCspKxreM3kK
         isyw==
X-Forwarded-Encrypted: i=1; AJvYcCUgSthnlL9Wdj3nmq5+yTN2WrHOFftUpJNihTihr5x7olUqBRVycKTzuoVyW0NBvp+cZ4+9jB5SXK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD/HKBi2j/qEWOly0avXn74GmOlo0StyrP5itPKHJE4W8tgENz
	uF+AlINeVycL7XweAtUXASpxPJHuyJtPxyUqNL3FOCZ8TQuBomPqJHZdNjM+hdOlSG3rrqba48j
	G
X-Gm-Gg: ASbGncu0RSlUQDWJzRx1ILhA1OhtWb8D6myJo2nXaSGCyH0B0oD93JrkRLKqi/S7AMm
	NuIGhuMZI/LB5P3BnzG3QCkp+LiicZKjjFzN1NHl8l4rCadPJud7NGSYqeEd3jLV4x+MnjMnJ6o
	GjmvxjzmxMKeapNzMVv8MriwsNZTGVPbpE8H6vDE4uitO1uSXQu32atpV66qOl1eLKV9ssVAVxE
	uKvAk2MviBLzUNoYKavFkGVwRogEBE9nF0DswEL/9QZXm0PEil5H4JweN/rhk/e4HPLGX4hCcFH
	C5EeMwZqCyDupxwkNM6aISXf73ci+lLAYFym+e5xQ8Km3M7UAQKKLtzo1641o2g4GWUBjGbQxLJ
	WmTw5jY3qvQ==
X-Google-Smtp-Source: AGHT+IGmEVkfVRfdcUU2D5zBX/SWwz3pvIeU7A3B7N2Y7ikX2E3PNwaUXX5GHmucS/FGQ0OZ/P0Uag==
X-Received: by 2002:a5d:6483:0:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3997f8f8c67mr4302104f8f.9.1742577238408;
        Fri, 21 Mar 2025 10:13:58 -0700 (PDT)
Message-ID: <4777d8e9-b4d9-45d2-82be-beb1af82283f@citrix.com>
Date: Fri, 21 Mar 2025 17:13:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-6-andrew.cooper3@citrix.com>
 <1cd10c63-4e86-45fa-b4b3-cb750ad9f39b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1cd10c63-4e86-45fa-b4b3-cb750ad9f39b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 11:42 am, Jan Beulich wrote:
> On 11.03.2025 22:10, Andrew Cooper wrote:
>> --- a/xen/include/xlat.lst
>> +++ b/xen/include/xlat.lst
>> @@ -34,8 +34,6 @@
>>  ?	pmu_intel_ctxt			arch-x86/pmu.h
>>  ?	pmu_regs			arch-x86/pmu.h
>>  
>> -!	cpu_user_regs			arch-x86/xen-@arch@.h
> Maybe worthwhile to keep the line, just switching ! to #, in order to
> indicate the type isn't accidentally missing here?

Is it really worth it?  That's a new semantic to an opaque
domain-specific-language, and this file only ever gets looked at when
something is broken.

~Andrew

