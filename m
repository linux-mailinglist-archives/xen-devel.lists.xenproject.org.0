Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879C37A20C9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 16:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603183.940094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9kB-0000DP-TL; Fri, 15 Sep 2023 14:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603183.940094; Fri, 15 Sep 2023 14:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9kB-0000AF-Qa; Fri, 15 Sep 2023 14:24:27 +0000
Received: by outflank-mailman (input) for mailman id 603183;
 Fri, 15 Sep 2023 14:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cz4l=E7=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qh9kA-00008l-I0
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 14:24:26 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90fec5db-53d3-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 16:24:24 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c44a25bd0bso301845ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 07:24:23 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 r8-20020a1709028bc800b001bf11cf2e21sm3531228plo.210.2023.09.15.07.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 07:24:21 -0700 (PDT)
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
X-Inumbo-ID: 90fec5db-53d3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694787862; x=1695392662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHTaktzv7bnoZ+Ko6dJsAHaA50L9PLb96lYLjtqY4v0=;
        b=iyYICjsLUcUCK6xs6VDl8QOfv2ke6zwvysEAk8ZGLE+TSRXuUo911+jRFiNHbdyTDu
         rL1ZIc+1YAj9XHDgpHV/17FyY0zb7pAjLo7q2N9nQesAgAQlAgyWLLLYuSDFil1KL61z
         kxIGWMVwxa3K6SlLX2TUdN9ikfm0zqaEsewTmRHTHlIxTfZHHh1vVM6hGOVyYPhRZoj5
         9PtQf3BCKRRYbAylMwCSTFOCpoBQ2/wT2VaKS+9z0AludEJ01F4MOsuGr+c6FlohRkEX
         AaL+4S2oouf0LVmUP700J7WSvVReUzmAji1xVv75SFnSnX6oCPdst7RLYPvyEOHJBTyV
         mV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694787862; x=1695392662;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHTaktzv7bnoZ+Ko6dJsAHaA50L9PLb96lYLjtqY4v0=;
        b=mwS9jXQaiCljSiJmr5F5j9kn6ZUbAKrYuOeBMm55SqRaxaOVQ4jIvhph4EBLFt0yS6
         I9VplFzu9J/q9s8zvXE33jwrMfA8nnabvP7dRWfEVgAmVH+ukBY9t5FOb+XxIfNu42x9
         ob3vlL0XklJkfLm5jbQ18lrKm5721xxQ626C7zLiQBwRGobFNSNJawdgV1iZGFHsVNWx
         wvElzCBIKoWLvhzPzhwDPr03eojSIdwvbswClQAPL9DysKupqO4V6e6Zboafa3fQ8A7g
         W53zmlB6BIaos7+M4RRo5Bm0xlEq9IfDpgUosPjWmYWdS3+HvJIXSKMSEJ8Kd6j2Dxgj
         UiQA==
X-Gm-Message-State: AOJu0Yxd4I274sXIQBMqYbe9GPClQHBgcfla+BZfkm7uEArGMp0xrIPA
	EKG1wNdvakLTud383K1X5vQ=
X-Google-Smtp-Source: AGHT+IHOC3EoV4PITFfm4nnfvVTEwlIOKsvmT9ctLPJOP0sIRZRuC/Hmt3QQIXlG3iqE7jlcTyMp5Q==
X-Received: by 2002:a17:902:ec8d:b0:1c3:22a9:8643 with SMTP id x13-20020a170902ec8d00b001c322a98643mr1860968plg.31.1694787862337;
        Fri, 15 Sep 2023 07:24:22 -0700 (PDT)
Message-ID: <d4073297-4095-20b2-13f2-e1d6e8bd9c17@gmail.com>
Date: Fri, 15 Sep 2023 23:24:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] x86/emul: Add a pending_dbg field to
 x86_emulate_ctxt.retire
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-4-andrew.cooper3@citrix.com>
 <e17dd8a7-91d0-fc30-203e-09058ee5e61d@gmail.com>
In-Reply-To: <e17dd8a7-91d0-fc30-203e-09058ee5e61d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/23 21:20, Jinoh Kang wrote:
> On 9/13/23 08:21, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
>> index 698750267a90..f0e74d23c378 100644
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -588,15 +588,26 @@ struct x86_emulate_ctxt
>>      /* Canonical opcode (see below) (valid only on X86EMUL_OKAY). */
>>      unsigned int opcode;
>>  
>> -    /* Retirement state, set by the emulator (valid only on X86EMUL_OKAY). */
>> +    /*
>> +     * Retirement state, set by the emulator (valid only on X86EMUL_OKAY/DONE).
>> +     *
>> +     * TODO: all this state should be input/output from the VMCS PENDING_DBG,
>> +     * INTERRUPTIBILITY and ACTIVITIY fields.
>> +     */
>>      union {
>> -        uint8_t raw;
>> +        unsigned long raw;
> 
> Minor nit: this should be uint64_t for clarity.  Otherwise, it's not at all
> clear that the raw field covers the entire union, unless you remind myself
> that Xen does not support 32-bit host.

you remind yourself*.  What a weird typo to make :-(

-- 
Sincerely,
Jinoh Kang


