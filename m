Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1CE7F64D0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 18:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639950.997641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D8C-0005rC-IL; Thu, 23 Nov 2023 17:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639950.997641; Thu, 23 Nov 2023 17:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D8C-0005pL-Fk; Thu, 23 Nov 2023 17:04:48 +0000
Received: by outflank-mailman (input) for mailman id 639950;
 Thu, 23 Nov 2023 17:04:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6D8B-0005pF-3C
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 17:04:47 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a4ff55-8a22-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 18:04:45 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c87903d314so13981631fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 09:04:45 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b004090798d29csm2590823wmq.15.2023.11.23.09.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 09:04:44 -0800 (PST)
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
X-Inumbo-ID: 66a4ff55-8a22-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700759084; x=1701363884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ii/MpepE/7ykm3O7eF0wFiPiMw7DcmNEyo33n31iXos=;
        b=HcQCnGj2sJ7jm/v+HtqT4AztjFB0P9rTxUTZoYrcf46CMJLFWOlSjPE/15nKIYlpwj
         FqsLmVGgpylZnxT/JPjhl+C3xoMTBLJ6yhKENgAMZKWo6uwHZBaTRVkuDxIXdcAwgqRJ
         682NBrM5NeydvKOgkilvH1TVoXOTiMOavBDrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759084; x=1701363884;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ii/MpepE/7ykm3O7eF0wFiPiMw7DcmNEyo33n31iXos=;
        b=thsiR4AdluJ+dMM674bm8ab9nDnEdwk1OE860A9uovl5VZEQIn11VO/bZveWtin0ZC
         vUv6o9d+VCet3SiOBoIj24C2vsAV8c1eXj3t2fBUvL37fKJuMDQ9wGN6O3Hh0BjdeqIA
         AT9G19jA3XTZHcFw8wAg6yVKlFt9kJDfKhmp17XeSPUFDAFu5mQfRPMi4OGVpy2aQNMD
         5FJXV9isUdXF71Ve9SfivHS4qr1dmWkg0rELdGjP6r8WjqDpUR59Vy/3/t/htcg4QFp9
         a8xOK45yAVO4Y1RJJ89LLgKYqraPm0pE3EYNx6jDqY93AI/5VM491T25NtWz29pd5UXS
         Fz9A==
X-Gm-Message-State: AOJu0Yym636mqMbqQv1ZFPXLGm8k3GT8rNfUxX3pvFF2wlLKzNDxRh2z
	58zFNkGqP/5dj7R0FLgGwetfbg==
X-Google-Smtp-Source: AGHT+IEHT+sDpq+njGv5GTew5qzwsW/vluJaD4o5E3UmlavmIuu1BAEXtwWxfQTGB6LiCht+Im6jgA==
X-Received: by 2002:a05:651c:1047:b0:2c8:8813:2e7b with SMTP id x7-20020a05651c104700b002c888132e7bmr4236009ljm.2.1700759084671;
        Thu, 23 Nov 2023 09:04:44 -0800 (PST)
Message-ID: <6d93bd3a-7dca-44c1-9235-a1fe4f6e2f6c@cloud.com>
Date: Thu, 23 Nov 2023 17:04:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.5/6] tools/pygrub: Fix expression before it's copied
 elsewhere
Content-Language: en-US
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
 <20231122200702.1874420-1-andrew.cooper3@citrix.com>
 <90f63f30-38d3-4d70-aae3-1ec3a307c4c1@cloud.com>
In-Reply-To: <90f63f30-38d3-4d70-aae3-1ec3a307c4c1@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2023 16:50, Alejandro Vallejo wrote:
> On 22/11/2023 20:07, Andrew Cooper wrote:
>> This has an identical meaning, and is the more pythonic way of writing 
>> it.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Wei Liu <wl@xen.org>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>   tools/pygrub/src/pygrub | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
>> index 327cf51774fc..2c06684d6532 100755
>> --- a/tools/pygrub/src/pygrub
>> +++ b/tools/pygrub/src/pygrub
>> @@ -88,7 +88,7 @@ def downgrade_rlimits():
>>       # filesystem we set RLIMIT_FSIZE to a high bound, so that the file
>>       # write permissions are bound.
>>       fsize = LIMIT_FSIZE
>> -    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ.keys():
>> +    if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ:
>>           fsize = int(os.environ["PYGRUB_MAX_FILE_SIZE_MB"]) << 20
>>       resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
> 
> LGTM.
> 
> Cheers,
> Alejandro

... and

Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

