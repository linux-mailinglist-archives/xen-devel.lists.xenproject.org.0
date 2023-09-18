Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD92E7A4AF7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 16:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604082.941289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEpR-0006sw-Mq; Mon, 18 Sep 2023 14:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604082.941289; Mon, 18 Sep 2023 14:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEpR-0006q1-K2; Mon, 18 Sep 2023 14:02:21 +0000
Received: by outflank-mailman (input) for mailman id 604082;
 Mon, 18 Sep 2023 14:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngl4=FC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qiEpQ-0006pv-60
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 14:02:20 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9942a3b-562b-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 16:02:16 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31aeef88a55so4059501f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 07:02:16 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff782000000b00317f70240afsm12648691wrp.27.2023.09.18.07.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 07:02:15 -0700 (PDT)
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
X-Inumbo-ID: f9942a3b-562b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695045736; x=1695650536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OhfeKmO1RWl5wsNU7qxZBKetLolm2oO+djeGbzoRX4I=;
        b=l32hRE3+HshK7dlV9QRTdSJtfy8F3UWn8ta1Q/N9N25VtXSjk+dbcP7SuKweomiscD
         5Wu/KwDMW6REvWq27uot9Z79NAF5QR1Md2h2Z9/khfXapiYInDRMechFz0eYmvvgMBis
         5syZBPBR5JbFQeYmxAK/iK/l+uOoqsMPWCrhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695045736; x=1695650536;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhfeKmO1RWl5wsNU7qxZBKetLolm2oO+djeGbzoRX4I=;
        b=nWJtz/3ALGJZejOJm1v604hmm2pHBgRAQGMUfdM4x8RMxcKBScImuvrfcmHtBXQnmp
         +qcep3z8fskGVg1TMQ4104UYSbAqIzGs710M1xOcqlUCY/pKFBK036JQoI7SSLUjUHvt
         85wB9aU8BYzuSZK3EJLCEbTD1T81OeLJ+HoiXzmk4NwempUtSCa2GWuXalP9sTWMaVlj
         /+bL+Fd3PJRySGJWEzASGvVvo1JOlI0TeP/UJhcepSfg5YiuV8ZT0hToXZ1KWVfKirtm
         hZ4bwZLUq+OP1sDnty0njvVrwK3BAR/TTgSANJvHk4bhdkhDXss5GCkSgu/9UkO/0134
         ZD7w==
X-Gm-Message-State: AOJu0YyuVMEnGN81yDUuesRBPV6UL6wezfDwiDuFZm570m4p7jZzcX6k
	O8a7G38leiY+ioYAzVJzkcsNQQ==
X-Google-Smtp-Source: AGHT+IE0Db0PyHNyNmXSWigKJV+XO5YuZNfcfsPbvuK+2miyk8gjVQkDhxuQDIHt3u1RnkBTy3AR8Q==
X-Received: by 2002:a05:6000:1e09:b0:31f:f9fe:e739 with SMTP id bj9-20020a0560001e0900b0031ff9fee739mr9719644wrb.59.1695045735367;
        Mon, 18 Sep 2023 07:02:15 -0700 (PDT)
Message-ID: <9ceb62f4-e625-3fa9-6924-f22522de47a0@citrix.com>
Date: Mon, 18 Sep 2023 15:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/9] x86/amd: Introduce is_zen{1,2}_uarch() predicates
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-9-andrew.cooper3@citrix.com>
 <e28bbdf1-31e7-9500-ca5a-00cf15ceb33d@suse.com>
In-Reply-To: <e28bbdf1-31e7-9500-ca5a-00cf15ceb33d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2023 12:07 pm, Jan Beulich wrote:
> On 15.09.2023 17:00, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/amd.h
>> +++ b/xen/arch/x86/include/asm/amd.h
>> @@ -140,6 +140,17 @@
>>                         AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
>>                         AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))
>>  
>> +/*
>> + * The Zen1 and Zen2 microarchitectures are implemented by AMD (Fam17h) and
>> + * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
>> + * as a heuristic that distinguishes the two.
>> + *
>> + * The caller is required to perform the appropriate vendor/family checks
>> + * first.
>> + */
>> +#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
>> +#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
>> +
>>  struct cpuinfo_x86;
>>  int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
> With one simply the opposite of the other, and with the requirement of a
> family check up front, do we really need both? Personally I'd prefer if
> we had just the latter. Yet in any event
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

We specifically do want both, because they're use is not symmetric at
callsites.

In particular, having only one would make the following patch illogical
to read.

~Andrew

