Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E805B68C360
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490621.759407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4OQ-0007Zl-2Z; Mon, 06 Feb 2023 16:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490621.759407; Mon, 06 Feb 2023 16:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4OP-0007Y3-Vs; Mon, 06 Feb 2023 16:30:57 +0000
Received: by outflank-mailman (input) for mailman id 490621;
 Mon, 06 Feb 2023 16:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP4OO-0007Xx-D0
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:30:56 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a072f243-a63b-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 17:30:54 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so4011961wmb.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 08:30:54 -0800 (PST)
Received: from [192.168.1.93] ([188.73.236.41])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003dec22de1b1sm12288382wmq.10.2023.02.06.08.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 08:30:53 -0800 (PST)
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
X-Inumbo-ID: a072f243-a63b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uN6Yn35LFEIaC9C7Z2m6Dq4ezkXfgzSR56vHUQFmHCs=;
        b=lhsk4hFGRib+oyICAU3Ja8n2wYlnsI4rUfiuAAxm8dB9d4uQSLJ/ZczDj2uVV7nf7x
         jamNL5RsPOT1zmPMx5QOCT4SDQRbdqVAPqXGll5ulRWRa9cRYTAoNMGt5K+6FH8PN4jA
         TwjeSiZebfva86eK2eup6woVDwHnBPrf4q83xRK8QUhdIF8yNDTZTFczf3dilW0dA87K
         DHOjbMmMsWpfsTX+jWtWM5D1OSF0iqJa2QC1qvEGgTDOqsgENYW5JRFvFV/3G9dp80K7
         LpleHAfJCuq30O1+B9mjX9ja4dq5Fjw4VOVj8OHNZrQUuLdTieeu7h/VD5VDlvzN708D
         CsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uN6Yn35LFEIaC9C7Z2m6Dq4ezkXfgzSR56vHUQFmHCs=;
        b=vlvytwIYE8uaey5QbRKeR5GO/Pn2+bEf0K575HqdJZ262Jmvubx2kTKr4Isaduay2u
         JDptTVNSCHi3M7rI9AS0KucMam63WZDu3Kk3tPWaLMtkeeqB7Xn64qBZDQOyWIOpXwNX
         pNJlRXCeMu24hTCOb8cMsHH1RoCMi9EU6LuEtg47RzRgbrgWEYpDCjtrfVyhdZGtGRlJ
         PtsaMXn9LVT+ZYsPIVRCRI5KJ/2BfRhwAGIKKRVp6QYkwTuHXegxd/zJxqKwT+8vcvzH
         ngEVYZ4FV3lpxFCNojRcN95YmAt/HWeWA/4NsStn3W/8X3KjgJWMZpwyX3QeI5q304EF
         d/Jw==
X-Gm-Message-State: AO0yUKWDmr07OvxY0VXR1Atb3SI1/9K03MDCcY4VmlJanVxOLSX37RV9
	r5iPz3Zghjh3INx199Qzi5k=
X-Google-Smtp-Source: AK7set8BfI+xpYgxoMkmEFNbyBqbCshOmbf4JSJ6Fih72wp9SVg1pUS0wHBcWWSj4LqX3WNgVCSZcA==
X-Received: by 2002:a05:600c:30ca:b0:3df:c284:7e78 with SMTP id h10-20020a05600c30ca00b003dfc2847e78mr264803wmn.38.1675701053975;
        Mon, 06 Feb 2023 08:30:53 -0800 (PST)
Message-ID: <8a1658e0-0778-688a-e2a3-bd8e4de0d542@gmail.com>
Date: Mon, 6 Feb 2023 18:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86: do not include asm/hvm/support.h when not used
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230206124251.911744-1-burzalodowa@gmail.com>
 <20230206124251.911744-2-burzalodowa@gmail.com>
 <90bef569-a49c-fd29-a855-5ef0b93b1056@suse.com>
 <5c112f02-37ab-8637-3e61-e5e19f42115d@gmail.com>
In-Reply-To: <5c112f02-37ab-8637-3e61-e5e19f42115d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/6/23 15:11, Xenia Ragiadakou wrote:
> 
> On 2/6/23 15:01, Jan Beulich wrote:
>> On 06.02.2023 13:42, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/x86/emul-i8254.c
>>> +++ b/xen/arch/x86/emul-i8254.c
>>> @@ -34,7 +34,7 @@
>>>   #include <asm/time.h>
>>>   #include <asm/hvm/hvm.h>
>>>   #include <asm/hvm/io.h>
>>> -#include <asm/hvm/support.h>
>>> +#include <asm/hvm/save.h>
>>>   #include <asm/hvm/vpt.h>
>>>   #include <asm/current.h>
>>
>> To be honest I'd prefer if only the HVM-specific part of this file had
>> this new #include (and ideally the other hvm/ ones would move there as
>> well, but I can see this being beyond the scope of what you're wanting
>> to do).
> 
> Ah I see. That's ok. I ll move it in v2.

After having a closer look at the code, I think it would be better to 
leave it as is in this patch because the struct hvm_hw_pit_channel 
(declared in puplic/hvm/save.h) and the function hvm_get_guest_time() 
(declared in asm/hvm/hvm.h) are used by the common part of this file. 
And I can send another patch to cleanup the headers in this file.
Unless you insist.

> 
>>
>> Jan
> 

-- 
Xenia

