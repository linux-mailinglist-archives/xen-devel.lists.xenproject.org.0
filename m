Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CDB304B9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 22:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089256.1446902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upBls-0001xL-EW; Thu, 21 Aug 2025 20:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089256.1446902; Thu, 21 Aug 2025 20:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upBls-0001vr-Bn; Thu, 21 Aug 2025 20:20:28 +0000
Received: by outflank-mailman (input) for mailman id 1089256;
 Thu, 21 Aug 2025 20:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upBlq-0001vl-IR
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 20:20:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455266a4-7ecc-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 22:20:25 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0c52f3so8801875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 13:20:25 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e2ba619sm19626135e9.4.2025.08.21.13.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:20:24 -0700 (PDT)
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
X-Inumbo-ID: 455266a4-7ecc-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755807624; x=1756412424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZmlsXXr7MMKjZkwN+neQ4WEGzqzDzNyCksWjHidiDk=;
        b=XSoce/E1CZ3Ybl+hzsaYjZdBEGb7LLDtYova/0TXj0Di8q1N3Dkd6G+9D8UXTUq9pQ
         uEfDjOHu+u6n6KQ8uFI0lYMhUtSXOIEtfOAQcPy8m2PTRiWiaLvwusLRpIIX19vsszLx
         y43EXnBSgLqCs0RfzDsz8wECyjr2NNvTQnoPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755807624; x=1756412424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZmlsXXr7MMKjZkwN+neQ4WEGzqzDzNyCksWjHidiDk=;
        b=A/6I8q0sGipBBfl+qjRaUheIkwrDXYfhQHKrWcjVK0PtxTB2X0mlzdiI+hEMFkf6pR
         2QLyMnFuFrqAQbPw6XCOZ142Cp7vxuSqqiCbrvsT4VH13YCKuqMGf17V3OkKFya6RMFK
         grH1cUFSWyXaYErigoepaF18jnkNo3xwt3H6ToCMtdksczY3GQx5Uy0FKqv8H+7QtwrH
         Cp+fxXx2eJrB+4WkTl7mjOZdjDGHkls9fFDNJ2YpmqpYAIaGWNqOdrxJUsdfPiu8gWh0
         GPxJXP9dAV9ea1qLYXYdWs9/TjqFa0SCXo3XAxFT16lgHDgM8cGonjGg+iTtIEUPesGD
         QeSw==
X-Forwarded-Encrypted: i=1; AJvYcCXJBieC/6zEEcQ5qm5ujgck00S42npn5QP+Ao+5i+a771cTNl8J6oIXscKiszUYfo/ux0jGUTKSibY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM/hrPx/uQEAmgtgiQjlvG2/BL+qOde6xfq/Fesw404h+H0lkv
	C7+hoDdvaQl5j/0CuYx/R6w5iIv2POmuJkMjuOIWSXMau89fO93peWWCf95zX8A12rxKuRRyMFt
	BixKs
X-Gm-Gg: ASbGncsQIUaUVjihE9AhRUspUegQNvTH3DCqxPinmYeOqs36VACvnLUT07JJzvo1gFF
	eTNOBt2+TyL0T09AM5ziqjuX57meEev1KMxXa9VMSEyUUiFIqt2QVzQJG4XatDeEohtMMcY+uIr
	HfKP3A2i5+tHoAP56fxzi80sVNeXLjdNm20vZlBl61UR24N8EtSHJsLHopmtRycjeZ3lGX3I8Ea
	JsDIRd91W/33mvxzspYXQXR17GBWDMQjRZjsnAfmffAWJlM9ob0ALl/JZT79kCxbfSoWlZlEMYa
	1EhfortaUrXBGd77kESrRjoLcfCSxWvjelYXGhBHKg7FfbNmLY/zW36g8fhQSFj/Zc/o+ya6c5Z
	qvt9PowfzEnNw80oCdycQtqOer+9MoVha3qITXO6/2e2Y0qLvAan/GPxummFqGxf83h0TDJhKzZ
	0OBCI=
X-Google-Smtp-Source: AGHT+IENnqootj7VGAvKt+n4syzu92a45LYVrJltE6hUAvO/C4YSUPo+Pe/6OJu8QzKyPEJUvEyzJA==
X-Received: by 2002:a05:6000:2211:b0:3b8:f318:dc61 with SMTP id ffacd0b85a97d-3c5dc73523bmr191389f8f.40.1755807624452;
        Thu, 21 Aug 2025 13:20:24 -0700 (PDT)
Message-ID: <4d07f29b-006a-46ea-845a-3f21ce246f44@citrix.com>
Date: Thu, 21 Aug 2025 21:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] x86/fsgsbase: Split out __{rd,wr}gskern()
 helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-15-andrew.cooper3@citrix.com>
 <740ce507-de96-41e0-a5ae-999b5b6d8726@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <740ce507-de96-41e0-a5ae-999b5b6d8726@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 2:01 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> Right now they're inline in {read,write}_gs_shadow(), but we're going to need
>> to use these elsewhere to support FRED.
> But why "kern"? We're not dealing with GS in kernel / user terms, but in
> real / shadow ones.

Because it's a common name that also has the property of aligning nicely
when used beside GS_BASE.

But fine, I'll rename it.

>  I'm also not quite happy with the double leading
> underscores, fwiw.

Consistency with the similar logic.

>
>> --- a/xen/arch/x86/include/asm/fsgsbase.h
>> +++ b/xen/arch/x86/include/asm/fsgsbase.h
>> @@ -32,6 +32,17 @@ static inline unsigned long __rdgsbase(void)
>>      return base;
>>  }
>>  
>> +static inline unsigned long __rdgskern(void)
>> +{
>> +    unsigned long base;
>> +
>> +    asm_inline volatile ( "swapgs\n\t"
>> +                          "rdgsbase %0\n\t"
>> +                          "swapgs" : "=r" (base) );
> Again strictly speaking "=&r", if already you open-code rdgsbase() now.

As before, why?   There are no inputs to be clobbered, early or otherwise.

~Andrew

