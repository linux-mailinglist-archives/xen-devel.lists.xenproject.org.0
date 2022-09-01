Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B505A9315
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396432.636578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgUS-0002ol-5Z; Thu, 01 Sep 2022 09:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396432.636578; Thu, 01 Sep 2022 09:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgUS-0002m9-2G; Thu, 01 Sep 2022 09:28:00 +0000
Received: by outflank-mailman (input) for mailman id 396432;
 Thu, 01 Sep 2022 09:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3PQ=ZE=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oTgUQ-0002iv-De
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:27:58 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d5cccec-29d8-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 11:27:57 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id s11so21708532edd.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 02:27:57 -0700 (PDT)
Received: from [192.168.1.10] (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a056402019a00b0044402ac02f7sm997261edv.67.2022.09.01.02.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 02:27:56 -0700 (PDT)
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
X-Inumbo-ID: 5d5cccec-29d8-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9Fj0oh9Yyp5FSKztr1IsxguBpjpyadMGxN0s2mi4j0g=;
        b=NQScdxVvH6WTMkv+CoFSfal2Wm2ISjDdoED7ZRNsYInW09P6MkCnQv7SC5Pl7N36Bq
         kVeONK47dDS+lmvM5lGaM5ywyO6z0O61qsF6S/IJ2OV4QhLNjSIxFqfLdj8QwLPlb2Rl
         dBvx+oes38I7DkOydhRfaQ5cmT1bg1/tJdVGkVwGoj4/AAKofQryj6LWLJZrCw7SDGja
         C2hwGh+ICKMhBjuJ2IX7tZqn6/2+vYveIUyX1PeH731zO+yMC9hlfOxneoOQRfUMjQf4
         AvSSseWfHUBqb1WCsxaoqc4hECKcDVh/4K804gSjdheX9oHcfzrunl1ukMI5YbDKsEg5
         0xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9Fj0oh9Yyp5FSKztr1IsxguBpjpyadMGxN0s2mi4j0g=;
        b=k168h3huI/4WlowunE+c1Dh7/bc99DreCNn9AZ+VJFvu0y209rQTU8uSI85HV4Ai5v
         A/kGzgG8EfjEI/m8fh4nXcUIZtVrQ+wJXu+0x+ufgPuDbe496rw51EiCnVEYVuMcMSpo
         +SbPGKvfCBqzElq/Tbp7Ey6lZvIm0XFtwq+tT2L0Ql6BaGIlSs0N2Ys9pUsSv0cEyLyO
         cOAfApU2HpLm6bvDQA7AIW6c9NrN7V75RLGEbqP7ShOm7ukvkS5s/xrJuknYNMfG2xIO
         whns2sspacoCDM73ENNL6bGBkt7ste44HkDPjID7BktLZGYpHuIBq2+UmWjII6WWU9OF
         KHMA==
X-Gm-Message-State: ACgBeo1yAAzdXYbSX1rxX8FJU0s9krtj40b94cetJn5uht04Vr8w+io8
	+9wsQnpPLXljwNJlazQbpwYxJlZgmZs=
X-Google-Smtp-Source: AA6agR4Ly6XRZCAWCsu5UKIv0W2xL05PlHIXM7uiiMTjmbk3AxkRKgIlO6wziQ5OcWWdGBz1Jh8U6w==
X-Received: by 2002:a05:6402:40cb:b0:448:627d:90d6 with SMTP id z11-20020a05640240cb00b00448627d90d6mr16534007edb.233.1662024476957;
        Thu, 01 Sep 2022 02:27:56 -0700 (PDT)
Message-ID: <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com>
Date: Thu, 1 Sep 2022 12:27:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/22 01:35, Stefano Stabellini wrote:
> Patches 1, 4, and 6 are already committed. I plan to commit patches 2, 3
> and 5 in the next couple of days.
> 
> Patch 7 needs further discussions and it is best addressed during the
> next MISRA C sync-up.
> 

I would like to share here, before the next MISRA C sync, my 
understandings that will hopefully resolve a wrong impression of mine, 
that I may have spread around, regarding this rule.
There was a misunderstanding regarding the rule 20.7 from my part and I 
think that Jan is absolutely right that parenthesizing macro parameters 
used as function arguments is not required by the rule.

The rule 20.7 states "Expressions resulting from the expansion of macro 
parameters shall be enclosed in parentheses" and in the rationale of the 
rule states "If a macro parameter is not being used as an expression 
then the parentheses are not necessary because no operators are involved.".

Initially, based on the title, my understanding was that it requires for 
the expression resulting from the expansion of the macro to be enclosed 
in parentheses. Then, based on the rule explanation and the examples 
given,  my understanding was that it requires the macro parameters that 
are used as expressions to be enclosed in parentheses.
But, after re-thinking about it, the most probable and what makes more 
sense, is that it require parentheses around the macro parameters that 
are part of an expression and not around those that are used as expressions.

Therefore, macro parameters being used as function arguments are not 
required to be enclosed in parentheses, because the function arguments 
are part of an expression list, not of an expression (comma is evaluated 
as separator, not as operator).
While, macro parameters used as rhs and lhs expressions of the 
assignment operator are required to be enclosed in parentheses because 
they are part of an assignment expression.

I verified that the violation reported by cppcheck is not due to missing 
parentheses around the function argument (though still I have not 
understood the origin of the warning). Also, Eclair does not report it.

Hence, it was a misunderstanding of mine and there is no inconsistency, 
with respect to this rule, in adding parentheses around macro parameters 
used as rhs of assignments. The rule does not require adding parentheses 
around macro parameters used as function arguments and neither cppcheck 
nor Eclair report violation for missing parentheses around macro 
parameters used as function arguments.

> 
> On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
>> Xenia Ragiadakou (7):
>>    xen/arm: gic_v3_its: Fix MISRA C 2012 Rule 20.7 violations
>>    xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7 violations
>>    xen/elf: Fix MISRA C 2012 Rule 20.7 violations
>>    xen/vgic: Fix MISRA C 2012 Rule 20.7 violation
>>    xen/rbtree: Fix MISRA C 2012 Rule 20.7 violation
>>    xen/arm: processor: Fix MISRA C 2012 Rule 20.7 violations
>>    xen/device_tree: Fix MISRA C 2012 Rule 20.7 violations
>>
>>   xen/arch/arm/include/asm/gic_v3_its.h | 10 +++++-----
>>   xen/arch/arm/include/asm/new_vgic.h   |  2 +-
>>   xen/arch/arm/include/asm/processor.h  |  4 ++--
>>   xen/include/xen/device_tree.h         |  6 +++---
>>   xen/include/xen/elfstructs.h          |  4 ++--
>>   xen/lib/rbtree.c                      |  2 +-
>>   xen/xsm/flask/ss/sidtab.c             |  8 ++++----
>>   7 files changed, 18 insertions(+), 18 deletions(-)
>>
>> -- 
>> 2.34.1
>>

-- 
Xenia

