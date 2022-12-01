Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A263F911
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 21:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451160.708783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0q5z-0004j9-J6; Thu, 01 Dec 2022 20:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451160.708783; Thu, 01 Dec 2022 20:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0q5z-0004gh-GC; Thu, 01 Dec 2022 20:23:47 +0000
Received: by outflank-mailman (input) for mailman id 451160;
 Thu, 01 Dec 2022 20:23:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAsL=37=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0q5y-0004gL-2Z
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 20:23:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d63a9ad-71b6-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 21:23:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92CE0B82025;
 Thu,  1 Dec 2022 20:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BE5C433D6;
 Thu,  1 Dec 2022 20:23:40 +0000 (UTC)
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
X-Inumbo-ID: 0d63a9ad-71b6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669926222;
	bh=X0scWWcolDJ4nuR6Skd3nMGQgmNfzvu34hahuSjifRg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mIUuianey4xj0Ct5qS0RS6OaSdJpbqj3FpCPY1VVczJSXfm845ZbWIVGCLO2k6qp7
	 etmaWTJYWqEFOrU4u6qAep3y3I9YUHcvRrTr4WY9GCT5Ld87QLN4+jSf1x4f11lQSb
	 KcQZ/zIJalguvzgVQooeHUZ2GDYLtcWOiI6z3Gu4nGgH2tgAfDjue8Dlk0vmUZxV0w
	 kRMhhzZHvmBRjbrK5cEefhl+Fx9QSm8yBSuHGwitCiK2mpiAw2efXuMHv3mEbs6nTe
	 Ceg3X61tVHE/mvsnqKsE7ihkt4QMh5PdIuBbuQ/FHnC31eCV1fdNGXZtSJ5HtROpTO
	 7W2bqp6HZZQxw==
Date: Thu, 1 Dec 2022 12:23:39 -0800 (PST)
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
In-Reply-To: <A3204E48-FF22-4275-961C-690F57A8AAEE@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212011210120.4039@ubuntu-linux-20-04-desktop>
References: <20221128141006.8719-1-luca.fancellu@arm.com> <20221128141006.8719-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop> <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com> <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
 <A3204E48-FF22-4275-961C-690F57A8AAEE@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1579453118-1669926222=:4039"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1579453118-1669926222=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Dec 2022, Luca Fancellu wrote:
> Hi Stefano,
> 
> >>> 
> >>> 
> >>>> +            sm_tool_args="n"
> >>>> +            ;;
> >>>> +        --cppcheck-cmd=*)
> >>>> +            CPPCHECK_TOOL="$(eval echo "${OPTION#*=}")"
> >>>> +            sm_tool_args="y"
> >>>> +            ;;
> >>>> +        --cppcheck-html)
> >>>> +            CPPCHECK_HTML="y"
> >>>> +            sm_tool_args="n"
> >>>> +            ;;
> >>>> +        --cppcheck-plat=*)
> >>>> +            CPPCHECK_PLAT_PATH="$(eval echo "${OPTION#*=}")"
> >>>> +            sm_tool_args="n"
> >>>> +            ;;
> >>>> +        --ignore-path=*)
> >>>> +            IGNORE_PATH_LIST="${IGNORE_PATH_LIST} $(eval echo "${OPTION#*=}")"
> >>>> +            sm_tool_args="n"
> >>>> +            ;;
> >>>> +        --)
> >>>> +            forward_to_cc="y"
> >>>> +            sm_tool_args="n"
> >>>> +            ;;
> >>>> +        *)
> >>>> +            if [ "${sm_tool_args}" = "y" ]; then
> >>>> +                CPPCHECK_TOOL_ARGS="${CPPCHECK_TOOL_ARGS} ${OPTION}"
> >>>> +            else
> >>>> +                echo "Invalid option ${OPTION}"
> >>>> +                exit 1
> >>> 
> >>> It doesn't look like sm_tool_args is really needed? It is only set to
> >>> 'y' in the case of --cppcheck-cmd, and in that case we also set
> >>> CPPCHECK_TOOL. CPPCHECK_TOOL is the variable used below. Am I missing
> >>> something?
> >> 
> >> We use sm_tool_args to fill CPPCHECK_TOOL_ARGS, basically it’s a state machine where
> >> when we find --cppcheck-cmd=<xxx> we expect that every other space separated arguments
> >> passed afterwards are the args for cppcheck, so we append to CPPCHECK_TOOL_ARGS
> >> until we find an argument that is supposed to be only for this script.
> > 
> > That seems a bit unnecessary: if the user wants to pass arguments to
> > cppcheck, the user would do --cppcheck-cmd="cppcheck arg1 arg2" with ""
> > quotes. Doing that should make --cppcheck-cmd="cppcheck arg1 arg2" be
> > seen as a single argument from this script point of view. CPPCHECK_TOOL
> > would end up being set to "cppcheck arg1 arg2" which is what we want
> > anyway? And if we need to distinguish between the cppcheck binary and
> > its argument we could use "cut" to extract "cppcheck", "arg1", and
> > "arg2" from CPPCHECK_TOOL.  Would that work?
> > 
> 
> I gave a try for the quotes, the problem is that we need to have quotes in CC=“...”, so adding
> quotes also to --cppcheck-cmd= which is inside CC=“...” is preventing the Makefile to work,
> I tried escaping etc but I didn’t manage to have it working, so would you agree on keeping it
> like that?

Is the problem coming from the following?

    cppcheck_cc_flags = """--compiler={} --cppcheck-cmd={} {}
 --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
""".format(xen_cc, settings.cppcheck_binpath, cppcheck_flags,
           settings.tools_dir)

    if settings.cppcheck_html:
        cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"

    # Generate the extra make argument to pass the cppcheck-cc.sh wrapper as CC
    cppcheck_extra_make_args = "CC=\"{}/cppcheck-cc.sh {} --\"".format(
                                        settings.tools_dir,
                                        cppcheck_cc_flags
                                    ).replace("\n", "")


Wouldn't something like the following solve the issue?

    settings.cppcheck_binpath = settings.cppcheck_binpath + " " + cppcheck_cc_flags

    cppcheck_cc_flags = """--compiler={} --cppcheck-cmd=\"{}\"
 --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
""".format(xen_cc, settings.cppcheck_binpath, settings.tools_dir)

    if settings.cppcheck_html:
        cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"

    # Generate the extra make argument to pass the cppcheck-cc.sh wrapper as CC
    cppcheck_extra_make_args = "CC=\"{}/cppcheck-cc.sh {} --\"".format(
                                        settings.tools_dir,
                                        cppcheck_cc_flags
                                    ).replace("\n", "")
--8323329-1579453118-1669926222=:4039--

