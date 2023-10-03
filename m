Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B481D7B6FBA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 19:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612306.952177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnjBa-0006jT-VF; Tue, 03 Oct 2023 17:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612306.952177; Tue, 03 Oct 2023 17:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnjBa-0006hW-SM; Tue, 03 Oct 2023 17:27:54 +0000
Received: by outflank-mailman (input) for mailman id 612306;
 Tue, 03 Oct 2023 17:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=56qu=FR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qnjBZ-0006hO-ER
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 17:27:53 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e5a435f-6212-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 19:27:52 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-406618d0991so11844675e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Oct 2023 10:27:52 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b004065d72ab19sm9970148wms.0.2023.10.03.10.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 10:27:51 -0700 (PDT)
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
X-Inumbo-ID: 2e5a435f-6212-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696354072; x=1696958872; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v6zZ2zpNMwOqk+ufjI+WYn02mreJbDKvpwV3YkxrRHc=;
        b=uxooc4Zn6pew5QJMYmde1gU8N/wbqjFVUPHdnJtGWgcwkNLC5W5/o4LD63j+OBxCGv
         PaGHHB9bjehRdQ8lU2t9TFR9NnTQ+NJ7MF3ENO3+mzkqAqoLEXBmqOzyYR+L0q4x9/G0
         RhXpcx82jiuvQfnaXYhjspYC46twkEZxoLpKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696354072; x=1696958872;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6zZ2zpNMwOqk+ufjI+WYn02mreJbDKvpwV3YkxrRHc=;
        b=a32ddcKO7ZT+aNmy8tQzPTDEOMmEX2tlqnWlKS6gFJEMzXwnaFZr+QWpTUyzSx0XaO
         nvczdAyjIg+QwDiqKRQ7ReEJmZn5d7dXYTutCphdnX36e/Kky+6w42JzwhZEvDGWQ46M
         CEpxiR290+LsX/0nFPL4Qro+hB+tc8xwfKKJJVtdlgrioG88axcIT59/+wDKI5JnmLBE
         7Bdz+ipjjHAH0zX/LwEMKidYFA/L8Tbxe3VxhbVmye4/G/SZzNtUxsoN7VbmOFrC0k5p
         Fdc8PrHCoM7Giga6NA/9FYhRc0G0WBEuh3m4WVAjOAiszBJoSJ02cyKQbULa10JeAEob
         c5KQ==
X-Gm-Message-State: AOJu0YxuDGYH4P3gYtXXbK6bX0rST7trIbbz0LljG2fb+hM8vbt8iwvz
	RKERXRUTThnJNrv2IP+0PE4tew==
X-Google-Smtp-Source: AGHT+IExzmdp7lkYnSvmsqF7PBEHxvCViwHcSTPxsuS7/HigQ+z4rb8pJqQAkVya0+doD7w2IYCiTA==
X-Received: by 2002:a7b:c40a:0:b0:401:23fc:1f92 with SMTP id k10-20020a7bc40a000000b0040123fc1f92mr116429wmi.25.1696354071600;
        Tue, 03 Oct 2023 10:27:51 -0700 (PDT)
Message-ID: <2ff3ae18-0064-42ac-88fd-a46c4332a5dc@citrix.com>
Date: Tue, 3 Oct 2023 18:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <1f271e93-7409-4a8d-9841-368722d6aa43@citrix.com>
 <58213BE0-ADC4-47A0-B169-2E2E3B76D9C3@arm.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <58213BE0-ADC4-47A0-B169-2E2E3B76D9C3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2023 6:14 pm, Luca Fancellu wrote:
>
>> On 3 Oct 2023, at 17:17, andrew.cooper3@citrix.com wrote:
>>
>> On 03/10/2023 4:37 pm, Nicola Vetrini wrote:
>>> As specified in rules.rst, these constants can be used
>>> in the code.
>>> Their deviation is now accomplished by using a SAF comment,
>>> rather than an ECLAIR configuration.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ------
>>> docs/misra/safe.json                             | 8 ++++++++
>>> xen/arch/x86/hvm/svm/emulate.c                   | 6 +++---
>>> xen/arch/x86/hvm/svm/svm.h                       | 9 +++++++++
>>> xen/common/inflate.c                             | 4 ++--
>>> 5 files changed, 22 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index d8170106b449..fbb806a75d73 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -132,12 +132,6 @@ safe."
>>> # Series 7.
>>> #
>>>
>>> --doc_begin="Usage of the following constants is safe, since they are given as-is
>>> -in the inflate algorithm specification and there is therefore no risk of them
>>> -being interpreted as decimal constants."
>>> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>> --doc_end
>>> -
>>> -doc_begin="Violations in files that maintainers have asked to not modify in the
>>> context of R7.2."
>>> -file_tag+={adopted_r7_2,"^xen/include/xen/libfdt/.*$"}
>>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>>> index 39c5c056c7d4..7ea47344ffcc 100644
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -20,6 +20,14 @@
>>>         },
>>>         {
>>>             "id": "SAF-2-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.R7.1"
>>> +            },
>>> +            "name": "Rule 7.1: constants defined in specifications, manuals, and algorithm descriptions",
>>> +            "text": "It is safe to use certain octal constants the way they are defined in specifications, manuals, and algorithm descriptions."
>>> +        },
>>> +        {
>>> +            "id": "SAF-3-safe",
>>>             "analyser": {},
>>>             "name": "Sentinel",
>>>             "text": "Next ID to be used"
>>> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
>>> index aa2c61c433b3..c5e3341c6316 100644
>>> --- a/xen/arch/x86/hvm/svm/emulate.c
>>> +++ b/xen/arch/x86/hvm/svm/emulate.c
>>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
>>>         if ( !instr_modrm )
>>>             return emul_len;
>>>
>>> -        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
>>> -             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>> -             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )
>>> +        if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
>>> +             (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
>>> +             (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* SAF-2-safe */
>>>             return emul_len;
>>>     }
> Hi Andrew,
>
>> This is line noise, and later examples are even worse.
>>
>> What does SAF mean?  It's presumably not the Scalable Agile Framework.
> Please have a look on docs/misra/documenting-violations.rst, you will find all the
> info about it.

Thankyou for proving my point perfectly.

The comment in the source code needs to be *far* clearer than it
currently is.

Even s/SAF/ANALYSIS/ would be an improvement, because it makes the
comment very clear that it's about code analysis.  An unknown initialism
like SAF does not convey enough meaning to be useful.

~Andrew

