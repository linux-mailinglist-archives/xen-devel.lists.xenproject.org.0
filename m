Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54993AB1FAE
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980423.1366883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVwp-0008B5-0x; Fri, 09 May 2025 22:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980423.1366883; Fri, 09 May 2025 22:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVwo-00088f-Ud; Fri, 09 May 2025 22:12:02 +0000
Received: by outflank-mailman (input) for mailman id 980423;
 Fri, 09 May 2025 22:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDVwn-00088W-MQ
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:12:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a157fd39-2d22-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 00:12:00 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso17255855e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 15:12:00 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f296csm4442452f8f.47.2025.05.09.15.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 15:11:59 -0700 (PDT)
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
X-Inumbo-ID: a157fd39-2d22-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746828720; x=1747433520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9TPRPubuQA3V/Wf8DEBzDpVpE/QZ3qffycdvVbRaPMI=;
        b=CCF56/GN7WHR81ahwe5AqiseiXm8z0CDH9Kq1okH5ZOA+gOEzD3ZPCbXggKA2PsJaJ
         JnpwscCJYqN5XQbosSPuDkEKeC5/X6COM5UfPw4GGwdkJqNhjlWTAOCu0jzUzPsOhZgB
         CDiKXWTOOMnxzHoMcXTFtY4E2O2PG4EFQpXEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746828720; x=1747433520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TPRPubuQA3V/Wf8DEBzDpVpE/QZ3qffycdvVbRaPMI=;
        b=EXr5SvFyIKZeZCdTMD7qg5wEidG3inPDzOPsm5F1YJ60HxZNnFgqMc7Z7LP/DWmN7n
         V1lBcMyW3Y84O1DJ1UG7rBajPXhlZtWA2o3litoMH3zah0PJMIdaYOM5B2/CrdqfSvD3
         d7f549Uk5Ms8bA7I+I35nXSeY7bBUoU9Z9RAJjZp/IwzPGTLug+1+BkoCC9UM1zHHXWM
         EzuxMnV/ePk6UF9n0HWZf1cK088XzAgKVO1xV27YLdGosLR5sy0yJXnuIWyIE2X6Tb0J
         0iP5MQThB2tB1P9uJ74STNe6e4R7o82KzWdC5IoIAc+8yC6ITYCtmPGSE7Vcped4wH89
         /gAg==
X-Gm-Message-State: AOJu0YzGwLe8Bc8s6dfewlzHouuZkHC+II2s54m5Pi1BEYuX7wbWAp6G
	eDyspocv6F/FEpjdMhr4Ng/3wZK4ExYZDurc1mh4nE8onUJ8Ja/n0tW8z7YxIVecUlCIZgxrzZv
	y
X-Gm-Gg: ASbGncvVfpHgcwH/lQtxBOS6V0u3Ac4Y5nypGDLWPkBdnaHkhBonME3wrD3bayxxQRO
	WQ7mh3Q0ULs/VpfwEKO32d3vdwGUdCvYzwPKwxcNY0P/AP5kVx8RjNv8DhJbHL5JDnfrbcAvcc1
	a1z2TB+DU2c7bi9pdT5hD8/xgKxSUcLD670FoKn4kj9GMUPeTb3LZPHgbM6dY9VjmXMaUPfp+ST
	PSTx9VXjoXiWYhjxOAKJ5pPhZGh5+0STlyJEHvHftqFN+aBRvowryxp99krriOSrnA/az/GpXxJ
	Zq3AcrMQYPlLXUYJQMUoQ1DSPSDH1alIJ+eru76E6zFDgaFHon0xoHBx3lnRnyZ0Y9/FeBx/Se3
	lgLuAQYyV8QYpM2l9
X-Google-Smtp-Source: AGHT+IEdysVTdqkE/2q4IZewCoNeDBcEV7CA0ThS+Mv4datWFuvrk0bh/mlbCmV2o3sNcXVYBQJVQw==
X-Received: by 2002:a05:6000:3113:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a1f6482d31mr4257844f8f.37.1746828720315;
        Fri, 09 May 2025 15:12:00 -0700 (PDT)
Message-ID: <a02eeaca-a007-40e9-83a0-8cf2ad3d2e30@citrix.com>
Date: Fri, 9 May 2025 23:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS] Drop legacy jobs
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250509215123.2953401-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505091508590.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2505091508590.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2025 11:10 pm, Stefano Stabellini wrote:
> On Fri, 9 May 2025, Andrew Cooper wrote:
>> The CI improvements have been backported to all Xen branches.
>>
>> Remove the transitionary tar/cpio parameter in scripts/alpine-rootfs.sh
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>>  .gitlab-ci.yml               | 27 +---------------
>>  scripts/alpine-rootfs.sh     | 23 ++++---------
>>  scripts/x86_64-argo-linux.sh | 63 ------------------------------------
>>  3 files changed, 8 insertions(+), 105 deletions(-)
>>  delete mode 100755 scripts/x86_64-argo-linux.sh
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index dcf76db6ec62..2e1aad800b95 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -52,7 +52,7 @@ linux-6.6.86-arm64:
>>  alpine-3.18-x86_64-rootfs:
>>    extends: .x86_64-artifacts
>>    script:
>> -    - ./scripts/alpine-rootfs.sh cpio
>> +    - ./scripts/alpine-rootfs.sh
>>    variables:
>>      CONTAINER: alpine:3.18-x86_64-base
> There is one survivor just above:
>
> alpine-3.18-arm64-rootfs:
>   extends: .arm64-artifacts
>   script:
>     - ./scripts/alpine-rootfs.sh cpio
>   variables:
>     CONTAINER: alpine:3.18-arm64-base
>
>
> Makes sense to fix it as well?

Yeah, that wants to be dropped too.  (It happens to be a nop.)

Fixed up locally.

~Andrew

