Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FDA4CBF1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 20:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900591.1308458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpBOW-0005BS-1A; Mon, 03 Mar 2025 19:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900591.1308458; Mon, 03 Mar 2025 19:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpBOV-0005A0-Tr; Mon, 03 Mar 2025 19:24:03 +0000
Received: by outflank-mailman (input) for mailman id 900591;
 Mon, 03 Mar 2025 19:24:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ljt=VW=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tpBOU-00059u-N1
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 19:24:02 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f9de88d-f865-11ef-9ab3-95dc52dad729;
 Mon, 03 Mar 2025 20:24:01 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-549662705ffso1724212e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 11:24:01 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495f82690fsm587150e87.42.2025.03.03.11.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 11:23:59 -0800 (PST)
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
X-Inumbo-ID: 0f9de88d-f865-11ef-9ab3-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741029840; x=1741634640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HJEdog4ob8xHrXpCAkgh5Ad9q9xvwuYiepcZpTKPz8=;
        b=a5ShoweCi11aRJJuM5KXAXYD3tBl0t3fk3O4C631I0ZauP8BtKNBEsZ7kgHdzNIk7E
         EmV8JprkWGefmwK1bOegkpuywQxLR5rekSFnWNupEeZaAYmHmJqZUTVVSEYl38825VBR
         Pga7WrjQ5Wkk8NSNytrG7wSFXZmlAakkYSEpvmnQGmahL25IJdp0Zlhn9ailQcBw9f/2
         ZizyxiXrUev3/PsTWnYwarzWMZgLLnMvtZU/Tx0MngoHYCgSm1xaOHScklGiA34Kj6Vt
         W1tz43XgGp7l1AaGpU/1VnpqnRLzFfs42K/5XmeR2S0z7eE929VGz0EYoztgoJfJD48f
         9Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029840; x=1741634640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HJEdog4ob8xHrXpCAkgh5Ad9q9xvwuYiepcZpTKPz8=;
        b=feYOS7iTkCWY6vvqPHEyYuhfv4uT0BOX3+5F9Keerh/3ckmG19SNpweNy9KBXxlKI5
         Vi+TD56EOeQiAg6b/UoMxwD9kjnt/neFFxcTihGBD7orQWGTxzH+6dlnGvkLVGL460XG
         agxBz7fZ5rCw98gHy+o+LNRBOZZuMPMyShrcQuFGbTqP+PGxklp5gqJ2/2RK8ecISMRK
         EDk7Be+9P5xhD3gc0vYhb1aFq7VilDAnggv3m9Uq+TgHndtGplH0QlT6lxSa7PnZEjQN
         n+5vnPNGeG41snhFbgCXI6SjPtup/JDO+lqQ9WeTOMzkZzxg/8mTaJOAFXTLC7EUxvuE
         DVdA==
X-Gm-Message-State: AOJu0Yxt4ozsakgtddaXWnyXQkqvGu+Y9bYv1vJOHqcSRM6S1KamZ0D4
	0fMzk6pid03zh7vm0M/NYb4bgpwg/FvNMsSvoNrzumVk1jGX7Tp9
X-Gm-Gg: ASbGncvi3gC/8e6FgNw49eJRaR3bCYVv15/wRuRGMHZ3w7xbLSEYjpsFZa4sKJKA05x
	op9XO0L1B7kDh59ZLSaPldyIBnNtHtB2nJVf27HYTCiF4/6Iy0OtVJbY3jRDnBjMVLTGcNlKOqN
	rl/yNc+tyD5UARVrCrHrBjpiVl5Rdal5z+krzOMIeEmbNqBucWl9gDjgkQgSUQ+LJeieqkvHsHw
	MGCeiG8EvH4t1YItnMGngqCNgRAND1IfvNXlcwkoaQ+2LtI8r6sGdbdL0xQgBnYRQdea0t6fVNN
	FoNbEwELlv7bb5sxcx9FkyMKdHB5lJfC7Dg8MaMyUajjGw==
X-Google-Smtp-Source: AGHT+IHATMuZIoKL4SBi8P6xkY6zMSUjY8hFc9TP+081TnuJck2aeszk61uGx+6BZmoTuJmVJmS5iA==
X-Received: by 2002:a05:6512:1292:b0:545:10bc:20ca with SMTP id 2adb3069b0e04-5494c32afcamr6390569e87.24.1741029839892;
        Mon, 03 Mar 2025 11:23:59 -0800 (PST)
Message-ID: <2e26f594-edfc-4687-8433-4d04a527388e@gmail.com>
Date: Mon, 3 Mar 2025 21:23:57 +0200
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
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <Z8XFRmK_kL6Lp9Xk@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Roger!

