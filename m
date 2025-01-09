Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A394EA07C51
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868861.1280363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVukF-0008Hw-Na; Thu, 09 Jan 2025 15:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868861.1280363; Thu, 09 Jan 2025 15:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVukF-0008Ff-Kf; Thu, 09 Jan 2025 15:46:51 +0000
Received: by outflank-mailman (input) for mailman id 868861;
 Thu, 09 Jan 2025 15:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rr8/=UB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVukE-0008FP-KC
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:46:50 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0769359-cea0-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:46:49 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso8634715e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:46:49 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da65a3sm60119745e9.7.2025.01.09.07.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:46:48 -0800 (PST)
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
X-Inumbo-ID: f0769359-cea0-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736437609; x=1737042409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T2s0FnzdFE2FjkmWbN6mMjF08lODMgKgBLZSCmVE3bE=;
        b=aFtvAPjP5FHRfptpZAR3LgjnCjV558X4EN4RVqh3+dlObbLWf48rUkHyrHyzUrMyyy
         E1zGePkT1zozSDOIMPgonjPWDB72mwKhmceFim0bSGgmMfMAg7TA5A5Sl7d8znKX6IVi
         W7x7w3zEGaO19UOPksYE5f05A3lOs4LXT3P4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437609; x=1737042409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2s0FnzdFE2FjkmWbN6mMjF08lODMgKgBLZSCmVE3bE=;
        b=B9u3AXRgtjZ5fWaAFnZsT9I9BV+STscFQPqqLLyEPDMxokaLGRkmzRvYn1qjCzJpWx
         1NieMyDeMvqcmdB6WN6On0JE+jfUzVvKgzGHHC/w94/CfZX7+L58nbvigxloIUfQziyD
         5bqMnFSurJWVfZBKetBG/jwKKte9zLlbPyzns/kywaD06AhnXt+exloGPBaiDCTaHGRa
         W8Rn/+29Rrp5auMAtN5c66PQWCJXIS2SHf4EL43xaFSlhNfUPyUBnaQ7/oL5aTChMzHn
         Sb57ZmR9OK2K0cEfb21GFVj4nqB6PUxVCTCACYWwFS3XRb2LWaZ9whiBTfKjk06xCDmu
         ZY7g==
X-Forwarded-Encrypted: i=1; AJvYcCWuP5D0Vrx17NYHrydFWUFu+KEQAa0V/BgUF3dSPfE8zWwqRTsZnFPv/vTOcY/e19XDJlT9R9xDXTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY4LnYaTDIx8yAXNNcqShCG+Kys/D2FhqKpmT2O3p8eVYD0jMn
	fHIM4haPPgQLRzR7MepfyYA6iAYbnZ9wgjhxO6aD1h3AJs6gOIRnGXiDt+CCSbg=
X-Gm-Gg: ASbGncs0S6WQ8ptQMdYuO1An7W6QKG71W2HJ2l7hQfAScfEdLCxB7WcJFhrcQ3EUZUG
	PeNafKg2BUDEfVqxNtcVmCNMnm/aajPFJjCmteEe2BKlSppY+P93oU1b7AV4z07pd4acU4CNxo6
	g5vGcfozTLEXV94oWsRsxsGBZBoTElYlAdBJgQtT5aOHKuYiNsbDTKNRRZxecdUWKNLMnA3ckqx
	YYA59TtozE4SQLRPqVDFy5E99sD2b4tvKpq8xL4QA4sFXNI3/37/GoqP/alkdt8YOw=
X-Google-Smtp-Source: AGHT+IGQUNm8MiT+hldRCbc5yGSkSirzGk5f9HQuktuySCngMzvREuyAL0btlX5C9IVWSY34e5zPKQ==
X-Received: by 2002:a05:600c:4e92:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-436e2707f4amr64449745e9.29.1736437608771;
        Thu, 09 Jan 2025 07:46:48 -0800 (PST)
Message-ID: <c7eeaa80-a4bd-457f-824e-accd23c2f471@citrix.com>
Date: Thu, 9 Jan 2025 15:46:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.20-rc
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
 <20250109153921.43610-3-andrew.cooper3@citrix.com>
 <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2025 3:44 pm, Jan Beulich wrote:
> On 09.01.2025 16:39, Andrew Cooper wrote:
>> --- a/README
>> +++ b/README
>> @@ -1,11 +1,11 @@
>> -############################################################
>> -__  __                                _        _     _
>> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
>> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
>> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>> -
>> -############################################################
>> +#####################################################
>> +__  __            _  _    ____   ___
>> +\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
>> + \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
>> + /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
>> +/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
>> +
>> +#####################################################
>>  
>>  https://www.xen.org/
>>  
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>>  
>>  # Release Support
>>  
>> -    Xen-Version: 4.20-unstable
>> +    Xen-Version: 4.20-rc
>>      Initial-Release: n/a
>>      Supported-Until: TBD
>>      Security-Support-Until: Unreleased - not yet security-supported
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>  # All other places this is stored (eg. compile.h) should be autogenerated.
>>  export XEN_VERSION       = 4
>>  export XEN_SUBVERSION    = 20
>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>> +export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
> Since we'd been there before I take it the .0 in here (which isn't in the
> changes to the other two files) is deliberate now? Clearly I continue to
> think it shouldn't be put there together with -rc.

Oh, that's because I cribbed this by looking at the recent releases.

The documentation leaves ~everything to be desired...

I can drop the .0 here, although I shan't repost just for that.

~Andrew

