Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB555B85E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356302.584446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5jZw-0002k1-Mf; Mon, 27 Jun 2022 07:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356302.584446; Mon, 27 Jun 2022 07:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5jZw-0002hM-Jc; Mon, 27 Jun 2022 07:54:40 +0000
Received: by outflank-mailman (input) for mailman id 356302;
 Mon, 27 Jun 2022 07:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kbpj=XC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5jZv-0002hG-4Q
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:54:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 649813e9-f5ee-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 09:54:38 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id cf14so11737440edb.8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jun 2022 00:54:38 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a056402111100b0042deea0e961sm7140360edv.67.2022.06.27.00.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 00:54:37 -0700 (PDT)
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
X-Inumbo-ID: 649813e9-f5ee-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P+fy/cYo5Rjn4tll9qI4vhve08KQRIZnXFgk4/rurV8=;
        b=TG3Jd71CkH+i3L1N3wE4bKJLuvy78hkd5cwLqk3aqBooDUzceYIf5vvhgooFdODqkz
         AWLZPNBV+p1TzUKG8VGG1ZuZZT1EPOiRi4jCP7TG6SxTfcy2J6B5OLgL8Z4P4F3lYE1d
         wDzQdith+gM/rFz1JJjCKLLC0XeS6N5Eg6Snpv5aSG0pCRSPBsbgHofk8xb/D9GuWoiU
         rjGmUFCqln8ateEA7wMIJQFAB4a65G+HwRrd9RcwC1ItNk7ICxftAwJp2VwJL86W7lr/
         0ZMSHbWREVusqOBm/103eQdZIm5HDrrpxN7vBOD1C4tHmfPkcWM3xhN8iT0ccZBmqnL1
         krOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P+fy/cYo5Rjn4tll9qI4vhve08KQRIZnXFgk4/rurV8=;
        b=57y/jQZJenLCquwujVPEx48uAyb0n8WPUdo6T24khSNfPI4MlDiwXdtzbPqQBQmuud
         M3eqLhNaAFBITm1KAG9fh3CIQ7jZWrdK/dxHHuuZi3fQOTDejNoKxz8p/lAE3f7RHUV6
         Bq4c/kXnwAhrDSHA7u+pAPwxdoSW+Ne+3A2VIjpLSbqWC5yHpEvTERsXsJYA7CjnRogT
         rscrgRkpaE40+BLv47mosvQ7xRvHpYP3EDZcjZjVixCTXR1O0jD57wU4Il0Kx1tMCKKE
         bpssa+hkbH5FfBiQHWIto+x8gKskmK84jw2/CIM63LcHswdqqFl8Lcn69CrXqLA0mUeo
         VLHg==
X-Gm-Message-State: AJIora9ioLOyPTtyahhglnfPRxzl4y36hkzPoYQltw01mogZRpdBKxi6
	DZSsJ4J87jcdMjMZgOzpa8U=
X-Google-Smtp-Source: AGRyM1vad67RR+ny6LvgZLW6hK4GfYmphL3oUQ1ptCGgsKG/05tb+CLZ2IzTKuW2xPEfx1Czspc3Sw==
X-Received: by 2002:a05:6402:278e:b0:435:bdc4:9294 with SMTP id b14-20020a056402278e00b00435bdc49294mr15355622ede.350.1656316477692;
        Mon, 27 Jun 2022 00:54:37 -0700 (PDT)
Message-ID: <cb50eba7-bbc5-3100-2be3-98587766c240@gmail.com>
Date: Mon, 27 Jun 2022 10:54:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-3-burzalodowa@gmail.com>
 <61094b37-4075-e362-7fc6-ce28f965bb05@suse.com>
From: xenia <burzalodowa@gmail.com>
In-Reply-To: <61094b37-4075-e362-7fc6-ce28f965bb05@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 6/27/22 10:11, Jan Beulich wrote:

> On 26.06.2022 23:11, Xenia Ragiadakou wrote:
>> The function vm_event_wake() is referenced only in vm_event.c.
>> Change the linkage of the function from external to internal by adding
>> the storage-class specifier static to the function definition.
>>
>> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
> Actually also for patch 1 - this is slightly confusing, as the title
> talks about 8.7. At first I suspected a typo. May I suggest to add
> "also" (which I think could be easily done while committing)?


This is actually a violation of MISRA C 2012 Rule 8.7 (Advisory), which 
states that functions referenced in only one translation unit should not 
be defined with external linkage.
This violation triggers a MISRA C 2012 Rule 8.4 violation warning, 
because the function is defined with external linkage without a visible 
declaration at the point of definition.
I thought that this does not make it a violation of MISRA C 2012 Rule 8.4.

>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

