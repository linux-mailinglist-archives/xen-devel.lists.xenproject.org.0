Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F6380AD3
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 15:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127367.239365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYJl-0005gF-PL; Fri, 14 May 2021 13:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127367.239365; Fri, 14 May 2021 13:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYJl-0005e6-Lv; Fri, 14 May 2021 13:57:29 +0000
Received: by outflank-mailman (input) for mailman id 127367;
 Fri, 14 May 2021 13:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhYJj-0005dx-P1
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 13:57:27 +0000
Received: from mail-io1-xd2c.google.com (unknown [2607:f8b0:4864:20::d2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58814e96-f0f1-4688-be29-dad8ffff7f80;
 Fri, 14 May 2021 13:57:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id i7so20701499ioa.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 06:57:27 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id x14sm3041398ill.74.2021.05.14.06.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 06:57:26 -0700 (PDT)
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
X-Inumbo-ID: 58814e96-f0f1-4688-be29-dad8ffff7f80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=I80+X0SMixcNNEjoWnMY8lYgMp184ikKB9bKEeh4kMM=;
        b=e/XP3V/oJD8xj9XMhPnYIlaQcL2XdhSV/7/cMQDOrZJrHCVvE4j3k5/3RgqdwL9WTZ
         AFxFhS40Mrjza4i8lwfyUtHwSyQiRLR/Hjo+mUSXmWgpVpsRzHIyUYkYSaDQMyrs2hv0
         /jXRXbfhKJCHH8VbZYDFWed46KnIVxo+Y0u4GuYAAkYogM4coTb/XHMiwnR6NouGRwSl
         jnazP9hJI/O+AjkCV4LxQjBrEVPgyi7vJE1AKtYbw2yd2fEGJ4FoQVMVohAhWkTHBNmD
         IPWYuje/9neYCP5hUVVpTIctfUWdfj1WrZSQvjPLL65OECDR1obD7U51F931w7E4cMpU
         kK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I80+X0SMixcNNEjoWnMY8lYgMp184ikKB9bKEeh4kMM=;
        b=Gc0v/tKnL6qvd+MYG8wd7W63TNaUrL19FVEen1DSqKGg7fbMlbw90dRglKJvwO8eCG
         erIJLxBRQHJJjsQVaxcQq2BkCv9lG5mxd3z30MlGWfUjrCWI4Qqa90LJsSJlCCnHh3Xz
         EYcE2521fdq1g1+yNoEodU/+1nU+FbNtQQmq+iYVfVjOUuB9q2Jj6qmMqWhBHOLnDic9
         fSpRruwPbzlwyFz+e9MwAdOgak5DKKIgFhAEGzIxq1CNPf6yFDiB2EHDS8jwxIBEgn6i
         W9qjyU+FwU5eJH1L8tYj3VTPRGO6B1i68+7niVofmRcsQrxME9rvc+u1wLt8B9C7k9IY
         KO4Q==
X-Gm-Message-State: AOAM530THepahTQJTpMmWJCAOQWEnDjzVTT+768ArU5j4FhyJ2PbA1RY
	wqB0wIrRGVwMxJZfvHKcjlo=
X-Google-Smtp-Source: ABdhPJzXjGdg+BBKyCIjFNC0gIohwCQWX9tFQjn0LXStxT30mkkcNqoHI+gWRsnFxAtSVbWuedelFA==
X-Received: by 2002:a02:caa3:: with SMTP id e3mr43006658jap.57.1621000646597;
        Fri, 14 May 2021 06:57:26 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] xen: Add files needed for minimal riscv build
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
 <c5d130b06de3d724921488387f1743d7996aac11.1620965208.git.connojdavis@gmail.com>
 <a5fd6d72-3a02-4c12-4021-bf06d0eeb174@xen.org>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <2582c509-3123-f193-0b72-bfc46e798741@gmail.com>
Date: Fri, 14 May 2021 07:57:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a5fd6d72-3a02-4c12-4021-bf06d0eeb174@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/14/21 3:46 AM, Julien Grall wrote:
> Hi Connor,
>
> On 14/05/2021 05:17, Connor Davis wrote:
>> Add the minimum code required to get xen to build with
>> XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
>> function added is required for a successful build, given the .config
>> generated from riscv64_defconfig. The function implementations are just
>> stubs; actual implmentations will need to be added later.
>
> Thank you for the contribution. This is quite a large patch to review. 
> Could you consider to split in smaller one (I think Stefano suggested 
> one per header file or group of headers)? This would help to review 
> and find whether some bits can be moved in common.
>
Ok yes I will work on that.

> I would be happy to help moving some of the pieces.
>
Great!
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> ---
>>   config/riscv64.mk                        |   7 +
>>   xen/Makefile                             |   8 +-
>>   xen/arch/riscv/Kconfig                   |  54 ++++
>>   xen/arch/riscv/Kconfig.debug             |   0
>>   xen/arch/riscv/Makefile                  |  57 ++++
>>   xen/arch/riscv/README.source             |  19 ++
>>   xen/arch/riscv/Rules.mk                  |  13 +
>>   xen/arch/riscv/arch.mk                   |   7 +
>>   xen/arch/riscv/configs/riscv64_defconfig |  12 +
>>   xen/arch/riscv/delay.c                   |  16 +
>>   xen/arch/riscv/domain.c                  | 144 +++++++++
>>   xen/arch/riscv/domctl.c                  |  36 +++
>>   xen/arch/riscv/guestcopy.c               |  57 ++++
>>   xen/arch/riscv/head.S                    |   6 +
>>   xen/arch/riscv/irq.c                     |  78 +++++
>>   xen/arch/riscv/lib/Makefile              |   1 +
>>   xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++
>
> I quickly skimmed through the code and I think some of the file can be 
> made common such as this one.
Yep there is quite a bit of overlap from ARM
>
> [...]
>
>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>> index 1708c36964..fd0b75677c 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -60,6 +60,7 @@ void arch_vcpu_destroy(struct vcpu *v);
>>   int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>>   void unmap_vcpu_info(struct vcpu *v);
>>   +struct xen_domctl_createdomain;
>
> This is needed because?
>
The build was failing without it. With the one commit-per-file approach 
we can probably avoid this.


Thanks,

Connor


