Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435606449EB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455357.712806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2bOp-0007e5-0X; Tue, 06 Dec 2022 17:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455357.712806; Tue, 06 Dec 2022 17:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2bOo-0007bJ-TC; Tue, 06 Dec 2022 17:06:30 +0000
Received: by outflank-mailman (input) for mailman id 455357;
 Tue, 06 Dec 2022 17:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZAw=4E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p2bOm-0007bD-Ty
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:06:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 514d8df4-7588-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 18:06:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 717EE617A2;
 Tue,  6 Dec 2022 17:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AED0C433D6;
 Tue,  6 Dec 2022 17:06:23 +0000 (UTC)
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
X-Inumbo-ID: 514d8df4-7588-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670346384;
	bh=d+cpkOXLD8/5FKjPjQ0oXVqJEVTCfqYe6QpLlGntUmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g56hvde1vyxgSCACWBBnHaAfsGxywrmxMeX+M+b8qicg2dqonoz2c2IJmCS9q3gVH
	 sem0lN4NFw/8uQJMWWNYwoKyluu7iFwOYY4OyYIXgTYXxDKCjVHWdipmj403nRlr6L
	 xVXiHJ2uWrJeVMUgMwYM5doQU/2pZRiwK/quw4QeOfbMFHv3ruPTCBpyv1EOEIR63P
	 h+Vn6iqv7c0VCn98/m/P0DY8uu+Wom8C+I9LcEfFQrMkDtOFUQVV8H5B5Nw59WF2Fy
	 kjVTO3owc/QQGYpa/n85Rza3UIReFhzWqyj3dfq1D3cGV6Rkf7ZJU+sJ0IPVDXiAuU
	 wMgjl5cIaKo/A==
Date: Tue, 6 Dec 2022 09:06:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/5] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
In-Reply-To: <E67F8041-D3D1-4A8A-9A8F-319C522CB0D5@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212060858180.4039@ubuntu-linux-20-04-desktop>
References: <20221205154052.14191-1-luca.fancellu@arm.com> <20221205154052.14191-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2212051650300.4039@ubuntu-linux-20-04-desktop> <E67F8041-D3D1-4A8A-9A8F-319C522CB0D5@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1303052128-1670346384=:4039"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1303052128-1670346384=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 6 Dec 2022, Luca Fancellu wrote:
> Hi Stefano,
> >> 
> >> +++ b/docs/misra/false-positive-cppcheck.json
> >> @@ -0,0 +1,12 @@
> >> +{
> >> +    "version": "1.0",
> >> +    "content": [
> >> +        {
> >> +            "id": "SAF-0-false-positive-cppcheck",
> >> +            "violation-id": "",
> >> +            "tool-version": "",
> >> +            "name": "Sentinel",
> >> +            "text": "Next ID to be used"
> >> +        }
> >> +    ]
> >> +}
> > 
> > I think we need to add to the cppcheck document how to figure out the
> > cppcheck id for a given violation in the html report
> 
> I’m planning to send some patches with cppcheck false positive fixes, would them be enough?
> 
> We already have a section in documenting-violation.rst on how to document the finding, for
> cppcheck it’s just a matter to get the text report, do you think it’s better to add a part to that section
> on how to locate the cppcheck violation id from its text report?

Examples would certainly help a lot. Looking at the html results it
wasn't clear to me what the violation-id actually was. It took me a few
tries to understand that "shadowVariable" was the cppcheck violation-id.

