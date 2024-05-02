Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F498B9B73
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 15:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715821.1117753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WJB-0004QJ-Nq; Thu, 02 May 2024 13:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715821.1117753; Thu, 02 May 2024 13:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2WJB-0004OC-Kh; Thu, 02 May 2024 13:17:09 +0000
Received: by outflank-mailman (input) for mailman id 715821;
 Thu, 02 May 2024 13:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/qc=MF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2WJA-00046N-KI
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 13:17:08 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46bee23d-0886-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 15:17:07 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso58101565e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 06:17:07 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0041674bf7d4csm5646744wmi.48.2024.05.02.06.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 06:17:07 -0700 (PDT)
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
X-Inumbo-ID: 46bee23d-0886-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714655827; x=1715260627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+P0Gj5m26NK8WSz79zHfWPdpUEHx50wuUj1P9z801s=;
        b=Z2VMzwN7r+h6KDNbaOy4+n4lmSu3JTc8kbE0PVeHQsCyH27J7f8PCRQOCMLcVtyuqm
         XtfrvxsF0awMu90SligR3ROQsAkzMH6+V47sMS/tnDpA/1Zst77ewEeXwYusZDLppdwm
         WKMBDFnHHqKcn5hceEPCXLcTKORTLNieYK4C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714655827; x=1715260627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+P0Gj5m26NK8WSz79zHfWPdpUEHx50wuUj1P9z801s=;
        b=TldJ+09nPCEbWLbSZ/fnsG3D4j16zBUUWLJ8T6xbmbgI3/j3ylarxNPWV3Si3XwKJ5
         Dkcc8Frz8iGv9059k5YJU/dNQNflN8RVxSzv9GFsqMLMdCCAg9ZmI2/gXZCY0BNbcR9C
         4u3CunNMNmVcHSEm69JLKNHrk4gKYmIVvDPHMVy8HzBBI32075hM3KImaXNaYKVkgsOO
         Ut5RUSdPlevzeVL15GxiOxXmK2CLkR3hhgzIXJmBPmu1jsdw7BJkVax4KDav1p+hMn3w
         mlxRQqYllLCExJw83GQX0iKARQHlT6ygLUkz9yv9rUKppmO6mdY7aF5QC/e5/meTZFF6
         Zf3g==
X-Forwarded-Encrypted: i=1; AJvYcCXiXzhEpMQ7dOffWJ+Bioj5+YpzllpWyajTbZUK/KQcEMiLceF412IqRJfBwGVDqz4QIzo+qDTjYkdxxMXuugV9wYhoOfWcC70aZxErpW0=
X-Gm-Message-State: AOJu0YzzkCV7jt3Q8DSU2rFFcPexT8D4P7Obxn8a5ho4YqvTfgHNoEYp
	ogjmyczM5h2fFe99tXJzXyrqXSg3mWj4fIF4VGacpJGvzLlfR2ch5yiSDY25WS0=
X-Google-Smtp-Source: AGHT+IFNbpj6ZFIEsQRJQk3DrlVyfZehQ6N+xpND6IDc4S5NKywFsmUWQ+OH+zY+vPKjqQrv84+y+A==
X-Received: by 2002:a05:600c:3b26:b0:41d:9d8c:5a34 with SMTP id m38-20020a05600c3b2600b0041d9d8c5a34mr3412092wms.9.1714655827254;
        Thu, 02 May 2024 06:17:07 -0700 (PDT)
Message-ID: <1628a593-c028-401d-bdff-b21a8b21b324@citrix.com>
Date: Thu, 2 May 2024 14:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-3-andrew.cooper3@citrix.com>
 <741d4bef-8711-4802-91ad-8a6b4459da61@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <741d4bef-8711-4802-91ad-8a6b4459da61@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2024 1:19 pm, Jan Beulich wrote:
> On 29.04.2024 20:28, Andrew Cooper wrote:
>> @@ -567,16 +567,51 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
>>      return size;
>>  }
>>  
>> -/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
>> -unsigned int xstate_ctxt_size(u64 xcr0)
>> +unsigned int xstate_uncompressed_size(uint64_t xcr0)
>>  {
>> +    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
>> +
>>      if ( xcr0 == xfeature_mask )
>>          return xsave_cntxt_size;
>>  
>>      if ( xcr0 == 0 ) /* TODO: clean up paths passing 0 in here. */
>>          return 0;
>>  
>> -    return hw_uncompressed_size(xcr0);
>> +    if ( xcr0 <= (X86_XCR0_SSE | X86_XCR0_FP) )
> This is open-coded XSTATE_FP_SSE, which I wouldn't mind if ...
>
>> +        return size;
>> +
>> +    /*
>> +     * For the non-legacy states, search all activate states and find the
>> +     * maximum offset+size.  Some states (e.g. LWP, APX_F) are out-of-order
>> +     * with respect their index.
>> +     */
>> +    xcr0 &= ~XSTATE_FP_SSE;
> ... you didn't use that macro here (and once further down). IOW please
> be consistent, no matter which way round.

Oh yes - that's a consequence of these hunks having between written 3
years apart.

It's important for the first one (logical comparison against a bitmap)
that it's split apart.

>
>> +    for_each_set_bit ( i, &xcr0, 63 )
>> +    {
>> +        unsigned int s;
>> +
>> +        ASSERT(xstate_offsets[i] && xstate_sizes[i]);
>> +
>> +        s = xstate_offsets[i] && xstate_sizes[i];
> You mean + here, don't you?

Yes I do...  That was a victim of a last minute refactor.

It also shows that even the cross-check with hardware isn't terribly
effective.  More on that in the other thread.

>  Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I'm also inclined to suggest making this the initializer of s.

Hmm, good point.  Will change.

Thanks,

~Andrew

