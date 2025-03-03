Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D18A4C437
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 16:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900452.1308347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp7Md-0001k9-5q; Mon, 03 Mar 2025 15:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900452.1308347; Mon, 03 Mar 2025 15:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp7Md-0001h3-33; Mon, 03 Mar 2025 15:05:51 +0000
Received: by outflank-mailman (input) for mailman id 900452;
 Mon, 03 Mar 2025 15:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjBI=VW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tp7Mc-0001gx-6v
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 15:05:50 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb3c8c4d-f840-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 16:05:45 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abf4d756135so362391966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 07:05:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1e8a8c1f9sm43704466b.69.2025.03.03.07.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:05:43 -0800 (PST)
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
X-Inumbo-ID: fb3c8c4d-f840-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741014344; x=1741619144; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bTyjRjXa23YRmw8rBvnbHI5OgQQJDhI0b5KyaQ3Fbz8=;
        b=q5NNWyhwGgB0f29V/KUH8ZhYFWe3RSBrb/SI4FnWNmtgu2YCxevn+y58qhYCVsj1Gq
         Vvhz8G0U0IhXhv/RbNWd84KPqtLiilQCNayxEnW4cqcVbsmox/dBZmhiLFHGgSCOB3+H
         PLRynqhYqt0uQRokXDwudOkGcrbV2YxP8wGe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014344; x=1741619144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTyjRjXa23YRmw8rBvnbHI5OgQQJDhI0b5KyaQ3Fbz8=;
        b=S1F/Nm0NFFSY/sXLyjhjYAV10Qg4d/ymbrXM/bdd3WhUY04pDwH2rEq8dvnT/WWKZi
         n7XmZsiSZwyWK/qup74d7q5Mr5E44DWr4InasRiID3yGZXUJNhgORdREksrkWnz4Huha
         F57/nAZJx4ZbcHPW9wP9TRAqZjxBBuIpSH8vZgJ5ECRKFX+OHXM4Ibn3TWPqXRjlgq5B
         I4ZDgS+y4s57qHLv0inQ9SDWsBaSQfxehqc3LPlP0pOYwtcC40IgL+NrYR43vNvC+Wb9
         ZrzPvj9rnfsxzP/T1XtyMzyYFyyx5/A9yJ2kZRGUd4ucn8pJNV7g1lQQ6icQEriowW11
         nl/g==
X-Gm-Message-State: AOJu0Yx98rvLKkRybIc9ThE/0iAhefbZQWT5cy1C0Yq2ajF30e9lpv4m
	kmRfB1+TBpE2/As+1+h4AdbQPytLK6Q4FK445H8WAHOsGVu+AaIXN/XC/RPlitQ=
X-Gm-Gg: ASbGncvI/kibt35XQxewNP2RpFF9ffV6W5d3mHG3VwhKoFAateO3gWSWtl3RIla2xjK
	nFglqv7pAbotR5DlKXuVgYJkOaMvKcv7hnVXMJIA48HiVqVxnLzjSADQPqUuUa7KahX9xVzO+6O
	oEj5Tk7LtOODpjys5Dr/xMLdaTrQhoDvhx2OPh4i20ALCbFpSaeQLBTKIpACg9ExSSU83AXBzD2
	9rI4BtUk+Oegnjq6ChPZCd8F+y4FutavT7C2dFKWKp6wwoAZkHz+epDzgnsatrmQjJFx1AntHpA
	wyG4g9gltj9/okqahzDQVU7ItwGXbiHYBqNrvWHwRNeDrS8sag==
X-Google-Smtp-Source: AGHT+IElmCxR13LVHYG1kez1bFffysb6oUgFc9/9iz0zkcGIS95Ol+Dq84BL6mJ6Grci/EjNOojWUw==
X-Received: by 2002:a17:907:6e90:b0:abf:71bb:c24a with SMTP id a640c23a62f3a-abf71bbc70dmr553324166b.17.1741014344095;
        Mon, 03 Mar 2025 07:05:44 -0800 (PST)
Date: Mon, 3 Mar 2025 16:05:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	Artem_Mygaiev@epam.com, jbeulich@suse.com, Luca.Fancellu@arm.com,
	marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: Re: [PATCH 1/4] Add .clang-format files to enable manual coding
 style checks
Message-ID: <Z8XFRmK_kL6Lp9Xk@macbook.local>
References: <20250301114242.93650-1-andr2000@gmail.com>
 <20250301114242.93650-2-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250301114242.93650-2-andr2000@gmail.com>

