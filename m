Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD498D37CE
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731925.1137700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJTl-0003ur-4c; Wed, 29 May 2024 13:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731925.1137700; Wed, 29 May 2024 13:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJTl-0003s9-0p; Wed, 29 May 2024 13:36:33 +0000
Received: by outflank-mailman (input) for mailman id 731925;
 Wed, 29 May 2024 13:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vA4L=NA=gmail.com=yskelg@srs-se1.protection.inumbo.net>)
 id 1sCJTj-0003rz-Mz
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:36:31 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74a9d63d-1dc0-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 15:36:30 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1f4a52b9589so18285965ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:36:30 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f5e6a0c323sm7448965ad.259.2024.05.29.06.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:36:28 -0700 (PDT)
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
X-Inumbo-ID: 74a9d63d-1dc0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716989789; x=1717594589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dicpLSmGeHTxR8brlcEnN0cI1QEPfhfEJAkQtcJYjXg=;
        b=i0IwzJFNGucVXcWsUDt9wk8k21tDhJoykjLHu7HMxRqvuFhExZ7MJWkQ9t7PcNJINI
         G3CON6CgCGHGhmI5fPeLILnTitYHAF5xLd/E0L8EsZFzReStKOjQRCTtH6bAE53RkOYw
         vCQ4J7FRLEwqyjXkD8LRqD+0e0B+k4O0Xdmt7KVc/KgXCAmMFolHMYFuI1hNKHprswKC
         OTh3yGJauxrJvjVxVb9ZZ97P9a24yL2QNbRlm+inNRdx6deTCMCQu+nZKIsrrvsAfSGw
         H+MLBL1f98iJCok9A2+YI42mTB9f8DxsCH39dpLtABzKRTmamw4iHC/LI8Tc/Lh9oZUU
         8BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989789; x=1717594589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dicpLSmGeHTxR8brlcEnN0cI1QEPfhfEJAkQtcJYjXg=;
        b=oH/LDWYq+bFyy+mWy10POuKn/5wXzUywjIXE5wdDyWQqxvd+jIcBdvkuRaqQcdl1gu
         v9hpWKaPrQNb43GQF9cjZ0EaR76c4A19BeA/h1Eb/bvITBYb3OiwXqUf32JIhGg0xpt0
         mJEweO2WlXaUx6SMMDnAADi4nP0j3JohKnMkmnzF1MH9VlqCIIncXXjD8BNrYVnKiB51
         S/5wRu7gdCGSQJ24tWYCym4A2LjrI//hYXGH4QqOxwoTndtDyJ5G5xm+0ah6arqhl9mM
         YQXUgRDZyIaylRwjCsmT3/ssNxicNgEC3p5SDCS+SngE03ISSVFGiGTA/n7arzrqDOZe
         jYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Pl+9cIhGURq4Y386IB7Dp8/TUOir1kcBAINLkaCKmJjjnRE7QG1+GagMoWSxZiRKkzZXuJbdIFadnBLlMNtdoP9US3hM4Ys3Dei02DY=
X-Gm-Message-State: AOJu0Yy/wx6RP0skodSLVcHaK7Kswpq+/qMJCPpns8+DlgpI+t5EhEct
	PYsGOX/CGh41faadDkUHk6afHpMtagOU0Mex4A0wKVdvz39ticF0
X-Google-Smtp-Source: AGHT+IG2bzrds8yi4l23vZDAB9yvZEHtwj8ed98GsFY012BXS9ao17xB0hQkMahe4hP7gPU0TMZLBA==
X-Received: by 2002:a17:902:ce87:b0:1f4:8a83:a2dc with SMTP id d9443c01a7336-1f48a83a580mr95544275ad.10.1716989789220;
        Wed, 29 May 2024 06:36:29 -0700 (PDT)
Message-ID: <12ac8cc2-3117-4cb5-ab3a-2e8add3270a6@gmail.com>
Date: Wed, 29 May 2024 22:36:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: handle potential dangling pointer issue in
 xen_pcibk_xenbus_probe
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org, sj@kernel.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240529122232.25360-1-yskelg@gmail.com>
 <0c53415d-3394-455a-a6b5-99d3efb92318@suse.com>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <0c53415d-3394-455a-a6b5-99d3efb92318@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/29/24 9:27 오후, Jürgen Groß wrote:
> On 29.05.24 14:22, yskelg@gmail.com wrote:
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> If 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
>> not point to 'xdev' when 'pdev' is freed.
>>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
>> ---
>>   drivers/xen/xen-pciback/xenbus.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/xen/xen-pciback/xenbus.c
>> b/drivers/xen/xen-pciback/xenbus.c
>> index b11e401f1b1e..348d6803b8c0 100644
>> --- a/drivers/xen/xen-pciback/xenbus.c
>> +++ b/drivers/xen/xen-pciback/xenbus.c
>> @@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct
>> xenbus_device *xdev)
>>       INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
>>         if (xen_pcibk_init_devices(pdev)) {
>> +        pdev->xdev = NULL;
>>           kfree(pdev);
>>           pdev = NULL;
>>       }
> 
> NAK.
> 
> This doesn't make any sense, as pdev is freed.
> 
> 
> Juergen

Thanks for the code review Juergen!

I don't know if it's a big deal, but I think that if pdev->xdev don't
replace it with NULL, 'struct xenbus_device *xdev' address value stays
in the kmalloc cached memory.

And most of the kernel code I've seen does this (even when it's
'free_pdev()'), so I sent a patch.

In the very unlikely event that. I was thinking if someone look at the
value without initializing the kmalloced memory, someone might see the
'xenbus_device *xdev address'.

Warm Regards,

Yunseong Kim

