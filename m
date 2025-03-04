Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E08A4EE09
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 21:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901503.1309470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpYVg-0002CX-8S; Tue, 04 Mar 2025 20:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901503.1309470; Tue, 04 Mar 2025 20:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpYVg-0002AN-5V; Tue, 04 Mar 2025 20:05:00 +0000
Received: by outflank-mailman (input) for mailman id 901503;
 Tue, 04 Mar 2025 20:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/uV=VX=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tpYVe-0002AH-0h
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 20:04:58 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0fbbb09-f933-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 21:04:55 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5496bc2e261so2489678e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 12:04:55 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494f0d92f6sm1431165e87.105.2025.03.04.12.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 12:04:53 -0800 (PST)
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
X-Inumbo-ID: f0fbbb09-f933-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741118695; x=1741723495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygh40xv4Vi3CreFxzFkGVO3MK/NUBiP1ocsbBliTXsc=;
        b=EdbB5Iz2OTNHTHAzImlhDx9w1ytLBB2rxxlwSdRoloxJIK6vjYGVVhGunlquyX950b
         jlHoLwHCwOINkjsSn/ta5vTye8bHVzjSWoc1VH+X5ceLPssDtEej0z7VIZI1zFLo2Cqt
         JWcx0u/JoIosrDYWveSL5r2XUmwPXFDm/reeXlL7BjGbmuqi+LLk3k2w7sFocqNNyUKu
         r/bwqXoCwX3EXxNHdvR3PuCHxpUyIaKIaFoMWb0rQsXqcvRtunzu11MvpfeCzsckpe/W
         E26Ujs7muhidZVGPcMw/agbi23XKczoUJiF/G9jkrAil0zMpt4Zm1Ezg7FGJpW40l1lX
         INjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741118695; x=1741723495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygh40xv4Vi3CreFxzFkGVO3MK/NUBiP1ocsbBliTXsc=;
        b=OkNlWyXG2UP5rIBamZqdlVI5oZZeyp/LXEgA/EUmcHBuCYlUUbPSkx3BC8rJfyMKb/
         pz16P2+Q8RAlhDLSEG1pgvPt/ZQEbSu4tS3IHP4vQsGojdkU5WWYFrF9iLwAfP5UK8cI
         qHrJySm0jrLxIGzHXPheHMRy/p3hdVgAXkgee7MEKQoBkTMtAq895lQ04xgUiJZnQu6k
         h0fghQgr1ZiWRLAMayoeXfuDWIeLkMboQLyIMdz9rCtZOVRTpsG/YaUDo3x0wZQpXBNC
         r41CRVz78UfcqLlzDFiQol4RGXzjXkAAFpqrz7WApoXkkwgYr+GaegUWu/sw1KGiGudB
         H9ag==
X-Gm-Message-State: AOJu0YwYA4DjET4n0v4H3ER96DNQuRKyOYIQAt0iscA9n0Qs71njM1jb
	xteGCavlri9a5vj3Jm67MRsljmfz6IGCviX96lkHEE8F5jmYMQd5
X-Gm-Gg: ASbGncuBzS+atHmFOBqbGEdVlSEuX0HAQ0WyTvGiWL3FQ46Ab9ZEGm0Kne2OsDIQO+t
	QzFsGrYv+MGJM8cOz2m50ZEAyOk0lrJci7cRp7G15rOQp49NOVlnHNFaYOgG0+kB28rIqsdxPlt
	/qzwsj7K0E4jDS07/43CrAwVM7MVpCg6wA+WQVUYFMR7cX6SwNJerIEsTnyUCUToRKREugr4v4g
	2j7es9n9zvDVUQiIVyox2XlJg9wpfZ7CJ4IfC6e+uB32wjKMwv5VS1H6mSWVLZPxVRAQw04pR1v
	oW1+mT4GC9dwL+OKII2MCgx/3M4nTbYVsxeNQ8kqgoncjg==
