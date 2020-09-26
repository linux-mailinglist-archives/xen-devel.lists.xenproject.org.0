Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64E279A3C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 16:58:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMBdQ-0005tW-O0; Sat, 26 Sep 2020 14:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7Fr=DD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kMBdO-0005tR-MP
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 14:57:10 +0000
X-Inumbo-ID: 86418ffb-14bc-4467-95d2-d5d1bea29fea
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86418ffb-14bc-4467-95d2-d5d1bea29fea;
 Sat, 26 Sep 2020 14:57:09 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q8so6092921lfb.6
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2020 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0OkwzjeICf9ftg+qFz7gAAHzvhof0Cb7rYEHWlDNoWk=;
 b=dQ3l6x1pbyo3zi+jgt3o11lMfklpqtXGuu3wO76iDScHtMqA8ecLUlxa79LFbsC16f
 QovFodfmFRKNO4ujRyueK25kYE8eBA0BeGT3KBGrpqMW3NP+Ve/XA1Ttjbngl3YHMxyR
 8aUSukQbrfR7o6QIEfk50LYNOq/JYhaO0t/foZY813eusTvCwlsbogEyzrsOqlQeZ8Ir
 Ub7r5I2mSItFntwt7PcFKlH0q5peZ2kONz3w/ksRAxTsrU9xJHDvxtD/kiMrlpXvNpD9
 aKq0TbfuYxLdnm30Nx/JZ77w9tKzxe/OXACagOz3oV7FCdyj/RwT5uYQbs4PAZsix1YS
 dPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0OkwzjeICf9ftg+qFz7gAAHzvhof0Cb7rYEHWlDNoWk=;
 b=s95A3dCWLwGnt/yOCvCg9e/2qhDbs9hLjm0FZIqMO4vk6MOI7yLZQ0Vsbf9ZnxmlYI
 esNpOqFAviRzEJOcPmSRE/gMHslT/dUVepzmUATTbMR+DzPCIwirRG3w/Gk9p2jmyDDf
 G+lALT9hmqWoMHU4ICt1yOYalG7vrIsLn/ytYCBPaL1ZAoEzgACaGSfbansCnpHMqp9R
 RxlbhPiBpwztdFfgtu8SYNEHVb8BKtt8lqhXthzOIa2L/gPEUxpjkfQYvE/xxM+3SIAR
 GYeTTx5pF/U6wnwrJNy9RlHV2tJ6PwjCA1mZn8PVjSFxvjfvnQgRtlczdvz3HlWbnHHe
 t67A==
X-Gm-Message-State: AOAM5339C+yGKAs099Rbl7J02HhCUPQQ39wbHuMdD9gQEnoW2UWPtVRb
 3EC3jir5hDReNcUi1AZAd8j9Ut2gZjSHESai
X-Google-Smtp-Source: ABdhPJyUB+7AM9K+nimoRpJjVkDYWT72N2ynP3RBTyQr2Lzj9lykdRj3Hj8ji3DRpJNv3bf5bS1+ug==
X-Received: by 2002:a05:6512:3692:: with SMTP id
 d18mr1201045lfs.62.1601132228158; 
 Sat, 26 Sep 2020 07:57:08 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r13sm1740038lfe.114.2020.09.26.07.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 07:57:07 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <e4009c0f-1057-f031-c3bb-6b7c850a0aa1@xen.org>
 <fcb40929-9487-1d20-3990-09c79cab8df8@gmail.com>
 <aa284c2a-c632-a446-2f14-03b22b402919@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6e40376c-b6ee-50b6-8870-aa12639f56a6@gmail.com>
Date: Sat, 26 Sep 2020 17:57:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aa284c2a-c632-a446-2f14-03b22b402919@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 26.09.20 16:21, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien.


>
> On 24/09/2020 19:22, Oleksandr wrote:
>> On 24.09.20 20:25, Julien Grall wrote:
>>> On 23/09/2020 21:16, Oleksandr wrote:
>>>> On 23.09.20 21:03, Julien Grall wrote:
>>>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> Could you please clarify how this patch could be split in smaller one?
>>>
>>> This patch is going to be reduced a fair bit if you make some of the 
>>> structure common. The next steps would be to move anything that is 
>>> not directly related to IOREQ out.
>>
>>
>> Thank you for the clarification.
>> Yes, however, I believed everything in this patch is directly related 
>> to IOREQ...
>>
>>
>>>
>>>
>>> From a quick look, there are few things that can be moved in 
>>> separate patches:
>>>    - The addition of the ASSERT_UNREACHABLE()
>>
>> Did you mean the addition of the ASSERT_UNREACHABLE() to 
>> arch_handle_hvm_io_completion/handle_pio can moved to separate patches?
>> Sorry, I don't quite understand, for what benefit?
>
> Sorry I didn't realize there was multiple ASSERT_UNREACHABLE() in the 
> code. I was referring to the one in the follow chunk:
>
> @@ -1955,9 +1959,14 @@ static void do_trap_stage2_abort_guest(struct 
> cpu_user_regs *regs,
>              case IO_HANDLED:
>                  advance_pc(regs, hsr);
>                  return;
> +            case IO_RETRY:
> +                /* finish later */
> +                return;
>              case IO_UNHANDLED:
>                  /* IO unhandled, try another way to handle it. */
>                  break;
> +            default:
> +                ASSERT_UNREACHABLE();
>              }
>          }
>
> While I understand the reason this was added, to me this doesn't seem 
> to be directly related to this patch.
>
> In fact, the switch case will be done on an enum. So without the 
> default, the compiler will be able to notice if we are adding a new 
> field. With this new approach, you would only notice at runtime 
> (assuming the path is exercised).
>
> So what do we gain?

Hmm, now I am in doubt whether we really need to put 
ASSERT_UNREACHABLE() here. Also we would notice it at the runtime for 
debug builds only.


>
> [...]
>
>>> I think Jan made some suggestion today. Let me know if you require 
>>> more input.
>>
>>
>> Yes. I am considering this now. I provided my thoughts on that a 
>> little bit earlier. Could you please clarify there.
>
> I have replied to it.

Thank you.


-- 
Regards,

Oleksandr Tyshchenko


