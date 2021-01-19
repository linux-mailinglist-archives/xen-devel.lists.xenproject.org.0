Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89C2FBAE9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70507.126564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1snn-0005ZS-Gy; Tue, 19 Jan 2021 15:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70507.126564; Tue, 19 Jan 2021 15:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1snn-0005Z3-DT; Tue, 19 Jan 2021 15:20:15 +0000
Received: by outflank-mailman (input) for mailman id 70507;
 Tue, 19 Jan 2021 15:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhrS=GW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1snl-0005Yy-PU
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:20:13 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8162b55a-43d9-42e8-89f5-5eb8c153b49f;
 Tue, 19 Jan 2021 15:20:12 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o13so29599100lfr.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jan 2021 07:20:12 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f9sm2309093lft.114.2021.01.19.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 07:20:11 -0800 (PST)
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
X-Inumbo-ID: 8162b55a-43d9-42e8-89f5-5eb8c153b49f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FzGS9umngqsjnVotLh4pOKKI9E6E9dxSXXo+W2PjZRg=;
        b=YRPN3KWp/4WVCJAy7rsIeW36NYMpG+WYZ0CBszAIGDuH9GCQgy9bOx6eG0ziFTxA8c
         k8lpoTsaBvrgZyBM0cA8NY4Ije4ASSMPW0ofni1jr3p+pOalAYIvO3dUEYf9Caf+sT9N
         owRtNubrXfZ6il9WS5UwixiFm0drZKi3Q/bSUPmSHHFQujRHh5aSrt7m1QCvbkBFWLIN
         tPshHLa7mk5zLXPlo0B/gPMxLfjmEq13EHiN9gv+egLL6az5hUEPg0yZhLN1Z2cZSYpV
         tLhwuxuElDiOvObvh3CU3HG4fYOb+wFSbZiPHEptySA/zW0qeEU6byl77jjD0zb1W4vb
         lyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FzGS9umngqsjnVotLh4pOKKI9E6E9dxSXXo+W2PjZRg=;
        b=g4zaZ9S/x7voshxJU2HLJs9gk257hjtgYb9qGJ9/CdXNKH4pE5C83ioNYIpZ3ChsVw
         97UglZsVnIrM71dJgw0TocfR85AO3asxVYIEo0BjlSUA9fohatNEaCpKpe1f2ql7KXjx
         FYaZtaDkpj9NRoFvOqFFr4dlzQq0xfbusEFQVkQnevNDHJIjjlTo+AvlOytMGwv5kWCG
         5WSKDDd3mhbM9zolPfzNcr4FhDuXiZ5I3gGFGJoSbD8II7p7TX06ZCxLa22Fy2R5K4tA
         Bk5oz8okZkBuWIVybnnsEYR0MOa2RxB+GEqu3Tyc+gEr49tC6Zw0g95DXRjZWF/miZYZ
         UGhg==
X-Gm-Message-State: AOAM532/9F97GceB5k+ep09xIfmDyYV95Y0B+H1jaMo3N3ROQ388R/s5
	sd1IDlLuo5OtQtuxIG9A8OM=
X-Google-Smtp-Source: ABdhPJz9hYaakoFeUR4mJGF5eTOFN2aZhjkBCGMgv0acWYw+fxzCQ8/6isFO0pwMP2uuhXN6EzmmuA==
X-Received: by 2002:a19:c215:: with SMTP id l21mr1970871lfc.142.1611069611615;
        Tue, 19 Jan 2021 07:20:11 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com>
Date: Tue, 19 Jan 2021 17:20:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Julien


>>
>>
>>>
>>>>>
>>>>>> +
>>>>>>       PROGRESS(xen):
>>>>>>           ret = relinquish_memory(d, &d->xenpage_list);
>>>>>>           if ( ret )
>>>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>>>> index ae7ef96..9814481 100644
>>>>>> --- a/xen/arch/arm/io.c
>>>>>> +++ b/xen/arch/arm/io.c
>>>>>> @@ -16,6 +16,7 @@
>>>>>>    * GNU General Public License for more details.
>>>>>>    */
>>>>>>   +#include <xen/ioreq.h>
>>>>>>   #include <xen/lib.h>
>>>>>>   #include <xen/spinlock.h>
>>>>>>   #include <xen/sched.h>
>>>>>> @@ -23,6 +24,7 @@
>>>>>>   #include <asm/cpuerrata.h>
>>>>>>   #include <asm/current.h>
>>>>>>   #include <asm/mmio.h>
>>>>>> +#include <asm/hvm/ioreq.h>
>>>>>
>>>>> Shouldn't this have been included by "xen/ioreq.h"?
>>>> Well, for V1 asm/hvm/ioreq.h was included by xen/ioreq.h. But, it 
>>>> turned out that there was nothing inside common header required 
>>>> arch one to be included and
>>>> I was asked to include arch header where it was indeed needed 
>>>> (several *.c files).
>>>
>>> Fair enough.
>>>
>>> [...]
>>>
>>>>>
>>>>> If you return IO_HANDLED here, then it means the we will take care 
>>>>> of previous I/O but the current one is going to be ignored. 
>>>> Which current one? As I understand, if try_fwd_ioserv() gets called 
>>>> with vio->req.state == STATE_IORESP_READY then this is a second 
>>>> round after emulator completes the emulation (the first round was when
>>>> we returned IO_RETRY down the function and claimed that we would 
>>>> need a completion), so we are still dealing with previous I/O.
>>>> vcpu_ioreq_handle_completion() -> arch_ioreq_complete_mmio() -> 
>>>> try_handle_mmio() -> try_fwd_ioserv() -> handle_ioserv()
>>>> And after we return IO_HANDLED here, handle_ioserv() will be called 
>>>> to complete the handling of this previous I/O emulation.
>>>> Or I really missed something?
>>>
>>> Hmmm... I somehow thought try_fw_ioserv() would only be called the 
>>> first time. Do you have a branch with your code applied? This would 
>>> help to follow the different paths.
>> Yes, I mentioned about it in cover letter.
>>
>> Please see
>> https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml5
>> why 5 - because I started counting from the RFC)
>
> Oh, I looked at the cover letter and didn't find it. Hence why I 
> asked. I should have looked more carefully. Thanks!
>
> I have looked closer at the question and I am not sure to understand 
> why arch_ioreq_complete_mmio() is going to call try_handle_mmio().
>
> This looks pretty innefficient to me because we already now the IO was 
> handled by the IOREQ server.
>
> I realize that x86 is calling handle_mmio() again. However, I don't 
> think we need the same on Arm because the instruction for accessing 
> device memory are a lot simpler (you can only read or store at most a 
> 64-bit value).

I think, I agree.


>
> So I would like to keep our emulation simple and not rely on 
> try_ioserv_fw() to always return true when call from completion 
> (AFAICT it is not possible to return false then).


So what you are proposing is just a replacement try_ioserv_fw() by 
handle_ioserv() technically?


diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 40b9e59..0508bd8 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -101,12 +101,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
*regs,

  bool arch_ioreq_complete_mmio(void)
  {
-    struct vcpu *v = current;
      struct cpu_user_regs *regs = guest_cpu_user_regs();
      const union hsr hsr = { .bits = regs->hsr };
-    paddr_t addr = v->io.req.addr;

-    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
+    if ( handle_ioserv(regs, current) == IO_HANDLED )
      {
          advance_pc(regs, hsr);
          return true;


>
> I will answer to the rest separately.

Thank you.


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


