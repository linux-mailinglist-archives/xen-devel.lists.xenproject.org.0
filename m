Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA4B26FC7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 21:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082443.1442295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdlt-0000Hd-Fx; Thu, 14 Aug 2025 19:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082443.1442295; Thu, 14 Aug 2025 19:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdlt-0000Ew-BC; Thu, 14 Aug 2025 19:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1082443;
 Thu, 14 Aug 2025 19:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umdls-0008Rn-FZ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 19:37:56 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d122683-7946-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 21:37:56 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b9d41baedeso749980f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 12:37:56 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9386sm51923038f8f.18.2025.08.14.12.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 12:37:54 -0700 (PDT)
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
X-Inumbo-ID: 2d122683-7946-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755200275; x=1755805075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBGI48VsPUnT+e9vpM1hkbUkMXnBNJ79lzK13v1JZo8=;
        b=ZrDTRL/enzCKClCXDYZxvGxv6ba3/uWA2ag2/wgm7JgMXsvtAF5KZduPyrjCwZKZYs
         AP5FcnnyWaeGsRjHP4+rGw1aCQZswmxkWzD8sEoNH9qSwzb+UKJK6t5/XgP4fplco1Xx
         9gS3gXh+WK4rZujz0xM7Rvyu5B/l3LUaydVjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755200275; x=1755805075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBGI48VsPUnT+e9vpM1hkbUkMXnBNJ79lzK13v1JZo8=;
        b=pe8rumMpS45KjKgYOWOqhhJk8dreT5gUzhXx53LSBMUL7+ycU7pS/fVQbXnCVqwg8Q
         epGFtKrBxx/gOt8WajCAo5wbYzUjl8FPnY55nk06YG0zQr1J9mrtNjetW2pMQEppncob
         wXEkQyW3oBWcLh6kUxy3xpy4sVkj6QaAM/D/oH3PthML19WS1f6APivUBiU8Mrt/8e03
         HFJE2bHM+M74xCiR5VNVEkysR0lkk9Ecr4NbATWjZ6Bceqh/8j3Ip/+R5HDNLEFioSYt
         OU+DHBv+YjvyeeYZVDb2QNDtfdPxN95fTtv2ZOWwr3px6PcmMI6BtrBqL4Zzj5EyqqTa
         TL+A==
X-Forwarded-Encrypted: i=1; AJvYcCVrYv94VSboGAl2YE1x9TZffiTB2LMi7sqRSv9DGlWdFOL/uqS+0Xx+KfiKEJWcQ3qt2J8OVoyfWNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvZiHTCtyxGbSl30zTThW4N8Lt8L8tBqIN7oYNmVLOrSWDV4Nz
	Q6b2VBgS6jII7zMk2Jvzs1IKsNQa2FSmQWlEg0dlCrdmIgC/F1ZDIJ4Ltp8GfAKHxCvDANUcdUo
	EmG0i
X-Gm-Gg: ASbGncsgRODQFHzAIBZc/FdizKN9bR9gR1IASRfv3Z9LNb3U8Hflr1SL5Fe3LHdP7p5
	xrCl1qDFJw0PfiVsHUO+scgYRgQlD+hh/GdugxYkO4N0mEpKRe8/KkQid79l6fp9Pf9sfliiPYd
	7hUmyWD3FB84i6YPQVaGRU/B9RiG/JUFMlzCdnXRQ7Bk2w5I7gZSfGCnfVvvKwCneNeHuF56GoO
	vQYY7+QGuWssgxovL0jI+IT8/ryvPhJySLJvFb1P/CFFHYFq/w4WWPdpQU8B21rmlM1mmyftjno
	KtetlVE+V2qmrYqNdoBxHUw2KGbF63TKtO6fcl6YSbPtxYFft73yCwQI2MDeF6rkGIzDkDQV9nn
	4glUSuqDdApZTQbsfNnU7MzOJip3vuc3gZ1LMFIXchWO0aTfhWVNcUXgPcZHV5u3gEehK
X-Google-Smtp-Source: AGHT+IHDhKVX/cMGvyDTUpwNB2EPLDpSvErvqRv7vfn1LMjbOYgb6LoUWKJ2l869EP53GUhyrDjlFg==
X-Received: by 2002:a5d:5c84:0:b0:3b9:13d6:cb4a with SMTP id ffacd0b85a97d-3b9fc36466bmr3543638f8f.59.1755200275381;
        Thu, 14 Aug 2025 12:37:55 -0700 (PDT)
Message-ID: <abfd11c9-db7b-4922-aeb5-381b5284fb22@citrix.com>
Date: Thu, 14 Aug 2025 20:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/22] x86/traps: Set MSR_PL0_SSP in load_system_tables()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-19-andrew.cooper3@citrix.com>
 <74a76087-e45e-4d7a-8df3-2711f77eea2a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <74a76087-e45e-4d7a-8df3-2711f77eea2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 4:00 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>> means that the value they load into MSR_PL0_SSP differs by 8.
>>
>> s3_resume() in particular has logic which is otherwise invariant of FRED mode,
>> and must not clobber a FRED MSR_PL0_SSP with an IDT one.
>>
>> This also simplifies the AP path too.  Updating reinit_bsp_stack() is deferred
>> until later.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I wonder why this was originally done in assembly in the first place, when
> we aim at reducing tghe assembly code we have.

It took several iterations (and releases) to get the setup of the
supervisor tokens correct.

I can't even recall if we had load_system_tables() working like this
when the first code went it.  It may have been following a subsequent
clean-up series.

>
>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -65,17 +65,11 @@ ENTRY(__high_start)
>>          or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
>>  
>>          /*
>> -         * Write a new supervisor token.  Doesn't matter on boot, but for S3
>> -         * resume this clears the busy bit.
>> +         * Write a new Supervisor Token.  It doesn't matter the first time a
>> +         * CPU boots, but for S3 resume or CPU hot re-add, this clears the
>> +         * busy bit.
>>           */
>>          wrssq   %rdx, (%rdx)
>> -
>> -        /* Point MSR_PL0_SSP at the token. */
>> -        mov     $MSR_PL0_SSP, %ecx
>> -        mov     %edx, %eax
>> -        shr     $32, %rdx
>> -        wrmsr
>> -
>>          setssbsy
> This is ending up a little odd: The comment says the write is to clear the
> busy bit, when that's re-set immediately afterwards.

That comment is about the wrssq.  I suppose what isn't said is that
setssbsy will fault if not.  How about ", so SETSSBSY can set it again" ?

~Andrew

