Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C30A745A4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 09:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930306.1332958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5LQ-0000ZE-G4; Fri, 28 Mar 2025 08:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930306.1332958; Fri, 28 Mar 2025 08:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5LQ-0000Wg-D3; Fri, 28 Mar 2025 08:45:40 +0000
Received: by outflank-mailman (input) for mailman id 930306;
 Fri, 28 Mar 2025 08:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QVst=WP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ty5LP-0000Uf-14
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 08:45:39 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05d880be-0bb1-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 09:45:38 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5c9662131so2930236a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 01:45:38 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16d32d6sm1032117a12.18.2025.03.28.01.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 01:45:37 -0700 (PDT)
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
X-Inumbo-ID: 05d880be-0bb1-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743151538; x=1743756338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7n+f4azj2Tc5nhhvw/tnnF0Z56n1LqAJQ/6rHzrKBHY=;
        b=WVfngtruXD0Dw/yz8TzHn/aDy1rlShbyoq69MqidgECM07iQLGI+eWLL7jdh1Qcv9l
         ALtmWodjd4VqLN83Y7yhUi9zhfNZGt0N6wpYjVOTHcho8S2cjDMMhOC9Wr3Iv8du6QCF
         ix+wrpCuUAssJ05pk8/0NTpGj05FidCvda0phIz9cGIhaT/NMtooHl1O3HFvqWa5E/v8
         ycKfJ8NeMk8qeyKoEdTSOewVPXB7rsnqSq37EHQ8b0+u30V5DW9XfvgyTfLnWNvGY/Gj
         gsMjl1PMWBMBWh+vxfCRryKdgo0OkZj9TfODVxp6V4K6wK64vQhoAdG9UywEdH/Zv51m
         qcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151538; x=1743756338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7n+f4azj2Tc5nhhvw/tnnF0Z56n1LqAJQ/6rHzrKBHY=;
        b=GxLvVkUetAfRt2ed8Z8HU2XN0pF0F3iEcKKoAemblz97O9x5H8zKe6V0YH+H8x4E6M
         obUjDlXTXBYjNyvZ9n+V0aGTDK0BbVgE3b1ucA2w1ri7AymlvToii4wDO/B89zeia7MH
         ++ukDWAm45aGnHT7N+a290EpOwC5thHuGRJcluNTJl8ivU8sO/wg06Saan+L/oBLPt9/
         Nn+0yhLgqg0I7FfsYDgAkoOMBY6jF2J7PtsfWPLlOie+bZLltZQyMF8NM5I+dybdV5a5
         FvZ01VtbnIABmHDThxhs6mteCjNMTF2ugDIGKoR+DB8tFR4zXJs7ceEqLGQPyuF2XCd/
         Y8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeCXC0+W5949gEtQRBiaR3AM6RBvyfjBfGrcHDsrwxedqJnNdBcTvwdHM38oXPuDzMAFW9j5NAUtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/QdAHVFxWn5HWzQGiY+3I8jnad38Br6hkHkObekCCfHNytmOi
	RBGxFXMS3tsRF5aISjTizU057bVIweRy0rgnZQ3kkMdewtP49u2d
X-Gm-Gg: ASbGnculrHyCqvMHYMjdOrmoUP/jJpHNn+mqcOS3UE8PvlFKAR5exrd4bR7wsUgzA5d
	YePFFt18nCx7vGt3e10ipHmQk0yOjT4b+mh9kYueEM0yVAzYNhRV//N0mFSe0dlDF3lh1JUhGWN
	vZtXk+Wq59do/8mzpBHDFeSLfAx0BbZ5mJW6sYDejwJm7/RzK5Bt91XOFYR6bQFhDUDfofbqFPx
	e18f2g/AuqJGtrQGr6Mpm5MZAV0NTgZdiSqAzGMavTNBawCBSJZL0icD+biZZm/B+s5ROj82Ke2
	wSqV4NZHipvZaOiAL2Bfdcrrfc1eeRhnLf7XwJv4KCniTdhTH8JFiuO8e6LaFMhob/JgRY/LIeM
	TkYpql/QUt8qAR4zPqA98
X-Google-Smtp-Source: AGHT+IHtI3+Bc9FdWfB+6p7UD/FsYj1tqmk0TURTxdGnP1wNkPoGwFGKjGh/A+zTeqpQzfZyzA6wLg==
X-Received: by 2002:a05:6402:84f:b0:5ed:1909:d435 with SMTP id 4fb4d7f45d1cf-5ed8e061763mr6645523a12.5.1743151537637;
        Fri, 28 Mar 2025 01:45:37 -0700 (PDT)
Message-ID: <7e15e282-42a2-44c2-8a66-3fe72c216fdb@gmail.com>
Date: Fri, 28 Mar 2025 09:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG: Minimum toolchain requirements for x86 and
 ARM
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250327153725.401451-1-andrew.cooper3@citrix.com>
 <5d34510a-2f31-4295-b42d-a4e035dd4559@gmail.com>
 <0db68d90-fa7e-46d1-98dc-8b4692918285@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0db68d90-fa7e-46d1-98dc-8b4692918285@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/28/25 8:59 AM, Andrew Cooper wrote:
> On 27/03/2025 4:05 pm, Oleksii Kurochko wrote:
>>
>> On 3/27/25 4:37 PM, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> v2:
>>>   * State x86 and ARM, rather than implying all architectures.
>>> ---
>>>   CHANGELOG.md | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 35ab6749241c..8f6afa5c858a 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>>   
>>>   ### Changed
>>> + - The minimum toolchain requirements have increased for some architectures:
>>> +   - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>>> +   - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>>>   
>>>   ### Added
>>>    - On x86:
>> LKGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> May I interpret this as Acked-by: ?

Sorry, yes. It is Acked-by.

~ Oleksii