Maybe just add: look under the column "Defect ID" amoung the html
results to find the violation-id, such as "variableScope".

 
> >> diff --git a/xen/scripts/xen_analysis/generic_analysis.py b/xen/scripts/xen_analysis/generic_analysis.py
> >> index 0b470c4ecf7d..94122aebace0 100644
> >> --- a/xen/scripts/xen_analysis/generic_analysis.py
> >> +++ b/xen/scripts/xen_analysis/generic_analysis.py
> >> @@ -1,7 +1,7 @@
> >> #!/usr/bin/env python3
> >> 
> >> -import os, subprocess
> >> -from . import settings, utils, tag_database
> >> +import os
> >> +from . import settings, utils, tag_database, cppcheck_analysis
> >> 
> >> class ParseTagPhaseError(Exception):
> >>     pass
> >> @@ -60,18 +60,13 @@ def parse_xen_tags():
> >> 
> >> 
> >> def build_xen():
> >> -    try:
> >> -        subprocess.run(
> >> -            "make -C {} {} build"
> >> -                .format(settings.xen_dir, settings.make_forward_args),
> >> -            shell=True, check=True
> >> +    utils.invoke_command(
> >> +            "make -C {} {} {} build"
> >> +                .format(settings.xen_dir, settings.make_forward_args,
> >> +                        cppcheck_analysis.cppcheck_extra_make_args),
> >> +            False, BuildPhaseError,
> >> +            "Build error occured when running:\n{}"
> >>         )
> >> -    except (subprocess.CalledProcessError, subprocess.SubprocessError)  as e:
> >> -        excp = BuildPhaseError(
> >> -                "Build error occured when running:\n{}".format(e.cmd)
> >> -            )
> >> -        excp.errorcode = e.returncode if hasattr(e, 'returncode') else 1
> >> -        raise excp
> > 
> > Any reason why we can't have utils.invoke_command directly in patch #1?
> 
> There was only one invocation, so I left that as it was, now if I change it I think I will lost your
> Tested-by and ack, do you want me to put also in the first patch?

Yes I think it is fine. I plan to test again your next version anyway


> >> def clean_analysis_artifacts():
> >> diff --git a/xen/scripts/xen_analysis/settings.py b/xen/scripts/xen_analysis/settings.py
> >> index 947dfa2d50af..bd1faafe79a3 100644
> >> --- a/xen/scripts/xen_analysis/settings.py
> >> +++ b/xen/scripts/xen_analysis/settings.py
> >> @@ -7,14 +7,23 @@ xen_dir = os.path.realpath(module_dir + "/../..")
> >> repo_dir = os.path.realpath(xen_dir + "/..")
> >> tools_dir = os.path.realpath(xen_dir + "/tools")
> >> 
> >> +step_get_make_vars = False
> >> step_parse_tags = True
> >> +step_cppcheck_deps = False
> >> step_build_xen = True
> >> +step_cppcheck_report = False
> >> step_clean_analysis = True
> >> +step_distclean_analysis = False
> >> 
> >> target_build = False
> >> target_clean = False
> >> +target_distclean = False
> >> 
> >> analysis_tool = ""
> >> +cppcheck_binpath = "cppcheck"
> >> +cppcheck_html = False
> >> +cppcheck_htmlreport_binpath = "cppcheck-htmlreport"
> >> +cppcheck_misra = False
> >> make_forward_args = ""
> >> outdir = xen_dir
> >> 
> >> @@ -26,29 +35,47 @@ Usage: {} [OPTION] ... [-- [make arguments]]
> >> This script runs the analysis on the Xen codebase.
> >> 
> >> Options:
> >> -  --build-only    Run only the commands to build Xen with the optional make
> >> -                  arguments passed to the script
> >> -  --clean-only    Run only the commands to clean the analysis artifacts
> >> -  -h, --help      Print this help
> >> -  --no-build      Skip the build Xen phase
> >> -  --no-clean      Don\'t clean the analysis artifacts on exit
> >> -  --run-coverity  Run the analysis for the Coverity tool
> >> -  --run-eclair    Run the analysis for the Eclair tool
> >> +  --build-only          Run only the commands to build Xen with the optional
> >> +                        make arguments passed to the script
> >> +  --clean-only          Run only the commands to clean the analysis artifacts
> >> +  --cppcheck-bin=       Path to the cppcheck binary (Default: {})
> >> +  --cppcheck-html       Produce an additional HTML output report for Cppcheck
> >> +  --cppcheck-html-bin=  Path to the cppcheck-html binary (Default: {})
> >> +  --cppcheck-misra      Activate the Cppcheck MISRA analysis
> >> +  --distclean           Clean analysis artifacts and reports
> >> +  -h, --help            Print this help
> >> +  --no-build            Skip the build Xen phase
> >> +  --no-clean            Don\'t clean the analysis artifacts on exit
> >> +  --run-coverity        Run the analysis for the Coverity tool
> >> +  --run-cppcheck        Run the Cppcheck analysis tool on Xen
> >> +  --run-eclair          Run the analysis for the Eclair tool
> >> """
> >> -    print(msg.format(sys.argv[0]))
> >> +    print(msg.format(sys.argv[0], cppcheck_binpath,
> >> +                     cppcheck_htmlreport_binpath))
> >> 
> >> 
> >> def parse_commandline(argv):
> >>     global analysis_tool
> >> +    global cppcheck_binpath
> >> +    global cppcheck_html
> >> +    global cppcheck_htmlreport_binpath
> >> +    global cppcheck_misra
> >>     global make_forward_args
> >>     global outdir
> >> +    global step_get_make_vars
> >>     global step_parse_tags
> >> +    global step_cppcheck_deps
> >>     global step_build_xen
> >> +    global step_cppcheck_report
> >>     global step_clean_analysis
> >> +    global step_distclean_analysis
> >>     global target_build
> >>     global target_clean
> >> +    global target_distclean
> >>     forward_to_make = False
> >>     for option in argv:
> >> +        args_with_content_regex = re.match(r'^(--[a-z]+[a-z-]*)=(.*)$', option)
> >> +
> >>         if forward_to_make:
> >>             # Intercept outdir
> >>             outdir_regex = re.match("^O=(.*)$", option)
> >> @@ -60,6 +87,18 @@ def parse_commandline(argv):
> >>             target_build = True
> >>         elif option == "--clean-only":
> >>             target_clean = True
> >> +        elif args_with_content_regex and \
> >> +             args_with_content_regex.group(1) == "--cppcheck-bin":
> >> +            cppcheck_binpath = args_with_content_regex.group(2)
> >> +        elif option == "--cppcheck-html":
> >> +            cppcheck_html = True
> >> +        elif args_with_content_regex and \
> >> +             args_with_content_regex.group(1) == "--cppcheck-html-bin":
> >> +            cppcheck_htmlreport_binpath = args_with_content_regex.group(2)
> >> +        elif option == "--cppcheck-misra":
> >> +            cppcheck_misra = True
> >> +        elif option == "--distclean":
> >> +            target_distclean = True
> >>         elif (option == "--help") or (option == "-h"):
> >>             help()
> >>             sys.exit(0)
> >> @@ -69,6 +108,11 @@ def parse_commandline(argv):
> >>             step_clean_analysis = False
> >>         elif (option == "--run-coverity") or (option == "--run-eclair"):
> >>             analysis_tool = option[6:]
> >> +        elif (option == "--run-cppcheck"):
> >> +            analysis_tool = "cppcheck"
> >> +            step_get_make_vars = True
> >> +            step_cppcheck_deps = True
> >> +            step_cppcheck_report = True
> >>         elif option == "--":
> >>             forward_to_make = True
> >>         else:
> >> @@ -76,13 +120,23 @@ def parse_commandline(argv):
> >>             help()
> >>             sys.exit(1)
> >> 
> >> -    if target_build and target_clean:
> >> -        print("--build-only is not compatible with --clean-only argument.")
> >> +    if target_build and (target_clean or target_distclean):
> >> +        print("--build-only is not compatible with --clean-only/--distclean "
> >> +              "argument.")
> >>         sys.exit(1)
> >> 
> >> +    if target_distclean:
> >> +        # Implicit activation of clean target
> >> +        target_clean = True
> >> +
> >> +        step_distclean_analysis = True
> >> +
> >>     if target_clean:
> >> +        step_get_make_vars = False
> >>         step_parse_tags = False
> >> +        step_cppcheck_deps = False
> >>         step_build_xen = False
> >> +        step_cppcheck_report = False
> >>         step_clean_analysis = True
> >>         return
> >> 
> >> @@ -95,3 +149,4 @@ def parse_commandline(argv):
> >>         step_parse_tags = False
> >>         step_build_xen = True
> >>         step_clean_analysis = False
> >> +        step_cppcheck_report = False
> > 
> > I think that target_build should not say anything about
> > step_cppcheck_report.
> > 
> > - if one wants to just do a regular build, they can do "make xen"
> > - if one is calling xen-analysis.py --cppcheck-html --run-cppcheck
> >  --build-only, it means that they want the build done, not the cleaning
> >  done, not the tags substitution. If they also add --cppcheck-html and
> >  --run-cppcheck, then it means that they also want the cppcheck report
> >  produced. --build-only still makes sense because they don't want the
> >  cleaning done and don't want the tag substitution.
> > 
> > Does it make sense to you as well?
> > 
> > 
> > If it does, I think we also need to add a note in the help message from
> > xen_analysis because it is not clear. So basically:
> > 
> > <nothing>: tags, build, clean [, cppcheck]
> > --no-clean: tags, build [, cppcheck]
> > --build-only: build [, cppcheck]
> > --no-build: tags
> > --clean-only: clean
> > 
> > Did I get it right?
> 
> Ok I can leave the report generation with the build-only, I will also explain better
> In the help

Thank you


> >> +
> >> +function create_jcd() {
> >> +    local line="${1}"
> >> +    local arg_num=0
> >> +    local same_line=0
> >> +
> >> +    {
> >> +        echo -e -n "[\n"
> > 
> > Everywhere in this bash function: there is no point in passing -n and
> > then adding \n at the end. You might as well do this:
> > 
> > echo -e "["
> > 
> > Also, you'll find that in most cases, you don't need -e either, which
> > simplifies it to:
> > 
> > echo "["
> > 
> > That's better right? :-)  Of course feel free to use -e when you have
> > escape and -n when you don't want \n in the output
> 
> Yeah I guess they come from copy paste, I can use the right arguments when needed
--8323329-1303052128-1670346384=:4039--

