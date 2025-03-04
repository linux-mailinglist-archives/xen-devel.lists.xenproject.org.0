Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614EDA4D60A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 09:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900844.1308810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpNTL-000606-FU; Tue, 04 Mar 2025 08:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900844.1308810; Tue, 04 Mar 2025 08:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpNTL-0005xn-CZ; Tue, 04 Mar 2025 08:17:51 +0000
Received: by outflank-mailman (input) for mailman id 900844;
 Tue, 04 Mar 2025 08:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFsD=VX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpNTJ-0005xh-VR
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 08:17:49 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25f6b739-f8d1-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 09:17:44 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so9570383a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 00:17:44 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf6aeaff51sm416884366b.142.2025.03.04.00.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 00:17:43 -0800 (PST)
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
X-Inumbo-ID: 25f6b739-f8d1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741076263; x=1741681063; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ux/jIAVztGit/84gK6nKHmn/f80sVYBPJTTboGQhCN4=;
        b=tDGCCEBjx0q/EsXNKbK+udP0QVzfQ02JFVVYA36OAi5Q1lV1Soh8bPaCeoTjHUrbZ5
         aQ+cZD7cYmvcxzInjHT3FoPhpSKoIlkKltSH2gzp8C5zTzadmMO3aJC8OoZLkrOY02wC
         BR93xKOMQ5mYx4PICyPdv9KxB5pc2CJBfVzfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741076263; x=1741681063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux/jIAVztGit/84gK6nKHmn/f80sVYBPJTTboGQhCN4=;
        b=u2kz4Gkpet1MhRmEqELy8rYBVlh5UZNxQnmVO0/8G0tLoLfcu5gNW/LG1dC2radgiz
         ODqgZ7be0QTrgNYhbTPCckcqSSNEn7w0LW8EWnWKlSFrdhQY1BMNCHDBJ6qevnblAlgb
         ngbAHVsw2wwjssM+O6uMwrblvvLriCaKmDx08G0chep2g1dQabVTm+slKvVuIf5C5oGF
         2tkMnXIbb5+KNZobdiZpjb5m967OIpUXoNFpdlOo+sWmzo9XVOc0xkjKRsIDDzDj3kb3
         CZx6HP5XZW+ulKqBKqGFB3kcBbd06hKNypfyT1Uoj48HJBSnT9O2AGqJgXv1qrPiLYvl
         9vMw==
X-Gm-Message-State: AOJu0YzHRpfoju2Y6wYv7WHRpYRywvO/Mttiot97CxTJqCErKVYZvTSM
	wijCGoEeOrFdTUUtr+8q4LjPdGoirs5XbqoCDLWl7jckCOowGL97K9MDCcEHShg=
X-Gm-Gg: ASbGnctI6SP0DnnmKC7WFluB3JuWCj3m72XWd/sAOS8Co0jsdUHeZUKkxe8V2aYwD2z
	VvOJW0oTXTK1LxcE9l3lymmgkAvtURsPABfEws2x7vNZBYkUuadxopXlAXShu20JX9PhjX5NLGQ
	qmIjE03uiqcJS0SLlfBt2r63mpqAEQ0nmITqBz/bThUuFjAL7DenWZvDV30Q0CuKm6sZPuayXnZ
	jh4lvPbKTr2VXXuDEeDb6Mc7c8B7l8wBhcmxKhPtnCuv5+2GVrKPWv+3Of6uw/TeLYOSu7RaWB2
	XlHpD/TTb3mWnItgFZzRTQQA+FKza4p1kVSnRocE47JxhK6zjLMy+tQ=
X-Google-Smtp-Source: AGHT+IG6fGLPP2yG0CPSXZba5+SDL+KLTAXXLLQ5vkUJBKplBVR6DpOXc3SiJWtiotTvReWxuhsb5A==
X-Received: by 2002:a17:906:4fcb:b0:abf:6a53:2ce0 with SMTP id a640c23a62f3a-abf6a53392emr982215766b.14.1741076263516;
        Tue, 04 Mar 2025 00:17:43 -0800 (PST)
Date: Tue, 4 Mar 2025 09:17:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	Artem_Mygaiev@epam.com, jbeulich@suse.com, Luca.Fancellu@arm.com,
	marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: Re: [PATCH 1/4] Add .clang-format files to enable manual coding
 style checks
Message-ID: <Z8a3JmNFKPI6h0s7@macbook.local>
References: <20250301114242.93650-1-andr2000@gmail.com>
 <20250301114242.93650-2-andr2000@gmail.com>
 <Z8XFRmK_kL6Lp9Xk@macbook.local>
 <2e26f594-edfc-4687-8433-4d04a527388e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e26f594-edfc-4687-8433-4d04a527388e@gmail.com>

