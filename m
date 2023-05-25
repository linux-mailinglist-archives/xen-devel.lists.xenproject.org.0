Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51E710245
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 03:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539279.839999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1zdG-0002lC-Fn; Thu, 25 May 2023 01:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539279.839999; Thu, 25 May 2023 01:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1zdG-0002iT-CT; Thu, 25 May 2023 01:19:10 +0000
Received: by outflank-mailman (input) for mailman id 539279;
 Thu, 25 May 2023 01:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1zdE-0002iJ-GK
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 01:19:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23eb60c4-fa9a-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 03:19:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4B9960CA4;
 Thu, 25 May 2023 01:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A28FC433D2;
 Thu, 25 May 2023 01:19:01 +0000 (UTC)
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
X-Inumbo-ID: 23eb60c4-fa9a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684977544;
	bh=poYWUzsvU1FJcSFwaQ/BgZYa728xSmNE2fmYEjAePHk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TwlAAFK3FRSs8E0wCJeO0zyKTDsGA8GOg4PpHpTsM808uQbcmw8FtRWtBRjQzKGQP
	 D5e8TCcNG7EaNG6qC0A8ec1yqixXQNYo5/9MsjpWnzyrSiNdzpsGqc+itgguiGWpFM
	 BA6GIc9K2gz6y3eYyKah+1kBNMoptaLiexw2w728ZCiAOVqjnamTRlIRSEK/AvBZAH
	 IxXvyul2NG5mxvJmPyu7nmwHcpzORicQf3FufaUIsZ9ZkAvL8spJnBanBm+9IfBePZ
	 y3Tamh0evIfK6KuxMBo+Pxvsa3u6Y5FkRsA6E8UAsE0ZDQe4Ka/OQVrEDyc4hi0y5e
	 BXHyxop6nry/g==
