Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344C2B1BA6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 14:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26497.54901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdYrs-0002gJ-6w; Fri, 13 Nov 2020 13:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26497.54901; Fri, 13 Nov 2020 13:11:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdYrs-0002fu-3I; Fri, 13 Nov 2020 13:11:56 +0000
Received: by outflank-mailman (input) for mailman id 26497;
 Fri, 13 Nov 2020 13:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdYrq-0002fp-Ir
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 13:11:54 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 781a7d3a-a254-41c6-b81b-c6a2b605b8d8;
 Fri, 13 Nov 2020 13:11:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i17so9520153ljd.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 05:11:53 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g138sm1183740lfd.260.2020.11.13.05.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 05:11:50 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdYrq-0002fp-Ir
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 13:11:54 +0000
X-Inumbo-ID: 781a7d3a-a254-41c6-b81b-c6a2b605b8d8
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 781a7d3a-a254-41c6-b81b-c6a2b605b8d8;
	Fri, 13 Nov 2020 13:11:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i17so9520153ljd.3
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 05:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gxp1s8evwRVx1P3f8s5C2m5NppcopvVUMzWzggxDT2g=;
        b=sWjMEqYMin6oVvPag7EiYsyC54tFM84qYanvBV7sn/Tefyo7KP0r3P86WL+YbHHO00
         iQzNmrdpk2fxtsmoG5byal/zr/ifwKNPLiCLpmvGqBSgjIZZ78pFpdJj0fvUdI4hnqbl
         PHjVQBIQva0gyOaQTMAIR6KWxI1SvxzXcaVzjlL9waG+Ds+7f50lp/qOxpMVcOSv97G1
         m77lVxu35q9q5lr2U9YtvZ6YEdo/5ZEpXTKnOdavC3XnTXTPI4nFnuLZOrNI/i0b2EhR
         swEVwlWTMQzpgfXa/SyTO+QVbv0gd8BUktf/hxi22fqrl5zdXhjqRYFINTRxoCp2vXfa
         LZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gxp1s8evwRVx1P3f8s5C2m5NppcopvVUMzWzggxDT2g=;
        b=RUKz4oRnnPanG6j8VEGIo9//BoZlzk1pixyqrR20RRGsc38Jff6q1DNUBybwmb0UtI
         W5hJNHf934yI6ivVQ242dMULNUqTlvYLOhaeUy1cSOTHbBhgs7hLq5h6RRhzttlB4wfc
         j3/6vii91QocZciuWWK7vlWOz23qt6J0o4gz0NlaD09d57hG0rcLLmaiKz+gxSvsYGI9
         San5LjMO1rX/x06Wur+UJnOJmjC1sQx4uLdJ2k0TwLaDA1CzbdyenXK4n+WbDTFiVFPI
         vL2a/UtuzQc0uplnhQz2BkDtrOQJO2Ihvj2/Hqg6jASmhKAiRX0p8Z+0Ti/AoQgcFMRl
         +liQ==
X-Gm-Message-State: AOAM5319GwizvVdLuHkKX/A8wDC2PuvXWPYOWT32Pp2ZCtiiG88YMpTy
	B4+Ip8yRIIm06k3r/PYA8pqjn16a8kryrQ==
X-Google-Smtp-Source: ABdhPJxYqmEWUy+ll1BKsYGXyDL3jyz3uEoEumC1NyGZRG79hKbyicf7oNJ5QhRBfaFwehZmgNwIyw==
X-Received: by 2002:a2e:b809:: with SMTP id u9mr959042ljo.212.1605273111608;
        Fri, 13 Nov 2020 05:11:51 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id g138sm1183740lfd.260.2020.11.13.05.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 05:11:50 -0800 (PST)
Subject: Re: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tim Deegan
 <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
 <5aa67969-0571-ee1b-bbe1-0b936a85acd2@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fecd1dd8-7da7-0071-7f2a-c32ffc90e209@gmail.com>
