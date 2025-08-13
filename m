Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F75B2486B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 13:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079772.1440463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9bs-0000P2-Pc; Wed, 13 Aug 2025 11:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079772.1440463; Wed, 13 Aug 2025 11:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9bs-0000Lv-MJ; Wed, 13 Aug 2025 11:25:36 +0000
Received: by outflank-mailman (input) for mailman id 1079772;
 Wed, 13 Aug 2025 11:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um9br-0000Lp-Iw
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 11:25:35 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a08d9ab-7838-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 13:25:33 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so54638945e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 04:25:33 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a16ddb5a1sm28138775e9.8.2025.08.13.04.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 04:25:32 -0700 (PDT)
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
X-Inumbo-ID: 3a08d9ab-7838-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755084333; x=1755689133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UhJnWWdnx73cvIIqqsYygJXEAdzFo2QL32uSi3XP3fg=;
        b=uAyTV9EcKxxQY+E7y3XDW/3XduzXAND71BJaoRkUKChbjw6RlwBMmntlBn6sRurgfR
         ox9erWrBMKQWv0W37hZYgaJIw4MH22kMIuCb5KLdZ/BuhBFrCGR9jUbVTquT41YClTGC
         b+qfUjvVDwTodVCMI2VHCy2tw1AZMh4UsWd6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084333; x=1755689133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhJnWWdnx73cvIIqqsYygJXEAdzFo2QL32uSi3XP3fg=;
        b=SLlVpuqIYDfLlVlaNiBMJr93o5GnGf/cHPd9L3zx2AuJWeaTQlwzOuWd3TyYWIK1mA
         38KDqVIl2GjtOElh23YnqAuVyP6gYEPzPptB/ZvVu6EsRYkTjo3IIBwKKB+u2Hwul/Ul
         3ZvOPE2EqndyY0+mWJMPdD/Pz4p3gKD+pB4sZ0T4RaUE31o/WUU2Qqme4U4jYRvipvi6
         WlH0teexQ74sDOQN73lxXaTW02qy77O3VhwJr7CHNIX9o5GlaNtVdgKezubHyJBYfy9v
         cYJ4kpTBd+15P2kETbpm++AtO3e3Cym+uCJSfZTz1nP2Ig/TSov+RWaZ7hAFseKRohG8
         6oAA==
X-Forwarded-Encrypted: i=1; AJvYcCV6JGONbCinsXAHCwns1pLBTm5Dd1j9juVp/gpW3gRiDLIYBQI5AMVIWtPbwVSRSd3thZU5ywd4KWY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3w8AC4thRTqSOJX+jbNiz5T5uIRMnPZUxIpcuH+12EEobLtMa
	1C2Cx4MHaHGKtr5FRVlqsEx+SGoNsyoH32dH0FKLRzJChoEnpnlguYNCJgDTWxMC8Rg=
X-Gm-Gg: ASbGncuM9IPiD+ppOcZgbOBCEJJjVd9Zx3I4tKzoWTBRcp5eA3SpgqQDmpMUIXrMhsF
	2GVnAENRgVEbsykn025YylhCA26nMaxPXzDnIUPI72rD0ARffh0dqood46mzobL1H9Y/3J3jqhS
	kolM/kbHHgwgOVPUYjYLBYw98NlafAt6kIU5lB6pBUQK7VZW6MEWhKzYp2tOAki6kP5VknGlJtn
	rMD7Hcfdp5hSvAzoZWRgcbQw4E9tiqPMZOr2vMdu3IvXsmYMa0K5jWVcmQAmWTUVt1ZdF6m8ERA
	OrYBFxawLrCdO15tim4ImL8YVne+pMgXtGNXAmRmf+JAOzNTeLjvVg/pkDU34E4kNFgzkpJ1WV8
	oUR4h6+WiPqf43OVeYCc8FB6xdSDDhTJ8CIPCGxg+qcgLpMAuZWA6po6WduCu4aKmSS6n
X-Google-Smtp-Source: AGHT+IFOQmA3ZZqZEhCByKGgzaTy3+SKFX33jVzVLP+YI04vdEj6triXIxPmmboEc7a+lm+/SvYowQ==
X-Received: by 2002:a05:600c:4711:b0:456:18ca:68db with SMTP id 5b1f17b1804b1-45a1660b594mr21967145e9.8.1755084333069;
        Wed, 13 Aug 2025 04:25:33 -0700 (PDT)
Message-ID: <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
Date: Wed, 13 Aug 2025 12:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 10:19 am, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> Switch it to Xen coding style and fix MISRA violations.
> That were all ul -> UL suffix transformations, afaics?

Yes.

>
>>  Make it static as
>> there are no external caller now.
>>
>> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
>> simplify setup"), load_system_tables() is called later on the BSP, so the
>> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
>>
>> Move the BUILD_BUG_ON() into build_assertions(),
> I'm not quite convinced of this move - having the related BUILD_BUG_ON()
> and BUG_ON() next to each other would seem better to me.

I don't see a specific reason for them to be together, and the comment
explains what's going on.

With FRED, we want a related BUILD_BUG_ON(), but there's no equivalent
BUG_ON() because MSR_RSP_SL0 will #GP on being misaligned.

>> @@ -139,3 +258,16 @@ void asmlinkage ap_early_traps_init(void)
>>  {
>>      load_system_tables();
>>  }
>> +
>> +static void __init __maybe_unused build_assertions(void)
>> +{
>> +    /*
>> +     * This is best-effort (it doesn't cover some padding corner cases), but
>> +     * is preforable to hitting the check at boot time.
> Nit: "preferable"

Fixed.

~Andrew

