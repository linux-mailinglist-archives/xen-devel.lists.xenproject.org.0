Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4E78D6A0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593025.925914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMUf-0004zN-I1; Wed, 30 Aug 2023 14:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593025.925914; Wed, 30 Aug 2023 14:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMUf-0004ws-FN; Wed, 30 Aug 2023 14:48:29 +0000
Received: by outflank-mailman (input) for mailman id 593025;
 Wed, 30 Aug 2023 14:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcGj=EP=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qbMUe-0004sU-O2
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:48:28 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46770720-4744-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:48:27 +0200 (CEST)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-565f86ff4d1so2789958a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 07:48:26 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 cm8-20020a17090afa0800b00267b7c5d232sm1348241pjb.48.2023.08.30.07.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 07:48:24 -0700 (PDT)
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
X-Inumbo-ID: 46770720-4744-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693406905; x=1694011705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m34JzR/6nm8nt+3yDhXCsoIcLT2YqxxZJj4gAIXZWwY=;
        b=BH8Y3ME+rIPiZUKk+G+Mc981g5o8HMZeJpPxtbLr8OAAOWfuo3gKfdzaauI58c8IcP
         yVQxxk5XnBGOHyRZT4Jv509BGo2TjHvEMw22PJv7c64IAkTMpub0Q/DiH7yPsmM3PJMA
         YpQTEaeP4kDBtQwhdqOsUCQdbq8VbNmRf4DJvUwPe2tW6/XcUSTAJkQ55vHadsldZWrs
         0pNwxB0guoWnBUzObvnyC0PHYRVv0hL1Elx1OUlaPuhf45RAIm/A36Hao/BD/qoBd6zJ
         Lv80i8L434tgAQUv4gEfxXQfNlhQUtcr1GqCunl7dFs4I2t89WxgcoLZxU+zivXfXSL+
         TfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693406905; x=1694011705;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m34JzR/6nm8nt+3yDhXCsoIcLT2YqxxZJj4gAIXZWwY=;
        b=YQUqICCEaHPiZ0ThHMeh8q1BJOizcv3dJJ7X/Ak4z91Y9earYo/O3FfUQ7IfMb2ICS
         kxcqE3WUObr/ozl4lkCmk+RPq1uJ6itWd7rgiV6AcGJTIcywfCjKmmk9sNJmDfBqtA7e
         rBoiFVUAHysiE53qEn6korsEdg4arwIfogo8JdMca7bRrjLN+HEGLirOxwUumrOBgRjo
         0XFEKBouG36fyMUEtaLpRKUT1NoUu518wRmdcZoRMXNaFqJIIJKIngknBzwLZvnhVKOb
         FZh5aNL+K/h8gAlPIB9f0t+XJBHtmW5b8d5RaqQCI8M1PFx7+iwlRc9R/KTSPbU77Cf+
         tGnA==
X-Gm-Message-State: AOJu0YyNvwoPWTx4fK//3vnwBIzOD0h6KgA9dFM8921/EWO131fB5D+7
	wWsCk2rnWDIcWobkxtUaa6w=
X-Google-Smtp-Source: AGHT+IG7VqcolFkzbIzwWXysC7P5Xqx4Pfdn5dOxk9wUFr8wX9Fl6XLqE/9AUkdN8TUd/li8dumJKw==
X-Received: by 2002:a17:90b:150:b0:26b:5205:525e with SMTP id em16-20020a17090b015000b0026b5205525emr2089485pjb.42.1693406905312;
        Wed, 30 Aug 2023 07:48:25 -0700 (PDT)
Message-ID: <0e1539bc-60b5-4a1c-1b51-3cb5594a4e5e@gmail.com>
Date: Wed, 30 Aug 2023 23:48:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <c668f355-0a31-0ffb-a7c2-4fee46705a3e@gmail.com>
 <5d19675c-993d-974c-425d-bd16d3e85905@suse.com>
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH v2 2/8] x86/hvm: Only populate info->cr2 for #PF in
 hvm_get_pending_event()
In-Reply-To: <5d19675c-993d-974c-425d-bd16d3e85905@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/23 22:41, Jan Beulich wrote:
> On 24.08.2023 17:25, Jinoh Kang wrote:
>> Prepare for an upcoming patch that overloads the 'cr2' field for #DB.
> 
> Seeing the subsequent change and the fact that earlier on Andrew didn't
> need such an adjustment, I'm afraid I can't see the need for this change,
> and the one sentence above also doesn't answer the "Why?", but only the
> "What?"

This is part of the hvm_monitor_interrupt() fix (patch 4), which would
otherwise get CR2 value (instead of PENDING_DBG) even for #DB.

I might have been overzealous, though, since there is no known (broken)
use for VM_EVENT_REASON_INTERRUPT in the first place.

> 
> Jan
> 
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -503,9 +503,14 @@ void hvm_migrate_pirqs(struct vcpu *v)
>>  
>>  static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
>>  {
>> -    info->cr2 = v->arch.hvm.guest_cr[2];
>> +    if ( !alternative_call(hvm_funcs.get_pending_event, v, info) )
>> +        return false;
>> +
>> +    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
>> +         info->vector == X86_EXC_PF )
>> +        info->cr2 = v->arch.hvm.guest_cr[2];
>>  
>> -    return alternative_call(hvm_funcs.get_pending_event, v, info);
>> +    return true;
>>  }
>>  
>>  void hvm_do_resume(struct vcpu *v)
> 

-- 
Sincerely,
Jinoh Kang


