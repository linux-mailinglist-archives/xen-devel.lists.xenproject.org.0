Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6BA4AAB7
	for <lists+xen-devel@lfdr.de>; Sat,  1 Mar 2025 12:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899372.1307706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLF9-0000Bg-5A; Sat, 01 Mar 2025 11:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899372.1307706; Sat, 01 Mar 2025 11:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLF9-00008e-0T; Sat, 01 Mar 2025 11:42:55 +0000
Received: by outflank-mailman (input) for mailman id 899372;
 Sat, 01 Mar 2025 11:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn84=VU=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1toLF7-0008Nf-EH
 for xen-devel@lists.xenproject.org; Sat, 01 Mar 2025 11:42:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e3dff74-f692-11ef-9898-31a8f345e629;
 Sat, 01 Mar 2025 12:42:51 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5454f00fc8dso2776583e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Mar 2025 03:42:51 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494d7ac5aasm529435e87.120.2025.03.01.03.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 03:42:47 -0800 (PST)
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
X-Inumbo-ID: 4e3dff74-f692-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740829370; x=1741434170; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCxkccS7MSC0gdd3QuyN0yUbNtf2IsYb/tMqB6DPVK8=;
        b=a3VKwg+hgol/U5Vp8g06OqtSee3VViwecpkza2xoa6ZAPLqAmlpvAgcxOYcUPaFCKd
         eSK9a86ATU6EjlCQn3tRHa8FunSu1p9xjdgFK17axFHJlh7Uqjavrd5NeSvnzTILkFtQ
         4ukjS/le/8r75KKuGJxMhtb9nk7FR8tHJipcONVF/BAdPfVRWUd3t2FZ+NqkweC65boB
         O8onDep2RKb5z/FFzFuYb1uPM1GUADGZRVoj6fe1xHvF9iyyccYZiAWbHw1nPdOyVlMi
         fKcuZyCXI+SYp+4dCLxP13fkcz++XKuacUeL0hk6Uqk00NKBrSeiNq0DZqZHFpCdEklj
         1m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829370; x=1741434170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCxkccS7MSC0gdd3QuyN0yUbNtf2IsYb/tMqB6DPVK8=;
        b=cubCHlvzD2aMWEDv/GPU2NZYlc5sAskCU5V0yawnQEBcuFqqmwovwUElr2tf/aipQB
         9s9zfB1M1JUGcxg8bN5sE9Fk2Q0TPvw5X9VaUE6kYJ+mkCs9bF+VxM+ghlcfP0TVAKza
         VVNOU6eRuq9i6ZwdEJtg1HGj/01I9xxhLpfwi3TfWTXAG0PYuLi1buR4C6B0U+ZjDaWx
         fPWy4qXK01WMFxsvwswp10HGyjqyJBqEHifK69F8X5bCsVsO2MK8dPgBVeIz7U54SFra
         RAg4TyUeh8+DFBsQW/atF9ToC84w1qKsJL7aEqQA/302cX61nelx5ZK1UY4YQXFcMi0W
         hVkQ==
X-Gm-Message-State: AOJu0YwfKzwT5X9Hw4SBMRaqWN7xr8KYGXNTO806rZstPY0WU0uLKE6C
	eyHj6yVs/XwV1S5SafAoMBLFjgPjvw5tA6msc0jw/UGhe0IHEl/enBL6b9pB
X-Gm-Gg: ASbGncuOrMMv/435fDUzPVv3YqI9/icYrOdWCnP0PRxb9m4mmd8g6Nz//bwiCx2B74L
	kj4rYhVjROfiLlxffDeuzOM8hoQhnHVOLB3YMOp9ELENNkc1LOcALg1AWtkFtAb+Gg8NPQvLAsd
	5ZdkVFVsINtxpX+u/ugj53/rrQQvT8JNPi6obDKgK584Cx4bAz6LB4LEr1h711zVr+EHvSnqGEX
	7euXTFvOF1wcqsU73Dfe77YV/gn5at7nBIgdJZFDwYwOqvxk+s7JwRhRR/W72ZU71yfO48osGQZ
	Hpto4A7sc/2OcqTQoVgBvanxu5USpSWYTm7RvPDsaImXPx7OLbKLJw==
X-Google-Smtp-Source: AGHT+IFK1Zbw56Ik5i18LJaC3F8zSfrHuz+EhjoUC3Ah7x4rc0AtRqJL72/whDBO6gbjwkdEFwRbdw==
X-Received: by 2002:a05:6512:71:b0:549:39b1:65c2 with SMTP id 2adb3069b0e04-5494c38c14emr2633136e87.48.1740829369324;
        Sat, 01 Mar 2025 03:42:49 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH 1/4] Add .clang-format files to enable manual coding style checks
Date: Sat,  1 Mar 2025 13:42:39 +0200
Message-Id: <20250301114242.93650-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250301114242.93650-1-andr2000@gmail.com>
References: <20250301114242.93650-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Disable coding style checks for the project, but xen/ folder:
this is done by providing a global .clang-format at the top level which
disables clang-format and only providing .clang-format for xen/.

clang-format version expected to be >15 and the latest tool can be
installed with:
python3 -m pip install clang-format

Please note, that no automatic code style checks are performed and all
those can be run manually:

- to see changes proposed to the patch being worked on (not committed yet):
git-clang-format --diff --style=file --verbose

- to run code formatting on the HEAD patch:
git-clang-format --style=file --verbose HEAD~1

Provided xen/.clang-format still has a lot of comments gathered from the
previous discussions. This is for purpose of better seeing why some of
the options have their values. Once option values are accepted all those
comments can be removed.

Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .clang-format     |    5 +
 xen/.clang-format | 1380 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1385 insertions(+)
 create mode 100644 .clang-format
 create mode 100644 xen/.clang-format

