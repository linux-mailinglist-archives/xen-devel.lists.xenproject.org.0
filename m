Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7FF978714
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 19:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798383.1208587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spAMZ-0004EH-Pr; Fri, 13 Sep 2024 17:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798383.1208587; Fri, 13 Sep 2024 17:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spAMZ-0004Bi-NF; Fri, 13 Sep 2024 17:45:43 +0000
Received: by outflank-mailman (input) for mailman id 798383;
 Fri, 13 Sep 2024 17:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spAMZ-0004Bc-5z
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 17:45:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe1e0b70-71f7-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 19:45:40 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so377322466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 10:45:40 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d3b47d270sm831409066b.47.2024.09.13.10.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 10:45:39 -0700 (PDT)
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
X-Inumbo-ID: fe1e0b70-71f7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726249540; x=1726854340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFEXrSZ/U6BJCbHXZTbiBSfrTSWlL7FIE3dkM0dSiU4=;
        b=CjSch6eWYSozFPdN1oExXdtIHT3gkCQegKNrYcPHxIO0OydqOIO9WB5KqE5dPJSeHD
         L2D1Igd2QhRCkRLRKLHnEEoJQI5lLsu1/Hb8Lk/Am2gaxX18gOx7OYGz+5W8YM9YivwN
         xapX6AI04raiUNfthrtMUmHAAMDU5EsMhe8pNmHNvDv7z4Cxt5yAAwHm3HaB+cF6ytC6
         Y8T9IxW6YkNts8YUZvWQeo/1Cfy5teT3qS4WxZCr0yxLrbyJoTclik4yp3A1BViptrrS
         rjVzSMo+lWP2w/omXVb6By6g78YFh3LHebzpcxwCPqjntACwsABT3LU3a+/vDkeyGSR0
         ehRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726249540; x=1726854340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFEXrSZ/U6BJCbHXZTbiBSfrTSWlL7FIE3dkM0dSiU4=;
        b=ZIOxxFbuDmYyz/x/5MuZO1JMSC7Ka/Oc4ZDRoaEpwD2vUaiP7FBsehyxhRXvO6DstH
         fmnmcoxREXPtPwrlQsjbcjTl3Q1N9UE/dQ+vwckSBxHpo5eL91LLjWcg/6PkpMwc0FHE
         i/c7thGTEP2ypYoWXpnlRPTIQAfOpRWqtl6rJ4caloTQmXGyUiAEYhpUTy/CinQyqcIR
         mmbjhdF8LAUODc56ji2PAPWINtxMMejXl3E6/Yrd54Uqsn2GkdeqAsqGhqbI1nzDyUEQ
         3KeaaWxkKH9JVie2GdZ7coa3TXEtzh2qYVvJ+c5//9nqPVXxZ8xYz8316uwi/JwgWzD4
         jASQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc3d3rsN4fzI/Z9BX6ssvsq3KUyd6Aj+ga65S9JUKkEf7fPIBamSdp4A80MUoVRtYoh+MJy4JQPHE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBTv8QCg95doHx4N0SEWqa4OwLr1RYtbYGBsmFMCZodxlc+MtD
	jTkZpIiR4CsEHOfeU71h9xErgA4M9TcR6DyGms0DOnvjCXKQDIMpcENMlb64Ew==
X-Google-Smtp-Source: AGHT+IFCNVDJed0z5ZPDI+CwITXRtm93GslSex005D+jST++aJxuHlM30xlhQVWKqDJVN7iuEjMWXw==
X-Received: by 2002:a17:907:3e9e:b0:a8c:78a5:8fb7 with SMTP id a640c23a62f3a-a902961bfa3mr775953966b.45.1726249540087;
        Fri, 13 Sep 2024 10:45:40 -0700 (PDT)
Message-ID: <f324c131-9446-4444-b5f7-65d851b2be3b@suse.com>
Date: Fri, 13 Sep 2024 19:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/common: move device initialization code to
 common code
To: oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
 <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
 <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
 <f3a16db18f98a4fff3a4b59f144d4a2fee815465.camel@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f3a16db18f98a4fff3a4b59f144d4a2fee815465.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.09.2024 16:35, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-09-12 at 17:28 +0200, Jan Beulich wrote:
>> On 11.09.2024 12:04, Oleksii Kurochko wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>>>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>>>  obj-y += cpu.o
>>>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>>> +obj-$(call or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) +=
>>> device.o
>>
>> I can't spot any HAS_ACPI in the tree. And if this was switched to
>> CONFIG_ACPI
>> I'd further ask why the file needs building on x86.
> Oh, there is no need for building this on x86. With what you suggested
> here ...
> 
>>
>> Also I think I'd prefer to avoid the of the "or" macro here:
>>
>> obj-$(CONFIG_ACPI) += device.o
>> obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
> ... IIUC it will fix the issue with building this file for x86 as
> CONFIG_ACPI depends on (ARM_64 && ARM_EFI).

Except that "depends on" is itself Arm-only, so won't affect x86.
Or else x86 would end up without ACPI support, which would mean
full breakage on about every system.

Jan

