Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A55681F4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361962.591761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90dR-0006nJ-JY; Wed, 06 Jul 2022 08:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361962.591761; Wed, 06 Jul 2022 08:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90dR-0006k4-Gb; Wed, 06 Jul 2022 08:43:49 +0000
Received: by outflank-mailman (input) for mailman id 361962;
 Wed, 06 Jul 2022 08:43:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwIU=XL=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o90dQ-0006jy-Vc
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:43:49 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c087d745-fd07-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 10:43:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id f190so8387243wma.5
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 01:43:48 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a1ccc0f000000b0039749b01ea7sm33352907wmb.32.2022.07.06.01.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:43:47 -0700 (PDT)
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
X-Inumbo-ID: c087d745-fd07-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HvgVgBjxmDEC7BUXUWxN5Ar4FzPasbbILopqKZ/AQjY=;
        b=bFs7AISnYlfjo8ptoltfMipbLLwj3uti+l1tPCS0BufQBhLSp2avLjjhlpLInoe50i
         +MUnjxd2ENn3n8OPoz6MnDAJUoneWNy4aQuG7LXeklxLMLaYNlPh7UXRgo92VI3u1YT7
         nqBugMTRQrJHs6e6/qlChoKLXIP2j5bmNS5/9N95gccsisDKDjUytk7h7SF9B/ekGpRV
         UPYKbZNUnhqJHieniq1LRvjAO14cqYkYCHJ3i2oJywu8vtbBeK53bfdW1OsFo7eXypPF
         Uj+ss5gtPzlwR4zFA4GAQYzfIN/0taOe2kz53vQMU+l6f/Kut+0p7aYnEDD4l+wxDcXq
         pmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HvgVgBjxmDEC7BUXUWxN5Ar4FzPasbbILopqKZ/AQjY=;
        b=FNoKACnHoqV/R2RkGpGtdMRZKiBPkYC/B1K6+wRRiF1zJu0AKIEKw1+4c0Bx2bui/h
         XX5fwGKqJP744EzsMUo+M+KVZduP9852OUhLPKOLFGjTWn2HwvKl2ZBBuSSwIVwfHrin
         +WTfZ1IIf+cZoFAugklCYbnSpcW5AxEuUVEocoyH0xe3zbr+Lq+L5FqFPNeoARrR+u3m
         onLMhKI22TTg8Sn6TA8xgl9DihU7AJoywZ5smX9TmbX9wrNM8Pyew/umG8IYeN+6RjYo
         n+WEaylGZvggaidb7Ul7SasHMMBgeKAPIqoo1JYF5p+b6wf+Vlf+mErOcur45a35Y3SV
         1jeg==
X-Gm-Message-State: AJIora9NNEcN5Sf/xXfg3CALa21ah0RJRXM7PmTbzSvnUbTfEJJgRP2V
	WhUlYCT4O9bpAHRrSc8o/lo=
X-Google-Smtp-Source: AGRyM1ueGTxN3952cGT56AtMHet2CLP64G68z63zsnHDQPrjYHeDzfLjqOnmzN+g6pp+6xK1dzxk8A==
X-Received: by 2002:a1c:e907:0:b0:3a0:3e42:9c72 with SMTP id q7-20020a1ce907000000b003a03e429c72mr41321529wmc.162.1657097027502;
        Wed, 06 Jul 2022 01:43:47 -0700 (PDT)
Message-ID: <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
Date: Wed, 6 Jul 2022 11:43:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 7/6/22 10:10, Jan Beulich wrote:
> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>> The function idle_loop() is referenced only in domain.c.
>> Change its linkage from external to internal by adding the storage-class
>> specifier static to its definitions.
>>
>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>> attribute to suppress unused-function compiler warning.
> 
> While I see that Julien has already acked the patch, I'd like to point
> out that using __used here is somewhat bogus. Imo the better approach
> is to properly make visible to the compiler that the symbol is used by
> the asm(), by adding a fake(?) input.

I 'm afraid I do not understand what do you mean by "adding a fake(?) 
input". Can you please elaborate a little on your suggestion?

-- 
Xenia

