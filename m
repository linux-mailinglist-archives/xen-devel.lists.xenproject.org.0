Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BBA74E8C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 17:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930938.1333447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyCbm-0004Ca-Lt; Fri, 28 Mar 2025 16:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930938.1333447; Fri, 28 Mar 2025 16:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyCbm-0004A1-Im; Fri, 28 Mar 2025 16:31:02 +0000
Received: by outflank-mailman (input) for mailman id 930938;
 Fri, 28 Mar 2025 16:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyCbk-00049v-Qz
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 16:31:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077c7667-0bf2-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 17:30:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so22086085e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 09:30:58 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm3183182f8f.54.2025.03.28.09.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 09:30:57 -0700 (PDT)
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
X-Inumbo-ID: 077c7667-0bf2-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743179458; x=1743784258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ajohcOtArAPciv6Z1xu+3HliHHeoWMjbybvOD1Cdez8=;
        b=L7bMTMZNEM4jG1H66SPhX/McXUah6XyXBy8ZVQYXTG6bX3wE6BDSb/1H9jFBFKR6ik
         uBAj8bM1K21pEhXC1prsu06iGFJmL1X8dd01WQjtrBGvatu0kEawHdL2UjVL9BE0opFg
         VMuPcUKH0HAB04ehT6/uYwJIUQzMhBxXGOS7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743179458; x=1743784258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajohcOtArAPciv6Z1xu+3HliHHeoWMjbybvOD1Cdez8=;
        b=mOAlQUrdJfuRQiXJst+NL9sKB61fpeEWPfQu8jJJj8+sS+Ad2vCOQEWk/iZAtSUlLw
         rn6Oeq5fNGMIo3n1yORdKj71yM/P8KAV4hDjr+xOVLHloF+K3iIvLruYmdrahieVBD4B
         51x827+6DGEFeUTiKUQvf+K0OPdNHOnRuSMOeVBreYq/B4pMaAvJkNDq5SqRRlloBhYK
         HQSJOaF/5Y9my/sf38Z4x3A3AiGzVrl+YioV5IhxKbyppNMNLeTa+NM9J3iDwIiJQNNh
         DTQk8OiiumviavnuMdyUXG4pnmBfmfRZ8pvxTfkjOO8nXxeNnY4NOCQlXS7S8PFCegUE
         Jbpg==
X-Gm-Message-State: AOJu0YzMja2GHc1vjylkLr6gdAV3vfMPhbzVCi8FJENMqS3/2foSz80l
	pORnfnj8Z6DaPmHhkQL4dzKNMxQn+YgqXsh6FlFFgwYt65We/4ZFQvUM42u8Dqs=
X-Gm-Gg: ASbGncvBDJ0T6AI5KbTVVfXNOOK04P3wJ/Tj+DuYQhq7pOGifLXAHClckLazpbfuoNl
	RPDgDAtzggUT6Q8F4IddU8GJaHrgRu4ZHVVWLze3ItwOLsWHuMbEH8oXLlsBSSh48QnNZhXYGa8
	IxImgUoWdS93XMLW36n24blgY+iIdjF6hph3uVtD57nydHhaHePFElf3cJlGKUv0YVowHrwybDk
	sahwe+Fr7Ivuy44EvaVRU4Axj2ChdpfAoWu+4mr9JxP47O06myekTccasNNvq67HK7wa6LJEEzf
	hkYHHeUOCcf+j/878mchVJ4OT9dEf53AThvqsQk6b+r3L07Sl4qmlol3683YdFIangPN5KafxW9
	mBtIRTWKSjQ==
X-Google-Smtp-Source: AGHT+IHytOQvI2KzbbXC7N8VMsX7NtpamfRgiUPB/vcbiSPjv9EoEQeN9k2U19GTRNLfFBJqhWzm9w==
X-Received: by 2002:a05:600c:34d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43db8526487mr1094645e9.30.1743179457863;
        Fri, 28 Mar 2025 09:30:57 -0700 (PDT)
Message-ID: <279ccfd6-606f-45fd-91c2-d96bd749db00@citrix.com>
Date: Fri, 28 Mar 2025 16:30:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Xen: Update compiler checks
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250327174302.412821-1-andrew.cooper3@citrix.com>
 <Z-asrZ6OuK2lHJ_C@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z-asrZ6OuK2lHJ_C@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/03/2025 2:05 pm, Anthony PERARD wrote:
> On Thu, Mar 27, 2025 at 05:43:02PM +0000, Andrew Cooper wrote:
>> The $(eval $(check-y)) is badly positioned:
>>
>>   xen.git/xen$ make
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>     HOSTCC  tools/fixdep
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   make[1]: *** [scripts/Makefile.host:108: tools/fixdep] Error 1
>>     HOSTCC  tools/symbols
>>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>>   make[1]: *** [scripts/Makefile.host:108: tools/symbols] Error 1
>>   make: *** [Makefile:610: xen] Error 2
>>
>> It is involved every time Config.mk is included, rather than once per `make`
>> invocation.
> It's worth than that ;-). $(eval $(check-y)) doesn't print anything, it
> actually replace $(CC) by something that just print this error message
> and thus refuse to build anything.

Oh, that's far worse.

>  So even if the eval was only done
> once, you'll still have this stream of error message.

It appears the author didn't know about $(error).

> Anyway, is this check still useful somehow? Or could we replace it by a
> check in ./configure for the tools and one in either Kconfig or
> "xen/Makefile" for the hypervisor?

I'm quite sure it predates ./configure.  But I don't think there's any
reason to keep it around in this form - like this it's borderline useless.

~Andrew

