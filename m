Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF3526466
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:33:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328486.551557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWLx-00088N-Qz; Fri, 13 May 2022 14:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328486.551557; Fri, 13 May 2022 14:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWLx-00086Z-N0; Fri, 13 May 2022 14:33:13 +0000
Received: by outflank-mailman (input) for mailman id 328486;
 Fri, 13 May 2022 14:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O871=VV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1npWBj-0004p3-Cv
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:22:39 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 236260f1-d2c8-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 16:22:37 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id w4so11626782wrg.12
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 07:22:37 -0700 (PDT)
Received: from [192.168.0.194] (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c500e00b00394708a3d7dsm5660714wmr.15.2022.05.13.07.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:22:36 -0700 (PDT)
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
X-Inumbo-ID: 236260f1-d2c8-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=kyrS36o/jWnUwfrq0CADzTAZFrVRLPWZX0OrC8tFl+M=;
        b=Rj2BWwN34D0wilE28GH+0shlMocKZtGVsy0IBmwkNSsMNCIaCMp181H4k3RYv8PNil
         0vWxCvdOWWLqJRjIsQjSsqfHu8JkPkqsPOJwZO6t0GM0eh5o8eGP2x9p7J+8hT0/mQdO
         HeLdFnUXYsi+YYTIrkn+jZrZlRVFe1Mte9efzY5Ln8TPYCzSMW70kfqvRVPKNF16Zz4n
         C7XOL1VqId6MQ38BJWocOHBR70aC6FEKFon+jP0ULVXKpz1qxOugEb19JY8gIRSJOY3h
         jz+yahPc8C3oT4ndek+6OuIpjHkzofEA0OK2yq8ch1Du9FR45NnkjeM69rkuUAH5q3Mf
         imbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=kyrS36o/jWnUwfrq0CADzTAZFrVRLPWZX0OrC8tFl+M=;
        b=YyJHda1wyse+jWmA4TtrULLkQTzv7Rmfcw4SefgWPSfqoFWPBLOU4WC4IEhRVThqpo
         iqaW9Sot6ZuHURpnC9A6LADHVDR08Vo/Q4Bk+iS61qblIx+gRqzyzmn1Hgl1g1W+ooNj
         wP1ldCSj+A6SrtOyjYk2gvR1kZX1O4GjXfa5t8I5u6+WVcrl1ZXXdOeMwbecqd33eTVl
         HHFNhpqxIaf0xUiat6nA3Hca99TDwVJefBMto5y/PmQglG3tpFmaWbOCbKWrgUOm2Fsk
         kY0AkHbZaXo9dUNAvBEFVcluV/ldScQ10XU6GJgrsYNgpLGpcMj0Wz6Jgll3c20fxCu5
         UlyQ==
X-Gm-Message-State: AOAM5309+z2WEf0T4OOkBVBOevniYuqPfLgnGJoeXoiJelFJj+44nQOC
	JsBrx3dooy4GJ8SQc+Jq6WPZ7g==
X-Google-Smtp-Source: ABdhPJxFyhcZAm06ayS+ue/NVo9BHkth/1yAwOPuYUq3ZH9FU3ybnEFpKYElXF7SQdmZBwc86GSS2A==
X-Received: by 2002:a5d:6112:0:b0:20c:f4a5:cd28 with SMTP id v18-20020a5d6112000000b0020cf4a5cd28mr1398859wrt.299.1652451756763;
        Fri, 13 May 2022 07:22:36 -0700 (PDT)
Message-ID: <7acb1709-344d-6995-ee9d-df6652d505b5@minervasys.tech>
Date: Fri, 13 May 2022 16:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: Re: [PATCH 04/36] xen/arm: add parsing function for cache coloring
 configuration
To: Julien Grall <julien@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-5-marco.solieri@minervasys.tech>
 <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
Content-Language: en-US
In-Reply-To: <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

I'm Carlo, the new developer that will work on this patch set and on the 
review.

Thanks for all the comments. I'll try to answer to all the open points 
and also
ask for feedback.

On 09/03/22 20:09, Julien Grall wrote:
>> - way_size: The size of a LLC way in bytes. This value is mainly used
>>    to calculate the maximum available colors on the platform.
>
> We should only add command line option when they are a strong use 
> case. In documentation, you wrote that someone may want to overwrite 
> the way size for "specific needs".
>
> Can you explain what would be those needs?
This parameter is here mainly to support QEMU on which the automatic 
probing
of the LLC size doesn't work properly.

Also, since from this value we compute the maximum number of colors
the architecture supports, you may want to fix the way size so as to 
simulate
a different use case for debugging purposes.

Should I add those notes somewhere (doc, commit messages, etc.)?

>> A cache coloring configuration consists of a selection of colors to be
>> assigned to a VM or to the hypervisor. It is represented by a set of
>> ranges. Add a common function that parses a string with a
>> comma-separated set of hyphen-separated ranges like "0-7,15-16" and
>> returns both: the number of chosen colors, and an array containing their
>> ids.
>> Currently we support platforms with up to 128 colors.
>
> Is there any reason this value is hardcoded in Xen rather than part of 
> the Kconfig?
Having another parameter to configure can complicate things from
the user perspective. Also 128 is more than enough for the current ARM
processors we tested.
>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> ---
>>   xen/arch/arm/Kconfig                |   5 ++
>>   xen/arch/arm/Makefile               |   2 +-
>>   xen/arch/arm/coloring.c             | 131 ++++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/coloring.h |  28 ++++++
>>   4 files changed, 165 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/coloring.c
>>   create mode 100644 xen/arch/arm/include/asm/coloring.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index ecfa6822e4..f0f999d172 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -97,6 +97,11 @@ config HARDEN_BRANCH_PREDICTOR
>>           If unsure, say Y.
>>   +config COLORING
>> +    bool "L2 cache coloring"
>> +    default n
>
> This wants to be gated with EXPERT for time-being. SUPPORT.MD woudl
> Furthermore, I think this wants to be gated with EXPERT for the 
> time-being.
>
>> +    depends on ARM_64
>
> Why is this limited to arm64?
Because arm32 isn't an "interesting" architecture where to have coloring
since there are locking primitives that provides sufficient isolation and so
the problem is not common.
On x86 instead, the functions that map memory into caches are not so 
easy to
exploit to achieve isolation.

Thanks.

- Carlo Nonato


