Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC2BB09B43
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047999.1418323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceTU-0007an-4q; Fri, 18 Jul 2025 06:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047999.1418323; Fri, 18 Jul 2025 06:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceTU-0007ZB-1w; Fri, 18 Jul 2025 06:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1047999;
 Fri, 18 Jul 2025 06:21:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQq3=Z7=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uceTS-0007Xu-Dx
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:21:38 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74ef6ad5-639f-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 08:21:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso791407f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 23:21:36 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2b81asm898980f8f.20.2025.07.17.23.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 23:21:35 -0700 (PDT)
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
X-Inumbo-ID: 74ef6ad5-639f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752819696; x=1753424496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7vYcLwfK3H2c1tSJleUypbU7M3wqbN1e3jpA5zKYtA=;
        b=p85p28viDVHNppaNfxL3JjRZrAMr2OOtM16xcjI+QnQWCetoyN/wceBs4f9Zn/haZ5
         cKkmq8oRqukChIgPfvCglvKlCV+SfhXLKjiLgFR7QZO+joYloPrwzlh6V/7XQWlv9gNs
         JHYbiCCCEO/BTDLm3ohPibe2afENZc9g+CWUOgeLtijZYHJpbYjL1JLmGYgdrMTqOIMW
         f38tKYyhmZqeaM1+SSy+MZ3Lgt1q0MtiHbs1CufgtHnkKiSmLPiXibOGHCvFxC9cK6cK
         vVpCpVfIFsjnqwo4uC1IJjCcQqzM+sC0tdpHWhnboKqjdBD7Wtb3h1h/HPawGHwfa3Dp
         KdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752819696; x=1753424496;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7vYcLwfK3H2c1tSJleUypbU7M3wqbN1e3jpA5zKYtA=;
        b=nKgrWE8MigUUAxoGqwu3YBYZGhM8koLn14JXwkn77a44q1ckE9UNiSa9v2LP6cHkS/
         YQc4cKqglnA+bxKjgvRIBNaUlcITb0zIDrxdLzBxaTuCHL1O9Wa7N9MVnQCwsq1zT12y
         l/swr80QvOaZUX6VBmEU3btKQPcAFB7WuhBrAf7Pc7QSy5OKzK3Yu6Pb8vqOOqpMR7e7
         5zRXFu04lNlLxgKY96b2RVvxKk4SwAW1/G2Io+hhFBwC7HzPo89CbnYV0F1CV0ePoJYp
         +DpP+tMBpT4SHB+qSjptvPIA9RTV3rayir5B2rKVmzJJOLmUKzzdOmBp+lt2R0fcgKer
         13lg==
X-Forwarded-Encrypted: i=1; AJvYcCVVhx+ByAFVJCY4W6GNZR+4USXOyd2tA1mMW3qV4HF09skrSG8JLLSpMZPJloD2aZhH1y0JAI4Zx0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+9Xafjo6NRUvNfyV9cXVRfh9duFO4f5X05uNju3fld9U6iOxt
	wFQvEe1J0kQ5u8BSTs7a1cm3POaeNH9HbDEpBvM5WAEEOZKwOBQ4EOJ7Qm9ojWyfIGA=
X-Gm-Gg: ASbGnctRH0N5BapKQOztcP/h9kvdQnOoxU23WfAfccQQSwJhvSvIBn1OQX270bKBfTW
	OBlb0ue89+GPU/Hu/IvS3olJIga8GhNyuNLCrvHf1fMwO8Fvfob8rv4mHz6HsdUihSv9AiMY2bE
	gsbuuHR2RZTQ2ctUA58AKWRqVnTU1P6vF6VdkbG2n0WWlBWhj455FKhPQ2xFTa6uW2KKoi8lPoK
	Hj9GSDhKUI9Gji6+Nm/r3iXVS9wydjc+I8PZhJHQCD36rNKqsdxPawDLyqg3o9FuoX5E+NyH+2z
	BV5Oo1fXXBm4guGnvkZ1Yo/+XtRSp57XnRFSx+NawJu73ajCrsKs4zJexM1Tc1VRffqLnQnvc8b
	aMm5GM0jElfQ5ztSYHi6QdcbOiyvmMNKlLyTUwiul3rqloZZwGVq+q9zfb4s5Bres3yVh/UUV/t
	EU
X-Google-Smtp-Source: AGHT+IEC5tQgQtwh1CjuHRTa9lNpCTVmoTmlu6n6EV8FHBz3FyQIYyhE/5tBkTAkk2hbHp95Cb0VIA==
X-Received: by 2002:adf:e19e:0:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3b613e984b9mr3705327f8f.30.1752819695582;
        Thu, 17 Jul 2025 23:21:35 -0700 (PDT)
Message-ID: <25667aaa-d884-4615-acc2-da230728923d@linaro.org>
Date: Fri, 18 Jul 2025 08:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
 Adam Williamson <awilliam@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20250717220207.171040-1-awilliam@redhat.com>
 <87v7nqgk21.fsf@pond.sub.org>
 <2c536b62-1253-4ac2-a549-ce783f8bf5c6@linaro.org>
Content-Language: en-US
In-Reply-To: <2c536b62-1253-4ac2-a549-ce783f8bf5c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/7/25 08:05, Philippe Mathieu-Daudé wrote:
> On 18/7/25 07:11, Markus Armbruster wrote:
>> Adam Williamson <awilliam@redhat.com> writes:
>>
>>> In cfcacba an `error_report` was added to this file, but the
> 
>     In commit cfcacbab38e ("xen/passthrough: use gsi to map pirq when
>     dom0 is PVH") an `error_report` was added to this file, but the
> 
>>> corresponding include of `qemu/error-report.h` was missed. This
>>> only becomes apparent when building against Xen 4.20+.
>>>
>>> Signed-off-by: Adam Williamson <awilliam@redhat.com>
>>> ---
>>>   hw/xen/xen_pt.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>>> index 9d16644d82..006b5b55f2 100644
>>> --- a/hw/xen/xen_pt.c
>>> +++ b/hw/xen/xen_pt.c
>>> @@ -54,6 +54,7 @@
>>>   #include "qemu/osdep.h"
>>>   #include "qapi/error.h"
>>> +#include "qemu/error-report.h"
>>>   #include <sys/ioctl.h>
>>>   #include "hw/pci/pci.h"
>>
>> Uh, error-report.h is included without this for me.  To see, build with
>> -H:
>>
>> . /work/armbru/qemu/hw/xen/xen_pt.h
>> .. /work/armbru/qemu/include/hw/xen/xen_native.h
>> ... /work/armbru/qemu/hw/xen/trace.h
>> .... ./trace/trace-hw_xen.h
>> ..... /work/armbru/qemu/include/qemu/error-report.h

FYI "qemu/error-report.h" was added in commit 418ed14268f ("trace:
make the 'log' backend timestamp configurable") to access the
message_with_timestamp declaration.

>>
>> Code smell: header in include/... includes header from hw/.  Not this
>> patch's concern.
> 
> Lucky side effect of including "trace.h" a include/ file due to trace
> event being called in inlined function. Bad pattern indeed.
> 
> Back to this patch:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 


