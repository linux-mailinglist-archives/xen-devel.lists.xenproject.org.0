Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D4ABDC65
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990801.1374728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNsf-0005BE-AX; Tue, 20 May 2025 14:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990801.1374728; Tue, 20 May 2025 14:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNsf-00058z-7E; Tue, 20 May 2025 14:23:45 +0000
Received: by outflank-mailman (input) for mailman id 990801;
 Tue, 20 May 2025 14:23:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHNsd-0004jQ-VD
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:23:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07e7e35a-3586-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:23:42 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad216a5a59cso797238966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:23:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cbe90sm733285366b.165.2025.05.20.07.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:23:41 -0700 (PDT)
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
X-Inumbo-ID: 07e7e35a-3586-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747751022; x=1748355822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdmLR8LVJAce2rpsLLAGcvCK6hz9bQv1dHblOeRnbJA=;
        b=IO8qYyd7NmPinEhYPlaG8qg0w8zkSJtu7H6aqN8hA7jJ9miuIreyrD6ySNAwRm7fbL
         fL6TqIWxOiZ3elbClyPBJnPAXHnbh5714Phuw362/Xv67i1VV50Fyaj4J2xFfaj5sbZP
         9TfDTyaGwx8FQtAfW4zg7PSpNL7PP5lcK8p5dIxH3OjeiMYvjB74yQ0/ugcwiXDVlRGJ
         j7tV7l5iK5y2CoGMRIoszmOUiVC9X+vp/UF9BGujpzvixkWlT4B2AdFL0wdN+z/1MrRE
         vr1O7hRPhwooVzcIN+xE0DNo49ZSFZZQgLgDLGetCEnSrPI/FnzsK7YTZxrJtOZO714i
         kcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751022; x=1748355822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdmLR8LVJAce2rpsLLAGcvCK6hz9bQv1dHblOeRnbJA=;
        b=xCfkLr2tttcJSOudwj4Oa3pQzYZnGmyqaI/28E32oajoFKPT4bZ5+aoYXDEIu7qOvK
         z4wcjXlAPPGIRAmqNp8iYUQ6dsw62yjuQo+FgH3yXmiFIaoFm1BKSM4sGIHSd3UoIfot
         BGby+ncx7RWenJKdlAPfOFBXYwNf9zCbpub6Qkn63Jrvl8WA7hNQH3dufEgqCywMAXBV
         jfsItTYjiYN9r4kxTSL9JLbcOA1BDNL6CfANxTlTXF6//f6qkQbUR3AXoy8UajcuhXSI
         VALT8Nf3Ffn8EOaPpuAxkMX0LFDSlbmQLJptukBPvC3Q9uWa3W8346Ed+A8uBOMMm2uR
         04Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVfyiXpSCg85QkCJWPGR9g1uF8+w3Guj9A0UGDfgoWa7lwhReB8gItQXSeMXiVcf2l/ER+HP/pmOCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv+oRb977rKxBqnyk8lWh7TP7W8MuNS3EVsk6ehGaz5l5MAVcK
	u8BrlVeItygv8OH2AF+kgtE35oi2Y4txLZeo2jYWKfxGsnJCrVTDxYYVJPhw4Q==
X-Gm-Gg: ASbGncuiDt5YnsebNTdmCnZp3ljSFPgXjTko7LZ6EHz7vtByK2nHOzAd5zTO/ucGoez
	viX24Jc+KmqalkCdFN39AZ75yuNy76qvrB1MPJt2ZcwZWPSH6pFzVrqDyEdKqM+uGRA2zWn55Ja
	Ms7fkQd7eesijFZyuF/OHeWqr58QozasckqeU5D1E7d49RBmnE+98HX7tnJ/OcwSMGNKQwZ/Eks
	j+WaccV6yrDkvI1bloEYVRe70MwVWjz50ds22Gu0xs4eXhKzXZ75RTmxoO1cyxI0VnTqVOhEKDo
	On/52Itd6n3PPmd/RwNxl51LuHty3TGCLeZRuqZZsgHP4zubBwMF18o1LjteTlSDufN4GkJD5RH
	4dvMU9bYC4cwxqAS0GtFIz5Mv
X-Google-Smtp-Source: AGHT+IHnya3Xgt/9gKQvNLReOaOYfiUJF+Fgain9YBbPS8iFLBZQEROpRRaVbXSOYNgXohb3P6Qf7w==
X-Received: by 2002:a17:907:1b09:b0:acb:b900:2bca with SMTP id a640c23a62f3a-ad52d07636amr1515316266b.0.1747751021507;
        Tue, 20 May 2025 07:23:41 -0700 (PDT)
Message-ID: <4357f6bd-d74a-4439-892a-4ad7735af9e0@gmail.com>
Date: Tue, 20 May 2025 16:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in
 memory_type_changed()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-7-roger.pau@citrix.com>
 <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com> <aCsRJBmoP-al6Kgk@Mac.lan>
 <558c7ec2-77ea-42e6-8568-af8b74e19c88@suse.com> <aCtBRV3cTwTnKuLc@Mac.lan>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aCtBRV3cTwTnKuLc@Mac.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/19/25 4:33 PM, Roger Pau Monné wrote:
> On Mon, May 19, 2025 at 03:22:32PM +0200, Jan Beulich wrote:
>> On 19.05.2025 13:08, Roger Pau Monné wrote:
>>> On Sun, May 18, 2025 at 01:44:49PM +0200, Jan Beulich wrote:
>>>> On 16.05.2025 11:45, Roger Pau Monne wrote:
>>>>> Not sure whether this attempt to reduce cache flushing should get some
>>>>> mention in the CHANGELOG.
>>>> Err on the side of adding an entry there?
>>> Oleksii would you be fine with me adding:
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 1ea06524db20..fa971cd9e6ee 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -11,6 +11,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>      - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>>>      - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>>>    - Linux based device model stubdomains are now fully supported.
>>> + - On x86:
>>> +   - Restrict the cache flushing done in memory_type_changed() to improve
>>> +     performance.
>> Maybe better to mention function names here, saying "after a memory type change
>> by a guest" instead?
> It's not just "after a memory type change by a guest", since
> memory_type_changed() is also used for toolstack operations like
> io{mem,ports}_{permit,deny}_access(), that strictly speaking are not
> memory type changes, neither are done by the guest itself.  I could
> reword to:
>
>     - Restrict the cache flushing done as a result of guest physical
>       memory map manipulations and memory type changes.
>
> Does that sound better?

Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



