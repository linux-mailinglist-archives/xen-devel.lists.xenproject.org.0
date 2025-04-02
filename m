Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BBA78B2F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935408.1336826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuWu-0006Zd-Fs; Wed, 02 Apr 2025 09:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935408.1336826; Wed, 02 Apr 2025 09:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuWu-0006YA-D6; Wed, 02 Apr 2025 09:37:04 +0000
Received: by outflank-mailman (input) for mailman id 935408;
 Wed, 02 Apr 2025 09:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzuWt-0006Y4-Cy
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:37:03 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0766d654-0fa6-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:37:01 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso31630965e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:37:01 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb619062fsm15027605e9.28.2025.04.02.02.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:37:00 -0700 (PDT)
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
X-Inumbo-ID: 0766d654-0fa6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743586621; x=1744191421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dWid1er7dE8FVIvprQ/zqaxWwTMIUEe1HsAI4kdDWvY=;
        b=Ot0SpcztKboMjI/XlfRZyOyupCR5G/rMoRK81ur+Vs2v8wiMWlP/OeJQJOe0r9Tm5i
         55+EET9atMlj8gvBIddmCKld+9JZ/vkhazLdQlaOpF40Ec1aesSkiJC7Kj8k3bmfJNr1
         IV2i7W9Cmrqe7FPRWWr7rOo1KMXLW48mRN/lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586621; x=1744191421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWid1er7dE8FVIvprQ/zqaxWwTMIUEe1HsAI4kdDWvY=;
        b=dpshFNXFyrvgqOZuV6lt0npVueA8ACE2a5yN1GDVbdM4bRbQDMuq+XejXq3/6WBagj
         3RJPjTh5VWBIPTZ5iNr3I5rBXq98hTk9oBTLoBKMvx8+fb5nMX6STK7dzxCazJpCQgUo
         rbWEeqPIeYgxf/5NKJl3mGONMDDx0rJV8PCmj7LLB/rCR+TpetB+2yHZl+n33ylMpdka
         OBMr2jIzmlSI/FrSBerp9Fjr3E9cBg9MV+zY0Fz7reyguPnUTPhCYJbvaK0cay86QOor
         kykvF6auxBFxaP2bhzkhes4bx3KeyLX9k3DveOCRaFD/iVXiqvq1c9szj8ruP85ONQRY
         LtWg==
X-Forwarded-Encrypted: i=1; AJvYcCU1nGY7/pCabWX13ncq08pXaRwFw2JCmtGMNQJUS36LZ752j17ReYJ3x/u9Xr0NFoWATYukYOyKmKg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKfPaZUe35F1xxXSPTqakUniIAGA/A3UTEOo86LmN2ju5gB8uQ
	UfW6p6gSVYGfaLDdupWNB3Dmp+QfbdiiZH7d5B1h8fXvdSVLOfO/Kq/zlS0jfdho4a9GoOcEtFp
	dCJE=
X-Gm-Gg: ASbGnctFx+ZqYvwP1BuG7TfeL8VuUBEFS/1db13w2kDSsRZDp4/Pt0zvtMXJDzRzFrp
	RnhwrNaR75aAXv8m6NhIGJaLLHGAxUc9eCjEkTwuElCYTB3fjM9OCDy9WA1OqD3NOLIujA4TW3p
	H8Gd1qgYDMwgNyeZJAZW2VbQxK7reY9tyG6Tv8mU58uSf9zXxPbPwgtjbxOHiGra1jY2wr7AffW
	Mx+hEWlX3O6YA6DXiSo9sFjGhb/Tgzd8+4z7Qp0L3gs3R3dsw/7wCmKq6PDik1K4Cn+xQDoX8ur
	LprpgVmR9H2x+PpUga0+j72nxhQRanMlahzsnDNUxNkgy74amBa1rANJuHSXZ0KyS3BGcaASc+n
	bijrovmjTjQ==
X-Google-Smtp-Source: AGHT+IH/3ZqQaRrjbbNn0OCz8GO0fN8qEQxqRKEdUDwlFpBns1rBTTrU5BeCoJZVE4JiB3W1vtdv0w==
X-Received: by 2002:a05:600c:34c2:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43ea7cdf399mr55930215e9.27.1743586620572;
        Wed, 02 Apr 2025 02:37:00 -0700 (PDT)
Message-ID: <d8be8991-8ac0-4b79-83a9-f0393f1dc46e@citrix.com>
Date: Wed, 2 Apr 2025 10:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250401005008.2787764-1-stefano.stabellini@amd.com>
 <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
 <87f8fc5f-ed82-4930-bc04-50106cc5acff@citrix.com>
 <52ae7bed-ba15-4842-b5d8-4fcb61df28b2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <52ae7bed-ba15-4842-b5d8-4fcb61df28b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2025 10:30 am, Jan Beulich wrote:
> On 02.04.2025 11:21, Andrew Cooper wrote:
>> On 01/04/2025 11:09 am, Jan Beulich wrote:
>>> --- a/xen/common/bitmap.c
>>> +++ b/xen/common/bitmap.c
>>> @@ -359,12 +343,11 @@ static void bitmap_byte_to_long(unsigned
>>>  
>>>  #elif defined(__LITTLE_ENDIAN)
>>>  
>>> -static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>>> -				unsigned int nbits)
>>> -{
>>> -	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
>>> -	clamp_last_byte(bp, nbits);
>>> -}
>>> +#define LITTLE_ENDIAN 1 /* For IS_ENABLED(). */
>> I guess I can fix this in my bswap series by giving __LITTLE_ENDIAN the
>> value of 1 when it is defined ?
> Hmm, that's an option, yes. Yet then I didn't pay close enough attention
> to that part of the respective patch in that series, as I was blindly
> assuming it to instead be
>
> #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> # define __LITTLE_ENDIAN __ORDER_LITTLE_ENDIAN__
> #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> # define __BIG_ENDIAN __ORDER_BIG_ENDIAN__
> #endif
>
> to keep the values of the symbols unaltered.

I saw no value doing that, after auditing that it was only ever used in
an #ifdef kind of way.  IS_ENABLED() is an extension of the same
concept, but requiring a 1 to work.

~Andrew

