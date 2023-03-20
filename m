Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C056C104D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511842.791156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDNI-0003xv-1e; Mon, 20 Mar 2023 11:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511842.791156; Mon, 20 Mar 2023 11:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDNH-0003uo-Uy; Mon, 20 Mar 2023 11:08:23 +0000
Received: by outflank-mailman (input) for mailman id 511842;
 Mon, 20 Mar 2023 11:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkKL=7M=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1peDNG-0003ui-Pr
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:08:22 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86a3675f-c70f-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:08:21 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id v25so6462021wra.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 04:08:21 -0700 (PDT)
Received: from [192.168.25.227] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a05600000ce00b002be505ab59asm8593307wrx.97.2023.03.20.04.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 04:08:20 -0700 (PDT)
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
X-Inumbo-ID: 86a3675f-c70f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679310501;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHLZ9hNwEsISJCMGi0AX2Dcq58mPz/ZQu0l4qDm1Cjc=;
        b=W1HgumVX+zNQtfwEzkD7tTQjwFuvuSMocX1FH1CTlGf17tvVbzKBTS0p/Wnkrg+bNx
         xZRZhi/i5Ao5WgezZ5l/GEdaqFzt7lteIoV24FUpVzglX6TMW1oN12/rrMMzcVXubefO
         rvvba+l7JXgqsHNM40RmYDvUS/hpLE/ExkT8f8iNLOyW58ZMf51izMu+yWiHMaLF1FO6
         DqgjadbSNkDqtxVGEsa1tiibfAVAeR4ZMPtCHGeR2VzQuKoFp97zL96RKR3Ze3xubiY+
         wazcbQsiwgX1e+zG3bzTRN2nTLHmWFwa1Y8WfASPJuUF0j4rQnR4GsqZY27GWNij3RQp
         eZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679310501;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHLZ9hNwEsISJCMGi0AX2Dcq58mPz/ZQu0l4qDm1Cjc=;
        b=vQP7RT3SjjgaUqojFcu+c+ugFG2CamgYUttMf5KyOb4QYyM6rz6w8wf6YQXqwrHRf6
         ThDFdvdDsoOCgpyXTW5B6hXGyvhDbPzF4brPHqABp5RNX0SDQ5TeS9mleRxj6K9njpMt
         RGZhQp/rkjM24Eef/3nsPBAxL5H/4LNmkS646i7RfSpHvsmOpZ9h2iIvah+ie75pp6E9
         ML7s35avTJhV1ArL6+bmSZLgULIctCSvlQDpX3yI9xKjgRPSxKqDUYQqJ3/EtsbUFS0Q
         Js21nzsJ/d64OzFXkMjG/m8q3Oq5uxfqBDi81nTgD0tXofNmAUh/t2dbWILbe594zzfr
         RaFQ==
X-Gm-Message-State: AO0yUKWcLBLaU0IJSHk8fQCgA2uhxfIAqK0hFXuUDdJqma8ahmZZD8Rc
	Hc14wQcCsgctND+GVm9UoL4=
X-Google-Smtp-Source: AK7set/MsycjgfVLnJE68cFBZQnuV9Kv+gktu9xw0UDYD00/F+Th8FmQWlCBnUe7xHGn/NYajv9nKg==
X-Received: by 2002:adf:fd42:0:b0:2d3:5a0e:3ed8 with SMTP id h2-20020adffd42000000b002d35a0e3ed8mr8560384wrs.52.1679310501136;
        Mon, 20 Mar 2023 04:08:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1a6b96a0-0860-a4f3-a2ee-089b6605b406@xen.org>
Date: Mon, 20 Mar 2023 11:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] Fix PCI hotplug AML
To: Jan Beulich <jbeulich@suse.com>
Cc: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <16d19b45842d4f98f130c98628932eb2d62ffe72.camel@infradead.org>
 <2f1c2da9-ad21-cf4d-230e-b3e01658f25f@xen.org>
 <5ab7332d-f0ca-d803-38c0-4e0210df5eb9@suse.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <5ab7332d-f0ca-d803-38c0-4e0210df5eb9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2023 10:34, Jan Beulich wrote:
> On 20.03.2023 10:04, Paul Durrant wrote:
>> On 17/03/2023 10:32, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> The emulated PIIX3 uses a nybble for the status of each PCI function,
>>> so the status for e.g. slot 0 functions 0 and 1 respectively can be
>>> read as (\_GPE.PH00 & 0x0F), and (\_GPE.PH00 >> 0x04).
>>>
>>> The AML that Xen gives to a guest gets the operand order for the odd-
>>> numbered functions the wrong way round, returning (0x04 >> \_GPE.PH00)
>>> instead.
>>>
>>> As far as I can tell, this was the wrong way round in Xen from the
>>> moment that PCI hotplug was first introduced in commit 83d82e6f35a8:
>>>
>>> +                    ShiftRight (0x4, \_GPE.PH00, Local1)
>>> +                    Return (Local1) /* IN status as the _STA */
>>>
>>> Or maybe there's bizarre AML operand ordering going on there, like
>>> Intel's wrong-way-round assembler, and it only broke later when it was
>>> changed to being generated?
>>>
>>> Either way, it's definitely wrong now, and instrumenting a Linux guest
>>> shows that it correctly sees _STA being 0x00 in function 0 of an empty
>>> slot, but then the loop in acpiphp_glue.c::get_slot_status() goes on to
>>> look at function 1 and sees that _STA evaluates to 0x04. Thus reporting
>>> an adapter is present in every slot in /sys/bus/pci/slots/*
>>>
>>> Quite why Linux wants to look for function 1 being physically present
>>> when function 0 isn't... I don't want to think about right now.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> Fixes: 83d82e6f35a8 ("hvmloader: pass-through: multi-function PCI hot-plug")
>>> ---
>>> Utterly untested in Xen. Tested the same change in a different
>>> environment which is using precisely the *same* AML for guest
>>> compatibility.
>>>
>>
>> This AML only relates to the hotplug controller for qemu-trad so it's
>> unlikely anyone particularly cares any more. In fact I'm kind of
>> surprised the generation code still exists.
> 
> Why would it not exist anymore? Use of qemu-trad is deprecated and
> advised against, but it's still possible to use it. Otherwise quite a
> bit of cleanup in libxl could also happen, for example.
> 

Right. I'm just surprised that is not done already... seems like a while 
since trad was deprecated; I'd have thought it could be removed in the 
next release.

   Paul


