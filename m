Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA4584BDF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 08:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377330.610491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJWh-00067K-9v; Fri, 29 Jul 2022 06:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377330.610491; Fri, 29 Jul 2022 06:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJWh-00064f-6z; Fri, 29 Jul 2022 06:31:11 +0000
Received: by outflank-mailman (input) for mailman id 377330;
 Fri, 29 Jul 2022 06:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHJWe-00064Z-T9
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 06:31:08 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07761000-0f08-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 08:31:08 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id z15so4631934edc.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 23:31:07 -0700 (PDT)
Received: from [192.168.1.93] (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.gmail.com with ESMTPSA id
 x12-20020aa7d38c000000b0043cfc872e7dsm1719742edq.10.2022.07.28.23.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 23:31:06 -0700 (PDT)
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
X-Inumbo-ID: 07761000-0f08-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Cn/oyKxFmI9jm6sR6JbOZ5E2S9s8W49u+9SGsSdMG9g=;
        b=GwU5ggBFFRZJAc5Qf6x5+JbDAYLYL3Nq4OPNnQvSjNtIf2m6ixoE7c87y7K1SOBh6X
         XAn5UlSPN0t7jTg432ITOQ6gyxQtS1HaTdiZ9mJU4fp/eeTqOJRpLfW8OUPy9EBPFlEl
         As27JNht5MmWtkR3Ya4+BJGikK4PmRQLJvXjAAzMw9dycWIguSUfXSbsc7sjZ+NYADGo
         ZHA8Z+f9+CUHPszPBKU9Nc9TACti1NG367rNvQ2Zd/FT3JiXkyZJrpfeaQqMnMp/fhu+
         S2vmHAVxKwQ/PtoExMZEFiR8hiKxdvQ4v8kTFJbWl70caK3N0yLqL/pmC8/Qess0JNFg
         uJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Cn/oyKxFmI9jm6sR6JbOZ5E2S9s8W49u+9SGsSdMG9g=;
        b=LubeNWOMPZPhClBpkR953LrZ3OBSJFhMMhc7wF4P84sPXI/EY6Bz6MkP9yCdSH1MuU
         p6TAKDOLULLFRuq401ONbHIl0CMM+MGWf9R1XJe6rsuZNNxvbwV/O/BAOQCUY5lD3Rzl
         orttjiY1OG43yt1kIRF0vEkYyZ2a9nz7UqdOFywqFdcA8aISMSufaRrNfSxOr5vea//y
         7VCzfVQXQeEfHbft3kEh7vbsdSk9x0Z5IHSDZadf6yVXUa7iNRNpBlkTkvPLAtlmA8KB
         PmtcHSKgIKsyc8z4muVBOfwm7LYz9YSsDiW1ohzFfz9FXAQyztKapTXAj05XrxJFFbms
         yLbQ==
X-Gm-Message-State: AJIora9+b+Q74z9Qi6/iIOugUF+WBxyGf5R4yGijxBXSK7JlL7QizIqL
	M5rUbtKOY1bMvSDwC3zSu30=
X-Google-Smtp-Source: AGRyM1uz+5TSoUJKXYuM/VaWbW8G5SAWMhCUJ1963yEdG1WRdtbxUCe1dqyCrdDbowUYiGqmdIddog==
X-Received: by 2002:a05:6402:428a:b0:42e:8f7e:1638 with SMTP id g10-20020a056402428a00b0042e8f7e1638mr2101231edc.228.1659076267184;
        Thu, 28 Jul 2022 23:31:07 -0700 (PDT)
Message-ID: <b9f3bbc1-e6ec-35c3-6ff6-35e051c86953@gmail.com>
Date: Fri, 29 Jul 2022 09:31:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728162151.1228747-1-burzalodowa@gmail.com>
 <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 7/29/22 09:26, Jan Beulich wrote:
> On 28.07.2022 18:21, Xenia Ragiadakou wrote:
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -63,7 +63,7 @@ static void do_idle(void)
>>       rcu_idle_exit(cpu);
>>   }
>>   
>> -void idle_loop(void)
>> +static void idle_loop(void)
> 
> While you're adding "noreturn" below, shouldn't this one be marked so
> as well? Preferably with the addition:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 

Yes, but I was not sure if this should go in this patch or in a separate 
one.

-- 
Xenia

