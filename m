Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3FA88A42
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951058.1347200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ntr-0000q9-W5; Mon, 14 Apr 2025 17:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951058.1347200; Mon, 14 Apr 2025 17:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ntr-0000nN-Sx; Mon, 14 Apr 2025 17:47:15 +0000
Received: by outflank-mailman (input) for mailman id 951058;
 Mon, 14 Apr 2025 17:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Ntp-0000nF-RC
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:47:13 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c906ffe-1958-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 19:47:08 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso23234385e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 10:47:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f206332d9sm183888295e9.13.2025.04.14.10.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 10:47:07 -0700 (PDT)
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
X-Inumbo-ID: 7c906ffe-1958-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744652828; x=1745257628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D+ZTLK5F4QVm4cBK91Izai1MfaPaGvYckIVB8q61zuc=;
        b=q4oE+Rm28MkNZQ2xQvTcbH0ZF2l+tyx1GrwSYKtKmkSVKryzqFXm9MGkMfm4xlgziw
         VwleRAS8h580DSrUHEeJ4puqmpSLNu+4WQedXs9WEVcW7rrSHiUEZXyKQQ7bhPPsw2iW
         kd53KGZB9RvenevsIhqcShn40bf2t6eJclWGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652828; x=1745257628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+ZTLK5F4QVm4cBK91Izai1MfaPaGvYckIVB8q61zuc=;
        b=MWk1PZlK0E7/W0ZIBd8P5yWUax1oVEe/VGUoqvt3tSf0YNudNv6z9ZncBAaOigQfOq
         mmLPhFOEq5asRE1bM/IvTENFRHRjnX2UHofEA/MGwvP0zFywp+TxoCNTAWBmLxOesl3C
         udGCvXYHw0TP5kaPQOOaI7QaDmdoJyB5czMPl/DZq5dla8YzFo3OJ8om4VbxBbx9aS74
         j6NgOuq9ymTMe6Pwca2LAz0PcP6XHFsEL4j6Wxb8kwn0eS0csfUDkIxcgJKUhArpbN1s
         YZMctVrF/Dzn1EY3/JGq+tJbwBOAfoOzSuWIzMqspUb7TdMKR/Qb+zazKurhpvkloFVe
         qvig==
X-Gm-Message-State: AOJu0YypCxfGkgHb8dPgfyOmBDPyOF14nADzRw2wuG14cMWbjWQiQ/R1
	o8RJWjv5TUqm+6NC/I4bUSHp9eswm8Oo8ZSyiFhKiRIDmbe3xYU7Ml2JBFoV4YY=
X-Gm-Gg: ASbGncv7+bJDr2v8F5n100NMFP8eKevXOz5Pkk9NIy5dT9lTRY5OlaovYibhepkafgh
	W5DyU9ca22e7M/QbzKnxjF5r8zKTbA57xwFPPT8o8hwN+pGmpYovWkqbNSNa8JM0+rzOcuKDfq5
	VCQUYOxbqnUkWsBZLg578nYWgj2jWkBkyovsY0cz+aYgpTEqKvhJazfCjGgZ6TjS0BM0lLm4guK
	ifY/XmZJzQs1y9TJ/Z+9fem7xVGZd2KI8FVQaXkOr2JuL5Zmn+kRfSPsf6H+YSIybGgJ8NhaI+L
	EXMLfRkIk/rzXhqdA2k2IfNFsS3VNOAYH65gLzFUHwhKqpL63DXwF7sWbjde1gLWg2+TzbE6aO1
	Brq0nNQ==
X-Google-Smtp-Source: AGHT+IFaDO2xIi4Yj5rfEf+6nj7BF5o/eAKXslRPECIMjhNNbCZKs6CTaWT9c0CRkbIkuFwr1rJe1w==
X-Received: by 2002:a05:600c:4f83:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43f3a93d78amr114342985e9.11.1744652828124;
        Mon, 14 Apr 2025 10:47:08 -0700 (PDT)
Message-ID: <e0bfbfa1-4130-420c-8db3-4ac520ac49de@citrix.com>
Date: Mon, 14 Apr 2025 18:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] CI: Include microcode for x86 hardware jobs
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-7-andrew.cooper3@citrix.com> <Z_1JuudeZAXihzwb@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_1JuudeZAXihzwb@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2025 6:45 pm, Anthony PERARD wrote:
> On Mon, Apr 14, 2025 at 12:09:03PM +0100, Andrew Cooper wrote:
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index 1b82b359d01f..ac5367874526 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -306,6 +306,7 @@ alpine-3.18-gcc-debug:
>>        CONFIG_ARGO=y
>>        CONFIG_UBSAN=y
>>        CONFIG_UBSAN_FATAL=y
>> +      CONFIG_UCODE_SCAN_DEFAULT=y
> Is there a change

DYM "chance" ?

>  that this patch series gets backported? Because that
> new Kconfig option won't exist.

Yes, I do intend to backport this whole series in due course, and yes,
I'm aware.

> Othewise, patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

~Andrew

