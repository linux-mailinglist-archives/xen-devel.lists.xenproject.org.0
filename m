Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E283924D3A4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 13:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k94z9-0004aF-DD; Fri, 21 Aug 2020 11:13:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIBs=B7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k94z7-0004aA-UE
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 11:13:26 +0000
X-Inumbo-ID: 8e68e997-9128-48e0-8176-39319aaec76e
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e68e997-9128-48e0-8176-39319aaec76e;
 Fri, 21 Aug 2020 11:13:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v9so1412988ljk.6
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=C2TWYQ9BThoxy+SmwyhbQnhJjmTXtOXoUayOb3u4LlA=;
 b=kG4TUPOTzNp7ydsc5PyOgJBits6Z9pg+8YCkM3qZAXDNlq13loZ3lVLG+UyBOVRO3i
 1ORls7jvBPHNIX3MvBuWbT90DPDPV00w7sGIeKAuS+vgaaX2s7N+7ZJxl+i+fG8AVX3n
 4ovyoZhH/rxD0qsez8myCTyf8n0RSvpV6UxH53DNWQSk3PwRVG9GJ1mG/K1pDtfsMTY6
 bu/XOP88MpKcCKdIx5FGmojCFIpdVNk1MVBDqgPokPgSqswZUrV4hgSAPc6YeOLbZAFT
 xoMhY23MzwDM7dKnbv+Qs+Q1Ojm+PzXQhXw9j7N2H+QLICdQiavJIkrm9l9U8GQ6Uv2I
 jduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C2TWYQ9BThoxy+SmwyhbQnhJjmTXtOXoUayOb3u4LlA=;
 b=VHxr4/Gz07gJmj3ZzxYUtMwQndvpS5pgTUjZpE1uQPydvV/DTYIwJCbFoQ/lcZdoVG
 zD87oq2zC/h58DS/F2aFmGBImK8D6xHOdoGpDw8UMpGKR2xkuOIXW2TE1oEtKpsoqjor
 iHM/4rxUujdNpJ7YSjh6VQGPjgAMeK8cZKinKZnsB2yfCH/WtiEuRoXAJVM8SOQLJH/3
 bG6zqsQ3h8EJzSVW3sDSBVYgeM69N8FjBjFES19Lej5+vx6EBo7o5+qzkiEpxd++P0SH
 dvzz1ePTALVmpUmA5mZAhaVo/R36DA92rs+pLUjlGKbpXbePTeWxZny/7C69kdYB4B5h
 OZ/w==
X-Gm-Message-State: AOAM5309lzbuMHIWzDLYuAEp0DCAmKl0DARQKZpTQ80dvgoW577ByrlG
 ClGr7PZS+ackxc8vMpvgvYc=
X-Google-Smtp-Source: ABdhPJyeNeQixf5vh+pKaG4vCmTiACyP4HIGHiIAHtc2JRZwlVBPyEHhCh8MPE3XzD5cM++YIza6fA==
X-Received: by 2002:a2e:81c2:: with SMTP id s2mr1335623ljg.10.1598008403216;
 Fri, 21 Aug 2020 04:13:23 -0700 (PDT)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
 by smtp.gmail.com with ESMTPSA id l13sm329426lfk.18.2020.08.21.04.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 04:13:22 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
 <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
 <fbc2d5a5-d8e7-0627-73cb-aca2b8addb8b@suse.com>
 <8b841e83-3dbf-b8d8-37d8-2828ca2cca66@gmail.com>
 <78cfadf0-984d-909e-c08a-797fb9e876f2@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <caa1d33d-aecc-12f7-82fa-2c0fbb6ce953@gmail.com>
Date: Fri, 21 Aug 2020 14:13:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78cfadf0-984d-909e-c08a-797fb9e876f2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 21.08.20 09:16, Jan Beulich wrote:

Hi Jan.

Thank you for your answer.

