Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0AB382DA5
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128243.240779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidTy-0004VL-QA; Mon, 17 May 2021 13:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128243.240779; Mon, 17 May 2021 13:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidTy-0004So-Mo; Mon, 17 May 2021 13:40:30 +0000
Received: by outflank-mailman (input) for mailman id 128243;
 Mon, 17 May 2021 13:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lidTx-0004Si-Iv
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:40:29 +0000
Received: from mail-oi1-x235.google.com (unknown [2607:f8b0:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78b1ceaa-4b32-495d-91da-d5d3c7f28f82;
 Mon, 17 May 2021 13:40:28 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u144so6491838oie.6
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 06:40:28 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id q26sm3157730otn.0.2021.05.17.06.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:40:27 -0700 (PDT)
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
X-Inumbo-ID: 78b1ceaa-4b32-495d-91da-d5d3c7f28f82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PHuiLV63C2tSmFFHnFLyLJ7i3+2YiHakKhRUDluCH84=;
        b=TRiPcrDpaCx6v8yoGO6mzvbi7SuyVGoWdMb9UzinGPzL9gExNh73ZBR9NGSwqpafg/
         iv/yve3NKLQDNfXlQS9lASd/P7qVhBfGu+Cbap/g6CQlO4w3f6khoiJT+f1LnHujSBVv
         4908Ol61233hB6ZZZlxrp+gUZSPo31Bta1hZolITCz9CZMRPogwgzBKL62pe/TpjqClY
         T8n8u1xfo3XCmbXzsnpVFrztk329Ale/YsxEB3ba8wimKLbuS5sSSpVLsnet2V0uQ97f
         UvYAnLaZmHtqt/Bi2O3T9Dz5vlfm/BdaNlM08ElV2T+z9j/n4kHPNLWhJg0hRjuh5hxr
         xEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PHuiLV63C2tSmFFHnFLyLJ7i3+2YiHakKhRUDluCH84=;
        b=YPQ01z7WJSYShu9AoW0F6hap18mBOzDE/Squb3E8hUjSSlIwCyUNa/V1F+eQBuhB+L
         hb7/MpZwF6mSKWANlfw+6KTUmasnbQ7InMNvGt+XYGxRLHcJY6Q5WzVunZTyb6yLg+x8
         G6K5wqnA6MzsmaKTHDEyPOr71JORwwx29GbOg/+llCinKESH09GHMF41ql6GRxnDIzq5
         DTPCtWph71CuVRD0yTSGnn7FippDRMX4+MnuPUU4g3APQ7+3SX+5tlcz01hOj8XLopC6
         xBon8sgItD2HMcQHterwL/lvShNqnZk1n1Go7w/Pza2Lpg67/7jQfkHHzcjS7V+0FFGW
         viDQ==
X-Gm-Message-State: AOAM5328hO1ukZlaF9ZvNwL8dSbxwKsM/yDLwIxexvuJKG6FYUtxOKFi
	16C9ujyG2dJd2SDEjZ3ONmi3g9g+xJhfDg==
X-Google-Smtp-Source: ABdhPJzgFGr6evghvbaa+ti/HoijdnyLyjMOzhrdOHT5ZKtj4JgcWxRoCKxRNj9dMTkjzcIqA3UJAw==
X-Received: by 2002:aca:f0c:: with SMTP id 12mr39647654oip.131.1621258827645;
        Mon, 17 May 2021 06:40:27 -0700 (PDT)
Subject: Re: [PATCH] drivers/char: Add USB3 debug capability driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
 <912fa28c-5cb3-cf40-00db-19423c442da3@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <b31e6eed-437e-de23-1395-48db052d6237@gmail.com>
Date: Mon, 17 May 2021 07:40:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <912fa28c-5cb3-cf40-00db-19423c442da3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/21 3:27 AM, Jan Beulich wrote:
> On 12.05.2021 02:12, Connor Davis wrote:
>> Add support for the xHCI debug capability (DbC). The DbC provides
>> a SuperSpeed serial link between a debug target running Xen and a
>> debug host. To use it you will need a USB3 A/A debug cable plugged into
>> a root port on the target machine. Recent kernels report the existence
>> of the DbC capability at
>>
>>    /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00
>>
>> The host machine should have the usb_debug.ko module on the system
>> (the cable can be plugged into any port on the host side). After the
>> host usb_debug enumerates the DbC, it will create a /dev/ttyUSB<n> file
>> that can be used with things like minicom.
>>
>> To use the DbC as a console, pass `console=dbgp dbgp=xhci`
>> on the xen command line. This will select the first host controller
>> found that implements the DbC. Other variations to 'dbgp=' are accepted,
>> please see xen-command-line.pandoc for more. Remote GDB is also supported
>> with `gdb=dbgp dbgp=xhci`. Note that to see output and/or provide input
>> after dom0 starts, DMA remapping of the host controller must be
>> disabled.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> ---
>>   MAINTAINERS                       |    6 +
>>   docs/misc/xen-command-line.pandoc |   19 +-
>>   xen/arch/x86/Kconfig              |    1 -
>>   xen/arch/x86/setup.c              |    1 +
>>   xen/drivers/char/Kconfig          |   15 +
>>   xen/drivers/char/Makefile         |    1 +
>>   xen/drivers/char/xhci-dbc.c       | 1122 +++++++++++++++++++++++++++++
>>   xen/drivers/char/xhci-dbc.h       |  621 ++++++++++++++++
> What is the reason for needing the separate header? Isn't / can't all
> logic (be) contained within xhci-dbc.c? If this is because you clone
> code from elsewhere (as the initial comment in the files seems to
> suggest), it might be a good idea for the description to say so.
> Depending on the origin and possible plans to keep out clone in sync
> down the road, undoing this separation as well as correction of certain
> style issues (which I'm not going to try to spot consistently just yet)
> may then not want requesting. Otoh the files look to have been converted
> to Xen style, so direct syncing may not be a goal.
>
No reason other than cosmetic, separating "header-ish" things from source.

I can put it all in one .c if that is preferred

>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -714,9 +714,26 @@ Available alternatives, with their meaning, are:
>>   ### dbgp
>>   > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
>>   
>> -Specify the USB controller to use, either by instance number (when going
>> +Specify the EHCI USB controller to use, either by instance number (when going
>>   over the PCI busses sequentially) or by PCI device (must be on segment 0).
>>   
>> +If you have a system with an xHCI USB controller that supports the Debug
>> +Capability (DbC), you can use
>> +
>> +> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
>> +
>> +To use this, you need a USB3 A/A debugging cable plugged into a SuperSpeed
>> +root port on the target machine. Recent kernels expose the existence of the
>> +DbC at /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00.
>> +Note that to see output and process input after dom0 is started, you need to
>> +ensure that the host controller's DMA is not remapped (e.g. with
>> +dom0-iommu=passthrough).
> This is a relatively bad limitation imo - people would better not get
> used to using passthrough mode, and debugging other IOMMU modes (for
> Dom0) may then be impossible at all.

Why is turning on passthrough mode to debug something bad? Sure

it shouldn't be done in a production deployment, but I don't see the

issue if it is used in a debug environment.

>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -11,7 +11,6 @@ config X86
>>   	select HAS_ALTERNATIVE
>>   	select HAS_COMPAT
>>   	select HAS_CPUFREQ
>> -	select HAS_EHCI
> Why?
>
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -63,6 +63,21 @@ config HAS_SCIF
>>   config HAS_EHCI
>>   	bool
>>   	depends on X86
>> +        default y if !HAS_XHCI_DBC
> Again, way? The two drivers shouldn't be exclusive of one another.

They both implement the dbgp_op hypercall, so they can't both

be built, otherwise the build fails (as the code stands now with this

patch that is)

>
> Also please note the mixture of indentation you introduce.
Thanks, will fix
>
>>   	help
>>   	  This selects the USB based EHCI debug port to be used as a UART. If
>>   	  you have an x86 based system with USB, say Y.
>> +
>> +config HAS_XHCI_DBC
>> +	bool "xHCI Debug Capability driver"
> A setting name HAS_* wouldn't normally have a prompt.
Understood
>
>> +	depends on X86 && HAS_PCI
>> +	help
>> +	  This selects the xHCI Debug Capabilty to be used as a UART.
>> +
>> +config XHCI_FIXMAP_PAGES
>> +        int "Number of fixmap entries to allocate for the xHC"
>> +	depends on HAS_XHCI_DBC
>> +        default 16
>> +        help
>> +          This should equal the size (in 4K pages) of the first 64-bit
>> +          BAR of the host controller in which the DbC is being used.
> Again - please use consistent (in itself as well as with the rest of
> the file) indentation.
>
> Jan


Thanks,

Connor


