Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE339806DC4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649120.1013500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApwE-0005lK-Vo; Wed, 06 Dec 2023 11:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649120.1013500; Wed, 06 Dec 2023 11:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApwE-0005jf-T6; Wed, 06 Dec 2023 11:19:34 +0000
Received: by outflank-mailman (input) for mailman id 649120;
 Wed, 06 Dec 2023 11:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHB2=HR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rApwE-0005jZ-Cr
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:19:34 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 541db6ff-9429-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 12:19:32 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c05ce04a8so47077135e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 03:19:32 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b0040b3e79bad3sm21573943wmq.40.2023.12.06.03.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:19:31 -0800 (PST)
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
X-Inumbo-ID: 541db6ff-9429-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701861571; x=1702466371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FEUV+PmKBOeyVDMK5RQ80NkiszK43YJzMpajTgF0JU=;
        b=IbybqLs/DAbsR2sUqjZw0luxLGPGOcEbIHs2vCShbUsbJM5FIsZdnwpyFuHZwA33Ym
         2OBCcBB2AWvJvtQbLTzU1lLBfo3UuOWvl7JV2OuftuTk8VBtVmFRifa+YbRMQc3Cn2Lv
         47e867uInFON/x01cglidN5nZPSiKnCT3t/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701861571; x=1702466371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FEUV+PmKBOeyVDMK5RQ80NkiszK43YJzMpajTgF0JU=;
        b=pVaivsCskzpcA/SDDzwBXrDSlAN+O/+8ICGfJr4BbaZcD4TUEG1bBbaKFyAzUKEGYS
         qTmh5PZTx6SvStXXgLMhlRtnwa6kn2ASxCYu2ZpPA0nEWL0I0OPDML8RiYrc4x66SpH3
         Q5LevAkUAtzAqjtWfi/bsjx/6rL07kEMMBUBaoC3EAdPYjuc7Lk1v2lhwIfL8Mnu7aqr
         jGc4Vt+GEw3QI/RhdmV3SCT+ZmAgpAnyRc21SmUl2N3GYsIw8R4Xub3GwaQb10et8Zg5
         od1mG+igQm/E3zhg0pN6M6sYLOANhg3f9v4qiwOdGU7QS7QPtsh610uw2DkzH/Omlt4n
         SYvA==
X-Gm-Message-State: AOJu0Yz9ETgC5CLyY67x517JneJSPiSegq/yv7FAbnHYvF3hpXsW0WpU
	3A7zAgDFaeoA0BBR1Y6wKKN4Ig==
X-Google-Smtp-Source: AGHT+IET00eT+qOGrLf1wmJr9VnNb5nAP2BUr4CUfncqfgizZ9e0u83c5EZbhYBvn2QsTFNAQkTwhA==
X-Received: by 2002:a05:600c:2210:b0:40b:5f03:b3fc with SMTP id z16-20020a05600c221000b0040b5f03b3fcmr274540wml.286.1701861571531;
        Wed, 06 Dec 2023 03:19:31 -0800 (PST)
Message-ID: <6f071eba-3995-451b-af80-efe875ec5ea8@citrix.com>
Date: Wed, 6 Dec 2023 11:19:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20231205181218.74667-1-julien@xen.org>
 <CA+zSX=aUV00BwnNfFTbCE=6PuVNT=UFvE0tnMO3UhwCMh5jmHQ@mail.gmail.com>
 <50b36423-d1e1-406f-a63f-66f2e4dce68e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <50b36423-d1e1-406f-a63f-66f2e4dce68e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2023 8:41 am, Jan Beulich wrote:
> On 06.12.2023 03:21, George Dunlap wrote:
>> On Tue, Dec 5, 2023 at 6:12 PM Julien Grall <julien@xen.org> wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Several maintainers have expressed a stronger preference
>>> to use '-' when in filename and option that contains multiple
>>> words.
>>>
>>> So document it in CODING_STYLE.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ---
>>>     Changes in v2:
>>>         - New wording
>>>         - Update the section title
>>>         - Add Jan's acked-by
>>> ---
>>>  CODING_STYLE | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/CODING_STYLE b/CODING_STYLE
>>> index ced3ade5a6fb..ed13ee2b664b 100644
>>> --- a/CODING_STYLE
>>> +++ b/CODING_STYLE
>>> @@ -144,6 +144,15 @@ separate lines and each line should begin with a leading '*'.
>>>   * Note beginning and end markers on separate lines and leading '*'.
>>>   */
>>>
>>> +Naming convention for files and command line options
>>> +----------------------------------------------------
>>> +
>>> +'-' should be used to separate words in commandline options and filenames.
>>> +E.g. timer-works.
>>> +
>>> +Note that some of the options and filenames are using '_'. This is now
>>> +deprecated.
>> Sorry for not catching this last time; "are using X" isn't really
>> idiomatic English; more idiomatic would be something like the
>> following:
>>
>> "Note that some existing options and file names use '_'.  This is now
>> deprecated."
>>
>> Since we're changing things, I *think* most style guides would advise
>> against starting the sentence with a punctuation; so perhaps:
>>
>> "Command-line options and file names should use '-' to separate words;
>> e.g., timer-works."
>>
>> And what about adding to the last paragraph:
>>
>> "When touching code around command-line parameters still using '_', it
>> is recommended to modify the documentation to say only '-', but modify
>> the code to accept both '-' and '_' (for backwards compatibility)."
> In this context see
> https://lists.xen.org/archives/html/xen-devel/2020-01/msg01945.html
> and Andrew's response
> https://lists.xen.org/archives/html/xen-devel/2020-01/msg02006.html
> I'm still in favor of addressing the issue centrally (making unnecessary
> adjustments like you suggest in the new paragraph). Yet I think Andrew's
> objection would cover such adjustments as much as my generic solution.

Aliasing - and _ in the cmdline parsing breaks basic usability.

Its fine for new options to use -, and it's even fine-ish (but only if
you're going to be the one doing security backports) to rename internal
files.

But there is real and detrimental effect for altering the command line.

You will get people failing to express the option they intended when
working with an older form of Xen.  You will need an absurd number of
notes in the command line docs saying "newer versions of Xen accept an
alias but you need to use the underscore form for backwards compatibility".

Not to mention that there are years of notes scattered all around the
internet using the underscore forms, so it's likely that everyone will
continue to use the underscore form, meaning that you don't even have a
way to phase them out.

And for what?  An attempt to pretend that we don't have 2 decades of
history where underscores where the norm?

It's tinkering, for no useful benefit and a clear cost.

~Andrew

