Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726007A00F7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 11:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602184.938595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgj3h-00055r-VE; Thu, 14 Sep 2023 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602184.938595; Thu, 14 Sep 2023 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgj3h-00053y-SM; Thu, 14 Sep 2023 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 602184;
 Thu, 14 Sep 2023 09:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgj3g-00053r-IK
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 09:54:48 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc7cbe96-52e4-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 11:54:46 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401bbfc05fcso7618535e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 02:54:46 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003fe1fe56202sm1489326wml.33.2023.09.14.02.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 02:54:45 -0700 (PDT)
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
X-Inumbo-ID: bc7cbe96-52e4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694685286; x=1695290086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fnEsIAeUeRDytyDgEkmMnJgqklpj0VzFI2M3W0xEsYo=;
        b=BTeLSHAKYzeqJtTjHm2jP9HiWkAWBdzZExqCVWOLvQrx6OTNsNRjB2VpU6lzD4KHiy
         KNcsSRLIvbnfm1T/GxeqClPb5/NPygx8i5Oa5q3Zi447hvsUCzQYaY/rOUlemVFCBfXc
         w8AOcOL6WAMG2uv5w9nXDkIcEWopz2E75xlbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694685286; x=1695290086;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnEsIAeUeRDytyDgEkmMnJgqklpj0VzFI2M3W0xEsYo=;
        b=jhckfPNkd7zjYA3DBr2fcnUFJuIp0nog8UljkFSSB7HsngpJoqPHjlkzqDbrATKdcF
         8rcf5iY4gwbejXagTlof+CRD8vqJwZSkIXS/i5qWmziTSvFPMvVvmSnQbKHc+NGeevcn
         yO5Lwoi/0gMDM2KMIomTD56UN+rdz0zTGL6QGOOvgK3q6RBw1lfiOZl0Zt5tclBd79/6
         uUPsCFGl/W2Zg2Vo5mq+asK1vRmwUwlAzZTE2NySNqP4LlK/jnK1m2COOsiiJBoBLSzl
         X471kF9BY6Bw6EXE+otOW4GWuVvkjAgghKIIcWQoQocCRGvqlyt6TY5OIPChNWOgesqN
         FzOQ==
X-Gm-Message-State: AOJu0Yy0z3HNS8KPhDUoT7ty2sXFfs/Dc3hl//tBAOq0AYR6T+BsN7fq
	9KQCQh/qvSvkmuGpDyN6gNtmgg==
X-Google-Smtp-Source: AGHT+IEbW/34obSf9Pjgt9KdCBO1eNO685TleUgQUdivzFpTEwHWBti6lVC8WQhXjmrgFWCV435+IQ==
X-Received: by 2002:a7b:c7cb:0:b0:3fe:dc99:56ea with SMTP id z11-20020a7bc7cb000000b003fedc9956eamr4072824wmk.19.1694685285953;
        Thu, 14 Sep 2023 02:54:45 -0700 (PDT)
Message-ID: <cde7f3b7-2e58-222a-ebac-6e745150eedd@citrix.com>
Date: Thu, 14 Sep 2023 10:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/8] x86/spec-ctrl: Fix confusion between
 SPEC_CTRL_EXIT_TO_XEN{,_IST}
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-2-andrew.cooper3@citrix.com>
 <4181dbec-38a4-d0dd-c132-2d23579c36a7@suse.com>
In-Reply-To: <4181dbec-38a4-d0dd-c132-2d23579c36a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 7:56 am, Jan Beulich wrote:
> On 13.09.2023 22:27, Andrew Cooper wrote:
>> c/s 3fffaf9c13e9 ("x86/entry: Avoid using alternatives in NMI/#MC paths")
>> dropped the only user, leaving behind the (incorrect) implication that Xen had
>> split exit paths.
>>
>> Delete the unused SPEC_CTRL_EXIT_TO_XEN and rename SPEC_CTRL_EXIT_TO_XEN_IST
>> to SPEC_CTRL_EXIT_TO_XEN for consistency.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
>
>> @@ -256,11 +255,6 @@
>>      ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
>>          X86_FEATURE_SC_MSR_PV
>>  
>> -/* Use when exiting to Xen context. */
>> -#define SPEC_CTRL_EXIT_TO_XEN                                           \
>> -    ALTERNATIVE "",                                                     \
>> -        DO_SPEC_CTRL_EXIT_TO_XEN, X86_FEATURE_SC_MSR_PV
>> -
>>  /* Use when exiting to PV guest context. */
>>  #define SPEC_CTRL_EXIT_TO_PV                                            \
>>      ALTERNATIVE "",                                                     \
>> @@ -328,7 +322,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>  .endm
>>  
>>  /* Use when exiting to Xen in IST context. */
>> -.macro SPEC_CTRL_EXIT_TO_XEN_IST
>> +.macro SPEC_CTRL_EXIT_TO_XEN
> ... with the comment her updated (either by dropping "in IST" or by
> explicitly mentioning both cases).

The comment is rewritten from scratch in patch 4.  I'm not moving that
rewrite to here, and the comment isn't technically wrong to begin with,
but I suppose I can drop the IST part.  Just means more churn.

~Andrew