Date: Wed, 24 May 2023 18:18:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
In-Reply-To: <CA6576E0-E49F-4E36-9363-CEB23B508DCE@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305241818410.44000@ubuntu-linux-20-04-desktop>
References: <20230519094613.2134153-1-luca.fancellu@arm.com> <20230519094613.2134153-3-luca.fancellu@arm.com> <CA6576E0-E49F-4E36-9363-CEB23B508DCE@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2005679444-1684977543=:44000"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2005679444-1684977543=:44000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 19 May 2023, Luca Fancellu wrote:
> > On 19 May 2023, at 10:46, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> > 
> > Add a feature to the diff-report.py script that improves the comparison
> > between two analysis report, one from a baseline codebase and the other
> > from the changes applied to the baseline.
> > 
> > The comparison between reports of different codebase is an issue because
> > entries in the baseline could have been moved in position due to addition
> > or deletion of unrelated lines or can disappear because of deletion of
> > the interested line, making the comparison between two revisions of the
> > code harder.
> > 
> > Having a baseline report, a report of the codebase with the changes
> > called "new report" and a git diff format file that describes the
> > changes happened to the code from the baseline, this feature can
> > understand which entries from the baseline report are deleted or shifted
> > in position due to changes to unrelated lines and can modify them as
> > they will appear in the "new report".
> > 
> > Having the "patched baseline" and the "new report", now it's simple
> > to make the diff between them and print only the entry that are new.
> > 
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
> > Changes from v1:
> > - Made the script compatible with python2 (Stefano)
> > ---
> > xen/scripts/diff-report.py                    |  55 ++++-
> > xen/scripts/xen_analysis/diff_tool/debug.py   |  21 ++
> > xen/scripts/xen_analysis/diff_tool/report.py  |  87 +++++++
> > .../diff_tool/unified_format_parser.py        | 232 ++++++++++++++++++
> > 4 files changed, 393 insertions(+), 2 deletions(-)
> > create mode 100644 xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
> > 
> > diff --git a/xen/scripts/diff-report.py b/xen/scripts/diff-report.py
> > index f97cb2355cc3..d608e3a05aa1 100755
> > --- a/xen/scripts/diff-report.py
> > +++ b/xen/scripts/diff-report.py
> > @@ -7,6 +7,10 @@ from argparse import ArgumentParser
> > from xen_analysis.diff_tool.cppcheck_report import CppcheckReport
> > from xen_analysis.diff_tool.debug import Debug
> > from xen_analysis.diff_tool.report import ReportError
> > +from xen_analysis.diff_tool.unified_format_parser import \
> > +    (UnifiedFormatParser, UnifiedFormatParseError)
> > +from xen_analysis.settings import repo_dir
> > +from xen_analysis.utils import invoke_command
> > 
> > 
> > def log_info(text, end='\n'):
> > @@ -36,9 +40,32 @@ def main(argv):
> >                              "against the baseline.")
> >     parser.add_argument("-v", "--verbose", action='store_true',
> >                         help="Print more informations during the run.")
> > +    parser.add_argument("--patch", type=str,
> > +                        help="The patch file containing the changes to the "
> > +                             "code, from the baseline analysis result to the "
> > +                             "'check report' analysis result.\n"
> > +                             "Do not use with --baseline-rev/--report-rev")
> > +    parser.add_argument("--baseline-rev", type=str,
> > +                        help="Revision or SHA of the codebase analysed to "
> > +                             "create the baseline report.\n"
> > +                             "Use together with --report-rev")
> > +    parser.add_argument("--report-rev", type=str,
> > +                        help="Revision or SHA of the codebase analysed to "
> > +                             "create the 'check report'.\n"
> > +                             "Use together with --baseline-rev")
> > 
> >     args = parser.parse_args()
> > 
> > +    if args.patch and (args.baseline_rev or args.report_rev):
> > +        print("ERROR: '--patch' argument can't be used with '--baseline-rev'"
> > +              " or '--report-rev'.")
> > +        sys.exit(1)
> > +
> > +    if bool(args.baseline_rev) != bool(args.report_rev):
> > +        print("ERROR: '--baseline-rev' must be used together with "
> > +              "'--report-rev'.")
> > +        sys.exit(1)
> > +
> >     if args.out == "stdout":
> >         file_out = sys.stdout
> >     else:
> > @@ -63,11 +90,35 @@ def main(argv):
> >         new_rep.parse()
> >         debug.debug_print_parsed_report(new_rep)
> >         log_info(" [OK]")
> > -    except ReportError as e:
> > +        diff_source = None
> > +        if args.patch:
> > +            diff_source = os.path.realpath(args.patch)
> > +        elif args.baseline_rev:
> > +            git_diff = invoke_command(
> > +                "git diff --git-dir={} -C -C {}..{}".format(repo_dir,
> > +                                                            args.baseline_rev,
> > +                                                            args.report_rev),
> > +                True, "Error occured invoking:\n{}\n\n{}"
> > +            )
> 
> I’ve noticed now an issue here, when using --baseline-rev/--report-rev, the fix is this one:
> 
> diff --git a/xen/scripts/diff-report.py b/xen/scripts/diff-report.py
> index d608e3a05aa1..636f98f5eebe 100755
> --- a/xen/scripts/diff-report.py
> +++ b/xen/scripts/diff-report.py
> @@ -95,9 +95,8 @@ def main(argv):
>              diff_source = os.path.realpath(args.patch)
>          elif args.baseline_rev:
>              git_diff = invoke_command(
> -                "git diff --git-dir={} -C -C {}..{}".format(repo_dir,
> -                                                            args.baseline_rev,
> -                                                            args.report_rev),
> +                "git --git-dir={}/.git diff -C -C {}..{}"
> +                .format(repo_dir, args.baseline_rev, args.report_rev),
>                  True, "Error occured invoking:\n{}\n\n{}"
>              )
>              diff_source = git_diff.splitlines(keepends=True)
> 
> I’ll wait for other feedback on the patch before sending it again.

With this change:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-2005679444-1684977543=:44000--

