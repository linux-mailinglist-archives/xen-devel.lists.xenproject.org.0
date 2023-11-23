Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511F47F64DC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 18:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639953.997652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6DAq-0006a7-W2; Thu, 23 Nov 2023 17:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639953.997652; Thu, 23 Nov 2023 17:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6DAq-0006XW-Sq; Thu, 23 Nov 2023 17:07:32 +0000
Received: by outflank-mailman (input) for mailman id 639953;
 Thu, 23 Nov 2023 17:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6DAp-0006Vp-BE
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 17:07:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c91b2c5c-8a22-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 18:07:30 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40839652b97so7037815e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 09:07:30 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x22-20020a05600c189600b0040a4cc876e0sm2501784wmp.40.2023.11.23.09.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 09:07:29 -0800 (PST)
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
X-Inumbo-ID: c91b2c5c-8a22-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700759250; x=1701364050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6dXTmJDvOfSqRg7KUpaUNcQYZIePsctVf2lQGF8vdU=;
        b=dIMhvhXTtsKTVrdtWZBH4j4jS2+8PRPBaHLXDf+Ob/CcEv4i0IR3Ac9NHfk+O01SCE
         oNq4oK3vLHAXCaWz7Vh8wh+VdN6Uk2I9gZttH7sqnYa6THC4Hd2rAA+F2Ca3Fw6NBqd8
         cWRvgBpI8NYza1ToypRqsjaqAxdOtB9c9TLTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759250; x=1701364050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6dXTmJDvOfSqRg7KUpaUNcQYZIePsctVf2lQGF8vdU=;
        b=J6KkqojzgTF4PRsUqyYIABGG6O5TprH4/XEWIvLJQHOKbv6LKTU1uabxZn/75uUaNR
         YDyPYsYakjoy5eh2Ws6eUNVdVPX/Qwi60p/TnAC/evWImkaHg7PcGGHHUMXj4ujLp4x9
         YhFuvqnn3MhA6SB4DoBsLb3lDQCAgd44eOKmPUjB395m/CLsYEtBFeF/ow1WcahPF4E2
         OQXlRg6ISjU9hQRXy7PeRMZOA6V+DLgYxN2d6QxIAXMQbmuA6ToeCOIlopZrC0DEZMLt
         Pd7ZDYnUcy5mkVClqbKjadkM3btU9p2ChxUGc4LAvUIOVWfhIZiB+HLVUU2cygg/EDWu
         5o8A==
X-Gm-Message-State: AOJu0YzziRTyeP7CHx7YwEj1SupMxGBvRtE+KfpxR0geVcdUJsZlbEfc
	s0qp1UkWr6oowg+q6ggqoSnkT7KTM+wE2gVhnCk=
X-Google-Smtp-Source: AGHT+IEUOmmGOJdy4YHRz70zhS5ES8cwkMYJ3Ibj7YUD9L3zeKKej2sTKSdwqQw+ftnHFPWEPJiNZg==
X-Received: by 2002:a05:600c:1d10:b0:408:5ba9:d707 with SMTP id l16-20020a05600c1d1000b004085ba9d707mr172569wms.16.1700759249794;
        Thu, 23 Nov 2023 09:07:29 -0800 (PST)
Message-ID: <476ba35b-947f-4cf0-8988-55ea8ae0d093@cloud.com>
Date: Thu, 23 Nov 2023 17:07:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tools/pygrub: Restrict depriv operation with
 RLIMIT_AS
Content-Language: en-US
To: Andrew Cooper <andcooper@tibco.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-4-alejandro.vallejo@cloud.com>
 <72585cdd-756b-49f6-b97f-7bb739217e6c@tibco.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <72585cdd-756b-49f6-b97f-7bb739217e6c@tibco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2023 20:16, Andrew Cooper wrote:
> On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
>> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
>> index 327cf51774..b96bdfd849 100755
>> --- a/tools/pygrub/src/pygrub
>> +++ b/tools/pygrub/src/pygrub
>> @@ -75,6 +80,11 @@ def downgrade_rlimits():
>>       resource.setrlimit(resource.RLIMIT_CORE,     (0, 0))
>>       resource.setrlimit(resource.RLIMIT_MEMLOCK,  (0, 0))
>>   
>> +    max_ram_usage = LIMIT_AS
>> +    if "PYGRUB_MAX_RAM_USAGE_MB" in os.environ.keys():
> 
> With the .keys() dropped as per patch 2.5/6,
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Happy to do this on commit.

Sure

Cheers,
Alejandro

