Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18073064D9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 21:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76393.137834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rDR-0007h4-SB; Wed, 27 Jan 2021 20:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76393.137834; Wed, 27 Jan 2021 20:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4rDR-0007gf-OM; Wed, 27 Jan 2021 20:15:01 +0000
Received: by outflank-mailman (input) for mailman id 76393;
 Wed, 27 Jan 2021 20:15:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4rDQ-0007gZ-91
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 20:15:00 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96406a84-38ba-4123-91ee-b01d8fb81f84;
 Wed, 27 Jan 2021 20:14:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a12so4491249lfb.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 12:14:59 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n1sm758676lfi.121.2021.01.27.12.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 12:14:57 -0800 (PST)
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
X-Inumbo-ID: 96406a84-38ba-4123-91ee-b01d8fb81f84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MZ/qQ58WpV/RO1Ey8CtW2bQ4/yAMENU9P+Ct/BnDEDY=;
        b=AiafKERHCexyOiDyFI6pUYhV+F6Sm7l80ZiG7z1r3QfrUCTSSeKEKE975hms71WRWM
         ZnitStb6cbUAXszYDJdL5/5d6mgpBYgYKJ5TuBTmjyfhHwYJ+T7HXwyNwAKibyWpYZ9g
         QuJIvRTkLuszqmdO9tzZaOZqqQNyULl07hAo37YNrwNXTOFGaRj1ub/eFzjZ27FQKjZT
         Ggw7yB+Hmz3WMhIqX6yMYcdvJhC3fJk1caElA+CNL/MsBDuFhNriuJbyItGWk3yrcemu
         owy6syqm+sF4z/m8vYJ1C6eUvsee0oPLNeu1po4KcyeqwzOTA3Ry8+xhIrMfFr3+37nm
         svfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MZ/qQ58WpV/RO1Ey8CtW2bQ4/yAMENU9P+Ct/BnDEDY=;
        b=uPLALkgwaqPbHiuFi/3YWrEbo4KsR+0LLmu4QzzGwF/O05++zK1QMSI61qijRkTO2Z
         xuDjPlwtfiPtEE5zK+SiLtEyH5zNE/ocnPBMR+1E6HaL2dUcc+CEODTggxX2scZ9ZUnM
         9JMDC6iCrxmF1mb6PWLVvz6r/NqQ/hvDRSuMlFNoxSN/vDk/SsHOicsMc7bQ2V+4t3ME
         252+qBMOjHgPl3xDv+3frWIBhFEg6qXFJbsxDGF3wQP6b5qkZE5tjKXBkhfT8I3/HOvb
         XgsdZ8/77fyPvQVVlU3J16BROGhGiGamm/8pftkETKjyc2GQEpmHVLzVnEkrqzjKxbKW
         qwCQ==
X-Gm-Message-State: AOAM530Q7TmRSO6VYUAzi8aFRK0t9tIaG+rM/ngDsczAKa3giWxcYXKa
	6ZPHwB1xA/goJLQySEnMSOnA2fiIYJmPTw==
X-Google-Smtp-Source: ABdhPJzkkaqVgHZQnCQs5DOZrLBcFj8OB05nlvfKtDenSJlNe2xrqkbhlCMQbh29rYXdgNpMy8mzRg==
X-Received: by 2002:ac2:5b4f:: with SMTP id i15mr5698116lfp.191.1611778497740;
        Wed, 27 Jan 2021 12:14:57 -0800 (PST)
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <01b122dd-37c9-d429-b060-adea9e7cae8b@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b16bb4e2-fb26-f5e5-2417-86867241036a@gmail.com>
Date: Wed, 27 Jan 2021 22:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01b122dd-37c9-d429-b060-adea9e7cae8b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 27.01.21 18:58, Jan Beulich wrote:

Hi Jan

> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> moves previously prepared IOREQ support to the common code
>> (the code movement is verbatim copy).
>>
>> The "legacy" mechanism of mapping magic pages for the IOREQ servers
>> remains x86 specific and not exposed to the common code.
>>
>> The common IOREQ feature is supposed to be built with IOREQ_SERVER
>> option enabled, which is selected for x86's config HVM for now.
>>
>> In order to avoid having a gigantic patch here, the subsequent
>> patches will update remaining bits in the common code step by step:
>> - Make IOREQ related structs/materials common
>> - Drop the "hvm" prefixes and infixes
>> - Remove layering violation by moving corresponding fields
>>    out of *arch.hvm* or abstracting away accesses to them
>>
>> Introduce asm/ioreq.h wrapper to be included by common ioreq.h
>> instead of asm/hvm/ioreq.h to avoid HVM-ism in the code common.
>>
>> Also include <xen/domain_page.h> which will be needed on Arm
>> to avoid touch the common code again when introducing Arm specific bits.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks


> with ...
>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -92,6 +92,7 @@ config PV_LINEAR_PT
>>   
>>   config HVM
>>   	def_bool !PV_SHIM_EXCLUSIVE
>> +	select IOREQ_SERVER
>>   	prompt "HVM support"
>>   	---help---
> ... the addition moved below the prompt line (could probably
> be taken care of while committing, if no other need for a v6
> arises).

V6 is planned anyway, so will do, but ...


>
> (Personally I think this should be
>
> config HVM
> 	bool "HVM support"
> 	default !PV_SHIM_EXCLUSIVE

... def_bool is changed to default by intention or this is a typo?


> 	select IOREQ_SERVER
> 	---help---
>
> anyway, but that's nothing you need to care about.)
>
>> --- /dev/null
>> +++ b/xen/include/asm-x86/ioreq.h
>> @@ -0,0 +1,37 @@
>> +/*
>> + * ioreq.h: Hardware virtual machine assist interface definitions.
>> + *
>> + * This is a wrapper which purpose is to not include arch HVM specific header
>> + * from the common code.
>> + *
>> + * Copyright (c) 2016 Citrix Systems Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __ASM_X86_IOREQ_H__
>> +#define __ASM_X86_IOREQ_H__
>> +
>> +#include <asm/hvm/ioreq.h>
>> +
>> +#endif /* __ASM_X86_IOREQ_H__ */
> Not necessarily for taking care of right away, I think in the
> longer run this wants wrapping by #ifdef CONFIG_HVM, such that
> in !HVM builds the dependency on the "chained" header goes
> away (reducing the amount of rebuilding in incremental builds).

I don't mind wrapping it right away.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