On 03.03.25 17:05, Roger Pau Monné wrote:
> On Sat, Mar 01, 2025 at 01:42:39PM +0200, Oleksandr Andrushchenko wrote:
>> Disable coding style checks for the project, but xen/ folder:
>> this is done by providing a global .clang-format at the top level which
>> disables clang-format and only providing .clang-format for xen/.
>>
>> clang-format version expected to be >15 and the latest tool can be
>> installed with:
>> python3 -m pip install clang-format
>>
>> Please note, that no automatic code style checks are performed and all
>> those can be run manually:
>>
>> - to see changes proposed to the patch being worked on (not committed yet):
>> git-clang-format --diff --style=file --verbose
>>
>> - to run code formatting on the HEAD patch:
>> git-clang-format --style=file --verbose HEAD~1
>>
>> Provided xen/.clang-format still has a lot of comments gathered from the
>> previous discussions. This is for purpose of better seeing why some of
>> the options have their values. Once option values are accepted all those
>> comments can be removed.
> I think the comments need to be trimmed to a concise explanation of
> why a setting is the way it is.  The (IMO overly long) excerpts from
> email conversations are difficult to follow in this context.  Someone
> has to spend the time to digest them and provide a shorter comment.
This is the goal. I do not expect the patch to be committed right
now, so I left those intentionally to provide some background
when those options were discussed before and, possibly, to
address some questions which were brought earlier.
The final patch will have all those in the way you mention here
>
> One thing that I'm missing: don't we need a list of excluded files
> somewhere because they are imports from Linux and we would like to
> keep the Linux coding style for avoiding conflicts when backporting
> fixes?
All files are excluded from formatting, but xen/ directory: this is
by providing a top level .clang-format file which disables all
formatting and also providing xen/.clang-format which is exactly
for xen/.
What is more, there is no automation yet, so this is up to a user
to decide whether they want to run git clang-format or not.
>
>> Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>   .clang-format     |    5 +
>>   xen/.clang-format | 1380 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 1385 insertions(+)
>>   create mode 100644 .clang-format
>>   create mode 100644 xen/.clang-format
>>
>> diff --git a/.clang-format b/.clang-format
>> new file mode 100644
>> index 000000000000..fc3f8e167f65
>> --- /dev/null
>> +++ b/.clang-format
>> @@ -0,0 +1,5 @@
>> +---
>> +DisableFormat: true
>> +SortIncludes: Never
>> +...
>> +
>> diff --git a/xen/.clang-format b/xen/.clang-format
>> new file mode 100644
>> index 000000000000..480628544cdd
>> --- /dev/null
>> +++ b/xen/.clang-format
>> @@ -0,0 +1,1380 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# clang-format configuration file. Intended for clang-format >= 15.
> What happens if used with clang-format < 15?  I expect the tool gives
> some kind of error about unknown options, rather than doing a wrong
> formatting?
Exactly, it will throw an error.
>
>> +#
>> +# For more information, see:
>> +#
>> +#   Documentation/process/clang-format.rst
>> +#   https://clang.llvm.org/docs/ClangFormat.html
>> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>> +#
>> +---
>> +
>> +################################################################################
>> +# How to review the changes
>> +################################################################################
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02126.html
>> +# ------------------------------------------------------------------------------
>> +# George Dunlap:
>> +# It's hard to agree on this one without seeing some of the examples of
>> +# what it does, some examples of the "weird behavior" Stefano &
>> +# Allejandro found, and some examples of places where it's going to
>> +# remove the alignment.
>> +#
>> +# I had tried to apply your series before and didn't get very far with
>> +# it for some reason ISTR.  One way to see the effect of individual
>> +# features would be:
>> +#
>> +# 1. Make a branch with one big patch applying clang-format for a given style
>> +#
>> +# 2. Change just one style line, re-run clang format, and create a new
>> +# patch from that
>> +#
>> +# Then it would be easy to see the difference between the two.  It might
>> +# actually be easier for individual reviewers to do that on their own
>> +# trees, rather than to ask you to try to generate and post such patches
>> +# somewhere.
>> +
>> +################################################################################
>> +# do/while loops
>> +################################################################################
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02276.html
>> +# ------------------------------------------------------------------------------
>> +# Jan:
>> +# > I've read the past threads about the brave people who dared to try to
>> +# > introduce clang-format for the xen codebase, some of them from 5 years ago,
>> +# > two points were clear: 1) goto label needs to be indented and 2) do-while
>> +# > loops have the braket in the same line.
>> +# > While point 1) was quite a blocker, it seemd to me that point 2) was less
>> +# > controversial to be changed in the Xen codestyle, so the current wrapper
>> +# > script handles only the point 1 (which is easy), the point 2 can be more
>> +# > tricky to handle.
>> +#
>> +# I'm afraid I view the do/while part pretty much as a blocker as well.
>> +# While placing the opening brace according to our style elsewhere would
>> +# be okay-ish (just a little wasteful to have two almost empty lines),
>> +# having the closing brace on a separate line is problematic: At least I
>> +# consider a block / scope to end at the line where the closing brace is.
>> +# So the farther do and while are apart, the more
>> +#
>> +#    do
>> +#    {
>> +#        ...;
>> +#    }
>> +#    while ( cond );
>> +#    ...;
>> +#
>> +# is going to be misleading. While normally we would write potentially
>> +# conflicting constructs this way
>> +#
>> +#     while ( cond )
>> +#         ;
>> +#
>> +# the alternative spelling still isn't outright wrong in our style (I
>> +# believe):
>> +#
>> +#     while ( cond );
>> +#
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02282.html
>> +# ------------------------------------------------------------------------------
>> +# Luca:
>> +# Thank you for your feedback, I could maybe misunderstood your reply, so please
>> +# tell me if I am wrong, the Xen coding style mandates this style for do-while
>> +# loops:
>> +#
>> +# do {
>> +# /* Do stuff. */
>> +# } while ( condition );
>> +#
>> +# Currently clang-format is able to do only this:
>> +#
>> +# do
>> +# {
>> +# /* Do stuff. */
>> +# } while ( condition );
>> +#
>> +# So the issue is only in the opening brackets, not the closing one. Is it a
>> +# blocker too?
>> +#
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02284.html
>> +# ------------------------------------------------------------------------------
>> +# Jan:
>> +# > do
>> +# > {
>> +# > /* Do stuff. */
>> +# > } while ( condition );
>> +#
>> +# Oh, I hadn't understood your description that way.
>> +#
>> +# > So the issue is only in the opening brackets, not the closing one. Is it a
>> +# > blocker too?
>> +#
>> +# No. I don't like the longer form, but I could live with it.
>> +
>> +################################################################################
>> +# clang version to use
>> +################################################################################
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02301.html
>> +# ------------------------------------------------------------------------------
>> +# Alejandro:
>> +# > The minimum clang-format version for the file is 15, my ubuntu 22.04 comes
>> +# > with it, we can reason if it's too high, or if we could also use the latest
>> +# > version maybe shipped inside a docker image.
>> +# 15 sounds ok \methinks. In practice we'll just stick it in GitLab and let
>> +# it check commits, so we'll be safe even in the case where every developer
>> +# has a slightly different version of the tool. I wouldn't try to make this
>> +# (hard) task harder by trying to retrofit it in an older version.
>> +#
>> +# It might be worth stitching a flag in the python script to scream if the
>> +#clang-format version doesn't match. Or it may do a mess of the tree.
>      ^ missing space
>
> Is it possible to add such flag and give a clear error when the wrong
> clang-format version is used?
This is actually a question if clang-format of a given version supports
options in .clang-format or not. If it doesn't it will throw an error
anyways.
>
>> +################################################################################
>> +# Options and their discussions
>> +################################################################################
>> +
>> +# [not specified]
>> +# Align function parameter that goes into a new line, under the open bracket
>> +# (supported in clang-format 3.8)
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
>> +# ------------------------------------------------------------------------------
>> +# Luca: This one is to align function parameters that overflows the line length,
>> +# I chose to align them to the open bracket to match the current codebase
>> +# (hopefully) e.g.:
>> +# someLongFunction(argument1,
>> +#                  argument2);
>> +#
>> +# This one can be a candidate for an entry in our coding style
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
>> +# ------------------------------------------------------------------------------
>> +# Jan:
>> +# > e.g.:
>> +# > someLongFunction(argument1,
>> +# >                  argument2);
>> +# The above matches neither of the two generally permitted styles:
>> +#
>> +#    someLongFunction(argument1,
>> +#                     argument2);
>> +#
>> +#    someLongFunction(
>> +#        argument1,
>> +#        argument2);
>> +#
>> +# Then again from its name I would infer this isn't just about function
>> +# arguments?
>> +#
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
>> +# ------------------------------------------------------------------------------
>> +# Luca:
>> +# I think it applies to parameters and arguments of functions and macro, given
>> +# the description in the docs.
>> +# I see your two snippets above but I’ve always found at least on arm a
>> +# predominance of the style above for functions, so arguments aligned after the
>> +# opening bracket, for macros there is a mix.
>> +# I might be wrong though and so another opinion from another maintainer would
>> +# help.
>> +# In any case we can choose among many value:
>> +# https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
>> +# but when we do so, we need to stick to one permitted style only, the tool don’t
>> +# allow to specify more than one.
>> +#
>> +# ------------------------------------------------------------------------------
>> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
>> +# ------------------------------------------------------------------------------
>> +# Jan:
>> +# > I see your two snippets above but I’ve always found at least on arm a
>> +# > predominance of the style above for functions, so arguments aligned after
>> +# > the opening bracket, for macros there is a mix.
>> +#
>> +# The latter "above" refers to which form exactly? The one you originally
>> +# spelled out, or the former of what my reply had?
>> +#
>> +# > In any case we can choose among many value:
>> +# > https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
>> +# > but when we do so, we need to stick to one permitted style only, the tool
>> +# > don’t allow to specify more than one.
>> +#
>> +# a2k: RED FLAG
> What does 'a2k' mean?
>
> I'm afraid this needs to be trimmed to a more manageable comment,
> otherwise I simply get lost in the context.  Maybe it makes sense more
> people involved in the discussion.
Sure, see my explanation above: this is just to give some more context
and have some ready answers for the questions being asked before.
I will remove all these right after we have some consensus.
>
> Thanks, Roger.
Thank you,
Oleksandr

