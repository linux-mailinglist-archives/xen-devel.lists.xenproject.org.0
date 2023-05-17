Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97F707251
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 21:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536019.834153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzMxj-0006FU-Dp; Wed, 17 May 2023 19:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536019.834153; Wed, 17 May 2023 19:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzMxj-0006D0-Ap; Wed, 17 May 2023 19:37:27 +0000
Received: by outflank-mailman (input) for mailman id 536019;
 Wed, 17 May 2023 19:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzMxh-0006Cu-SM
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 19:37:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e88cb1d-f4ea-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 21:37:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51BA764AAF;
 Wed, 17 May 2023 19:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711D6C433A0;
 Wed, 17 May 2023 19:37:20 +0000 (UTC)
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
X-Inumbo-ID: 3e88cb1d-f4ea-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684352241;
	bh=io9ZhUNsyuLYL/OJGkk5/ml8C/igUfusGusXtLP/Ru0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q8XOc38b+qot8A+npMw1uhdPcaTWhAxlrVY2pwNzQ/nnVDnK47eRmQ/Zp1w5TxAdT
	 kFisQwOf/pLAhUQgMl6YHRqoXaRR9LBRuSiB9Gowk9AKVY9/wJYVXUVnUl5tU8Jp76
	 Pf+Iq2xc9RTDizPE/3UfSn/sEi0WvZaVjPMuk73n4R9OzF0oligASc8L3GDQNYF9fe
	 Wm3m98ZrnFh/v91n60U3zHrhUYxDEu8kEOYGDTkuXoIMRvcTfKGoWriOLezS1WxwgS
	 ABF2QcVkyb9OGDYh4N2XvM8vTiR4VcgkReuAY9cr1dTv4OorOWcStetavKWrS8JB2T
	 uYhuLhPOT/zHw==
Date: Wed, 17 May 2023 12:37:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] xen/misra: diff-report.py: add report patching
 feature
In-Reply-To: <3A4E52B2-B33D-46FC-A1DB-4935AF06CC49@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305171232440.128889@ubuntu-linux-20-04-desktop>
References: <20230504142523.2989306-1-luca.fancellu@arm.com> <20230504142523.2989306-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2305161827050.128889@ubuntu-linux-20-04-desktop> <3A4E52B2-B33D-46FC-A1DB-4935AF06CC49@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1258655336-1684352241=:128889"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1258655336-1684352241=:128889
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 May 2023, Luca Fancellu wrote:
> > On 17 May 2023, at 02:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 4 May 2023, Luca Fancellu wrote:
> >> Add a feature to the diff-report.py script that improves the comparison
> >> between two analysis report, one from a baseline codebase and the other
> >> from the changes applied to the baseline.
> >> 
> >> The comparison between reports of different codebase is an issue because
> >> entries in the baseline could have been moved in position due to addition
> >> or deletion of unrelated lines or can disappear because of deletion of
> >> the interested line, making the comparison between two revisions of the
> >> code harder.
> >> 
> >> Having a baseline report, a report of the codebase with the changes
> >> called "new report" and a git diff format file that describes the
> >> changes happened to the code from the baseline, this feature can
> >> understand which entries from the baseline report are deleted or shifted
> >> in position due to changes to unrelated lines and can modify them as
> >> they will appear in the "new report".
> >> 
> >> Having the "patched baseline" and the "new report", now it's simple
> >> to make the diff between them and print only the entry that are new.
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > 
> > This is an amazing work!! Thanks Luca!
> > 
> > I am having issues trying the new patch feature. After applying this
> > patch I get:
> > 
> > sstabellini@ubuntu-linux-20-04-desktop:/local/repos/xen-upstream/xen$ ./scripts/diff-report.py
> > Traceback (most recent call last):
> >  File "./scripts/diff-report.py", line 5, in <module>
> >    from xen_analysis.diff_tool.debug import Debug
> >  File "/local/repos/xen-upstream/xen/scripts/xen_analysis/diff_tool/debug.py", line 4, in <module>
> >    from .report import Report
> >  File "/local/repos/xen-upstream/xen/scripts/xen_analysis/diff_tool/report.py", line 4, in <module>
> >    from .unified_format_parser import UnifiedFormatParser, ChangeSet
> >  File "/local/repos/xen-upstream/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py", line 56, in <module>
> >    class UnifiedFormatParser:
> >  File "/local/repos/xen-upstream/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py", line 57, in UnifiedFormatParser
> >    def __init__(self, args: str | list) -> None:
> > TypeError: unsupported operand type(s) for |: 'type' and 'type'
> > 
> > Also got a similar error elsewhere:
> > 
> > sstabellini@ubuntu-linux-20-04-desktop:/local/repos/xen-upstream/xen$ ./scripts/diff-report.py --patch ~/p/1 -b /tmp/1 -r /tmp/1
> > Traceback (most recent call last):
> >  File "./scripts/diff-report.py", line 127, in <module>
> >    main(sys.argv[1:])
> >  File "./scripts/diff-report.py", line 102, in main
> >    diffs = UnifiedFormatParser(diff_source)
> >  File "/local/repos/xen-upstream/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py", line 79, in __init__
> >    self.__parse()
> >  File "/local/repos/xen-upstream/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py", line 94, in __parse
> >    def parse_diff_header(line: str) -> ChangeSet | None:
> > TypeError: unsupported operand type(s) for |: 'type' and 'NoneType'
> > 
> > My Python is 2.7.18
> > 
> > 
> > Am I understanding correctly that one should run the scan for the
> > baseline (saving the result somewhere), then apply the patch, run the
> > scan again. Finally, one should call diff-report.py passing -b
> > baseline-report -r new-report --patch the-patch-applied?
> 
> Hi Stefano,
> 
> Yes indeed, that procedure is correct, I think the error you are seeing comes from the python version,
> I am using python 3, version 3.10.6.
> 
> The error seems to come from python annotations, I’m surprised you didn’t hit it when testing the first patch,
> did you use python2 for that?
> 
> Is it a problem if I developed the tool having in mind its usage with python3?

Hi Luca,

It is not a problem per se if the script requires python3 but then we
should check for the python version at the beginning of the script to
fail explictly with a nice error message if python < 3.

I am fine if you want to proceed that way, but if the only issue are the
annotations, I suggest it might be easier to remove them and then you
also get the benefit of python2 compatibility. I'll leave the choice to
you.

Either way, if you are OK with it, I think you should add a new entry to
the MAINTAINERS file to cover the xen analysis scripts if you are OK
with it:

xen/scripts/xen_analysis
xen/scripts/xen-analysis.py
xen/scripts/diff-report.py
--8323329-1258655336-1684352241=:128889--