On Mon, Mar 03, 2025 at 09:23:57PM +0200, Oleksandr Andrushchenko wrote:
> Hello, Roger!
> 
> On 03.03.25 17:05, Roger Pau Monné wrote:
> > On Sat, Mar 01, 2025 at 01:42:39PM +0200, Oleksandr Andrushchenko wrote:
> > > Disable coding style checks for the project, but xen/ folder:
> > > this is done by providing a global .clang-format at the top level which
> > > disables clang-format and only providing .clang-format for xen/.
> > > 
> > > clang-format version expected to be >15 and the latest tool can be
> > > installed with:
> > > python3 -m pip install clang-format
> > > 
> > > Please note, that no automatic code style checks are performed and all
> > > those can be run manually:
> > > 
> > > - to see changes proposed to the patch being worked on (not committed yet):
> > > git-clang-format --diff --style=file --verbose
> > > 
> > > - to run code formatting on the HEAD patch:
> > > git-clang-format --style=file --verbose HEAD~1
> > > 
> > > Provided xen/.clang-format still has a lot of comments gathered from the
> > > previous discussions. This is for purpose of better seeing why some of
> > > the options have their values. Once option values are accepted all those
> > > comments can be removed.
> > I think the comments need to be trimmed to a concise explanation of
> > why a setting is the way it is.  The (IMO overly long) excerpts from
> > email conversations are difficult to follow in this context.  Someone
> > has to spend the time to digest them and provide a shorter comment.
> This is the goal. I do not expect the patch to be committed right
> now, so I left those intentionally to provide some background
> when those options were discussed before and, possibly, to
> address some questions which were brought earlier.
> The final patch will have all those in the way you mention here
> > 
> > One thing that I'm missing: don't we need a list of excluded files
> > somewhere because they are imports from Linux and we would like to
> > keep the Linux coding style for avoiding conflicts when backporting
> > fixes?
> All files are excluded from formatting, but xen/ directory: this is
> by providing a top level .clang-format file which disables all
> formatting and also providing xen/.clang-format which is exactly
> for xen/.

There are files with intentional Linux coding style inside of xen/,
for example xen/arch/x86/cpu/mwait-idle.c.  We would need a way to
filter those out so that clang-format doesn't attempt to apply the Xen
coding style to them.

Otherwise it needs to be noted possibly in .clang-format that while
the clang-format style will apply by default to all files inside of
xen/, some of those use a different coding style on purpose, and those
should not be reformatted.

We also have some scripts in python and shell inside of both tools/
and scripts/, are those already excluded by clang-format by not having
a .c or .h extension?

> > > +################################################################################
> > > +# Options and their discussions
> > > +################################################################################
> > > +
> > > +# [not specified]
> > > +# Align function parameter that goes into a new line, under the open bracket
> > > +# (supported in clang-format 3.8)
> > > +# ------------------------------------------------------------------------------
> > > +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
> > > +# ------------------------------------------------------------------------------
> > > +# Luca: This one is to align function parameters that overflows the line length,
> > > +# I chose to align them to the open bracket to match the current codebase
> > > +# (hopefully) e.g.:
> > > +# someLongFunction(argument1,
> > > +#                  argument2);
> > > +#
> > > +# This one can be a candidate for an entry in our coding style
> > > +# ------------------------------------------------------------------------------
> > > +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
> > > +# ------------------------------------------------------------------------------
> > > +# Jan:
> > > +# > e.g.:
> > > +# > someLongFunction(argument1,
> > > +# >                  argument2);
> > > +# The above matches neither of the two generally permitted styles:
> > > +#
> > > +#    someLongFunction(argument1,
> > > +#                     argument2);
> > > +#
> > > +#    someLongFunction(
> > > +#        argument1,
> > > +#        argument2);
> > > +#
> > > +# Then again from its name I would infer this isn't just about function
> > > +# arguments?
> > > +#
> > > +# ------------------------------------------------------------------------------
> > > +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
> > > +# ------------------------------------------------------------------------------
> > > +# Luca:
> > > +# I think it applies to parameters and arguments of functions and macro, given
> > > +# the description in the docs.
> > > +# I see your two snippets above but I’ve always found at least on arm a
> > > +# predominance of the style above for functions, so arguments aligned after the
> > > +# opening bracket, for macros there is a mix.
> > > +# I might be wrong though and so another opinion from another maintainer would
> > > +# help.
> > > +# In any case we can choose among many value:
> > > +# https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
> > > +# but when we do so, we need to stick to one permitted style only, the tool don’t
> > > +# allow to specify more than one.
> > > +#
> > > +# ------------------------------------------------------------------------------
> > > +# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
> > > +# ------------------------------------------------------------------------------
> > > +# Jan:
> > > +# > I see your two snippets above but I’ve always found at least on arm a
> > > +# > predominance of the style above for functions, so arguments aligned after
> > > +# > the opening bracket, for macros there is a mix.
> > > +#
> > > +# The latter "above" refers to which form exactly? The one you originally
> > > +# spelled out, or the former of what my reply had?
> > > +#
> > > +# > In any case we can choose among many value:
> > > +# > https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
> > > +# > but when we do so, we need to stick to one permitted style only, the tool
> > > +# > don’t allow to specify more than one.
> > > +#
> > > +# a2k: RED FLAG
> > What does 'a2k' mean?
> > 
> > I'm afraid this needs to be trimmed to a more manageable comment,
> > otherwise I simply get lost in the context.  Maybe it makes sense more
> > people involved in the discussion.
> Sure, see my explanation above: this is just to give some more context
> and have some ready answers for the questions being asked before.
> I will remove all these right after we have some consensus.

Sorry for possibly not fully understanding the purpose and being
stubborn, but IMO consensus should be reached on the email discussion,
so that here you can make a proposal, possibly with a comment
justifying the chosen value.  Just copying excerpts from the email
thread is not likely to help, as I at least find myself completely
lost.

Otherwise if there's no consensus just add a TODO next to the option
explaining why the current setting might not be optimal or the (known)
shortcomings of it, so that we know there's some pending work in this
area.  But it needs to be a concrete list, not pieces from an email
discussion.

Thanks, Roger.

