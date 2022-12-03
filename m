Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0DC641282
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 01:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452330.710154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Gam-0007fR-SZ; Sat, 03 Dec 2022 00:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452330.710154; Sat, 03 Dec 2022 00:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Gam-0007dI-Pu; Sat, 03 Dec 2022 00:41:20 +0000
Received: by outflank-mailman (input) for mailman id 452330;
 Sat, 03 Dec 2022 00:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyC/=4B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p1Gal-0007dC-7X
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 00:41:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d002e9-72a3-11ed-91b6-6bf2151ebd3b;
 Sat, 03 Dec 2022 01:41:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C620DCE1E9A;
 Sat,  3 Dec 2022 00:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589C8C433D7;
 Sat,  3 Dec 2022 00:41:10 +0000 (UTC)
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
X-Inumbo-ID: 31d002e9-72a3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670028073;
	bh=ekxCqppWFoTlsLuJCnEBNXzChSlisIdkK4XbALbH8Kc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fffmVbfLCv3hUbD7BEu7qSq8IhI7xiar5fGSTi9uvyKWUy5XxjxrS61negyo7wvAW
	 vgcAJW1Xbk8jCjIWSyvOZIe31ZNsTLYgFc15R1PEUCx6MQFbmFfvevnsPu1sL9TFh+
	 bp6ETUcebjttwicZqAxDiDFegDj6QCWAxJ7u4W1aH8mT8BilMsJ3JqXsvYSXpbswy3
	 Ol+rmR3ZFzFGvYy6ZUOEpoGJzNi31YZn2jQJsOSU5DdiYRsFMiQdtCW1oIr5TW6d4/
	 TGtXBlVT0cwIOH9I68oWdpbJVzyfRCEW/dsS5MX7fDZb9eqmmR2H4hLx2H4ljoOEuV
	 +QmYrn2h8ySdg==
Date: Fri, 2 Dec 2022 16:41:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
In-Reply-To: <3C1C5FC8-8AFB-4E21-B47F-1BE4EDBD0670@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212021640210.4039@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop> <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com> <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
 <A3204E48-FF22-4275-961C-690F57A8AAEE@arm.com> <alpine.DEB.2.22.394.2212011210120.4039@ubuntu-linux-20-04-desktop> <3C1C5FC8-8AFB-4E21-B47F-1BE4EDBD0670@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1384827540-1670028072=:4039"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1384827540-1670028072=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 2 Dec 2022, Luca Fancellu wrote:
> > On 1 Dec 2022, at 20:23, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 1 Dec 2022, Luca Fancellu wrote:
> >> Hi Stefano,
> >> 
> >>>>> 
> >>>>> 
> >>>>>> +            sm_tool_args="n"
> >>>>>> +            ;;
> >>>>>> +        --cppcheck-cmd=*)
> >>>>>> +            CPPCHECK_TOOL="$(eval echo "${OPTION#*=}")"
> >>>>>> +            sm_tool_args="y"
> >>>>>> +            ;;
> >>>>>> +        --cppcheck-html)
> >>>>>> +            CPPCHECK_HTML="y"
> >>>>>> +            sm_tool_args="n"
> >>>>>> +            ;;
> >>>>>> +        --cppcheck-plat=*)
> >>>>>> +            CPPCHECK_PLAT_PATH="$(eval echo "${OPTION#*=}")"
> >>>>>> +            sm_tool_args="n"
> >>>>>> +            ;;
> >>>>>> +        --ignore-path=*)
> >>>>>> +            IGNORE_PATH_LIST="${IGNORE_PATH_LIST} $(eval echo "${OPTION#*=}")"
> >>>>>> +            sm_tool_args="n"
> >>>>>> +            ;;
> >>>>>> +        --)
> >>>>>> +            forward_to_cc="y"
> >>>>>> +            sm_tool_args="n"
> >>>>>> +            ;;
> >>>>>> +        *)
> >>>>>> +            if [ "${sm_tool_args}" = "y" ]; then
> >>>>>> +                CPPCHECK_TOOL_ARGS="${CPPCHECK_TOOL_ARGS} ${OPTION}"
> >>>>>> +            else
> >>>>>> +                echo "Invalid option ${OPTION}"
> >>>>>> +                exit 1
> >>>>> 
> >>>>> It doesn't look like sm_tool_args is really needed? It is only set to
> >>>>> 'y' in the case of --cppcheck-cmd, and in that case we also set
> >>>>> CPPCHECK_TOOL. CPPCHECK_TOOL is the variable used below. Am I missing
> >>>>> something?
> >>>> 
> >>>> We use sm_tool_args to fill CPPCHECK_TOOL_ARGS, basically it’s a state machine where
> >>>> when we find --cppcheck-cmd=<xxx> we expect that every other space separated arguments
> >>>> passed afterwards are the args for cppcheck, so we append to CPPCHECK_TOOL_ARGS
> >>>> until we find an argument that is supposed to be only for this script.
> >>> 
> >>> That seems a bit unnecessary: if the user wants to pass arguments to
> >>> cppcheck, the user would do --cppcheck-cmd="cppcheck arg1 arg2" with ""
> >>> quotes. Doing that should make --cppcheck-cmd="cppcheck arg1 arg2" be
> >>> seen as a single argument from this script point of view. CPPCHECK_TOOL
> >>> would end up being set to "cppcheck arg1 arg2" which is what we want
> >>> anyway? And if we need to distinguish between the cppcheck binary and
> >>> its argument we could use "cut" to extract "cppcheck", "arg1", and
> >>> "arg2" from CPPCHECK_TOOL.  Would that work?
> >>> 
> >> 
> >> I gave a try for the quotes, the problem is that we need to have quotes in CC=“...”, so adding
> >> quotes also to --cppcheck-cmd= which is inside CC=“...” is preventing the Makefile to work,
> >> I tried escaping etc but I didn’t manage to have it working, so would you agree on keeping it
> >> like that?
> > 
> > Is the problem coming from the following?
> > 
> >    cppcheck_cc_flags = """--compiler={} --cppcheck-cmd={} {}
> > --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
> > """.format(xen_cc, settings.cppcheck_binpath, cppcheck_flags,
> >           settings.tools_dir)
> > 
> >    if settings.cppcheck_html:
> >        cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"
> > 
> >    # Generate the extra make argument to pass the cppcheck-cc.sh wrapper as CC
> >    cppcheck_extra_make_args = "CC=\"{}/cppcheck-cc.sh {} --\"".format(
> >                                        settings.tools_dir,
> >                                        cppcheck_cc_flags
> >                                    ).replace("\n", "")
> > 
> > 
> > Wouldn't something like the following solve the issue?
> > 
> >    settings.cppcheck_binpath = settings.cppcheck_binpath + " " + cppcheck_cc_flags
> > 
> >    cppcheck_cc_flags = """--compiler={} --cppcheck-cmd=\"{}\"
> > --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
> > """.format(xen_cc, settings.cppcheck_binpath, settings.tools_dir)
> > 
> >    if settings.cppcheck_html:
> >        cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"
> > 
> >    # Generate the extra make argument to pass the cppcheck-cc.sh wrapper as CC
> >    cppcheck_extra_make_args = "CC=\"{}/cppcheck-cc.sh {} --\"".format(
> >                                        settings.tools_dir,
> >                                        cppcheck_cc_flags
> >                                    ).replace("\n", "")
> 
> No unfortunately not, Makefile is very sensitive to quotes, I’ve tried with many combination of single/double quotes but nothing worked

I spent a couple of hours to try to get it to work. I also admit defeat.
Keep your original code, that's better.
--8323329-1384827540-1670028072=:4039--

