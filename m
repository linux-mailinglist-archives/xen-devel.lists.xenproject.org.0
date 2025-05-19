Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEABABC732
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 20:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990097.1374035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5BD-0004xv-SL; Mon, 19 May 2025 18:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990097.1374035; Mon, 19 May 2025 18:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5BD-0004uo-OC; Mon, 19 May 2025 18:25:39 +0000
Received: by outflank-mailman (input) for mailman id 990097;
 Mon, 19 May 2025 18:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH5BC-0004ui-NP
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 18:25:38 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89f2adb-34de-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 20:25:36 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso869224166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 11:25:36 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06eac2sm633858666b.63.2025.05.19.11.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 11:25:35 -0700 (PDT)
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
X-Inumbo-ID: a89f2adb-34de-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747679136; x=1748283936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/rjIQCBKeruqH8Cp+9464FqFbhFXXAV61zk0uTknmU=;
        b=RM2sbBig1x7kcDZYv38h7BazmLOyeWVuF1R4VWTLAntFfuG4Bne+q+y9o9QD2QazdR
         36Iv3cCHv8WuPF83FaL4SWaop1cXCbd60M24nl+0SdcdgcbgPUrW2VA0PHC0aczteiGy
         VhZrJGWCNuH4VGEJ6njWxnOYunJawZYTGGlwHEOJURPWsvfyd1MTSrPfdN9MgiK/dCPc
         aNMuD8UpqSzVu+S/E/SxLx0oA1oxyvS4zkcF83Ll7fQT3ZyD0BWduwtBOdcNDxWmk2He
         K/mtC9J2yxplXPQ6ArOmM2IsIae8xGqs3Y9vhdEDbMF9W1aUj6Bc+SpACoSmWvQO9WFn
         EL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679136; x=1748283936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/rjIQCBKeruqH8Cp+9464FqFbhFXXAV61zk0uTknmU=;
        b=AkacFoj5PvhQ5eTy1qUJE839oYKPa0uxFNUhE2KoqIPc+ebQ96UxK1kzGfq2T2ltKC
         TmDtvS1XAua+mzupreMw4OaI6kQv4t555yawNdgjSvSwnk47bQhHyHf3+W7G7QMaYuhD
         pmxXpAlIDqW/7HcmjYNYQaDq1nngBK7f3lKe3iHYAcrYYyOZ0DOIxxa3Kx2jRt40Kk/4
         pM8DiTpCWk5fIt8wQ+wsahxOiDmkzuTOCA0dcBlTqiJLh3egN90/lmePqcBL0EjGXTvh
         jWoUOPl7z4OzhofStizdmF6etwYep35f14302zUmCRLodJDeXBHvnQPSX/tdpJD76psd
         iPlg==
X-Forwarded-Encrypted: i=1; AJvYcCWE0t+DOCEzRDY5wQTI4oxzhW3EG4Wt+dGKMSA7cAYw3W3rqIJ0NjwuL+G6CAhDvfiDlLgXGl+j8GA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw95nH6ghlJs/wQ5KssO/g5cwrFoEbNttNGvbqAh7gdxadnWAuo
	yyjGSx+VOlyeLrPH3CRFhHH6NYUuoqTURlP9LVDZR5rKVZWVUyQ43uA8Grd5+I5Lix2TZ4nL+b2
	qpyk=
X-Gm-Gg: ASbGnct9o9D1j1dW8epICZu4Jx38crviUKQRh6Vu1O6vL/+YBon29qxZfDNJYUpGwbv
	mYcT6jF2bZhCmCuymbdctcSMxUKcRkB83wEgEsXQ1d+lg8dO36IZ5dWoGh+QBWZ3A2PwkxI+byZ
	anYCJj77zhCPe8U/XPIi8oICPTmuqmKk3t96b28M9xmPAAVCMX5dtKad8gOSRRjlP2B70RZzJup
	BLTJwrk48m6KyOQ3ClkRkcGMK0PjnWj9Vpt6Bsm5tvfs1bA1cSWm3xqHhR9c5hGGYHmmQLORulz
	z8ZyrY4np34HGlKHnNklx0UAUGtmUx424enbPXVxuEBIBf0hIBrcgs6ZwjNgMg==
X-Google-Smtp-Source: AGHT+IGPZRIk+IkiMFLLJXxsto8tf6DT7jRLXt6Etl23qEUgCc8GJqAaIYAmvFMc+RcLzOyJHzmQjA==
X-Received: by 2002:a17:906:e4a:b0:ad5:3156:2c0c with SMTP id a640c23a62f3a-ad531563099mr960496166b.26.1747679135951;
        Mon, 19 May 2025 11:25:35 -0700 (PDT)
Message-ID: <0e88db3c-0d68-4f4e-ba7c-e826dc0b9cd4@suse.com>
Date: Mon, 19 May 2025 20:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in
 memory_type_changed()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-7-roger.pau@citrix.com>
 <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com> <aCsRJBmoP-al6Kgk@Mac.lan>
 <558c7ec2-77ea-42e6-8568-af8b74e19c88@suse.com> <aCtBRV3cTwTnKuLc@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aCtBRV3cTwTnKuLc@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.05.2025 16:33, Roger Pau Monné wrote:
> On Mon, May 19, 2025 at 03:22:32PM +0200, Jan Beulich wrote:
>> On 19.05.2025 13:08, Roger Pau Monné wrote:
>>> On Sun, May 18, 2025 at 01:44:49PM +0200, Jan Beulich wrote:
>>>> On 16.05.2025 11:45, Roger Pau Monne wrote:
>>>>> Not sure whether this attempt to reduce cache flushing should get some
>>>>> mention in the CHANGELOG.
>>>>
>>>> Err on the side of adding an entry there?
>>>
>>> Oleksii would you be fine with me adding:
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 1ea06524db20..fa971cd9e6ee 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -11,6 +11,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>>>     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>>>   - Linux based device model stubdomains are now fully supported.
>>> + - On x86:
>>> +   - Restrict the cache flushing done in memory_type_changed() to improve
>>> +     performance.
>>
>> Maybe better to mention function names here, saying "after a memory type change
>> by a guest" instead?
> 
> It's not just "after a memory type change by a guest", since
> memory_type_changed() is also used for toolstack operations like
> io{mem,ports}_{permit,deny}_access(), that strictly speaking are not
> memory type changes,

Sure, I'm aware. But I didn't think it would matter that much here. Still ...

> neither are done by the guest itself.  I could
> reword to:
> 
>    - Restrict the cache flushing done as a result of guest physical
>      memory map manipulations and memory type changes.
> 
> Does that sound better?

... yes, let's go with this then.

Jan