X-Google-Smtp-Source: AGHT+IH4p+EyXNtZBcFn5qZ2kRUT5u5G7xarBlFRDbvotDlq0RiQ5zzsA4mkL71EwZKloSe395O/NQ==
X-Received: by 2002:a05:6512:693:b0:545:d27:e367 with SMTP id 2adb3069b0e04-5497d37bb95mr129847e87.42.1741118694427;
        Tue, 04 Mar 2025 12:04:54 -0800 (PST)
Message-ID: <c17f5a23-d144-4f79-86b9-ee98960ed7ce@gmail.com>
Date: Tue, 4 Mar 2025 22:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Add .clang-format files to enable manual coding style
 checks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Artem_Mygaiev@epam.com, jbeulich@suse.com, Luca.Fancellu@arm.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech
References: <20250301114242.93650-1-andr2000@gmail.com>
 <20250301114242.93650-2-andr2000@gmail.com> <Z8XFRmK_kL6Lp9Xk@macbook.local>
 <2e26f594-edfc-4687-8433-4d04a527388e@gmail.com>
 <Z8a3JmNFKPI6h0s7@macbook.local>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <Z8a3JmNFKPI6h0s7@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Roger!

On 04.03.25 10:17, Roger Pau Monné wrote:
> On Mon, Mar 03, 2025 at 09:23:57PM +0200, Oleksandr Andrushchenko wrote:
>> Hello, Roger!
>>
>> On 03.03.25 17:05, Roger Pau Monné wrote:
>>> On Sat, Mar 01, 2025 at 01:42:39PM +0200, Oleksandr Andrushchenko wrote:
>>>> Disable coding style checks for the project, but xen/ folder:
>>>> this is done by providing a global .clang-format at the top level which
>>>> disables clang-format and only providing .clang-format for xen/.
>>>>
>>>> clang-format version expected to be >15 and the latest tool can be
>>>> installed with:
>>>> python3 -m pip install clang-format
>>>>
>>>> Please note, that no automatic code style checks are performed and all
>>>> those can be run manually:
>>>>
>>>> - to see changes proposed to the patch being worked on (not committed yet):
>>>> git-clang-format --diff --style=file --verbose
>>>>
>>>> - to run code formatting on the HEAD patch:
>>>> git-clang-format --style=file --verbose HEAD~1
>>>>
>>>> Provided xen/.clang-format still has a lot of comments gathered from the
>>>> previous discussions. This is for purpose of better seeing why some of
>>>> the options have their values. Once option values are accepted all those
>>>> comments can be removed.
>>> I think the comments need to be trimmed to a concise explanation of
>>> why a setting is the way it is.  The (IMO overly long) excerpts from
>>> email conversations are difficult to follow in this context.  Someone
>>> has to spend the time to digest them and provide a shorter comment.
>> This is the goal. I do not expect the patch to be committed right
>> now, so I left those intentionally to provide some background
>> when those options were discussed before and, possibly, to
>> address some questions which were brought earlier.
>> The final patch will have all those in the way you mention here
>>> One thing that I'm missing: don't we need a list of excluded files
>>> somewhere because they are imports from Linux and we would like to
>>> keep the Linux coding style for avoiding conflicts when backporting
>>> fixes?
>> All files are excluded from formatting, but xen/ directory: this is
>> by providing a top level .clang-format file which disables all
>> formatting and also providing xen/.clang-format which is exactly
>> for xen/.
> There are files with intentional Linux coding style inside of xen/,
> for example xen/arch/x86/cpu/mwait-idle.c.  We would need a way to
> filter those out so that clang-format doesn't attempt to apply the Xen
> coding style to them.
>
> Otherwise it needs to be noted possibly in .clang-format that while
> the clang-format style will apply by default to all files inside of
> xen/, some of those use a different coding style on purpose, and those
> should not be reformatted.
There is an analog of .gitignore which is .clang-format-ignore [1]
>
> We also have some scripts in python and shell inside of both tools/
> and scripts/, are those already excluded by clang-format by not having
> a .c or .h extension?
Currently it is only C/C++ files with the settings in the .clang-format provided
>
>>>> +################################################################################
>>>> +# Options and their discussions
>>>> +################################################################################
>>>> +
>>>> +# [not specified]
>>>> +# Align function parameter that goes into a new line, under the open bracket
>>>> +# (supported in clang-format 3.8)
>>>> +# ------------------------------------------------------------------------------
>>>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
>>>> +# ------------------------------------------------------------------------------
>>>> +# Luca: This one is to align function parameters that overflows the line length,
>>>> +# I chose to align them to the open bracket to match the current codebase
>>>> +# (hopefully) e.g.:
>>>> +# someLongFunction(argument1,
>>>> +#                  argument2);
>>>> +#
>>>> +# This one can be a candidate for an entry in our coding style
>>>> +# ------------------------------------------------------------------------------
>>>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
>>>> +# ------------------------------------------------------------------------------
>>>> +# Jan:
>>>> +# > e.g.:
>>>> +# > someLongFunction(argument1,
>>>> +# >                  argument2);
>>>> +# The above matches neither of the two generally permitted styles:
>>>> +#
>>>> +#    someLongFunction(argument1,
>>>> +#                     argument2);
>>>> +#
>>>> +#    someLongFunction(
>>>> +#        argument1,
>>>> +#        argument2);
>>>> +#
>>>> +# Then again from its name I would infer this isn't just about function
>>>> +# arguments?
>>>> +#
>>>> +# ------------------------------------------------------------------------------
>>>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
>>>> +# ------------------------------------------------------------------------------
>>>> +# Luca:
>>>> +# I think it applies to parameters and arguments of functions and macro, given
>>>> +# the description in the docs.
>>>> +# I see your two snippets above but I’ve always found at least on arm a
>>>> +# predominance of the style above for functions, so arguments aligned after the
>>>> +# opening bracket, for macros there is a mix.
>>>> +# I might be wrong though and so another opinion from another maintainer would
>>>> +# help.
>>>> +# In any case we can choose among many value:
>>>> +# https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
>>>> +# but when we do so, we need to stick to one permitted style only, the tool don’t
>>>> +# allow to specify more than one.
>>>> +#
>>>> +# ------------------------------------------------------------------------------
>>>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
>>>> +# ------------------------------------------------------------------------------
>>>> +# Jan:
>>>> +# > I see your two snippets above but I’ve always found at least on arm a
>>>> +# > predominance of the style above for functions, so arguments aligned after
>>>> +# > the opening bracket, for macros there is a mix.
>>>> +#
>>>> +# The latter "above" refers to which form exactly? The one you originally
>>>> +# spelled out, or the former of what my reply had?
>>>> +#
>>>> +# > In any case we can choose among many value:
>>>> +# > https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
>>>> +# > but when we do so, we need to stick to one permitted style only, the tool
>>>> +# > don’t allow to specify more than one.
>>>> +#
>>>> +# a2k: RED FLAG
>>> What does 'a2k' mean?
>>>
>>> I'm afraid this needs to be trimmed to a more manageable comment,
>>> otherwise I simply get lost in the context.  Maybe it makes sense more
>>> people involved in the discussion.
>> Sure, see my explanation above: this is just to give some more context
>> and have some ready answers for the questions being asked before.
>> I will remove all these right after we have some consensus.
> Sorry for possibly not fully understanding the purpose and being
> stubborn, but IMO consensus should be reached on the email discussion,
> so that here you can make a proposal, possibly with a comment
> justifying the chosen value.  Just copying excerpts from the email
> thread is not likely to help, as I at least find myself completely
> lost.
Agree, but the opposite happened before: same questions asked
again as we are out of context each time...
>
> Otherwise if there's no consensus just add a TODO next to the option
> explaining why the current setting might not be optimal or the (known)
> shortcomings of it, so that we know there's some pending work in this
> area.  But it needs to be a concrete list, not pieces from an email
> discussion.
It is not that easy as options act as a set, we cannot have one
option per rule unfortunately.
>
> Thanks, Roger.
Thank  you,
Oleksandr

[1] https://clang.llvm.org/docs/ClangFormat.html#clang-format-ignore

