Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9C3B22E4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 00:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146309.269182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwAyP-0002hl-JT; Wed, 23 Jun 2021 22:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146309.269182; Wed, 23 Jun 2021 22:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwAyP-0002eu-Es; Wed, 23 Jun 2021 22:03:53 +0000
Received: by outflank-mailman (input) for mailman id 146309;
 Wed, 23 Jun 2021 22:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqu9=LR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lwAyN-0002dX-Kr
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 22:03:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75c40fa5-ee0c-470a-afc8-348740e8aaef;
 Wed, 23 Jun 2021 22:03:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E490B613B0;
 Wed, 23 Jun 2021 22:03:49 +0000 (UTC)
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
X-Inumbo-ID: 75c40fa5-ee0c-470a-afc8-348740e8aaef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624485830;
	bh=w2sbGSFId0NaFC8mtIXbtUBfZVXUfEfQrH+1XXHbucg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eBQALQ45wV05wUPyRYOpUY8DL3cvZmCHYOq5cqiz1QJVmle/NtymOjiU89dM3mqmQ
	 xdYTb6Hjt9aAHL+diJth/2urr9/DRNeL5laoj8JIQJu60KmrCSGfxoWd+qGbm3fL2K
	 gyvUN3HKg5uq/C5kOGX64l2NH5DnDQpfIELn4Zqj92pDOuBqYscGZtwji3LQ1i6BMu
	 4uA70JwDX+hXNiUWo10I9To/rj9Ob37n0KAvly1jYIf/0CLuvNaP+S0iuAvCx6DSWC
	 56Fv/HEhHMf50H0HtDEAkczbrdQDWD73j6bBcn+LveLuHz01tgXBSP5Uq3ufFHKIjn
	 uhfRaiFNyQcVA==
Date: Wed, 23 Jun 2021 15:03:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 6/9] docs: add doxygen preprocessor and related
 files
In-Reply-To: <20210510084105.17108-7-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2106231456290.24906@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-7-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 May 2021, Luca Fancellu wrote:
> Add preprocessor called by doxygen before parsing headers,
> it will include in every header a doxygen_include.h file
> that provides missing defines and includes that are
> usually passed by the compiler.
> 
> Add doxy_input.list that is a text file containing the
> relative path to the source code file to be parsed by
> doxygen. The path sould be relative to the xen folder:
> E.g. xen/include/public/grant_table.h
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/xen-doxygen/doxy-preprocessor.py | 110 ++++++++++++++++++++++++++
>  docs/xen-doxygen/doxy_input.list      |   0
>  docs/xen-doxygen/doxygen_include.h.in |  32 ++++++++
>  3 files changed, 142 insertions(+)
>  create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
>  create mode 100644 docs/xen-doxygen/doxy_input.list
>  create mode 100644 docs/xen-doxygen/doxygen_include.h.in
> 
> diff --git a/docs/xen-doxygen/doxy-preprocessor.py b/docs/xen-doxygen/doxy-preprocessor.py
> new file mode 100755
> index 0000000000..496899d8e6
> --- /dev/null
> +++ b/docs/xen-doxygen/doxy-preprocessor.py
> @@ -0,0 +1,110 @@
> +#!/usr/bin/python3
> +#
> +# Copyright (c) 2021, Arm Limited.
> +#
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +
> +import os, sys, re
> +
> +
> +# Variables that holds the preprocessed header text
> +output_text = ""
> +header_file_name = ""
> +
> +# Variables to enumerate the anonymous structs/unions
> +anonymous_struct_count = 0
> +anonymous_union_count = 0
> +
> +
> +def error(text):
> +    sys.stderr.write("{}\n".format(text))
> +    sys.exit(1)
> +
> +
> +def write_to_output(text):
> +    sys.stdout.write(text)
> +
> +
> +def insert_doxygen_header(text):
> +    # Here the strategy is to insert the #include <doxygen_include.h> in the
> +    # first line of the header
> +    abspath = os.path.dirname(os.path.abspath(__file__))
> +    text += "#include \"{}/doxygen_include.h\"\n".format(abspath)
> +
> +    return text
> +
> +
> +def enumerate_anonymous(match):
> +    global anonymous_struct_count
> +    global anonymous_union_count
> +
> +    if "struct" in match.group(1):
> +        label = "anonymous_struct_%d" % anonymous_struct_count
> +        anonymous_struct_count += 1
> +    else:
> +        label = "anonymous_union_%d" % anonymous_union_count
> +        anonymous_union_count += 1
> +
> +    return match.group(1) + " " + label + " {"
> +
> +
> +def manage_anonymous_structs_unions(text):
> +    # Match anonymous unions/structs with this pattern:
> +    # struct/union {
> +    #     [...]
> +    #
> +    # and substitute it in this way:
> +    #
> +    # struct anonymous_struct_# {
> +    #     [...]
> +    # or
> +    # union anonymous_union_# {
> +    #     [...]
> +    # where # is a counter starting from zero, different between structs and
> +    # unions
> +    #
> +    # We don't count anonymous union/struct that are part of a typedef because
> +    # they don't create any issue for doxygen
> +    text = re.sub(
> +        "(?<!typedef\s)(struct|union)\s+?\{",
> +        enumerate_anonymous,
> +        text,
> +        flags=re.S
> +    )

My python is a bit rusty but I thought this is really clever!

One question: given that anonymous_struct_count is local per file being
processed, it always starts at 0 for each header. I think that is
actually better from a documentation readability point of view.

However, is it possible that Doxygen gets confused in a case where we
can multiple "struct anonymous_struct_0", e.g. one for grant_table.h,
one for event_channel.h, etc. ?

