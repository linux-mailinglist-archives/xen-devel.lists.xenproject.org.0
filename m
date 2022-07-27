Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CB582D13
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 18:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376373.609096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkHe-0002AQ-GZ; Wed, 27 Jul 2022 16:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376373.609096; Wed, 27 Jul 2022 16:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGkHe-000271-DA; Wed, 27 Jul 2022 16:53:18 +0000
Received: by outflank-mailman (input) for mailman id 376373;
 Wed, 27 Jul 2022 16:53:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGkHc-00026u-J1
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 16:53:16 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bb88305-0dcc-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 18:53:15 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id p21so12820907ljh.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 09:53:15 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 h19-20020ac25973000000b0048a95c0ff47sm1462705lfp.213.2022.07.27.09.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 09:53:14 -0700 (PDT)
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
X-Inumbo-ID: 9bb88305-0dcc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=5cZCO3x1nF3vmQsZHzH3PFGIKTP7h8r5EymDgu+bUpA=;
        b=DGAbpn5P4rOAxZSLeTePCMLOngZ0NHpPinw2u9WdYmXIbmu8yjOMnL1DA3q3aAFErx
         NLyVW/RgDjm/xcZBM6TpxrPG9FrOp0SWXuehEcUujmSvDd07VSnIixX4UHbd2Z8TIObd
         ILuAP3moVgz7w9FUUdOi2SxyYEAGnSklwYVyH1HxY8EfDup/mVXLoxac0JIYBapuikoS
         MhO93Jb/dPweqrZ6QMEgOWoLDevbVwm7oarJvmJpaKnfxQmYUNU9HngKyNV1oAQZhKrk
         N3WA+6amgKzhmmhpRvz6A2xyP9cyK8A6O0dEtpI+kXCaILuglGas45PB6ppDdB7nJZnN
         01Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=5cZCO3x1nF3vmQsZHzH3PFGIKTP7h8r5EymDgu+bUpA=;
        b=4Hlw1W9qwM6SFrFweQGjv9PLEjLfxji0nor/aNx1wJgj50IhZbCFkRr8sbVG/Pjrzi
         jE+IS9xLw4LE6LuaracKOdVQ15hQPkk94/F0tC+JDPDpUvF/+ZBgRVS0lIlpSHH+QcvY
         laqw133nvG49x1UEmlLh2ekgkKZma0XpjgljWnohxRRfSbhHxo8+E8FfTzGSHioxEO7v
         E7NbjcoVmhaES34EM9VPPg/Hv9XE/ZW6UCg7hDa+5dCiX2Tcz5YqnqBLWauhFQfzn3m2
         HK2afmzkjatUPeBuWcHWFvt/WETGWIfl4PbTq6zWrzaCpNWo1r/TqRbi6kynKTQiLo8H
         pFwg==
X-Gm-Message-State: AJIora9mgLPjf3OwK0OK/RpUx3BtJUlIMYZPyFH1ZGOGG9jYQgGaBQEi
	2n0HkccprxWTDEVfNK5E/SA=
X-Google-Smtp-Source: AGRyM1uFUnwMCpYJdwvfIQSfdvDdFA9cCdVGJIis5qYJv+cZnglJZOawSvAO2n/ewTbSga02oTpPow==
X-Received: by 2002:a2e:a591:0:b0:25d:7366:3344 with SMTP id m17-20020a2ea591000000b0025d73663344mr8339394ljp.242.1658940795296;
        Wed, 27 Jul 2022 09:53:15 -0700 (PDT)
Message-ID: <46ef9a6b-f13d-c751-8fb2-fb7293646bd2@gmail.com>
Date: Wed, 27 Jul 2022 19:53:13 +0300
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
 <450660e2-69cb-ea3c-2d91-4e671eb5d552@gmail.com>
 <b6a2742e-07cf-fa71-b37b-ae7a3b3f9846@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <b6a2742e-07cf-fa71-b37b-ae7a3b3f9846@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27.07.22 12:46, Jan Beulich wrote:

Hello Jan

> On 27.07.2022 10:58, Oleksandr wrote:
>> On 26.07.22 18:23, Jan Beulich wrote:
>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>
>>>> Reset the command register when assigning a PCI device to a guest:
>>>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>>>> after reset, but this might not be true for the guest as it needs
>>>> to respect host's settings.
>>>> For that reason, do not write 0 to the PCI_COMMAND register directly,
>>>> but go through the corresponding emulation layer (cmd_write), which
>>>> will take care about the actual bits written.
>>>>
>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>> ---
>>>> Since v6:
>>>> - use cmd_write directly without introducing emulate_cmd_reg
>>>> - update commit message with more description on all 0's in PCI_COMMAND
>>> I agree with the change,
>> thanks, may I please ask can this be converted to some tag?
> I could offer a R-b, but you've got one from Rahul already, so mine
> won't buy you anything further. What you will need is a maintainer
> ack, which imo isn't a priority since this is only patch 8 in a
> series which itself depends on a further series likely continuing
> to be controversial (didn't get there yet).


ok, fair enough.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


