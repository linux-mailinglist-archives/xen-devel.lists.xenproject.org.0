Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6443A98A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216130.375615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfArM-0004gM-Uz; Tue, 26 Oct 2021 01:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216130.375615; Tue, 26 Oct 2021 01:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfArM-0004eG-Rn; Tue, 26 Oct 2021 01:02:36 +0000
Received: by outflank-mailman (input) for mailman id 216130;
 Tue, 26 Oct 2021 01:02:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bjQH=PO=gmail.com=groeck7@srs-us1.protection.inumbo.net>)
 id 1mfArL-0004eA-NE
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:02:35 +0000
Received: from mail-ot1-x32b.google.com (unknown [2607:f8b0:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5698fdc7-0f89-45ca-b550-58ca090f44bd;
 Tue, 26 Oct 2021 01:02:34 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 z5-20020a9d4685000000b005537cbe6e5aso10709192ote.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 18:02:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o12sm3987438oti.21.2021.10.25.18.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 18:02:33 -0700 (PDT)
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
X-Inumbo-ID: 5698fdc7-0f89-45ca-b550-58ca090f44bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QoNo/gJ6xc/Lk71yUFY24yh/oDqwuM2rlI5YSI1Io30=;
        b=GPfYmTWaHMBbwyAoKorrgVTbZsmFqlu3TOEUwGHy2OWxrtvOOFmL05VvF2U0sO6yq0
         cVG2pGChgd50T10TZSsWNX05FELD1uvjy4vLApxnevG1JaFlX/01wc7bxYRIYPX9ot1j
         mhYj1Tn0i4N36hjzzsBFrFWjLhvHNK5OzDFjtK4IGQ/3RZsFvUyASOSC146FiTC7yTWx
         HZ/+VrrW4xUyv5bJobb84DMvFKh18sl1EjBuYTM6yOx7G8gWIfIcOy/Lv+2OP97aLqdm
         kVSOnhDE6i8MzbciAdTRwtEDm22pLsFy89+ZvJOg2agEUTAHLC62rfazSXLNYffW8WL8
         azdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QoNo/gJ6xc/Lk71yUFY24yh/oDqwuM2rlI5YSI1Io30=;
        b=4sX1n/9Up/4a1n+CDRgwPlENCpXOzLR1AmqrZfpiL1iYN3sfAhmJ1dgwUD+3ZEo+cP
         x7Sg1Sv20YAr66Ync/UTPMLt0mHUvkVJsFhnsQ0ASPz14uIwW3BsGGbDIktet8d4pMGP
         StiVaUoSE66V2X+4zw9Rvr4AI/snr5WOQ4qNqtX2vKgzi8NjJiPV3hGX2TBLOoc4EQ5l
         +2Fv62ox5oBRgrmTJZ3CEjYfaqEm1g6NA4829/NkH6ERvXc+/bRweXHDGDXMNO1+TVQF
         BUSGc8ddw7gc1q09EiJzTJZ1PN9KXsMil2jdsBjJJDpQZs/e8LOGX0Zlb2YKj8B866Z1
         8vXw==
X-Gm-Message-State: AOAM533SRlqrOKBSVh2zqSPk9Czr5FSBSHe/47yhoLiu7UmN2/1Dchtg
	v45W8qW2mPVjYBoUetljomU=
X-Google-Smtp-Source: ABdhPJxMlKWW+1zbC7QoBnBIjxiIfh66+rRIl5XDXf7TN2O3gbhH6mxZxLAaz09z6baWVCUcqaQD8g==
X-Received: by 2002:a9d:4616:: with SMTP id y22mr16425867ote.165.1635210154279;
        Mon, 25 Oct 2021 18:02:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RESEND 0/5] ARM/arm64: arm_pm_restart removal
To: Dmitry Osipenko <digetx@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, lorenzo.pieralisi@arm.com, sstabellini@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, treding@nvidia.com, arnd@arndb.de,
 xen-devel@lists.xenproject.org, patches@armlinux.org.uk
References: <20210604140357.2602028-1-lee.jones@linaro.org>
 <526fe66f-df08-c873-2a20-f1295e30a855@gmail.com>
 <a4fe088f-0f13-f80f-5011-4eee2d44ef63@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <321b167f-8744-9ca8-58b0-e09ff39dfa02@roeck-us.net>
Date: Mon, 25 Oct 2021 18:02:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a4fe088f-0f13-f80f-5011-4eee2d44ef63@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/25/21 4:55 PM, Dmitry Osipenko wrote:
> 26.10.2021 02:29, Florian Fainelli пишет:
>> On 6/4/21 7:03 AM, Lee Jones wrote:
>>> This is a rebase/refresh of a set sent out, reviewed,
>>> then forgotten about.  It's still considered useful.
>>>
>>> Here is an excerpt from the previous attempt:
>>>
>>>   "Hi Russell, ARM SoC maintainers,
>>>
>>>   here's the full set of patches that remove arm_pm_restart as discussed
>>>   earlier. There's some background on the series in this thread:
>>>
>>> 	https://lore.kernel.org/linux-arm-kernel/20170130110512.6943-1-thierry.reding@gmail.com/
>>>
>>>   I also have a set of patches that build on top of this and try to add
>>>   something slightly more formal by adding a power/reset framework that
>>>   driver can register with. If we can get this series merged, I'll find
>>>   some time to refresh those patches and send out for review again.
>>
>> What happened to this patch series? Is there any chance we will get it
>> included at some point? It is included in the Android13-5.10 tree AFAICT
>>
> 
> It's in mainline since v5.14, AFAICS.
> 

Yes, indeed.

Guenter

