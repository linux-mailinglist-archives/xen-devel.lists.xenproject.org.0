Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1978D7A308E
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 15:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603579.940618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhV4f-0006BU-Nk; Sat, 16 Sep 2023 13:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603579.940618; Sat, 16 Sep 2023 13:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhV4f-00068t-LA; Sat, 16 Sep 2023 13:11:01 +0000
Received: by outflank-mailman (input) for mailman id 603579;
 Sat, 16 Sep 2023 13:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uw=FA=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qhV4e-00068n-DQ
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 13:11:00 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7974ea89-5492-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 15:10:58 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-273e1aec35aso2505121a91.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 06:10:58 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 mp15-20020a17090b190f00b00265c742a262sm4487186pjb.4.2023.09.16.06.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 06:10:56 -0700 (PDT)
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
X-Inumbo-ID: 7974ea89-5492-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694869857; x=1695474657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MddOWg7qs5oTLc0qcBUzZzjKSZeRUr6MsoCHupLyQaM=;
        b=lFJ2kYrRik1WDT70p+f3F1kAlCp7pHXy5NLY/IKVTHQN+I7cNDpsoTFx+3tBMoCiGv
         hCgEfTuwbgSlDkfE1AaM5cKyfSTsLvAzLkpIvBdqdPEpGvREJnDLZYHQOEKJNde+HfbR
         hfpLagzHyax8I5jY/7vkqm8dX3hHCUSdRKbUGdtFgS9qTBTZ25faZUMMvu4lE1RqJihC
         WJHiCdZ/GbV3s42TsBRfMFQFw/0FAR9vERpMfPjkuozxMwWkNQ3xCFSbMeymOMS6vpLA
         QnKMrWDe1GwY1lLya3VRKcnIb4YmUcYwmZgZpcUp8ULMOlGNEEo5+UrXMgDNIjpFFTv5
         hr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694869857; x=1695474657;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MddOWg7qs5oTLc0qcBUzZzjKSZeRUr6MsoCHupLyQaM=;
        b=erWg2hR9SL1AiS5n9PeYKz+hHiXDYZseiZi3vMAn1HzwPPmCMBIlMmD/JGfKssVlW8
         /61EKUaf5TRJILaMptZSzzIbuHHOzRLQa2TTK2jFRasrciQ7NwP7sy0DcssvmZcjqDP5
         4jRY1OtF5JC1vz4cqjC85waTtUoOsBCMcP9a1FlFUQO3kTkBiaBvTUvQR3sOqzHZXE3W
         aukRfRfWgAdgtU1Dx4IYan7v8tX86x2h4bVp+uFHGMA3jTrkRsYFoSGgLb4GuCKr4CKs
         iSU2Vk69NhHGOQFTFOL99PiftjSnYa21abG2UnQWZQlZiyKBi7Q6QWlVHdF/DwC4k/Sw
         gIrQ==
X-Gm-Message-State: AOJu0Yw+XkU2PD0S/auxltRdQLUHc3pTiQT3eyQcWLqTMvNtyZxzfYPj
	dSuDQBEH/9RdDK5XNihZjI8=
X-Google-Smtp-Source: AGHT+IEc5E7pZ5ne4UmyGvgVZXcgqiMrgbxmZOt/VQLspy23NCszKMsWe67zCsiaeTknw4MsVFRQpQ==
X-Received: by 2002:a17:90a:7483:b0:273:f584:40ca with SMTP id p3-20020a17090a748300b00273f58440camr3466936pjk.16.1694869856629;
        Sat, 16 Sep 2023 06:10:56 -0700 (PDT)
Message-ID: <4671299c-0fae-0744-cf53-0cce89bf764c@gmail.com>
Date: Sat, 16 Sep 2023 22:10:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-8-andrew.cooper3@citrix.com>
 <0aee121e-a2ac-1c6c-be33-59d842419708@gmail.com>
 <17514c61-a561-b5a7-8b8f-8c3d8dbd845f@citrix.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 7/7] x86/pv: Rewrite %dr6 handling
In-Reply-To: <17514c61-a561-b5a7-8b8f-8c3d8dbd845f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/23 21:56, Andrew Cooper wrote:
>> We don't reset DR6 after reading it, and there is no guarantee that the PV guest
>> will reset it either, so it doesn't match PENDING_DBG exactly IIRC.
>>
>> On the other hand, nothing will probably care about its double-accumulating
>> quirk except perhaps monitor users.
>>
>> Do we want to document that, shadow DR6 for PV (which seems a little overkill
>> if we don't trap DR6 access from PV already), or just live with that?
> 
> Different DR6's.
> 
> This is Xen responding to a real #DB (most likely from a PV guest, but
> maybe from debugging activity in Xen itself), and in ...
> 
>>>  
>>>      /*
>>>       * At the time of writing (March 2018), on the subject of %dr6:
> 
> ... this piece of context missing from the patch, Xen always writes
> X86_DR6_DEFAULT back in order to clear the sticky bits.

Oh, that'll do.

How come have I not seen this?  Maybe I was in dire need of morning coffee.
I assumed absence just from a missing context...

> 
> This behaviour hasn't changed.  Xen always sees a "clean" DR6 on every
> new #DB.
> 
> For the PV guest, what matters is ...
> 

(snip)

>>> -    /* Save debug status register where guest OS can peek at it */
>>> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
>>> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
>>> -
>>>      if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
>>>      {
>>> +        /* Save debug status register where gdbsx can peek at it */
>>> +        v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
>>> +                                    v->arch.dr6, pending_dbg);
>>>          domain_pause_for_debugger();
>>>          return;
>>>      }
>>>  
>>> -    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
>>> +    pv_inject_DB(pending_dbg);
> 
> ... this, which will merge all new pending bits into the guest's DR6.
> 
> If the guest chooses not to clean out DR6 each time, then it will see
> content accumulate.
> 
> To your earlier point of shadowing, we already have to do that.  DR6 is
> just one of many registers we need to context switch for the vCPU.
> 
> PV guests, being ring-deprivieged, trap into Xen for every DR access,
> and Xen handles every one of their #DB exceptions.  This is one reason
> why I split the work into several parts.  PV guests are easier to get
> sorted properly, and patch 1,2,5,6 are all common improvements relevant
> to HVM too.

That confirms my knowledge.  Honestly if I got such a foolish remark
I would question the reviewer's understanding of PV mode (not that you did
anything wrong).  Sorry for wasting your time.

> 
> ~Andrew

-- 
Sincerely,
Jinoh Kang


