Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0140582294
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 11:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375972.608518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGcsa-0004cH-EU; Wed, 27 Jul 2022 08:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375972.608518; Wed, 27 Jul 2022 08:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGcsa-0004ZP-Aq; Wed, 27 Jul 2022 08:58:56 +0000
Received: by outflank-mailman (input) for mailman id 375972;
 Wed, 27 Jul 2022 08:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGcsY-0004ZI-1n
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 08:58:54 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 564c6e8a-0d8a-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 10:58:52 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id q23so12940239lfr.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 01:58:52 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a2ea4b0000000b0025d55600855sm3802691ljm.25.2022.07.27.01.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 01:58:51 -0700 (PDT)
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
X-Inumbo-ID: 564c6e8a-0d8a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tUM6XkTEVuhSGjq206ahZtlJP5+K+IK66plJSJOZ1eM=;
        b=jTwOcyEUZ9E0NomN1l7hB/vxr1AMLBjg5igREYUsw9wuQnjrRttzxG4Cjp20MbOX6L
         A/icpM5RF8/MKk8X/FPZaOYuDpiRuaMPyN5p1cRLgaEqcUlD+g7xwq2tbDh0jjBNgyXV
         ZX57G8Unn4zcBt6itMCwSY6wu57JgXH9apLC9YWNsY4fcYAuVZhHsX2Qd9AdVLQMoxdE
         9Ju8RqneuFta59xLoO2COVuDdanHxopimsMP1QLvZo9znlDj/xFyMnngeJYVEE4kOvLe
         +I33gI6xZzFY6ehwD2xnRUqXI2Vj5fZSDilTqQWuEyebnDCAUzbegyNkmGhVdOw/AtUC
         zCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tUM6XkTEVuhSGjq206ahZtlJP5+K+IK66plJSJOZ1eM=;
        b=mubgE6SV/oacMRdAh80tSztyQboTvWzmYfhQLJj9OSdSZOSDaW4kiK14Pa6TbwLJ0/
         /jHvj4e4T8k42gYVpwZMoHzH0xFFrwfQcvPId6oDB1Ug5/bef71kh+yppnSNFM5zWVX1
         QCm+jCmlH4uoPzW2W3zKsT0mOEFSRMV5kejLq0DcKS47ZbYBc0i3qoXLzs2yuAYbCOA6
         btc79RJUzSvI5zhq6Br8MHW7i3n++zGRnF66lFPaLEi8qpuCxNg0gXSf0j6ByDlg0abO
         wNx2NuVLJ8nnvR77r9QHBqW9gNYRxTFLEaehf/bimER9/I3riHWeFXg0NPA4aOeICf7d
         IapA==
X-Gm-Message-State: AJIora9+8gFHFh/cVhh+SNoIJ1C17ea3ANt5i5UKT/p64gzA1yUppT/W
	FXj9e0BUKcKiIIOWB7pfuk8=
X-Google-Smtp-Source: AGRyM1s+Kc2V1FWbdqBUptnBy430WNdkRpgddDknrNfymmqs/N+JkW0rl1Z282qoip3nEzpYtAv8KQ==
X-Received: by 2002:a05:6512:b97:b0:48a:781c:8901 with SMTP id b23-20020a0565120b9700b0048a781c8901mr8737043lfv.193.1658912331843;
        Wed, 27 Jul 2022 01:58:51 -0700 (PDT)
Message-ID: <450660e2-69cb-ea3c-2d91-4e671eb5d552@gmail.com>
Date: Wed, 27 Jul 2022 11:58:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 08/11] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-9-olekstysh@gmail.com>
 <d31174b6-5477-d3b4-e557-a8010e86f914@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <d31174b6-5477-d3b4-e557-a8010e86f914@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26.07.22 18:23, Jan Beulich wrote:

Hello Jan

> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Reset the command register when assigning a PCI device to a guest:
>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>> after reset, but this might not be true for the guest as it needs
>> to respect host's settings.
>> For that reason, do not write 0 to the PCI_COMMAND register directly,
>> but go through the corresponding emulation layer (cmd_write), which
>> will take care about the actual bits written.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> ---
>> Since v6:
>> - use cmd_write directly without introducing emulate_cmd_reg
>> - update commit message with more description on all 0's in PCI_COMMAND
> I agree with the change,

thanks, may I please ask can this be converted to some tag?


>   but it's imo enough that you also need to sign
> off on the patch (and this likely also applies elsewhere in the series).


I got your point. Regarding the current patch, I didn't make any changes 
to it. As I mentioned in the cover letter [1] after "!!! OT: please note,"

Oleksandr Andrushchenko has addressed almost all review comments given 
for v6 by himself. For the patches which I had to touch I added "OT:" to 
the change log. For example, like here [2].

I will consider signing off these patches.



[1] 
https://lore.kernel.org/xen-devel/20220719174253.541965-1-olekstysh@gmail.com/

[2] 
https://lore.kernel.org/xen-devel/20220719174253.541965-8-olekstysh@gmail.com/


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


