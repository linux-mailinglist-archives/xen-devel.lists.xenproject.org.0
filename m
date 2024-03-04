Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454B8702C4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 14:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688412.1072470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh8P5-0007lj-NV; Mon, 04 Mar 2024 13:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688412.1072470; Mon, 04 Mar 2024 13:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh8P5-0007jZ-Kt; Mon, 04 Mar 2024 13:30:51 +0000
Received: by outflank-mailman (input) for mailman id 688412;
 Mon, 04 Mar 2024 13:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rh8P4-0007jT-RW
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 13:30:50 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6916347c-da2b-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 14:30:48 +0100 (CET)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-220461b7597so2737464fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 05:30:48 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 19-20020a05620a04d300b00787ad5ca70fsm4346946qks.122.2024.03.04.05.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 05:30:46 -0800 (PST)
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
X-Inumbo-ID: 6916347c-da2b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709559047; x=1710163847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyC0XW1fp4YI+DuazPFfvuL/5W60y9CbXjWPM1zsBMA=;
        b=HCiSVmdtjop5DtCJsJMIArYNCyBLtH3TFvzRJayDZwqjXisl9/aR09LwoGzfaW+eYM
         OrCxxAZpgDgbwj66CE1aQkg0uFj3CPjqJ56lvbkvepTpTQYquyklM8pPFmtteWb7VTon
         +G0lIF+qIZZ+T5Q3hZ9X3FjJ6dOvzuiQc+op0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709559047; x=1710163847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyC0XW1fp4YI+DuazPFfvuL/5W60y9CbXjWPM1zsBMA=;
        b=l0bGQfEjcttbneyKiqT4VGxzVhpZC1C1lz2zM666sopUkpYFr+f4JFWBsuhMFiiNov
         Ihk60Mv9Tve1DC03AM9PPJrMTc2fJ0cJ+WZrTkxc4JfOON3K6l7qY4aJSinPxie0va1y
         B4+epu3hl0ePL0qhRnAK3naHiMxoJQ9E4GrC9HAT1pxp/l66YH4shtrjNlFrCXjVZjdD
         YZ2hrsfcmtnEA8QRClHQKHFEEKKFGZtEGqUy1pWwV8Glqs7p3/zQVFFBJmCYEzfFrLVM
         wIvEe4MfyxczdsP0dl5Q9JGQVBAp4d3Ae7t2bpmsLLUVTkPWmvoUGm7Hi8H85b7EuQzC
         zPiA==
X-Forwarded-Encrypted: i=1; AJvYcCXliloKQCcJQE19M5YzqNhnto7yx34eex3ANmNtEBrc2lHEthjKzoXFccnHsgBtLUwiMMLH7wKzIermoB4bP/vmBK5GE/QSBZ14owHTDqo=
X-Gm-Message-State: AOJu0YyAZpJoNwgd/XpQ68dixevGd8gmZTYqVTDgr/bhctM1uozFHQ6C
	2JwHRjywrfIz18lBo+A5PvdlNn1eMF50K+l82FLsQdD/TgQN1yUzMp3RK8Jfelo=
X-Google-Smtp-Source: AGHT+IHHQEyM1lYZfTXVX0FZ8qRt4NcNLHz0Q+3p62heijXliHZUGldIGnvL+kNgqhTaZ+TRzbzeDQ==
X-Received: by 2002:a05:6870:9d1b:b0:21e:70fd:f86 with SMTP id pp27-20020a0568709d1b00b0021e70fd0f86mr12151947oab.33.1709559047171;
        Mon, 04 Mar 2024 05:30:47 -0800 (PST)
Message-ID: <cf738e66-cac4-4828-80fb-ddd0d533919c@citrix.com>
Date: Mon, 4 Mar 2024 13:30:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240301112829.2657865-1-andrew.cooper3@citrix.com>
 <0751a4ac-4e3b-47e4-8727-f3dd4610d446@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0751a4ac-4e3b-47e4-8727-f3dd4610d446@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/03/2024 8:42 am, Jan Beulich wrote:
> On 01.03.2024 12:28, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -464,6 +464,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>               raw_cpu_policy.feat.clwb )
>>              __set_bit(X86_FEATURE_CLWB, fs);
>>      }
>> +
>> +    /*
>> +     * Topology information inside the guest is entirely at the toolstack's
>> +     * disgression, and bears no relationship to the host we're running on.
>> +     *
>> +     * HTT identifies p->basic.lppp as valid
>> +     * CMP_LEGACY identifies p->extd.nc as valid
>> +     */
>> +    __set_bit(X86_FEATURE_HTT, fs);
>> +    __set_bit(X86_FEATURE_CMP_LEGACY, fs);
>>  }
>>  
>>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>> @@ -514,6 +524,18 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>>              __clear_bit(X86_FEATURE_CLWB, fs);
>>      }
>>  
>> +    /*
>> +     * Topology information is at the toolstack's discretion so these are
>> +     * unconditionally set in max, but pick a default which matches the host.
>> +     */
>> +    __clear_bit(X86_FEATURE_HTT, fs);
>> +    if ( cpu_has_htt )
>> +        __set_bit(X86_FEATURE_HTT, fs);
>> +
>> +    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
>> +    if ( cpu_has_cmp_legacy )
>> +        __set_bit(X86_FEATURE_CMP_LEGACY, fs);
> When running on a host with the respective bit clear, won't this break
> (at least older) Linux'es logic? Iirc the unconditional setting of at
> least HTT was tied to the unconditional multiplying by 2 of the vCPU ID
> to derive the (fake) APIC ID.

This patch doesn't change the default at all.

All it does is expose (properly) in the max policy what Xen would
tolerate the toolstack doing blindly.

If there are problems in certain configurations, then they continue to
be problems.

Although I'll note that the unconditional multiplying by 2 was never
about hyper-threading - Alejandro did some archaeology and found out
that it was an LAPIC vs IOAPIC error in vmxloader.  The connection to HT
has just been bad guesswork since.

~Andrew