> On 20.08.2020 20:30, Oleksandr wrote:
>> On 06.08.20 14:29, Jan Beulich wrote:
>>> On 06.08.2020 13:08, Julien Grall wrote:
>>>> On 05/08/2020 20:30, Oleksandr wrote:
>>>>> I was thinking how to split handle_hvm_io_completion()
>>>>> gracefully but I failed find a good solution for that, so decided to add
>>>>> two stubs (msix_write_completion and handle_realmode_completion) on Arm.
>>>>> I could add a comment describing why they are here if appropriate. But
>>>>> if you think they shouldn't be called from the common code in any way, I
>>>>> will try to split it.
>>>> I am not entirely sure what msix_write_completion is meant to do on x86.
>>>> Is it dealing with virtual MSIx? Maybe Jan, Roger or Paul could help?
>>> Due to the split brain model of handling PCI pass-through (between
>>> Xen and qemu), a guest writing to an MSI-X entry needs this write
>>> handed to qemu, and upon completion of the write there Xen also
>>> needs to take some extra action.
>>
>> 1. Regarding common handle_hvm_io_completion() implementation:
>>
>> Could msix_write_completion() be called later on so we would be able to
>> split handle_hvm_io_completion() gracefully or could we call it from
>> handle_mmio()?
>> The reason I am asking is to avoid calling it from the common code in
>> order to avoid introducing stub on Arm which is not going to be ever
>> implemented
>> (if msix_write_completion() is purely x86 material).
> I'm unconvinced of this last fact, but as with about everything it is
> quite certainly possible to call the function later. The question is
> how ugly this would become, as this may involve redundant conditionals
> (i.e. ones which need to remain in sync) and/or extra propagation of
> state.


I understand. Would it be better to make handle_hvm_io_completion() per 
arch then?
This would avoid using various stubs on Arm (we could get rid of 
has_vpci, msix_write_completion, handle_pio, 
arch_handle_hvm_io_completion, etc)
and avoid renaming of handle_mmio().

Julien what is your opinion on that?


For example the Arm implementation would look like:

bool handle_hvm_io_completion(struct vcpu *v)
{
     struct domain *d = v->domain;
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
     struct hvm_ioreq_server *s;
     struct hvm_ioreq_vcpu *sv;
     enum hvm_io_completion io_completion;

     sv = get_pending_vcpu(v, &s);
     if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
         return false;

     vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;

     vcpu_end_shutdown_deferral(v);

     io_completion = vio->io_completion;
     vio->io_completion = HVMIO_no_completion;

     switch ( io_completion )
     {
     case HVMIO_no_completion:
         break;

     case HVMIO_mmio_completion:
         return ioreq_handle_complete_mmio();

     default:
         ASSERT_UNREACHABLE();
         break;
     }

     return true;
}


>>
>> 2. Regarding renaming common handle_mmio() to ioreq_handle_complete_mmio():
>>
>> There was a request to consider renaming that function which is called
>> from the common code in the context of IOREQ series.
>> The point is, that the name of the function is pretty generic and can be
>> confusing on Arm (we already have a try_handle_mmio()).
>> I noticed that except common code that function is called from a few
>> places on x86 (I am not even sure whether all of them are IOREQ related).
>> The question is would x86 folks be happy with such renaming?
> handle_mmio() without any parameters and used for a varying set
> of purposes was imo never a good choice of name. The situation
> has improved, but can do with further improvement. The new name,
> if to be used for truly renaming the function need to fit all
> uses though. As such, I don't think ioreq_handle_complete_mmio()
> is an appropriate name.
>
>> Alternatively I could provide the following in
>> include/asm-arm/hvm/ioreq.h without renaming it in the common code and
>> still using non-confusing variant on Arm (however I am not sure whether
>> this is a good idea):
>>
>> #define handle_mmio ioreq_handle_complete_mmio
> If anything, for x86 it ought to be the other way around, at
> which point you wouldn't need any alias #define on Arm.
But could this approach be accepted? I think it would be the easiest way
to avoid confusing on Arm and avoid renaming that function in the whole 
x86 code.


>
>> 3. Regarding common IOREQ/DM stuff location:
>>
>> Currently it is located at:
>> common/hvm/...
>> include/xen/hvm/...
>>
>> For the non-RFC patch series I am going to avoid using "hvm" name (which
>> is internal detail of arch specific code and shouldn't be exposed to the
>> common code).
>> The question is whether I should use another directory name (probably
>> ioreq?) or just place them in common root directory?
> I think there are arguments for and against hvm/. I'm not of
> the opinion that ioreq/ would be a good name, so if hvm/ was to
> be ruled out, I think the file(s) shouldn't go into separate
> subdirs at all.

Got it.


-- 
Regards,

Oleksandr Tyshchenko


