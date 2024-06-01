Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC908D6FE3
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 15:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734199.1140405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDOTX-0005De-Sj; Sat, 01 Jun 2024 13:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734199.1140405; Sat, 01 Jun 2024 13:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDOTX-0005BZ-Q0; Sat, 01 Jun 2024 13:08:47 +0000
Received: by outflank-mailman (input) for mailman id 734199;
 Sat, 01 Jun 2024 13:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKEA=ND=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sDOTW-0005BR-IE
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 13:08:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139c2ce7-2018-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 15:08:45 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so16407335e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2024 06:08:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0f47sm4067039f8f.8.2024.06.01.06.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jun 2024 06:08:44 -0700 (PDT)
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
X-Inumbo-ID: 139c2ce7-2018-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717247325; x=1717852125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MbozNucyW+sx+4W72eymgLOLCc+L5Y5BOCx+JClK1/A=;
        b=YBUuLXZJ9EHKtwOu2Q6/GD16Kic3ZdZepsnLfm3DiEyU2lbpLx9eQBss/KGrmvCj/N
         nrMhlryT8EtJCZ8GUAh3NCUZ8772yQoZg4chJ8kEhieD5WTuugHOU6WzCUGdAUM90UzM
         LXbK0mhBoaFRPkgA3RVk6nJFh6D4KcPcN5rJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717247325; x=1717852125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbozNucyW+sx+4W72eymgLOLCc+L5Y5BOCx+JClK1/A=;
        b=ggOiW4eOnft1uBFyOO29XWw2Mat9SUFOhvQI3PTibVqJjszJmB+z5y/vXyqg0SdBFr
         wUWMU5Hx36zY5PBF+99WkmchOOCffTPzn6hN2qp69dY3v1Xc4pTkuqo0LUjEXq6d2bax
         8HnbbPIT4jPxQDbC0GsDZ5nRLxQL+ylVYn90irKHxAqkmsamc6WRaCXXiEY+C9WT/KLb
         sZFxvO64rmH2qRRagA6E1TK7zN49xamvBOIkQSaObJznIe7fmtSjqDJDMiVwYazMdo0S
         0EjWbC0yBpJfKsJIP3GLdiTSA3+JELosLn5rJgVhyOmWLcmj/8XmBC7NZZk6B2WPfPIr
         UZdA==
X-Gm-Message-State: AOJu0Yx62GIn3inmL11YVjOG3uCsmOyGMmfTETOamPehrsR2VdWwabnu
	wcxxc/3h2+xamGknqCIQ7gDN1dWrv5fGKZad+R1dynQao38th43CSARkbNRxdTY=
X-Google-Smtp-Source: AGHT+IELjqaCsm8xhYnWtORL4243UV5PuzTF38x8wbyzxCpPw3UD5z1gohLLHJLni609/TDOII3cbQ==
X-Received: by 2002:a05:600c:4f4d:b0:418:9d4a:1ba5 with SMTP id 5b1f17b1804b1-421280dfabbmr64967945e9.6.1717247324717;
        Sat, 01 Jun 2024 06:08:44 -0700 (PDT)
Message-ID: <02138ee8-7a30-40b0-823f-af451fb4f060@citrix.com>
Date: Sat, 1 Jun 2024 14:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/5] xen: fix MISRA regressions on rule 20.9 and 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <7d454066eb24e0515ff5b37864ed7a7ef5215dc5.1717236930.git.nicola.vetrini@bugseng.com>
 <6ea1507d-25dc-4b3c-8c00-3b7b271e69a0@citrix.com>
 <00424ba7b8e418c497ccee25167320e1@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <00424ba7b8e418c497ccee25167320e1@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2024 1:58 pm, Nicola Vetrini wrote:
> On 2024-06-01 14:47, Andrew Cooper wrote:
>> On 01/06/2024 11:16 am, Nicola Vetrini wrote:
>>> ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead of
>>> rearrangements")
>>> introduced new violations on previously clean rules 20.9 and 20.12.
>>>
>>> The first is introduced because CONFIG_CC_IS_CLANG in
>>> xen/self-tests.h is not
>>> defined in the configuration under analysis. Using "defined()"
>>> instead avoids
>>> relying on the preprocessor's behaviour upon encountering an
>>> undedfined identifier
>>> and addresses the violation.
>>>
>>> The violation of Rule 20.12 is due to "val" being used both as an
>>> ordinary argument
>>> in macro RUNTIME_CHECK, and as a stringification operator.
>>>
>>> No functional change.
>>>
>>> Fixes: ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure
>>> ahead of rearrangements")
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Thankyou for this patch.  I'd seen that I'd broken something.  (Entirely
>> my fault - I've done a lot of testing in Gitlab for the series, but
>> never manually ran the Eclair jobs.  I'll try to remember better next
>> time.)
>>
>> One question though. 
>> https://gitlab.com/xen-project/xen/-/jobs/6994213979 says:
>>
>> Failure: 1 regressions found for clean guidelines
>>   service MC3R1.R20.9: (required) All identifiers used in the
>> controlling expression of `#if' or `#elif' preprocessing directives
>> shall be #define'd before evaluation:
>>    violation: 1
>>
>> While there is a report for 20.12, it's not clean yet (so the first
>> sentence wants adjusting), and RUNTIME_CHECK doesn't show up newly in
>> it.
>>
>> So, while I agree that RUNTIME_CHECK() should be included in the 20.12
>> exclusions, why is current Gitlab Run not reporting it?
>>
>> ~Andrew
>
> While Rule 20.12 wasn't clean on x86, but it was on arm, so in the
> arm64 run it is reported as such
>
> https://gitlab.com/xen-project/xen/-/jobs/6994213980
>
> with the other patches in the series the rule should be clean on both
> architectures, so this imbalance should disappear rather shortly.
>

Thanks - I'd just found the ARM report and was replying - I'll rebase
onto this thread.

I still don't understand why the violation doesn't show up on the x86
build.  Specifically, why it's missing from here:
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/staging/X86_64/6994213979/prev/PROJECT.ecd;/by_service/MC3R1.R20.12.html

From the ARM report, one is xen/lib/generic-ffsl.c:61 and checking with
the x86 build log, we are building generic-ffsl.c too (which is expected.)

~Andrew

