Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1649F7A78
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861182.1273166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEoQ-0005Aj-I9; Thu, 19 Dec 2024 11:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861182.1273166; Thu, 19 Dec 2024 11:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEoQ-00059C-FM; Thu, 19 Dec 2024 11:35:26 +0000
Received: by outflank-mailman (input) for mailman id 861182;
 Thu, 19 Dec 2024 11:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+GM=TM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tOEoP-000596-48
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:35:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55e2121c-bdfd-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:35:23 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so4576955e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 03:35:23 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366112e780sm15733395e9.0.2024.12.19.03.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 03:35:22 -0800 (PST)
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
X-Inumbo-ID: 55e2121c-bdfd-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734608123; x=1735212923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KOJblgNEYRjxP0OYgB505u61d61EOpJaBp9eHYxo0vc=;
        b=qAAff/a8vNPVC335xZUhgO5UAotX7tAd6nPZWP/TcIlTRe6oJJYR1K1FzeJME4KN0y
         av88zPRRbN+Q8IPN/AQX+9tkAIoEvYUVPh3sdpGNZIR+lacb8DSknqNF43Cf65eUg3bC
         SI5boYh84zi2oTocS6gAVVhLRFRbg8vVwU3pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734608123; x=1735212923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOJblgNEYRjxP0OYgB505u61d61EOpJaBp9eHYxo0vc=;
        b=d62NdsIGp9zxCErzkSAV541xadMMYpcLRGp/HUPQyTG58exAhw1RqGfdP0wZoZIdeB
         0Rer3/ZprkV1ogHoXrj53edUEOZ+f+R258dbLbNeGGtwcTBLLilZPAB8H23mEYubng7A
         8cvDHoh9Rf5k/o38Clw8LwrXE9N8rwvDu6aCI2q7CKnlns4wuCZadLjXcY42aUDm4aD+
         cRTYHS+2ANSQrtQQlEWt+JsOq0lWvkg5n+vrVFVRR5gbFACtL+Za5HNgasAZUPQpFCFP
         VF5q0Iyrh6DlPtMiu0EtlPBatUk1NnWfkGNEAeJ3bvEZeQBtRTtAd/ZwEIJiMhp90iTx
         pDsw==
X-Forwarded-Encrypted: i=1; AJvYcCXTP9xg2nhzcFhP7vWRNS7NyLjJ2fxsHY/T6649fPl34mBXT8QkmLeLxk4w9Xs3mqOsrtPPUVu+bak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI/xavI1VYMTP3K8EJ4DON1gn6xSIeoLGxSbTaWU4tLvo8Zpwn
	eA5RnnRnExxk9Zv+WIgV31mp69JaOgIdOEAyJQYCu9RO+4hIw5vjdbGF/DcOcGY=
X-Gm-Gg: ASbGncvhDhxnUHFtK0iQ93s8y/n9cDNLM/9Xv6oB2cbuHExdjowX3DJJBAkK4U0XQQC
	J2LZm/Dvd8/Crqg3C5wNhkzB6YDy8yFclB/JzWY6zK60x+m5oPwOhZbdSTlT9vA4wDiIldM07Q0
	xC5GWNodqntFklkL1amVbHAvvyojP0BZ+C4nOoy0LY7gaZcmcywA7WeE6ZJcYp3xa40sL85ytes
	CjPvFMV02EM14zMtLt44auznpzvaYGxYOBb0NVeBobXKsojvaFrkhiXYEAuyRfQ+8J2zNBON2PI
	rdl9OKomAXLl0q4X5rkC
X-Google-Smtp-Source: AGHT+IGF2aSoovgPII+Q/Sfq8Y47kck4pzlxKC/7I9n9kpUMYPbqqOEc1DLZF0Ng9zHD0Png1bDJJQ==
X-Received: by 2002:a05:600c:5107:b0:434:ff9d:a370 with SMTP id 5b1f17b1804b1-4365c7415f9mr29994765e9.0.1734608123265;
        Thu, 19 Dec 2024 03:35:23 -0800 (PST)
Message-ID: <c0d6b3ad-b8b6-4346-b7ee-aef520a7ea27@citrix.com>
Date: Thu, 19 Dec 2024 11:35:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hvm: Use constants for x86 modes
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
 <20241218170820.364253-1-andrew.cooper3@citrix.com>
 <2d6ce1c9-dac4-4b00-9157-07ab6987232f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2d6ce1c9-dac4-4b00-9157-07ab6987232f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2024 10:46 am, Teddy Astie wrote:
> Hello,
>
> Le 18/12/2024 à 18:08, Andrew Cooper a écrit :
>> From: Teddy Astie <teddy.astie@vates.tech>
>>
>> In many places of x86 HVM code, constants integer are used to indicate in what mode is
>> running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these constants are
>> are written directly as integer which hides the actual meaning of these modes.
>>
>> This patch introduces X86_MODE_* macros and replace those occurences with it.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Teddy Astie <teddy.astie@vates.tech>

Thanks, but as you're not a maintainer of this code, Ack doesn't carry
any weight.  Reviewed-by OTOH would, if you're happy with that adjustment?

~Andrew