diff --git a/.clang-format b/.clang-format
new file mode 100644
index 000000000000..fc3f8e167f65
--- /dev/null
+++ b/.clang-format
@@ -0,0 +1,5 @@
+---
+DisableFormat: true
+SortIncludes: Never
+...
+
diff --git a/xen/.clang-format b/xen/.clang-format
new file mode 100644
index 000000000000..480628544cdd
--- /dev/null
+++ b/xen/.clang-format
@@ -0,0 +1,1380 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# clang-format configuration file. Intended for clang-format >= 15.
+#
+# For more information, see:
+#
+#   Documentation/process/clang-format.rst
+#   https://clang.llvm.org/docs/ClangFormat.html
+#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
+#
+---
+
+################################################################################
+# How to review the changes
+################################################################################
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02126.html
+# ------------------------------------------------------------------------------
+# George Dunlap:
+# It's hard to agree on this one without seeing some of the examples of
+# what it does, some examples of the "weird behavior" Stefano &
+# Allejandro found, and some examples of places where it's going to
+# remove the alignment.
+#
+# I had tried to apply your series before and didn't get very far with
+# it for some reason ISTR.  One way to see the effect of individual
+# features would be:
+#
+# 1. Make a branch with one big patch applying clang-format for a given style
+#
+# 2. Change just one style line, re-run clang format, and create a new
+# patch from that
+#
+# Then it would be easy to see the difference between the two.  It might
+# actually be easier for individual reviewers to do that on their own
+# trees, rather than to ask you to try to generate and post such patches
+# somewhere.
+
+################################################################################
+# do/while loops
+################################################################################
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02276.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > I've read the past threads about the brave people who dared to try to
+# > introduce clang-format for the xen codebase, some of them from 5 years ago,
+# > two points were clear: 1) goto label needs to be indented and 2) do-while
+# > loops have the braket in the same line.
+# > While point 1) was quite a blocker, it seemd to me that point 2) was less
+# > controversial to be changed in the Xen codestyle, so the current wrapper
+# > script handles only the point 1 (which is easy), the point 2 can be more
+# > tricky to handle.
+#
+# I'm afraid I view the do/while part pretty much as a blocker as well.
+# While placing the opening brace according to our style elsewhere would
+# be okay-ish (just a little wasteful to have two almost empty lines),
+# having the closing brace on a separate line is problematic: At least I
+# consider a block / scope to end at the line where the closing brace is.
+# So the farther do and while are apart, the more
+#
+#    do
+#    {
+#        ...;
+#    }
+#    while ( cond );
+#    ...;
+#
+# is going to be misleading. While normally we would write potentially
+# conflicting constructs this way
+#
+#     while ( cond )
+#         ;
+#
+# the alternative spelling still isn't outright wrong in our style (I
+# believe):
+#
+#     while ( cond );
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02282.html
+# ------------------------------------------------------------------------------
+# Luca:
+# Thank you for your feedback, I could maybe misunderstood your reply, so please
+# tell me if I am wrong, the Xen coding style mandates this style for do-while
+# loops:
+#
+# do {
+# /* Do stuff. */
+# } while ( condition );
+#
+# Currently clang-format is able to do only this:
+#
+# do
+# {
+# /* Do stuff. */
+# } while ( condition );
+#
+# So the issue is only in the opening brackets, not the closing one. Is it a
+# blocker too?
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02284.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > do
+# > {
+# > /* Do stuff. */
+# > } while ( condition );
+#
+# Oh, I hadn't understood your description that way.
+#
+# > So the issue is only in the opening brackets, not the closing one. Is it a
+# > blocker too?
+#
+# No. I don't like the longer form, but I could live with it.
+
+################################################################################
+# clang version to use
+################################################################################
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02301.html
+# ------------------------------------------------------------------------------
+# Alejandro:
+# > The minimum clang-format version for the file is 15, my ubuntu 22.04 comes
+# > with it, we can reason if it's too high, or if we could also use the latest
+# > version maybe shipped inside a docker image.
+# 15 sounds ok \methinks. In practice we'll just stick it in GitLab and let
+# it check commits, so we'll be safe even in the case where every developer
+# has a slightly different version of the tool. I wouldn't try to make this
+# (hard) task harder by trying to retrofit it in an older version.
+#
+# It might be worth stitching a flag in the python script to scream if the
+#clang-format version doesn't match. Or it may do a mess of the tree.
+
+################################################################################
+# Options and their discussions
+################################################################################
+
+# [not specified]
+# Align function parameter that goes into a new line, under the open bracket
+# (supported in clang-format 3.8)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
+# ------------------------------------------------------------------------------
+# Luca: This one is to align function parameters that overflows the line length,
+# I chose to align them to the open bracket to match the current codebase
+# (hopefully) e.g.:
+# someLongFunction(argument1,
+#                  argument2);
+#
+# This one can be a candidate for an entry in our coding style
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > e.g.:
+# > someLongFunction(argument1,
+# >                  argument2);
+# The above matches neither of the two generally permitted styles:
+#
+#    someLongFunction(argument1,
+#                     argument2);
+#
+#    someLongFunction(
+#        argument1,
+#        argument2);
+#
+# Then again from its name I would infer this isn't just about function
+# arguments?
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
+# ------------------------------------------------------------------------------
+# Luca:
+# I think it applies to parameters and arguments of functions and macro, given
+# the description in the docs.
+# I see your two snippets above but I’ve always found at least on arm a
+# predominance of the style above for functions, so arguments aligned after the
+# opening bracket, for macros there is a mix.
+# I might be wrong though and so another opinion from another maintainer would
+# help.
+# In any case we can choose among many value:
+# https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
+# but when we do so, we need to stick to one permitted style only, the tool don’t
+# allow to specify more than one.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > I see your two snippets above but I’ve always found at least on arm a
+# > predominance of the style above for functions, so arguments aligned after
+# > the opening bracket, for macros there is a mix.
+#
+# The latter "above" refers to which form exactly? The one you originally
+# spelled out, or the former of what my reply had?
+#
+# > In any case we can choose among many value:
+# > https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket,
+# > but when we do so, we need to stick to one permitted style only, the tool
+# > don’t allow to specify more than one.
+#
+# a2k: RED FLAG
+# On top of my earlier reply yet another reason perhaps that this tool then
+# won't really fit our intended use.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02356.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > The latter "above" refers to which form exactly? The one you originally
+# > spelled out, or the former of what my reply had?
+#
+# In my reply I was referring to the one I originally spelled out.
+#
+# > On top of my earlier reply yet another reason perhaps that this tool then
+# > won't really fit our intended use.
+# ok
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02361.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > In my reply I was referring to the one I originally spelled out.
+#
+# But that's properly malformed, for not aligning argument2 with argument1.
+# Where are such constructs commonly used? I just took one example (cpuerrata.c)
+# and only found my first form of wrapping.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02366.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > But that's properly malformed, for not aligning argument2 with argument1.
+# > Where are such constructs commonly used? I just took one example (cpuerrata.c)
+# > and only found my first form of wrapping.
+#
+# I had to go back to the thread to realise there was some style issue, the
+# snippet I thought I sent already had argument2 aligned under argument1, like
+# this:
+#
+# e.g.:
+# someLongFunction(argument1,
+#                                argument2);
+#
+# Even my wording was not really accurate, as I meant:
+# “This one is to align function parameters that overflows the line length, I
+# chose to align them *after* the open bracket to match the current codebase
+# (hopefully)”
+# So to summarize, this value formats the code to have overflowing args/param
+# aligned after the open braket.
+#
+# But I understand that having only one format is not desirable.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02367.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > So to summarize, this value formats the code to have overflowing args/param
+# > aligned after the open braket.
+#
+# But the example above _again_ does not have the two arguments aligned.
+# I would have suspected a mail UI issue, but
+# https://lists.xen.org/archives/html/xen-devel/2023-11/msg02366.html
+# similarly shows way too many indenting blanks on the 2nd line.
+AlignAfterOpenBracket: Align
+
+# [not specified]
+# Align array of struct's elements by column and justify
+# struct test demo[] =
+# {
+#     {56, 23,    "hello"},
+#     {-1, 93463, "world"},
+#     {7,  5,     "!!"   }
+# };
+# (supported in clang-format 13)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
+# ------------------------------------------------------------------------------
+# Luca: "When using initialization for an array of structs aligns the fields into
+# columns."
+# It’s important to say that even if we specify "None", it is going to format the
+# data structure anyway, I choose left, but clearly I’m open to suggestions.
+# I don’t know how to phrase this one in our coding style
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
+# ------------------------------------------------------------------------------
+# Jan:
+# You don't say in which way it re-formats such constructs.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > You don't say in which way it re-formats such constructs.
+# Sure, taking as example an array of structure, xen/drivers/video/modelines.h,
+# With AlignArrayOfStructures: None we have this below.
+#
+# diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
+# index 9cb7cdde055f..3ff23ef1f8a7 100644
+# --- a/xen/drivers/video/modelines.h
+# +++ b/xen/drivers/video/modelines.h
+# @@ -42,36 +42,36 @@ struct modeline {
+#  };
+#
+#  struct modeline __initdata videomodes[] = {
+# -    { "640x480@60",   25175,  640,  16,   96,   48,   480,  11,   2,    31 },
+#
+# [snip]
+#
+# With AlignArrayOfStructures: Left we have (I noticed there might be a small
+# bug in clang-format since the first entry has no space after the opening curly
+# bracket):
+#
+# diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
+# index 9cb7cdde055f..1afe725dcb4c 100644
+# --- a/xen/drivers/video/modelines.h
+# +++ b/xen/drivers/video/modelines.h
+# @@ -42,36 +42,36 @@ struct modeline {
+#  };
+#
+#  struct modeline __initdata videomodes[] = {
+# -    { "640x480@60",   25175,  640,  16,   96,   48,   480,  11,   2,    31 },
+#
+# [snip]
+#
+# With AlignArrayOfStructures: Right we have:
+#
+# diff --git a/xen/drivers/video/modelines.h b/xen/drivers/video/modelines.h
+# index 9cb7cdde055f..539ab7c12d00 100644
+# --- a/xen/drivers/video/modelines.h
+# +++ b/xen/drivers/video/modelines.h
+# @@ -42,36 +42,36 @@ struct modeline {
+#  };
+#
+#  struct modeline __initdata videomodes[] = {
+# -    { "640x480@60",   25175,  640,  16,   96,   48,   480,  11,   2,    31 },
+#
+# [snip]
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
+# ------------------------------------------------------------------------------
+# Jan:
+# a2k: RED FLAG
+# None of which improve what we have at present, imo. Yet another reason not
+# to use this tool then, I would say.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02356.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > None of which improve what we have at present, imo. Yet another reason not
+# > to use this tool then, I would say.
+# Ok
+AlignArrayOfStructures: Left
+
+# [not specified]
+# Align consecutive assignments (supported in clang-format 3.8)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
+# ------------------------------------------------------------------------------
+# Luca: This one is disabled because of feedbacks from Stefano and Alejandro
+# about some weird behaviour on our codebase.
+# This one could be phased along this line: “Consecutive assignments don't need
+# to be aligned.”, the issue is that in this way it seems that it’s optional,
+# but clang-format is going to remove the alignment anyway for assignment that
+# are consecutive and aligned.
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02126.html
+# ------------------------------------------------------------------------------
+# George: It's hard to agree on this one without seeing some of the examples of
+# what it does, some examples of the "weird behavior" Stefano &
+# Allejandro found, and some examples of places where it's going to
+# remove the alignment.
+#
+# I had tried to apply your series before and didn't get very far with
+# it for some reason ISTR.  One way to see the effect of individual
+# features would be:
+#
+# 1. Make a branch with one big patch applying clang-format for a given style
+# 2. Change just one style line, re-run clang format, and create a new
+# patch from that
+#
+# Then it would be easy to see the difference between the two.  It might
+# actually be easier for individual reviewers to do that on their own
+# trees, rather than to ask you to try to generate and post such patches
+# somewhere.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02132.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > It's hard to agree on this one without seeing some of the examples of
+# > what it does, some examples of the "weird behavior" Stefano &
+# > Allejandro found,
+# I think there was a comment from Stefano for the RFC v1:
+# https://patchwork.kernel.org/project/xen-devel/cover/20230728081144.4124309-1-luca.fancellu@xxxxxxx/#25447625
+#
+# a2k:
+# RFC v1: https://patchew.org/Xen/20230728081144.4124309-1-luca.fancellu@arm.com/
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > This one is disabled because of feedbacks from Stefano and Alejandro about
+# > some weird behaviour on our codebase.
+# > This one could be phased along this line: “Consecutive assignments don't need
+# > to be aligned.”, the issue is that in this way it seems that it’s optional,
+# > but clang-format is going to remove the alignment anyway for assignment
+# > that are consecutive and aligned.
+#
+# Like below if there's no way to say "leave alone", then I don't consider this
+# usable. Imo we want to permit people to align when they think it helps, but
+# we don't want to demand them doing so.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > Like below if there's no way to say "leave alone", then I don't consider this
+# > usable. Imo we want to permit people to align when they think it helps, but
+# > we don't want to demand them doing so.
+#
+# Yes I understand, unfortunately the tool doesn’t allow that and if we don’t
+# specify this configurable, it will take the default one which is disabled
+# (and so would remove the formatting from already aligned assignments
+# that it would eventually find).
+#
+# This most of the configurable, when not specified, they apply their default
+# to the code anyway.
+#AlignConsecutiveAssignments: None
+# According to https://releases.llvm.org/15.0.0/tools/clang/docs/ClangFormatStyleOptions.html
+# Nested configuration flags: Alignment options.
+#
+# a2k: FIXME: If we use None above then the below options are not needed?
+AlignConsecutiveAssignments:
+  Enabled: false
+  AcrossEmptyLines: false
+  AcrossComments: false
+
+# [not specified]
+# Do not align consecutive bit fields (supported in clang-format 11)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
+# ------------------------------------------------------------------------------
+# Luca: Same thing as AlignConsecutiveAssignments, but for bitfields.
+AlignConsecutiveBitFields: None
+
+# [not specified]
+# Do not align values of consecutive declarations
+# (supported in clang-format 3.8)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
+# ------------------------------------------------------------------------------
+# Luca: This aligns declarations names, same considerations as
+# AlignConsecutiveAssignments.
+AlignConsecutiveDeclarations: None
+
+# [not specified]
+# Align values of consecutive macros (supported in clang-format 9)
+AlignConsecutiveMacros:
+  Enabled: true
+  AcrossEmptyLines: false
+  AcrossComments: false
+
+# [not specified]
+# Align escaped newlines to the right (supported in clang-format 5)
+AlignEscapedNewlines: Right
+
+# [not specified]
+# Aligns operands of a single expression that needs to be split over multiple
+# lines (supported in clang-format 3.5)
+AlignOperands: Align
+
+# Do not align trailing consecutive comments (It helps to make clang-format
+# reproduce the same output when it runs on an already formatted file)
+# (supported in clang-format 3.7)
+AlignTrailingComments: true
+
+# [not specified]
+# Do not put all function call arguments on a new line, try to have at least
+# the first one close to the opening parenthesis (supported in clang-format 9)
+AllowAllArgumentsOnNextLine: false
+
+# [not specified]
+# Do not put all function declaration parameters on a new line, try to have at
+# least the first one close to the opening parenthesis
+# (supported in clang-format 3.3)
+AllowAllParametersOfDeclarationOnNextLine: false
+
+# Bracing condition needs to be respected even if the line is so short that the
+# final block brace can stay on a single line
+# (supported in clang-format 3.5)
+# Luca: AllowShortBlocksOnASingleLine: Never
+# Oleksandr: this is good for empty inline functions, e.g.
+#
+# -static inline void arm_smmu_disable_ats(struct arm_smmu_master *master) { }
+# +static inline void arm_smmu_disable_ats(struct arm_smmu_master *master)
+# +{}
+AllowShortBlocksOnASingleLine: Empty
+
+# (supported in clang-format 3.6)
+AllowShortCaseLabelsOnASingleLine: false
+
+# (supported in clang-format 3.11)
+AllowShortEnumsOnASingleLine: false
+
+# (supported in clang-format 3.5)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg02355.html
+# ------------------------------------------------------------------------------
+# Luca:
+# >> static void __init efi_arch_cpu(void)
+# >> -{
+# >> -}
+# >> +{}
+# >>
+#
+# Also this one can be changed I think by tweaking
+# AllowShortFunctionsOnASingleLine, so that we can have just:
+#
+# static void __init efi_arch_cpu(void) {}
+AllowShortFunctionsOnASingleLine: Empty
+
+# (supported in clang-format 3.3)
+AllowShortIfStatementsOnASingleLine: Never
+
+# (supported in clang-format 3.7)
+AllowShortLoopsOnASingleLine: false
+
+# [not specified]
+# Do not add a break after the definition return type
+# (supported in clang-format 3.8)
+AlwaysBreakAfterReturnType: None
+
+# [not specified]
+# There is no need to use a break after an assigment to a multiline string
+# (supported in clang-format 3.4)
+AlwaysBreakBeforeMultilineStrings: false
+
+# (supported in clang-format 3.4)
+AlwaysBreakTemplateDeclarations: false
+
+# Specify Xen's macro attributes (supported in clang-format 12)
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00833.html
+# ------------------------------------------------------------------------------
+# Jan: Like above, the significance of having this list and needing to keep it
+# up-to-date is unclear to me. I guess the same also applies to a few
+# further settings down from here.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00867.html
+# ------------------------------------------------------------------------------
+# Luca: From what I understand, we should give to the formatter tool all the hint
+# possible to make it do a good
+# job, for example here we should maintain a list of our attributes so that
+# clang-format doesn’t think the function
+# below is called __init instead of device_tree_node_matches.
+
+# static bool __init device_tree_node_matches(const void *fdt, int node, const
+# char *match)
+# { ... }
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00888.html
+# ------------------------------------------------------------------------------
+# Jan: Well, perhaps they indeed need to do some level of syntax analysis, in
+# which case knowing which identifiers act as attributes is likely going
+# to help. Which is where the "needs keeping up-to-date" aspect comes into
+# play. The example above is simple enough that I wouldn't think a parser
+# needs to guess what this represents, but presumably there are cases
+# where ambiguities might arise. (I also wouldn't exclude that the more
+# involved syntax in C++ increases the desire to have apriori knowledge on
+# the purpose of certain identifiers. In the end, as per above, the tool
+# is being told to expect C++ code.)
+AttributeMacros:
+  - '__init'
+  - '__exit'
+  - '__initdata'
+  - '__initconst'
+  - '__initconstrel'
+  - '__initdata_cf_clobber'
+  - '__initconst_cf_clobber'
+  - '__hwdom_init'
+  - '__hwdom_initdata'
+  - '__maybe_unused'
+  - '__packed'
+  - '__stdcall'
+  - '__vfp_aligned'
+  - '__alt_call_maybe_initdata'
+  - '__cacheline_aligned'
+  - '__ro_after_init'
+  - 'always_inline'
+  - 'noinline'
+  - 'noreturn'
+  - '__weak'
+  - '__inline__'
+  - '__attribute_const__'
+  - '__transparent__'
+  - '__used'
+  - '__must_check'
+  - '__kprobes'
+
+# [not specified]
+# Try always to pack function call arguments on the same line before breaking
+# (supported in clang-format 3.7)
+BinPackArguments: true
+
+# [not specified]
+# Try always to pack function declaration parameters on the same line before
+# breaking (supported in clang-format 3.7)
+BinPackParameters: true
+
+# [not specified]
+# Do not add a spaces on bitfield 'unsigned bf:2;'
+# (supported in clang-format 12)
+BitFieldColonSpacing: None
+
+# Xen's coding style does not follow clang-format already available profiles for
+# breaking before braces, so set it to Custom and specify each case separately
+# (supported in clang-format 3.8)
+BraceWrapping:
+  # Braces ('{' and '}') are usually placed on a line of their own
+  AfterCaseLabel: true
+  AfterFunction: true
+  BeforeElse: true
+  AfterExternBlock: true
+  # except for the opening brace in definitions of enum, struct, and union
+  AfterEnum: false
+  AfterStruct: false
+  AfterUnion: false
+  # This is unlike the Linux coding style and unlike K&R.
+  #
+  # if ( condition )
+  # {
+  #     /* Do stuff. */
+  # }
+  # else
+  # {
+  #     /* Other stuff. */
+  # }
+  #
+  # while ( condition )
+  # {
+  #     /* Do stuff. */
+  # }
+  #
+  # [non-compliant]
+  # do-while is not compliant with CODING_STYLE because clang format doesn't
+  # support different styles for every control statement
+  # do
+  # {
+  #     /* Do stuff. */
+  # } while ( condition );
+  AfterControlStatement: Always
+  BeforeWhile: false
+  IndentBraces: false
+  # [not specified]
+  # Keep empty functions with braces style like this: 'void func() {}' instead
+  # of breaking the braces
+  SplitEmptyFunction: false
+  # Not related to C language, but specified for completeness
+  AfterClass: false
+  AfterNamespace: false
+  AfterObjCDeclaration: false
+  BeforeCatch: false
+  BeforeLambdaBody: false
+  SplitEmptyRecord: true
+  SplitEmptyNamespace: true
+
+# (supported in clang-format 3.18)
+BreakAdjacentStringLiterals: false
+
+# [not specified]
+# Break only after the operator in case of a long expression
+# (supported in clang-format 3.6)
+BreakBeforeBinaryOperators: None
+
+# Xen's coding style does not follow clang-format already available profiles for
+# breaking before braces, so set it to Custom and specify each case separately
+# (supported in clang-format 3.7)
+BreakBeforeBraces: Custom
+
+# [not specified]
+# Break before inline ASM colon if the line length is longer than column limit.
+# (This is a new feature upstreamed by EPAM during its work on clang-format for
+# Xen)
+# (supported in clang-format 16)
+BreakBeforeInlineASMColon: OnlyMultiline
+
+# [not specified]
+# Ternary operators '?, :' can be put after a line break
+# (supported in clang-format 3.7)
+BreakBeforeTernaryOperators: true
+
+# (supported in clang-format 5)
+BreakConstructorInitializers: BeforeComma
+
+# User visible strings (e.g., printk() messages) should not be split so they can
+# be searched for more easily. (supported in clang-format 3.9)
+BreakStringLiterals: false
+
+# Lines should be less than 80 characters in length
+# (supported in clang-format 3.7)
+ColumnLimit: 80
+
+# (supported in clang-format 3.7)
+CommentPragmas: '^ IWYU pragma:'
+
+# Code within blocks is indented by one extra indent level
+# (supported in clang-format 3.7)
+ContinuationIndentWidth: 4
+
+# Do not derive pointer alignment style from the file
+# (supported in clang-format 3.7)
+DerivePointerAlignment: false
+
+# Taken from:
+# git grep -h -i '^#define [^[:space:]]*for_each[^[:space:]]*(' xen/ \
+# | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1',i" \
+# | LC_ALL=C sort -u
+# A vector of macros that should be interpreted as foreach loops instead of as
+# function calls.
+# (supported in clang-format 3.7)
+ForEachMacros:
+  - 'FOR_EACH_IOREQ_SERVER'
+  - '__list_for_each_rcu'
+  - 'dt_for_each_child_node'
+  - 'dt_for_each_device_node'
+  - 'dt_for_each_property_node'
+  - 'ebitmap_for_each_positive_bit'
+  - 'expr_list_for_each_sym'
+  - 'fdt_for_each_property_offset'
+  - 'fdt_for_each_subnode'
+  - 'for_each_affinity_balance_step'
+  - 'for_each_amd_iommu'
+  - 'for_each_cfg_sme'
+  - 'for_each_cpu'
+  - 'for_each_domain'
+  - 'for_each_domain_in_cpupool'
+  - 'for_each_drhd_unit'
+  - 'for_each_kimage_entry'
+  - 'for_each_node_mask'
+  - 'for_each_online_cpu'
+  - 'for_each_online_node'
+  - 'for_each_pdev'
+  - 'for_each_possible_cpu'
+  - 'for_each_present_cpu'
+  - 'for_each_rmrr_device'
+  - 'for_each_sched_unit'
+  - 'for_each_sched_unit_vcpu'
+  - 'for_each_set_bit'
+  - 'for_each_vcpu'
+  - 'for_each_vp'
+  - 'hlist_for_each'
+  - 'hlist_for_each_entry'
+  - 'hlist_for_each_entry_continue'
+  - 'hlist_for_each_entry_from'
+  - 'hlist_for_each_entry_rcu'
+  - 'hlist_for_each_entry_safe'
+  - 'hlist_for_each_safe'
+  - 'list_for_each'
+  - 'list_for_each_backwards_safe'
+  - 'list_for_each_continue_rcu'
+  - 'list_for_each_entry'
+  - 'list_for_each_entry_continue'
+  - 'list_for_each_entry_from'
+  - 'list_for_each_entry_rcu'
+  - 'list_for_each_entry_reverse'
+  - 'list_for_each_entry_safe'
+  - 'list_for_each_entry_safe_continue'
+  - 'list_for_each_entry_safe_from'
+  - 'list_for_each_entry_safe_reverse'
+  - 'list_for_each_prev'
+  - 'list_for_each_rcu'
+  - 'list_for_each_safe'
+  - 'list_for_each_safe_rcu'
+  - 'page_list_for_each'
+  - 'page_list_for_each_safe'
+  - 'page_list_for_each_safe_reverse'
+
+# A vector of macros that should be interpreted as conditionals instead of as
+# function calls. (supported in clang-format 13)
+#IfMacros:
+#  - ''
+
+# Sort include files by block of includes and not as only one group
+# (supported in clang-format 6)
+IncludeBlocks: Preserve
+
+# [not specified]
+# Regular expressions denoting the different #include categories used for
+# ordering #includes. (supported in clang-format 3.8)
+#IncludeCategories:
+#  - Regex: '.*'
+#    Priority: 1
+
+# When guessing whether a #include is the “main” include (to assign category 0,
+# see above), use this regex of allowed suffixes to the header stem. A partial
+# match is done, so that: - “” means “arbitrary suffix” - “$” means “no suffix”
+# For example, if configured to “(_test)?$”, then a header a.h would be seen as
+# the “main” include in both a.cc and a_test.cc.
+# (Do we have a main include in Xen?)
+# (supported in clang-format 3.9)
+#IncludeIsMainRegex: '(Test)?$'
+
+# Non-case labels inside switch() bodies are preferred to be indented the same
+# as the block's case labels (supported in clang-format 11)
+IndentCaseBlocks: false
+
+# [not specified]
+# Do not indent case labels in the switch block (supported in clang-format 3.3)
+IndentCaseLabels: false
+
+# [not specified]
+# Do not indent extern "C" block
+# (supported in clang-format 11)
+IndentExternBlock: NoIndent
+
+# Due to the behavior of GNU diffutils "diff -p", labels should be indented by
+# at least one blank (supported in clang-format 10)
+IndentGotoLabels: true
+
+# [not specified]
+# Do not create indentation for the preprocessor directives
+# (supported in clang-format 6)
+IndentPPDirectives: AfterHash
+
+# An indent level consists of four spaces (supported in clang-format 3.7)
+IndentWidth: 4
+
+# [not specified]
+# In case a function definition or declaration needs to be wrapped after the
+# type, do not indent the new line (supported in clang-format 3.7)
+IndentWrappedFunctionNames: false
+
+# Braces should be omitted for blocks with a single statement. e.g.,
+# if ( condition )
+#     single_statement();
+# (supported in clang-format 15)
+InsertBraces: false
+
+# [not specified]
+# Every file needs to end with a new line
+# (supported in clang-format 16)
+# InsertNewlineAtEOF: true
+
+# [not specified]
+# Keep empty lines (up to MaxEmptyLinesToKeep) at end of file
+# (supported in clang-format 17)
+# KeepEmptyLinesAtEOF: true
+
+# [not specified]
+# Do not add a new empty line at the start of the block
+# (supported in clang-format 3.7)
+KeepEmptyLinesAtTheStartOfBlocks: false
+
+# The Xen Hypervisor is written in C language (supported in clang-format 3.5)
+Language: Cpp
+
+# [not specified]
+# Line ending style is '\n' (supported in clang-format 16)
+# LineEnding: LF
+
+# Specify Xen's macro that starts a block of code
+# (supported in clang-format 3.7)
+MacroBlockBegin: '^PLATFORM_START|^DT_DEVICE_START|^ACPI_DEVICE_START'
+
+# Specify Xen's macro that ends a block of code (supported in clang-format 3.7)
+MacroBlockEnd: '^PLATFORM_END|^DT_DEVICE_END|^ACPI_DEVICE_END'
+
+# [not specified]
+# Maximum consecutive empty lines allowed (supported in clang-format 3.7)
+MaxEmptyLinesToKeep: 1
+
+# Parameters to tweak to discourage clang-format to break something
+# (supported in clang-format 5)
+PenaltyBreakAssignment: 30
+# (supported in clang-format 3.7)
+PenaltyBreakBeforeFirstCallParameter: 30
+# (supported in clang-format 3.7)
+PenaltyBreakComment: 10
+# (supported in clang-format 3.7)
+PenaltyBreakFirstLessLess: 0
+# (supported in clang-format 14)
+PenaltyBreakOpenParenthesis: 100
+# (supported in clang-format 3.7)
+PenaltyBreakString: 10
+# (supported in clang-format 3.7)
+PenaltyExcessCharacter: 100
+# (supported in clang-format 12)
+PenaltyIndentedWhitespace: 0
+# (supported in clang-format 3.7)
+PenaltyReturnTypeOnItsOwnLine: 60
+
+# [not specified]
+# Pointer alignment style is on the right 'void *var'
+# (supported in clang-format 3.7)
+PointerAlignment: Right
+
+# [not specified]
+# The number of columns to use for indentation of preprocessor statements
+# When set to -1 (default) IndentWidth is used also for preprocessor statements.
+# (supported in clang-format 13)
+PPIndentWidth: -1
+
+# [not specified]
+# (supported in clang-format 14)
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
+# ------------------------------------------------------------------------------
+# Luca:
+# Our coding style doesn’t mention anything about alignment, shall we add a new
+# section? I can send patches when we reach agreement on each of these rules.
+#
+# QualifierAlignment: Custom
+# QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
+#
+# ---
+# For “QualifierAlignment” I chose Custom in order to apply in “QualifierOrder”
+# an order for the qualifiers that match the current codebase, we could specify
+# also “Leave” in order to keep them as they are.
+# Depending on how the discussion goes on this one, it could be an entry in our
+# coding style
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02143.html
+# ------------------------------------------------------------------------------
+# Jan: Where do attributes go in this sequence?
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > Where do attributes go in this sequence?
+#
+# I think function declaration/definition and variables.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02311.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > I think function declaration/definition and variables.
+#
+# How does this relate to my question? I asked about the sequence of elements
+# listed for QualifierOrder:, where attributes don't appear at all right now.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02356.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > How does this relate to my question? I asked about the sequence of elements
+# > listed for QualifierOrder:, where attributes don't appear at all right now.
+#
+# Sorry, I misread your question, attributes are like invisible for the tool,
+# they can be placed wherever between each of the QualifierOrder items.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02361.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > Sorry, I misread your question, attributes are like invisible for the tool,
+# > they can be placed wherever between each of the QualifierOrder items.
+#
+# Hoho, one thing where various options are tolerated.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02469.html
+# ------------------------------------------------------------------------------
+# Luca:
+# >> Hoho, one thing where various options are tolerated.
+#
+# I realise now that my answer above is not fully correct, I wanted to say that
+# the attributes are like invisible for the tool only when dealing with this
+# rule about ordering of the qualifiers.
+#
+# On the other hand, yes, if the QualifierAlignment is “Leave”, clang-format
+# won’t touch them.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02479.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > On the other hand, yes, if the QualifierAlignment is “Leave”, clang-format
+# > won’t touch them.
+#
+# Hmm - gets me back to wondering what "Alignment" in the name is about, when
+# order of syntactical elements is affected.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02481.html
+# ------------------------------------------------------------------------------
+# Luca:
+# Yes, probably QualifierAlignment is not the best name.
+QualifierAlignment: Custom
+
+# Specify in which order the qualifiers should appear 'static const int *var'
+# (supported in clang-format 14)
+QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
+
+# Don't try to reflow comments to respect the column limit (It helps to make
+# clang-format reproduce the same output when it runs on an already formatted
+# file)
+# (supported in clang-format 3.8)
+ReflowComments: true
+
+# [not specified]
+# Specifies the use of empty lines to separate definition blocks, including
+# structs, enums, and functions
+# (supported in clang-format 14)
+SeparateDefinitionBlocks: Always
+
+# [not specified]
+# Sort the include files by name (supported in clang-format 3.8)
+# TODO: enabling this will currently break the compilation, maybe fix?
+SortIncludes: Never
+
+# [not specified]
+# Do not format macro definition body
+# (supported in clang-format 3.18)
+SkipMacroDefinitionBody: true
+
+# [not specified]
+# Do not allow a space after a type cast '(type)var'
+# (supported in clang-format 3.5)
+SpaceAfterCStyleCast: false
+
+# [not specified]
+# Do not allow a space after the not operator '!var'
+# (supported in clang-format 9)
+SpaceAfterLogicalNot: false
+
+# Ensure that there is a space after pointer qualifiers, when used with
+# PointerAlignment of value Right it means 'void *const *x = NULL;'
+# (supported in clang-format 12)
+SpaceAroundPointerQualifiers: After
+
+# [not specified]
+# Always have a space after an assign operator or a compound operator, for
+# example '+=' (supported in clang-format 3.7)
+SpaceBeforeAssignmentOperators: true
+
+# [not specified]
+# Do not allow a space between the case argument and the final colon 'case 0:'
+# (supported in clang-format 12)
+SpaceBeforeCaseColon: false
+
+# [not specified]
+# Have a space before the parenthesis of a control statement, do an exception
+# for ForEach and If macros
+SpaceBeforeParens: ControlStatementsExceptForEachMacros
+
+# (supported in clang-format 7)
+SpaceBeforeRangeBasedForLoopColon: true
+
+# [not specified]
+# Do not add a spaces before square brackets 'int a[5];'
+# (supported in clang-format 10)
+SpaceBeforeSquareBrackets: false
+
+# [not specified]
+# Do not add a space inside empty parenthesis '()'
+# (supported in clang-format 3.7)
+SpaceInEmptyParentheses: false
+
+# (supported in clang-format 3.7)
+SpacesBeforeTrailingComments: 1
+
+# Space characters are used to spread out logical statements, such as in the
+# condition of an if or while 'if ( a )' 'while ( i < 5 )'
+# (supported in clang-format 10)
+SpacesInConditionalStatement: true
+
+# (supported in clang-format 3.7)
+SpacesInContainerLiterals: false
+
+# [not specified]
+# Do not add a spaces inside a type cast parenthesis '(int)var'
+# (supported in clang-format 3.7)
+SpacesInCStyleCastParentheses: false
+
+# [not specified]
+# Do not insert spaces in empty block '{}'
+# (supported in clang-format 3.5)
+SpaceInEmptyBlock: false
+
+# Only one space is allowed at the start of a line comment
+# (supported in clang-format 13)
+SpacesInLineCommentPrefix:
+  Minimum: 1
+  Maximum: -1
+
+# [not specified]
+# Do not add a spaces inside parenthesis '(var & var)'
+# (supported in clang-format 3.7)
+SpacesInParentheses: false
+
+# [not specified]
+# Do not add spaces inside square brakets 'int a[5];'
+# (supported in clang-format 3.7)
+SpacesInSquareBrackets: false
+
+# (supported in clang-format 3.7)
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00833.html
+# ------------------------------------------------------------------------------
+# Jan: Since I continue to be puzzled - iirc you said this is because of lack
+# of availability of "C99" as a value here. What's entirely unclear to
+# me is: How does this matter to a tool checking coding style (which is
+# largely about formatting, not any lexical or syntactical aspects)?
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00867.html
+# ------------------------------------------------------------------------------
+# Luca: Ok, maybe I understand your point, you are looking for a reason to declare this
+# configurable instead of not specifying it at all?
+# If it’s that, from what I understand clang-format will use the default value if
+# we don’t specify anything for this one, so it will take ‘Latest’. I think we
+# should put a value for this one to fix it and don’t have surprises if that
+# behaviour changes and seeing that also in Linux that value is fixed
+# increased myconfidence.
+# However, if you feel that we should not specify it, I’ve done a test and not
+# specifying it is not changing the current output. I can’t say that for a
+# different clang-format version though or if changes happen in the future.
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00887.html
+# ------------------------------------------------------------------------------
+# Alejandro: On C it _shouldn't_ matter because it's meant to affect C++ constructs
+# only. That said, clang-format doesn't understand (or care) whether the code
+# is C or C++, because C's syntax is strictly contained in that of C++ as far
+# as formatting cares.
+# While I agree it feels wrong to apply a C++ policy to a C project, it's
+# largely irrelevant. Setting a value here gives more deterministic output
+# because it fixes several options' default settings. One would hope none of
+# those settings affect C, but the world is complex and it's better to be
+# safe than sorry. Particularly when it's an inocuous one-liner.
+# There aren't strict C values. And Latest or Auto are simply shorthands for
+# one of the C++ options.
+#
+#  https://clang.llvm.org/docs/ClangFormatStyleOptions.html#standard
+#
+# IMO, C++03 is as good as any other. As long as it's a fixed one.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00888.html
+# ------------------------------------------------------------------------------
+# >>> This value is used also in Linux.
+# >>
+# >> Considering how different the two styles are, I don't think this is
+# >> overly relevant.
+# >
+# > Ok, maybe I understand your point, you are looking for a reason to declare
+# > this configurable instead of not specifying it at all?
+#
+# Jan: Not really, no. Here I was merely saying that with the styles being
+# sufficiently different, what Linux uses is probably not very significant
+# for our own decision.
+#
+# > However, if you feel that we should not specify it, I’ve done a test and not
+# > specifying it is not changing
+# > the current output. I can’t say that for a different clang-format version
+# > though or if changes happen in the
+# > future.
+# Jan: It's fine to set values. All I'm saying is that at least I would prefer
+# if it was also clear what exact effect the setting of a value has,
+# especially when that does not really match the language we use in the
+# project.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01035.html
+# ------------------------------------------------------------------------------
+# Luca: Yes I agree, I think Alejandro’s reply to this configurable reflects my
+# thoughts about it.
+# So if we all agree that we should set this parameter, do we all agree that it
+# should be the value above?
+# Do you have other concerns regarding this or the other parameters in this
+# thread?
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01051.html
+# ------------------------------------------------------------------------------
+# Alejandro:
+# > > It's fine to set values. All I'm saying is that at least I would prefer
+# > > if it was also clear what exact effect the setting of a value has,
+# > > especially when that does not really match the language we use in the
+# > > project.
+# On C, allegedly, none. It ought to control defaults for things like
+# SpaceBeforeCpp11BracedList, SpacesInAngles and other C++-specific things,
+# because the C++ language sticks syntactical extensions every other Tuesday.
+# Alas, whatever it does (there's no full list). I'd feel a lot more
+# comfortable knowing it won't change under our feet.
+# For reference, clang-format's docs state as an example:
+# ```
+# c++03:                                 latest:
+# vector<set<int> > x;           vs.     vector<set<int>> x;
+# ```
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01062.html
+# ------------------------------------------------------------------------------
+# Jan:
+# > Do you have other concerns regarding this or the other parameters in this
+# > thread?
+# I did raise what was occurring to me. This doesn't mean that down the
+# road yet something else might not pop up.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01063.html
+# ------------------------------------------------------------------------------
+# Luca:
+# > I did raise what was occurring to me. This doesn't mean that down the
+# > road yet something else might not pop up.
+# Sure, thanks for raising your concern, I’ve asked so that at the deadline if no
+# other concern are raised, we can move on with another set of configurable to
+# discuss.
+Standard: C++03
+
+# Macros which are ignored in front of a statement, as if they were an
+# attribute. So that they are not parsed as identifier
+# (supported in clang-format 12)
+# StatementAttributeLikeMacros: ['']
+
+# A vector of macros that should be interpreted as complete statements.
+# Typical macros are expressions, and require a semi-colon to be added;
+# sometimes this is not the case, and this allows to make clang-format aware of
+# such cases. (supported in clang-format 8)
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00833.html
+# ------------------------------------------------------------------------------
+# Jan: Ah, just wanted to ask. I agree that we'd better have here only items
+# which truly require an exception.
+#
+# ------------------------------------------------------------------------------
+# https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00867.html
+# ------------------------------------------------------------------------------
+# Luca: Yes my mistake, I’ll fix the list.
+StatementMacros:
+  - 'PROGRESS'
+  - 'PROGRESS_VCPU'
+  - 'bitop'
+  - 'guest_bitop'
+  - 'testop'
+  - 'guest_testop'
+
+# An indent level consists of four spaces (supported in clang-format 3.7)
+TabWidth: 4
+
+# A vector of macros that should be interpreted as type declarations instead of
+# as function calls (supported in clang-format 9)
+TypenameMacros:
+  - 'XEN_GUEST_HANDLE'
+  - 'XEN_GUEST_HANDLE_64'
+  - 'XEN_GUEST_HANDLE_PARAM'
+  - 'ELF_HANDLE_DECL'
+
+# Indentation is done using spaces, not tabs (supported in clang-format 3.7)
+UseTab: Never
+
+# A vector of macros which are whitespace-sensitive and should not be touched
+# (supported in clang-format 11)
+WhitespaceSensitiveMacros:
+  - '__stringify'
+
+## Not related to C language ###################################################
+
+# (supported in clang-format 3.3)
+AccessModifierOffset: -4
+
+# (supported in clang-format 9)
+AllowShortLambdasOnASingleLine: None
+
+# (supported in clang-format 16)
+# BreakAfterAttributes: Never
+
+# (supported in clang-format 3.8)
+BreakAfterJavaFieldAnnotations: false
+
+# (supported in clang-format 16)
+BreakArrays: true
+
+# (supported in clang-format 12)
+BreakBeforeConceptDeclarations: Never
+
+# (supported in clang-format 7)
+BreakInheritanceList: BeforeColon
+
+# (supported in clang-format 5)
+CompactNamespaces: false
+
+# (supported in clang-format 3.7)
+ConstructorInitializerAllOnOneLineOrOnePerLine: false
+
+# (supported in clang-format 3.7)
+ConstructorInitializerIndentWidth: 4
+
+# (supported in clang-format 3.4)
+Cpp11BracedListStyle: false
+
+# (supported in clang-format 13)
+EmptyLineAfterAccessModifier: Leave
+
+# (supported in clang-format 12)
+EmptyLineBeforeAccessModifier: Leave
+
+# (supported in clang-format 5)
+FixNamespaceComments: false
+
+# (supported in clang-format 13)
+IndentAccessModifiers: false
+
+# (supported in clang-format 15)
+IndentRequiresClause: false
+
+# (supported in clang-format 11)
+InsertTrailingCommas: None
+
+# (supported in clang-format 3.9)
+JavaScriptQuotes: Leave
+
+# (supported in clang-format 3.9)
+JavaScriptWrapImports: true
+
+# (supported in clang-format 3.7)
+NamespaceIndentation: None
+
+# (supported in clang-format 7)
+ObjCBinPackProtocolList: Auto
+
+# (supported in clang-format 3.7)
+ObjCBlockIndentWidth: 4
+
+# (supported in clang-format 11)
+ObjCBreakBeforeNestedBlockParam: false
+
+# (supported in clang-format 3.7)
+ObjCSpaceAfterProperty: true
+
+# (supported in clang-format 3.7)
+ObjCSpaceBeforeProtocolList: true
+
+# (supported in clang-format 14)
+PackConstructorInitializers: Never
+
+# (supported in clang-format 7)
+PenaltyBreakTemplateDeclaration: 0
+
+# (supported in clang-format 13)
+ReferenceAlignment: Right
+
+# (supported in clang-format 16)
+# RemoveSemicolon: false
+
+# (supported in clang-format 5)
+SortUsingDeclarations: false
+
+# (supported in clang-format 4)
+SpaceAfterTemplateKeyword: true
+
+# (supported in clang-format 7)
+SpaceBeforeCpp11BracedList: false
+
+# (supported in clang-format 7)
+SpaceBeforeCtorInitializerColon: false
+
+# (supported in clang-format 7)
+SpaceBeforeInheritanceColon: true
+
+# (supported in clang-format 3.4)
+SpacesInAngles: false
+
+RemoveBracesLLVM: true
+
+...
-- 
2.25.1


