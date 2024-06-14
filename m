Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE8908CCC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 15:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740723.1147823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7QL-0003Hp-KL; Fri, 14 Jun 2024 13:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740723.1147823; Fri, 14 Jun 2024 13:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI7QL-0003EU-Gs; Fri, 14 Jun 2024 13:57:01 +0000
Received: by outflank-mailman (input) for mailman id 740723;
 Fri, 14 Jun 2024 13:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sI7QJ-0003Dt-ME
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 13:56:59 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6f19e8a-2a55-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 15:56:57 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso2634342a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 06:56:57 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb7439606sm2311690a12.90.2024.06.14.06.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 06:56:56 -0700 (PDT)
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
X-Inumbo-ID: f6f19e8a-2a55-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718373417; x=1718978217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TiWABf3QR31YPZBIEqyXpYVGJAdZuRLQ3bCJAb3zXF4=;
        b=SQ2r+DYy06ePahsmisFSX1ffG8ZG7ehCfpYS1TjZdSqAWkqdAjzexpY1yrxAFw0AeS
         pj0esoeYsPNECYNoa9Ii9ZFlpezfSIveECWXfKuffO5LAIiNr5uAduKgTBptJSS96CNN
         uTv1PTB7GXDiIUtB+PE41HXx0gjYr+Vqw2MD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718373417; x=1718978217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiWABf3QR31YPZBIEqyXpYVGJAdZuRLQ3bCJAb3zXF4=;
        b=wmWh2fqZdvW9+6PO8CoAiyJroPHhPS88M2BAtE1+lYCHhfgrsUVaTywnxEueJLw5Y3
         O9n02n+711g4QTro605AAVjzgCjuHM4AyYLM4myqU5M3LIkHANSzlHSRfqn/8LQPXKhs
         nm+qGUMH8Avck95f6kHOu76N64pyQqIyeeP5fiGFo2TFQrv6GJ3dMiDScCgCjEpn7X4G
         IcZGHD8Ez0h8OmZEPQr7+f1lesDMD2uCdxviLa7ZitsaMLWa1c4vliDph32hnPERuH4X
         uYhI0uqEWn4sk9JnrfjXzIctS36LTgWcl6vu8sp/f70BkntL/GV8djLeuPDbHt5QRYSG
         wD2A==
X-Forwarded-Encrypted: i=1; AJvYcCXiefsaXrtLC1TBGnbUxo+FeiAUlvq3uUQXwGvEznmdHYgJf9cYzrtcmT5QlNToH55Q03YG8sU3gAcQm1t45NA1cApa/1UiTiqme0ys+Xk=
X-Gm-Message-State: AOJu0YwV4KbD7IYV7zJx9qzL/CJ2GPOL/AgBcedsGKmAvRDoAB4y9m/t
	0ais5Dix1qzeDoRhjyV+KFPd23KzinJMus3FWFImBz4xq+rrR27GVnZ1r0A0uc8=
X-Google-Smtp-Source: AGHT+IHUvLNEtk8+RCwmbFPacJJjegh2Voyl2SEQ9OW97g3s+D0z7azwFwGPhwmvLM1ivNp1PiQ9eQ==
X-Received: by 2002:a50:96d2:0:b0:57c:5f74:d8ff with SMTP id 4fb4d7f45d1cf-57cbd68e730mr2322462a12.21.1718373417169;
        Fri, 14 Jun 2024 06:56:57 -0700 (PDT)
Message-ID: <ef40e586-b1cd-4620-9d64-22fc2786c072@citrix.com>
Date: Fri, 14 Jun 2024 14:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-5-andrew.cooper3@citrix.com>
 <b0d92d89-5ca7-4870-8118-139a47057a88@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b0d92d89-5ca7-4870-8118-139a47057a88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 5:09 pm, Jan Beulich wrote:
> On 23.05.2024 13:16, Andrew Cooper wrote:
>> @@ -611,6 +587,40 @@ static bool valid_xcr0(uint64_t xcr0)
>>      return true;
>>  }
>>  
>> +unsigned int xstate_uncompressed_size(uint64_t xcr0)
>> +{
>> +    unsigned int size = XSTATE_AREA_MIN_SIZE, i;
>> +
>> +    ASSERT((xcr0 & ~X86_XCR0_STATES) == 0);
> I'm puzzled by the combination of this assertion and ...
>
>> +    if ( xcr0 == xfeature_mask )
>> +        return xsave_cntxt_size;
> ... this conditional return. Yes, right now we don't support/use any XSS
> components, but without any comment the assertion looks overly restrictive
> to me.

The ASSERT() is to cover a bug I found during testing.

It is a hard error to pass in non-XCR0 states.  XSS states do not exist
in an uncompressed image, and have a base of 0, which ends up hitting a
later assertion.

This snippet with xfeature_mask is just code motion from
xstate_ctxt_size(), expressed as an addition because of diff.  It was to
save a double XCR0 write in a perceived common case.

But, your AMX series makes both xfeature_mask and xsave_cntxt_size bogus
by there no longer being a uniform size of the save area, so I can
probably get away with simply dropping it here.

~Andrew

