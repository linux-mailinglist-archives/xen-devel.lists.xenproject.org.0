Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A6B09B18
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047993.1418314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceDr-0003ri-Rc; Fri, 18 Jul 2025 06:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047993.1418314; Fri, 18 Jul 2025 06:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uceDr-0003qH-OY; Fri, 18 Jul 2025 06:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1047993;
 Fri, 18 Jul 2025 06:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQq3=Z7=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uceDp-0003ps-Ta
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:05:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33c27610-639d-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 08:05:27 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1057613f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 23:05:27 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48991sm854502f8f.44.2025.07.17.23.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 23:05:26 -0700 (PDT)
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
X-Inumbo-ID: 33c27610-639d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752818727; x=1753423527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/Z0e0v+mj/JtzZZOgIVYftr5t4NKA0qBwbcMyxAgqQ=;
        b=DpQk9fSWjV4SYwcTMSdcswQPVWTsdvOQzjpQJPC8rImW6ltHoXvClI1BX7DdrSmzdN
         Zwn+6kG03sUMi88Q4RQM6Jl/3UYdP7RNXDlNb4TRvrSrs5f13JUkMpYbnURhN/dV5Njt
         D47sNAHThbecqS7MsIhar0dy0msFEROa3K7xmFYX+qlk2qDbVMx9xxU7xu/UY7bIFhDU
         EtSQi8iyAbgWe35q5/WPnhe72VKjI8e5iDxHLfdGwfHCT0bkAid08q2Bbr7uJ2NquzZt
         a8wubmfuV6XEASj+X8x58zyw+wPtAw0gkuGtnvtSdCC0+OxMBbyH6USFQl6l4G1lVLch
         IXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752818727; x=1753423527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/Z0e0v+mj/JtzZZOgIVYftr5t4NKA0qBwbcMyxAgqQ=;
        b=MNh69xLRS/SiAVCdWD/c8eot2a+Xutb0pjdPM946QcmVldf5LPz4oNlkUnddDCf1he
         IVam41X0NUz+WnHpWABOm8Z01G9Bmi/eR4Dp+dTw2jLtXxkCef2xHqd3jSiWw06152LR
         j+FExVd9UMIFXRg7Hh0wd7zC9bvEn46hMp51ChutneGIg5dpcrbW1KZ8TOUpAH5aq6Fq
         vb9V0isSa5m7BsgWLTxNHx1N5HW/04PARKbhCFIxMWlk7rOuKkXl/2f//GSeeOJ/FuAS
         mAlgzr+Mg9Sr5FuGp9/WC/jE4aJE3UChQio+0nWfRlvbKNFSwLgcgNuugTykf75jHi6C
         httA==
X-Forwarded-Encrypted: i=1; AJvYcCUtmR8hTVw4leka6qGyEeYJad78lj+r3mFKBTquc1xaa+DPX5bB7UriNsKS0hHBhs+mH5yMU8y40/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa5E6OT/zoanIK15D8oM/KftToXOZ8TyoPwDEDvzREnSAXQnnk
	w787xpGv0Ulu/wvUWUgjGOIDQCMWMYQ/q3O8tEqxY0mqgWJnbmCSlONxwGTXI/Lcrf4=
X-Gm-Gg: ASbGncv6adG80Ko62dlgMphSPvTkgWU5ACfruG9jRJTntW5UOsSYaXC5SHUE46PvUMn
	oyJEYGSzBBMqRW56kNw8SwVQ6EqvodPXE8SiW3MGOQDpYFpU8OXPY1WHE/g7pDIc/exNuxPhswI
	WCebwcA+mXlnILJdiJv5AQo5126PWimlCsbLtoaHAYAndWMzcmcyX4LFKgPl1ClO12k5u7sttty
	asJ6FJA+67QV09DV48XWEOY7cvm5HTTIMKWubgAtaY1WCYFy0WvzdSn6uFWvJ8GbgAn35wSudZ8
	U6zRZ8/1gh0cmdL/W73aVT94onk+lB6iABy9b+1kpjKOjD/sEgOZVLeeVhk12Sz23jO87MPOytA
	6ebe3AiOaa/F40R9X5fl5yATwhR+13VKqGwDMnyKsykC45CsPr4V739z0vDfYmyVsTGIVnMOXiW
	H0
X-Google-Smtp-Source: AGHT+IEVwoPtEffqV2UvbXG9QA/NTIVikliowCIzaSgzMAwHP1lDMSfGQA4GeS4Vvw0eyzWGzY3TTw==
X-Received: by 2002:a05:6000:4816:b0:3b6:d95:a3a4 with SMTP id ffacd0b85a97d-3b61b0ebecemr1002389f8f.4.1752818727223;
        Thu, 17 Jul 2025 23:05:27 -0700 (PDT)
Message-ID: <2c536b62-1253-4ac2-a549-ce783f8bf5c6@linaro.org>
Date: Fri, 18 Jul 2025 08:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
To: Markus Armbruster <armbru@redhat.com>,
 Adam Williamson <awilliam@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250717220207.171040-1-awilliam@redhat.com>
 <87v7nqgk21.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87v7nqgk21.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/7/25 07:11, Markus Armbruster wrote:
> Adam Williamson <awilliam@redhat.com> writes:
> 
>> In cfcacba an `error_report` was added to this file, but the

    In commit cfcacbab38e ("xen/passthrough: use gsi to map pirq when
    dom0 is PVH") an `error_report` was added to this file, but the

>> corresponding include of `qemu/error-report.h` was missed. This
>> only becomes apparent when building against Xen 4.20+.
>>
>> Signed-off-by: Adam Williamson <awilliam@redhat.com>
>> ---
>>   hw/xen/xen_pt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>> index 9d16644d82..006b5b55f2 100644
>> --- a/hw/xen/xen_pt.c
>> +++ b/hw/xen/xen_pt.c
>> @@ -54,6 +54,7 @@
>>   
>>   #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>> +#include "qemu/error-report.h"
>>   #include <sys/ioctl.h>
>>   
>>   #include "hw/pci/pci.h"
> 
> Uh, error-report.h is included without this for me.  To see, build with
> -H:
> 
> . /work/armbru/qemu/hw/xen/xen_pt.h
> .. /work/armbru/qemu/include/hw/xen/xen_native.h
> ... /work/armbru/qemu/hw/xen/trace.h
> .... ./trace/trace-hw_xen.h
> ..... /work/armbru/qemu/include/qemu/error-report.h
> 
> Code smell: header in include/... includes header from hw/.  Not this
> patch's concern.

Lucky side effect of including "trace.h" a include/ file due to trace
event being called in inlined function. Bad pattern indeed.

Back to this patch:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



