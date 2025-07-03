Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95801AF735E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 14:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032099.1405860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXImA-0005a6-Fn; Thu, 03 Jul 2025 12:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032099.1405860; Thu, 03 Jul 2025 12:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXImA-0005XR-Cm; Thu, 03 Jul 2025 12:10:50 +0000
Received: by outflank-mailman (input) for mailman id 1032099;
 Thu, 03 Jul 2025 12:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXIm9-0005XL-Jg
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 12:10:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ec161d-5806-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 14:10:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so4636761f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 05:10:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm18729296f8f.13.2025.07.03.05.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 05:10:46 -0700 (PDT)
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
X-Inumbo-ID: c0ec161d-5806-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751544647; x=1752149447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WyM9UHhnIWaFFHFkk/h4VQGQemdjudQVQMDglxn59+g=;
        b=fU1VBuuPSIyXwgduy4he1bdXrTA+ijQMJcNp9+xynutsQSxRTNG2hZOnrq6q5iyJ0C
         eptzLyIn/0RBfJ+6QgpDmsZsA52Q7FzEdqUErgzJq73hec2Euq06vnXAwahaUeT359CM
         WU2TTNRGxILCHRtVSFhISsnVma7nLk/Kj5d5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544647; x=1752149447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyM9UHhnIWaFFHFkk/h4VQGQemdjudQVQMDglxn59+g=;
        b=N9L7B7VXXppmZTwFI2KAleS/z6Pvp3jMiKHur3Gpuw3+X9HkyiudtUdf1kJ5xxIDc1
         baNdofVQuWpIxzHakEtfQvXpEiZ2FJUcmjdLkp4Pz40cAVjrWcjq/l/exILlDTUj7iui
         U4Dq/wDwU5XnKVffkEXOqexfEck0AXTO1bUfDhQ2nY3eqoucHBLFDxjkrSah8eCU1zgO
         04QvRjvh1XDCtzFftB6pt61Ew8nL2QcJxZSOFd+3bBMOL/a4kPJmdZhVBad+SP4PtLfz
         3oCtZeyIEZkGRbr+RYHuniE3Y+LWN9PqGfl0arneHUPNTR2rOasiIau7hzbCztzhCcUa
         KQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe0BZwxsVu3aHlnpBiKwH72g8btpzjTmGCxVLMXpzKAqwBzPTBqK8JSiSt7iWtpykS9yu5iHBsRPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQ7hAeywPQgAJYkST/upzU8iPLvrWDtG1hUD5Bp8gdx3Ifsgx9
	pzvyvxq/CXbK8X6lRzEf0FY8FUsnPmFNIMlbgjYQESe3279IqOAzUpKS9yyT4yGTHQQ=
X-Gm-Gg: ASbGncujEHVeygn/7R24QAs+4pdWI0HbHxaeXK3h57coGwis6AEQjll5lnKbPJYHFXP
	6q9OwBgz3ypTUezJojwdTxSDF6afaugdofMh2VEYZzJGQ1LYGK6FwYd7ayW24xyTTTE4ZPn8HCP
	cJCD+rvEdyhsOjZI+mDihbIVtPR02wEqTh5MjJx8skvMj9bzWjHXqXqNzjgGT5YW2d6kllVLNCf
	BMwXR7bGLKqb9mzx/Ns9s4rDh2VRW83xO/Q5PM/5GeH/mk6MPyfgCzyqUdA0Um4Ez6WUIx2dndl
	7/WhZ9mJyDqmkQ5Nyf8NcBup9V4oSV0n9ndSHFnZBc+596CUibBCw1khMaJN4KG3gh2pJzbZJmx
	xxEewM/BPsYf7wOGSMWAVLMfZ1k0=
X-Google-Smtp-Source: AGHT+IHmuUHG2hSypo3+bmKSuJLAhB0Zt+FTTw5nvuRDkHF6As458uVqbUfkROGJTUu7s3Bi8Mmtrg==
X-Received: by 2002:a05:6000:238a:b0:3b3:9cc4:21ce with SMTP id ffacd0b85a97d-3b39cc422c7mr1412097f8f.50.1751544647402;
        Thu, 03 Jul 2025 05:10:47 -0700 (PDT)
Message-ID: <0b3d68f3-da32-4cec-a73b-ac4b3abb7617@citrix.com>
Date: Thu, 3 Jul 2025 13:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/idle: Fix buggy "x86/mwait-idle: enable
 interrupts before C1 on Xeons"
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-7-andrew.cooper3@citrix.com>
 <5ad4dc09-981f-4ad4-9e20-2125f727046c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5ad4dc09-981f-4ad4-9e20-2125f727046c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 10:43 am, Jan Beulich wrote:
> On 02.07.2025 16:41, Andrew Cooper wrote:
>> @@ -461,12 +468,19 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>  
>>      monitor(this_softirq_pending, 0, 0);
>>  
>> +    ASSERT(!local_irq_is_enabled());
>> +
>>      if ( !*this_softirq_pending )
>>      {
>>          struct cpu_info *info = get_cpu_info();
>>  
>>          spec_ctrl_enter_idle(info);
>> -        mwait(eax, ecx);
>> +
>> +        if ( ecx & MWAIT_ECX_INTERRUPT_BREAK )
>> +            mwait(eax, ecx);
>> +        else
>> +            sti_mwait_cli(eax, ecx);
> Actually, I'm curious: It seems quite likely that you did consider an
> alternative resulting in assembly code like this:
>
> 	test	$MWAIT_ECX_INTERRUPT_BREAK, %cl
> 	jz	0f
> 	sti
> 0:
> 	monitor
> 	cli
>
> CLI being a relatively cheap operation aiui, is there anything wrong or
> undesirable with this (smaller overall) alternative?

Other than it needing to be mwait?  The overheads aren't interesting;
they're nothing compared to going idle.

What does matter is that such a transformation cannot exist in mwait()
itself, as that breaks acpi_dead_idle(), and if we turn this mwait()
into inline asm, there's only a single caller of mwait() left.

~Andrew

