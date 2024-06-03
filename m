Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16F8DAF8A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 23:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735040.1141190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEFAY-0002Tp-Pg; Mon, 03 Jun 2024 21:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735040.1141190; Mon, 03 Jun 2024 21:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEFAY-0002Qo-Mz; Mon, 03 Jun 2024 21:24:42 +0000
Received: by outflank-mailman (input) for mailman id 735040;
 Mon, 03 Jun 2024 21:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29W0=NF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEFAX-0002Qi-0j
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 21:24:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1394e8-21ef-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 23:24:39 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42121d28664so42256635e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 14:24:39 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213847aad7sm85430695e9.43.2024.06.03.14.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 14:24:38 -0700 (PDT)
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
X-Inumbo-ID: af1394e8-21ef-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717449878; x=1718054678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1h0IsyhmP1Kky0DXeowcrBtQ0fOwQqtGQ3MVVjWF9SI=;
        b=Xu+kej17jGU56u5sizA3up31cjrfhdCCdV0bVwak/Ss5A1YB3kwBU4MegJ05UDeVGj
         NptL66K6IRz49fl2SRwJAUH01KKEZpDx2hhGokvafCMK4wj2+k7TemZ4cTL7302YKIOu
         2vLQMCBppIRCVMGpxYtPBcrY/OBPK7FB4afN6oSbQwRV/+D2Whi/dtv9ZODYbtOvs4Pl
         wwFKnIqfkVqKEkOrIXkQI1y3rXC6Ixy9juHIQYzBPF76DEN6BADtQ/jMikRhXdGlEgKk
         +kyDPiHX4AQfn3CFJiVMXGKZkZjcE+OrWHIAm89rCoyLngsVs8HK0aNVIcIAStDq+yuX
         Q0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717449878; x=1718054678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1h0IsyhmP1Kky0DXeowcrBtQ0fOwQqtGQ3MVVjWF9SI=;
        b=wVZ/d4IG6cbTs4e8b5Cu8ecTvDkeaGe+i+GonyyITwrEd6uSXZE6wEm5I4d9cdmRKS
         qBWDgmX3+c0pE3AiKwKtSzaWg2o33egcrGywivFkRJqLvES9qX+CO6GvD2xA6Luef6X7
         jMnFY8KGiWum64aFV4w+c0bWwXoHxk8CkMk1UYyXjM3RDtUEgivnr9UMNsPF8RjvMZOQ
         pcR2BwnSXwQuLLCexrXMJ2kIzj/NcIPDgRq8+y2c51vPp3E6fFeKWm1DxxVjXeVQFiTl
         JS7SGLM2zYYVvhQZRFgv7z+CczVbaVq76984zB6L1/pwUkc/iyVUOCaoilW2NQeMm4JG
         pwxA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Lia/b6L5nRU1Urj2VsMXVSHDtoG0IFXJfZ4WAP6d8GFZDBQ22l4prYyAVoby0oDpIDffBnY5mPqe3JxeJqBhgN69jB9wV/FDQNI3p/c=
X-Gm-Message-State: AOJu0YzkuZxZw1gEyJV4dNn6HRQA3gvzmfUYKQS84/3TG5mbmT78m2KK
	7oUPnx+W1CPe9rcULUEjSrC8r4E7smkVYk/03lRit95toKeK4Vw2ngJzuNtAdA==
X-Google-Smtp-Source: AGHT+IF6hFRjvDjjsXNRQMaHDJEjO9hwb152W+UWDr8fxLAENLlh/E3eTBikQ0kl5oR1H1xcRzZNrw==
X-Received: by 2002:a05:600c:35d3:b0:421:3979:8c56 with SMTP id 5b1f17b1804b1-42139798e83mr39680165e9.40.1717449878506;
        Mon, 03 Jun 2024 14:24:38 -0700 (PDT)
Message-ID: <a27b1218-7530-43c7-8695-16057b712f89@suse.com>
Date: Mon, 3 Jun 2024 23:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/5] automation/eclair_analysis: address remaining
 violations of MISRA C Rule 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
 <90c40d6a-d648-46bb-9cb0-df11ac165bd7@suse.com>
 <085aabe9953d53e634d5cf75fecdb8b7@bugseng.com>
 <cb14826d-3c5c-45b8-aaea-30cfa85a450f@suse.com>
 <017a3e69ef784eb919a96a06b0fcf0dc@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <017a3e69ef784eb919a96a06b0fcf0dc@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 21:12, Nicola Vetrini wrote:
> On 2024-06-03 20:52, Jan Beulich wrote:
>> On 03.06.2024 09:13, Nicola Vetrini wrote:
>>> On 2024-06-03 07:58, Jan Beulich wrote:
>>>> On 01.06.2024 12:16, Nicola Vetrini wrote:
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -483,6 +483,12 @@ leads to a violation of the Rule are deviated."
>>>>>  -config=MC3R1.R20.12,macros+={deliberate,
>>>>> "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>>>>>  -doc_end
>>>>>
>>>>> +-doc_begin="The macro DEFINE is defined and used in excluded files
>>>>> asm-offsets.c.
>>>>> +This may still cause violations if entities outside these files are
>>>>> referred to
>>>>> +in the expansion."
>>>>> +-config=MC3R1.R20.12,macros+={deliberate,
>>>>> "name(DEFINE)&&loc(file(asm_offsets))"}
>>>>> +-doc_end
>>>>
>>>> Can you give an example of such a reference? Nothing _in_ 
>>>> asm-offsets.c
>>>> should be referenced, I'd think. Only stuff in asm-offsets.h as
>>>> _generated
>>>> from_ asm-offsets.c will, of course, be.
>>>>
>>>
>>> Perhaps I could have expressed that more clearly. What I meant is that
>>> there are some arguments to DEFINE that are not part of asm-offsets.c,
>>> therefore they end up in the violation report, but are not actually
>>> relevant, because the macro DEFINE is actually what we want to 
>>> exclude.
>>>
>>> See for instance at the link below VCPU_TRAP_{NMI,MCE}, which are
>>> defined in asm/domain.h and used as arguments to DEFINE inside
>>> asm-offsets.c.
>>>
>>> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/676/PROJECT.ecd;/by_service/MC3R1.R20.12.html
>>
>> I'm afraid I still don't understand: The file being supposed to be
>> excluded from scanning, why does it even show up in that report?
> 
> The report is made up of several source code locations. Three of them 
> are within asm-offsets.c, which is excluded from compliance but still 
> analyzed, but one references a macro definition in another file (e.g., 
> VCPU_TRAP_NMI from asm/domain.h). So in this case the exclusion of 
> asm-offsets.c is not enough for the report not to be shown.

But the (would-be-)violation is in asm-offsets.c. The other locations
pointed at are providing context. To report a violation, it should be
enough to exclude the file where the violation itself is?

Jan