On Sat, Mar 01, 2025 at 01:42:39PM +0200, Oleksandr Andrushchenko wrote:
> Disable coding style checks for the project, but xen/ folder:
> this is done by providing a global .clang-format at the top level which
> disables clang-format and only providing .clang-format for xen/.
> 
> clang-format version expected to be >15 and the latest tool can be
> installed with:
> python3 -m pip install clang-format
> 
> Please note, that no automatic code style checks are performed and all
> those can be run manually:
> 
> - to see changes proposed to the patch being worked on (not committed yet):
> git-clang-format --diff --style=file --verbose
> 
> - to run code formatting on the HEAD patch:
> git-clang-format --style=file --verbose HEAD~1
> 
> Provided xen/.clang-format still has a lot of comments gathered from the
> previous discussions. This is for purpose of better seeing why some of
> the options have their values. Once option values are accepted all those
> comments can be removed.

I think the comments need to be trimmed to a concise explanation of
why a setting is the way it is.  The (IMO overly long) excerpts from
email conversations are difficult to follow in this context.  Someone
has to spend the time to digest them and provide a shorter comment.

One thing that I'm missing: don't we need a list of excluded files
somewhere because they are imports from Linux and we would like to
keep the Linux coding style for avoiding conflicts when backporting
fixes?

> 
> Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  .clang-format     |    5 +
>  xen/.clang-format | 1380 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1385 insertions(+)
>  create mode 100644 .clang-format
>  create mode 100644 xen/.clang-format
> 
> diff --git a/.clang-format b/.clang-format
> new file mode 100644
> index 000000000000..fc3f8e167f65
> --- /dev/null
> +++ b/.clang-format
> @@ -0,0 +1,5 @@
> +---
> +DisableFormat: true
> +SortIncludes: Never
> +...
> +
> diff --git a/xen/.clang-format b/xen/.clang-format
> new file mode 100644
> index 000000000000..480628544cdd
> --- /dev/null
> +++ b/xen/.clang-format
> @@ -0,0 +1,1380 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# clang-format configuration file. Intended for clang-format >= 15.

What happens if used with clang-format < 15?  I expect the tool gives
some kind of error about unknown options, rather than doing a wrong
formatting?

> +#
> +# For more information, see:
> +#
> +#   Documentation/process/clang-format.rst
> +#   https://clang.llvm.org/docs/ClangFormat.html
> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> +#
> +---
> +
> +################################################################################
> +# How to review the changes
> +################################################################################
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02126.html
> +# ------------------------------------------------------------------------------
> +# George Dunlap:
> +# It's hard to agree on this one without seeing some of the examples of
> +# what it does, some examples of the "weird behavior" Stefano &
> +# Allejandro found, and some examples of places where it's going to
> +# remove the alignment.
> +#
> +# I had tried to apply your series before and didn't get very far with
> +# it for some reason ISTR.  One way to see the effect of individual
> +# features would be:
> +#
> +# 1. Make a branch with one big patch applying clang-format for a given style
> +#
> +# 2. Change just one style line, re-run clang format, and create a new
> +# patch from that
> +#
> +# Then it would be easy to see the difference between the two.  It might
> +# actually be easier for individual reviewers to do that on their own
> +# trees, rather than to ask you to try to generate and post such patches
> +# somewhere.
> +
> +################################################################################
> +# do/while loops
> +################################################################################
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02276.html
> +# ------------------------------------------------------------------------------
> +# Jan:
> +# > I've read the past threads about the brave people who dared to try to
> +# > introduce clang-format for the xen codebase, some of them from 5 years ago,
> +# > two points were clear: 1) goto label needs to be indented and 2) do-while
> +# > loops have the braket in the same line.
> +# > While point 1) was quite a blocker, it seemd to me that point 2) was less
> +# > controversial to be changed in the Xen codestyle, so the current wrapper
> +# > script handles only the point 1 (which is easy), the point 2 can be more
> +# > tricky to handle.
> +#
> +# I'm afraid I view the do/while part pretty much as a blocker as well.
> +# While placing the opening brace according to our style elsewhere would
> +# be okay-ish (just a little wasteful to have two almost empty lines),
> +# having the closing brace on a separate line is problematic: At least I
> +# consider a block / scope to end at the line where the closing brace is.
> +# So the farther do and while are apart, the more
> +#
> +#    do
> +#    {
> +#        ...;
> +#    }
> +#    while ( cond );
> +#    ...;
> +#
> +# is going to be misleading. While normally we would write potentially
> +# conflicting constructs this way
> +#
> +#     while ( cond )
> +#         ;
> +#
> +# the alternative spelling still isn't outright wrong in our style (I
> +# believe):
> +#
> +#     while ( cond );
> +#
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02282.html
> +# ------------------------------------------------------------------------------
> +# Luca:
> +# Thank you for your feedback, I could maybe misunderstood your reply, so please
> +# tell me if I am wrong, the Xen coding style mandates this style for do-while
> +# loops:
> +#
> +# do {
> +# /* Do stuff. */
> +# } while ( condition );
> +#
> +# Currently clang-format is able to do only this:
> +#
> +# do
> +# {
> +# /* Do stuff. */
> +# } while ( condition );
> +#
> +# So the issue is only in the opening brackets, not the closing one. Is it a
> +# blocker too?
> +#
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02284.html
> +# ------------------------------------------------------------------------------
> +# Jan:
> +# > do
> +# > {
> +# > /* Do stuff. */
> +# > } while ( condition );
> +#
> +# Oh, I hadn't understood your description that way.
> +#
> +# > So the issue is only in the opening brackets, not the closing one. Is it a
> +# > blocker too?
> +#
> +# No. I don't like the longer form, but I could live with it.
> +
> +################################################################################
> +# clang version to use
> +################################################################################
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02301.html
> +# ------------------------------------------------------------------------------
> +# Alejandro:
> +# > The minimum clang-format version for the file is 15, my ubuntu 22.04 comes
> +# > with it, we can reason if it's too high, or if we could also use the latest
> +# > version maybe shipped inside a docker image.
> +# 15 sounds ok \methinks. In practice we'll just stick it in GitLab and let
> +# it check commits, so we'll be safe even in the case where every developer
> +# has a slightly different version of the tool. I wouldn't try to make this
> +# (hard) task harder by trying to retrofit it in an older version.
> +#
> +# It might be worth stitching a flag in the python script to scream if the
> +#clang-format version doesn't match. Or it may do a mess of the tree.
    ^ missing space

