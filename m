Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1FAB12343
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 19:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058334.1425971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMYV-0002O6-Bm; Fri, 25 Jul 2025 17:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058334.1425971; Fri, 25 Jul 2025 17:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMYV-0002LR-8K; Fri, 25 Jul 2025 17:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1058334;
 Fri, 25 Jul 2025 17:50:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g6R=2G=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ufMYT-00029D-WB
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 17:50:02 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8dc20d5-697f-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 19:50:00 +0200 (CEST)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7fd35b301bdso3110187a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 10:50:00 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e60969c5fsm2868233a91.0.2025.07.25.10.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 10:49:58 -0700 (PDT)
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
X-Inumbo-ID: c8dc20d5-697f-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753465799; x=1754070599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3ixWOFQSdtnMlAkMQjP55eepzrSw0REYSmNy/7+pUQ=;
        b=uWUFPNfwvgzH57rxqIOsyzQK2DyJWghywXIdIqRDLkrK+IBduaTE6F1iahDEdM9KY9
         TcYis845+1H8NTMZNhA1G1Jvyy2np0NO5eXTZwKcdZSmVXlbXgT/c0GaX2dOSoSjIdS1
         CLautU4r1bh7JY36sUY6ZkDSt4FCyje/U+EeL35ui3J7y6syAqqBo4BSI5TtbUYoMBe/
         1X2scbcxNN/0iXz8CsM0XpL8NXktM2fSXfQfwBrCUB4/AV3blzf/CsyC37QoBtlXYWu0
         wdZh/2HVU7KJbXPyqYY1hhfIf4WdNLqf9p0d3Orn3szvR4IVnVrQyjz9YN8hx1gkdpA/
         GpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753465799; x=1754070599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3ixWOFQSdtnMlAkMQjP55eepzrSw0REYSmNy/7+pUQ=;
        b=ZmFgGFRicZAr21wje2ZWPG+wT9b6F3uwvs0B6sRzNo56axlI3fAxQvd8dJ+pxhEnbz
         z4EYUkNQSW/J3VkiACNjZxdPgAKzALLmWbUd8YLea2EU+DVeI0rKQxyyiW1AruMTVrTQ
         o6u4hqa5eCS7O4rO/8AjLXTYg/Ju/WMxRypqnkjr2PuzQaabiOAM/3GeaZKN6wdVNOOK
         7rDeENYOHMKGdw3BEmjM4HiW2q0FpTsObKtsPXROjEtDdW+IyBPvrF9Q7ary5Ggn7m3j
         5DSzQDVvKOCTRCP2G06sAAGpuIiuyyyQMeXLTILjETNKWDr1ML2n38mBLTVdQjDVRbcP
         a3dA==
X-Forwarded-Encrypted: i=1; AJvYcCXAEaPj6RAO1tV60lzU66ZBAHnTVoFoRltvrcbcONju3FDLaZ6Mf+SooWoSD3RFJdXZjMiFlPBGw2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWiOV4mRiQuvkW1Q8KaG5GjL/Yy6dXUMf8T3+oGpcy646Lp/Ho
	naVRq0X98Rd8V2usF4ajqcUJAcu95c8RSMhWGcJDatAnt9CAnOS7c44XWnE7Xo8oNV4=
X-Gm-Gg: ASbGncub3kI0HitJeaQR4Lgg1KTdPtGoGV3SAeplh23JO1ofrYa5X3pFfSU/Zmf/hPp
	oJwK9n4NI8yvdfaSDxNzlzTBt2pM/hOHD4gdPHqrVidRQvG5DKQLQ2HtFrKiH1ptLbGtYDD/J0p
	1avorN6qMPQ3gMVJNlNrcx0BTh7Eu2POUR3IH2rni/3sopuV+3p7CkMq0IfT8YOn0MkA22Bb0eu
	0IfsXdOFmXNqebIINm3Tm8SYrLtME0ocCWzGMrBXYkYMc8wBv11jH8GifWw29ImGz1iZufljA07
	eIyqtxP/0KcPlV1PjohhR8UWN3DfmtKvqFcgVDS40KbDq2xHDQcfuNjv+isJrKssItJ3tHc9b+j
	fsYBt/4dGk4C1uUTpqvY6pkqTeSpWWcnwJdc=
X-Google-Smtp-Source: AGHT+IGA6nzBTN5x7ahi8V8FicF2CRu4Ub1bpooNS+QJhQiHtXf9qw5HzP7eA6P6xsTpgfOVT/UE+g==
X-Received: by 2002:a17:90b:584b:b0:312:1508:fb4e with SMTP id 98e67ed59e1d1-31e77a00822mr4638684a91.17.1753465799215;
        Fri, 25 Jul 2025 10:49:59 -0700 (PDT)
Message-ID: <5577bfdd-2441-4b6f-a58a-29bc2a6850c7@linaro.org>
Date: Fri, 25 Jul 2025 10:49:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/xen_pt: fix missing include
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20250725165749.3893240-1-pierrick.bouvier@linaro.org>
 <aIO9SHJkDPnrfAHf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <aIO9SHJkDPnrfAHf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/25/25 10:22 AM, Daniel P. Berrangé wrote:
> On Fri, Jul 25, 2025 at 09:57:49AM -0700, Pierrick Bouvier wrote:
>> FAILED: libqemu-i386-softmmu.a.p/hw_xen_xen_pt.c.o
>> ...
>> /home/user/.work/qemu/hw/xen/xen_pt.c: In function ‘xen_pt_need_gsi’:
>> /home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Wimplicit-function-declaration]
>>    783 |         error_report("Cannot open %s: %s", guest_type, strerror(errno));
>>        |         ^~~~~~~~~~~~
>>        |         error_report_err
>> /home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: nested extern declaration of ‘error_report’ [-Werror=nested-externs]
>> cc1: all warnings being treated as errors
>>
>> Fixes: 012842c ("log: make '-msg timestamp=on' apply to all qemu_log usage")
> 
> The problem pre-dated this, so this should be
> 
>   Fixes: cfcacbab38e (xen/passthrough: use gsi to map pirq when dom0 is PVH)
> 
> See the prior posting of this fix last week:
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2025-07/msg04831.html
>

While true, this was not a problem as error-report.h was still 
implicitely included (as Markus pointed). We can debate where the 
regression comes from, but from git bisect point of view, this is the 
trace one, at least with the simple "./configure --enable-debug".

I don't mind changing the fixed commit, or even removing any Fix line at 
all, but we just need something upstream merged as soon as possible to 
not break everyone build.

>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   hw/xen/xen_pt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>> index 9d16644d82e..006b5b55f24 100644
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
>> -- 
>> 2.47.2
>>
> 
> With regards,
> Daniel


