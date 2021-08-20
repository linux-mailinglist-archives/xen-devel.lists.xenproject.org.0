Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F364C3F2BDA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 14:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169507.309644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Tf-0004UV-Ql; Fri, 20 Aug 2021 12:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169507.309644; Fri, 20 Aug 2021 12:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Tf-0004Rt-Mv; Fri, 20 Aug 2021 12:18:27 +0000
Received: by outflank-mailman (input) for mailman id 169507;
 Fri, 20 Aug 2021 12:18:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1tc=NL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mH3Te-0004Rn-6K
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 12:18:26 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3239f2f2-fd67-4b22-875e-b3a22f9a8b6d;
 Fri, 20 Aug 2021 12:18:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i9so20169642lfg.10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 05:18:25 -0700 (PDT)
Received: from [192.168.10.179] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id y27sm673259lfa.260.2021.08.20.05.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 05:18:23 -0700 (PDT)
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
X-Inumbo-ID: 3239f2f2-fd67-4b22-875e-b3a22f9a8b6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/LayrJE7QVSHSD7UaPlooOdCQ2dRKb7KkcBeOvSZsiQ=;
        b=jPqw9BKMK90zi2us/D/FNJr24VFM1T9Gzvq1YZdRo6ooVMGa8TWc99uxPyuawVWssL
         VKGdViGbASReDmbkUgjCovaZx7XuPqYVCWt1y/WRU5kE8pXwqvO5LO0YQWyiSSB1IYzJ
         my87XTYg0roMkBFUrzU1KgUWAcP4RBJ+kHQp+/K27OWu8DHUaEdUK+dpy0179mpEdK1U
         ZBQPreWzEY5jzSJ/OlI9/bPu/obpMyfHDsFmeZay86KJYra6l8DC347lzj8YnhyqtGcB
         Gjb6N4pVJno2Oq6EaIhOY9n31QE0hbX9Maq/kdJtaCEBBW5a9bCSZP5t+Wl7ugxFwb26
         Ki3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/LayrJE7QVSHSD7UaPlooOdCQ2dRKb7KkcBeOvSZsiQ=;
        b=YwJ3zRjItZuyvzdOdylhvL+Lr3VGBxBUFSsEsHQPAmZyJbgouDZTT/AERqDGUNFNWr
         rxsGhWa7o5IAV9nqQFripVde+aT2olUb/rzE854Zb26ejr4TubpzV5Ma9sIZRA4ONl3G
         MZPeTKs6AA3f7zZEwpKnKUP2o+pRxAojfjM40OYUpdWi0XDjGp9zD/KXKplHkl8edIk1
         FNkxan2CE35LFpmc4ubYCWAG4njKreJ9M95DpHnIPn0bnK2BH1X6i9NDCKdhwQmRVyP/
         Q2eyTs7B1Z1YIXmrAnDCKi83HV4DvZTKIUuoVNozXJJ4LJOCxW43TIBTZZr6d4TX3tjq
         IkmA==
X-Gm-Message-State: AOAM530aZZw1mFAAqK7JTzBfIU+Ck6Kv8rdKoVeLPbrIiE8FZUgGkn6z
	zfzdMPMenG9/8pEwx6rlXnPPLrtFdId3Ow==
X-Google-Smtp-Source: ABdhPJzRlegQUaUqRLqlKrPimoeGIsLWCCCKUaIAXl84gnjKpdP3uapAh6UDyo/V8XzDlrNVzpjbzQ==
X-Received: by 2002:a19:e00a:: with SMTP id x10mr15206905lfg.536.1629461903756;
        Fri, 20 Aug 2021 05:18:23 -0700 (PDT)
Subject: Re: [PATCH] ns16550: Properly gate Exar PCIe UART cards support
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20210820115422.2185145-1-andr2000@gmail.com>
 <af460288-0fac-b894-f727-65010ca64088@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <016307c3-4a69-dc39-4a3b-490544b205a6@gmail.com>
Date: Fri, 20 Aug 2021 15:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <af460288-0fac-b894-f727-65010ca64088@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.08.21 15:07, Jan Beulich wrote:
> On 20.08.2021 13:54, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> This fixes Arm build which doesn't have ns16550 PCI support.
>>
>> ns16550.c:313:5: error: implicit declaration of function 'enable_exar_enhanced_bits' [-Werror=implicit-function-declaration]
>>    313 |     enable_exar_enhanced_bits(uart);
>>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~
> This can't be the full story - both Arm32 and Arm64 build fine for me.
> In fact I can't find any "select HAS_PCI" outside of x86'es subtree.
>
>> Fixes: 5ffd37db2ff6 ("ns16550: add Exar PCIe UART cards support")
> IOW this tag is wrong, no matter that I agree that ...

Ok, the full story is that I am building this with PCI passthrough support on Arm,

so yes, you are obviously correct here and "Fixes" tag does not apply.

I will remove it.

>
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -308,7 +308,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>       /* Handle the DesignWare 8250 'busy-detect' quirk. */
>>       handle_dw_usr_busy_quirk(uart);
>>   
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef NS16550_PCI
>>       /* Enable Exar "Enhanced function bits" */
>>       enable_exar_enhanced_bits(uart);
>>   #endif
> ... this change is wanted, but just for consistency for now. If you
> can supply an improved / accurate description, I'll be happy to commit
> this with
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I can put the following description:

     ns16550: Properly gate Exar PCIe UART cards support

     Arm is about to get PCI passthrough support which means CONFIG_HAS_PCI
     will be enabled, so this code will fail as Arm doesn't have ns16550
     PCI support:

     ns16550.c:313:5: error: implicit declaration of function 'enable_exar_enhanced_bits' [-Werror=implicit-function-declaration]
       313 |     enable_exar_enhanced_bits(uart);
           |     ^~~~~~~~~~~~~~~~~~~~~~~~~

     Fix this by gating Exar PCIe UART cards support with the above in mind.

Will this be ok?

Can I keep your rb tag with this description?

>
> As an aside - please follow patch submission guidelines: Patches go
> To the list, with maintainers (and perhaps other relevant folks) on Cc.
Sure, sorry about that
>
> Jan
>
Thank you,

Oleksandr