Is it possible to add such flag and give a clear error when the wrong
clang-format version is used?

> +################################################################################
> +# Options and their discussions
> +################################################################################
> +
> +# [not specified]
> +# Align function parameter that goes into a new line, under the open bracket
> +# (supported in clang-format 3.8)
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
> +# ------------------------------------------------------------------------------
> +# Luca: This one is to align function parameters that overflows the line length,
> +# I chose to align them to the open bracket to match the current codebase
> +# (hopefully) e.g.:
> +# someLongFunction(argument1,
> +#                  argument2);
> +#
> +# This one can be a candidate for an entry in our coding style
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
> +# ------------------------------------------------------------------------------
> +# Jan:
> +# > e.g.:
> +# > someLongFunction(argument1,
> +# >                  argument2);
> +# The above matches neither of the two generally permitted styles:
> +#
> +#    someLongFunction(argument1,
> +#                     argument2);
> +#
> +#    someLongFunction(
> +#        argument1,
> +#        argument2);
> +#
> +# Then again from its name I would infer this isn't just about function
> +# arguments?
> +#
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
> +# ------------------------------------------------------------------------------
> +# Luca:
> +# I think it applies to parameters and arguments of functions and macro, given
> +# the description in the docs.
> +# I see your two snippets above but I’ve always found at least on arm a
> +# predominance of the style above for functions, so arguments aligned after the
> +# opening bracket, for macros there is a mix.
> +# I might be wrong though and so another opinion from another maintainer would
> +# help.
> +# In any case we can choose among many value:
> +# https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
> +# but when we do so, we need to stick to one permitted style only, the tool don’t
> +# allow to specify more than one.
> +#
> +# ------------------------------------------------------------------------------
> +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
> +# ------------------------------------------------------------------------------
> +# Jan:
> +# > I see your two snippets above but I’ve always found at least on arm a
> +# > predominance of the style above for functions, so arguments aligned after
> +# > the opening bracket, for macros there is a mix.
> +#
> +# The latter "above" refers to which form exactly? The one you originally
> +# spelled out, or the former of what my reply had?
> +#
> +# > In any case we can choose among many value:
> +# > https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
> +# > but when we do so, we need to stick to one permitted style only, the tool
> +# > don’t allow to specify more than one.
> +#
> +# a2k: RED FLAG

What does 'a2k' mean?

I'm afraid this needs to be trimmed to a more manageable comment,
otherwise I simply get lost in the context.  Maybe it makes sense more
people involved in the discussion.

Thanks, Roger.