Date: Fri, 13 Nov 2020 15:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5aa67969-0571-ee1b-bbe1-0b936a85acd2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 12.11.20 13:11, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> moves previously prepared x86/hvm/ioreq.c to the common code.
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
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> Please note, this patch depends on the following which is
>> on review:
>> https://patchwork.kernel.org/patch/11816689/
>> ***
>>
>> Changes RFC -> V1:
>>     - was split into three patches:
>>       - x86/ioreq: Prepare IOREQ feature for making it common
>>       - xen/ioreq: Make x86's IOREQ feature common
>>       - xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>>     - update MAINTAINERS file
>>     - do not use a separate subdir for the IOREQ stuff, move it to:
>>       - xen/common/ioreq.c
>>       - xen/include/xen/ioreq.h
>>     - update x86's files to include xen/ioreq.h
>>     - remove unneeded headers in arch/x86/hvm/ioreq.c
>>     - re-order the headers alphabetically in common/ioreq.c
>>     - update common/ioreq.c according to the newly introduced arch functions:
>>       arch_hvm_destroy_ioreq_server()/arch_handle_hvm_io_completion()
>>
>> Changes V1 -> V2:
>>     - update patch description
>>     - make everything needed in the previous patch to achieve
>>       a truly rename here
>>     - don't include unnecessary headers from asm-x86/hvm/ioreq.h
>>       and xen/ioreq.h
>>     - use __XEN_IOREQ_H__ instead of __IOREQ_H__
>>     - move get_ioreq_server() to common/ioreq.c
>> ---
>>   MAINTAINERS                     |    8 +-
>>   xen/arch/x86/Kconfig            |    1 +
>>   xen/arch/x86/hvm/Makefile       |    1 -
>>   xen/arch/x86/hvm/ioreq.c        | 1422 ---------------------------------------
>>   xen/arch/x86/mm.c               |    2 +-
>>   xen/arch/x86/mm/shadow/common.c |    2 +-
>>   xen/common/Kconfig              |    3 +
>>   xen/common/Makefile             |    1 +
>>   xen/common/ioreq.c              | 1422 +++++++++++++++++++++++++++++++++++++++
>>   xen/include/asm-x86/hvm/ioreq.h |   39 +-
>>   xen/include/xen/ioreq.h         |   71 ++
>>   11 files changed, 1509 insertions(+), 1463 deletions(-)
>>   delete mode 100644 xen/arch/x86/hvm/ioreq.c
>>   create mode 100644 xen/common/ioreq.c
>>   create mode 100644 xen/include/xen/ioreq.h
> Iirc I've previously asked to make sure the diff here gets created with
> git's rename detection enabled, so we wouldn't see 1422 lines deleted
> and 1422 lines added, _hoping_ they're all the same (or going through
> the extra steps needed to compare old and new code), but instead seeing
> just the diff between old and new files (which in the ideal case would
> then be empty).

This is my fault, I misread this last time. I have just rechecked this 
patch again.

git config diff.renames false

  MAINTAINERS                     |    8 +-
  xen/arch/x86/Kconfig            |    1 +
  xen/arch/x86/hvm/Makefile       |    1 -
  xen/arch/x86/hvm/ioreq.c        | 1544 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  xen/arch/x86/mm.c               |    2 +-
  xen/arch/x86/mm/shadow/common.c |    2 +-
  xen/common/Kconfig              |    3 +
  xen/common/Makefile             |    1 +
  xen/common/ioreq.c              | 1544 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  xen/include/asm-x86/hvm/ioreq.h |   38 +----
  xen/include/xen/ioreq.h         |   73 +++++++++
  11 files changed, 1633 insertions(+), 1584 deletions(-)

git config diff.renames true

  MAINTAINERS                          |  8 +++++++-
  xen/arch/x86/Kconfig                 |  1 +
  xen/arch/x86/hvm/Makefile            |  1 -
  xen/arch/x86/mm.c                    |  2 +-
  xen/arch/x86/mm/shadow/common.c      |  2 +-
  xen/common/Kconfig                   |  3 +++
  xen/common/Makefile                  |  1 +
  xen/{arch/x86/hvm => common}/ioreq.c |  0
  xen/include/asm-x86/hvm/ioreq.h      | 38 
++------------------------------------
  xen/include/xen/ioreq.h              | 73 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  10 files changed, 89 insertions(+), 40 deletions(-)

Although it is not needed for the patch in question anymore (since there 
won't be a rename here) I will try to keep that in mind for the future 
patches.


-- 
Regards,

Oleksandr Tyshchenko


