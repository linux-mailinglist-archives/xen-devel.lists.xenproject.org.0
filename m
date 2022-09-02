Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E55AB822
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 20:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397886.638603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUBMx-0006GD-Aj; Fri, 02 Sep 2022 18:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397886.638603; Fri, 02 Sep 2022 18:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUBMx-0006DT-7C; Fri, 02 Sep 2022 18:26:19 +0000
Received: by outflank-mailman (input) for mailman id 397886;
 Fri, 02 Sep 2022 18:26:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFGg=ZF=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oUBMu-0006DL-S9
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 18:26:17 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba0a2b88-2aec-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 20:26:14 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id gb36so5460750ejc.10
 for <xen-devel@lists.xenproject.org>; Fri, 02 Sep 2022 11:26:14 -0700 (PDT)
Received: from [192.168.1.10] (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a170906a45900b00730a1c73288sm1529357ejb.49.2022.09.02.11.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 11:26:12 -0700 (PDT)
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
X-Inumbo-ID: ba0a2b88-2aec-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RGduPfmV/d+FI45R2V6B1LMc7TO2USYlbHZWxrYrI0A=;
        b=le+A5EFj1mWH+EY7sl7A9fBof9dsUD4sZYqeQPLQmVAOO8fsNwY+Zf3rB/ppJMGkZ6
         dc53YtKJ1sUSvr01qC9R6OLKjcu+szK+qg8i5YbUg0ixljNJFeLdv4svMP0t9YsnITDy
         BYHbUNxu1BX/1hUc37GmLAxiFEq4jqqIOcTZkN4JdkjZ20jRCNVgP9hVZUe+f6RqajmT
         /a5DaDWA0AmxVPrkpFg9LNSH+sRmsanycetL3L9i3qdS7a3XCVnOgljIJvt2O0f3Yqpn
         unMDHvgToADnAcSU4+X6799h/GDOJHyBHsYFRTYjqZp33sHNvSh9vmPIf6k8mDLlhp36
         xdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RGduPfmV/d+FI45R2V6B1LMc7TO2USYlbHZWxrYrI0A=;
        b=dXZsHvIzwPLZ4MsvwNpb+DALUqLo6Mk+828/oXMZiI5T57TOHnj3aAk0g9VL/pcdr+
         4SpSC5exnLBUTSyVvmNdDQ8COUIC2GMZuCHolBLSc1cPXFExmlfMgEBWilnwIvubtZNq
         FoD+JNQissJ/Tvn3PG8XbhBtGLYhoQ3Mpjm+C6wAcvHv+jd+LikLtrt3ZrTN5hfuR2HY
         2Afx5VUZUFu0qoYGuOGv5kR2Jam1hbyqwkmnotXR+K2ylSXsjT9pFUOG3ELUpxZf+a/V
         +CKlCaTLhbbqGKpRis7GWfFKPBMqXEifc7mu97s0qzpAvsahxcQAoH9Skmdqydgh7yw5
         xRzg==
X-Gm-Message-State: ACgBeo2Fje2vzdJpjOV8ZcwQ9RuibgeJTbuyf1pgWFhQuunPHm+dLT2V
	PUT2l27CeyHqwnwyY1cbByw=
X-Google-Smtp-Source: AA6agR4Z2AEWF1UqHkP/VYrLaqLVgKX60scJLKlweK44ANiBEdpFi4GMlx+o+5aQwKi4tK/82Q/+6w==
X-Received: by 2002:a17:907:72d0:b0:734:b451:c8d9 with SMTP id du16-20020a17090772d000b00734b451c8d9mr27982558ejc.272.1662143173602;
        Fri, 02 Sep 2022 11:26:13 -0700 (PDT)
Message-ID: <422ad42f-8bfa-55a9-2e70-4ae857632a94@gmail.com>
Date: Fri, 2 Sep 2022 21:26:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
 <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com>
 <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
 <alpine.DEB.2.22.394.2209011904571.3931@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2209011904571.3931@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/22 05:07, Stefano Stabellini wrote:
> On Thu, 1 Sep 2022, Bertrand Marquis wrote:
>> Hi Xenia,
>>
>>> On 1 Sep 2022, at 10:27, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>>
>>>
>>> On 9/1/22 01:35, Stefano Stabellini wrote:
>>>> Patches 1, 4, and 6 are already committed. I plan to commit patches 2, 3
>>>> and 5 in the next couple of days.
>>>> Patch 7 needs further discussions and it is best addressed during the
>>>> next MISRA C sync-up.
>>>
>>> I would like to share here, before the next MISRA C sync, my understandings that will hopefully resolve a wrong impression of mine, that I may have spread around, regarding this rule.
>>> There was a misunderstanding regarding the rule 20.7 from my part and I think that Jan is absolutely right that parenthesizing macro parameters used as function arguments is not required by the rule.
>>>
>>> The rule 20.7 states "Expressions resulting from the expansion of macro parameters shall be enclosed in parentheses" and in the rationale of the rule states "If a macro parameter is not being used as an expression then the parentheses are not necessary because no operators are involved.".
>>>
>>> Initially, based on the title, my understanding was that it requires for the expression resulting from the expansion of the macro to be enclosed in parentheses. Then, based on the rule explanation and the examples given,  my understanding was that it requires the macro parameters that are used as expressions to be enclosed in parentheses.
>>> But, after re-thinking about it, the most probable and what makes more sense, is that it require parentheses around the macro parameters that are part of an expression and not around those that are used as expressions.
>>>
>>> Therefore, macro parameters being used as function arguments are not required to be enclosed in parentheses, because the function arguments are part of an expression list, not of an expression (comma is evaluated as separator, not as operator).
>>> While, macro parameters used as rhs and lhs expressions of the assignment operator are required to be enclosed in parentheses because they are part of an assignment expression.
>>>
>>> I verified that the violation reported by cppcheck is not due to missing parentheses around the function argument (though still I have not understood the origin of the warning). Also, Eclair does not report it.
>>>
>>> Hence, it was a misunderstanding of mine and there is no inconsistency, with respect to this rule, in adding parentheses around macro parameters used as rhs of assignments. The rule does not require adding parentheses around macro parameters used as function arguments and neither cppcheck nor Eclair report violation for missing parentheses around macro parameters used as function arguments.
>>
>>
>> Thanks a lot for the detailed explanation :-)
>>
>> What you say does make sense and I agree with your analysis here, only protect when part of an expression and not use as a subsequent parameter (for a function or an other macro).
> 
> Yeah I also agree with your analysis, and many thanks for
> double-checking the cppcheck and Eclair's reports.

Unfortunately in the specific case that I checked, it was not reported 
because it was actually an argument to a macro, not a function.
Eclair does report as violations of Rule 20.7 the macro parameters that 
are used as function arguments and are not enclosed in parentheses.

So, one tool reports it as violation and the other one not.

The same goes, also, for the case where a macro parameter is used as 
index to an array. Eclair reports it as violation while cppcheck does not.

-- 
Xenia

