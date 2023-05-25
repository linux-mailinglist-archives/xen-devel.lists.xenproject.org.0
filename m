Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E2710215
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 02:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539269.839978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1z7v-0000QF-NU; Thu, 25 May 2023 00:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539269.839978; Thu, 25 May 2023 00:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1z7v-0000Np-Ki; Thu, 25 May 2023 00:46:47 +0000
Received: by outflank-mailman (input) for mailman id 539269;
 Thu, 25 May 2023 00:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1z7u-0000Nj-9s
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 00:46:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e5dae11-fa95-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 02:46:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF8876413A;
 Thu, 25 May 2023 00:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BE3C433D2;
 Thu, 25 May 2023 00:46:40 +0000 (UTC)
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
X-Inumbo-ID: 9e5dae11-fa95-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684975602;
	bh=nfH3mGgNwMSbNgF7ChnkiSmXD4C5vRPEvASZWFe7nwg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XLfV3Xaerez7xkpsVhDp+HVK9vXQ1llvLC/3PudOh9845//F+pUOXKfmnpSpW5Z2f
	 U2l0T7wL7P2OOPYX1QWMhbA3I5ZWEyifkXoUDUkllCOwkWFyXozJtUdSCN+4qMGmFj
	 DP8+uUsqFmjsLFGpyqEKvBeugfJnHykEDuPtBGKL5/H+IB1b/dqrauY85EZgvMkoYT
	 9x0XZDuD/tbCw1nRoVYbuZV9g8F39cQtA5N3HWYAxs6a28yARXkILdbKHSF9a9TZgr
	 6iLgtcSt2Ta9+mKwmw1bkLWzGMZ0ChOR7qJCxf2oEzyhKgSD/D94EFuss2+8j0b8QU
	 Ecc7XFGvUI6Gg==
Date: Wed, 24 May 2023 17:46:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 3/3] xen/misra: xen-analysis.py: Fix cppcheck report
 relative paths
In-Reply-To: <20230519093019.2131896-4-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305241744170.44000@ubuntu-linux-20-04-desktop>
References: <20230519093019.2131896-1-luca.fancellu@arm.com> <20230519093019.2131896-4-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 May 2023, Luca Fancellu wrote:
> Fix the generation of the relative path from the repo, for cppcheck
> reports, when the script is launching make with in-tree build.
> 
> Fixes: b046f7e37489 ("xen/misra: xen-analysis.py: use the relative path from the ...")
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  .../xen_analysis/cppcheck_report_utils.py     | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> index fdc299c7e029..10100f6c6a57 100644
> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> @@ -1,6 +1,7 @@
>  #!/usr/bin/env python3
>  
> -import os
> +import os, re
> +from . import settings
>  from xml.etree import ElementTree
>  
>  class CppcheckHTMLReportError(Exception):
> @@ -101,12 +102,28 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
>              text_report_content = list(text_report_content)
>              # Strip path from report lines
>              for i in list(range(0, len(text_report_content))):
> -                for path in strip_paths:
> -                    text_report_content[i] = text_report_content[i].replace(
> -                                                                path + "/", "")
>                  # Split by : separator
>                  text_report_content[i] = text_report_content[i].split(":")
>  
> +                for path in strip_paths:
> +                    text_report_content[i][0] = \
> +                        text_report_content[i][0].replace(path + "/", "")

Why moving this for loop after "Split by : separator"? If it is
necessary, would it make sense to do it in the previous patch?


> +                # When the compilation is in-tree, the makefile places
> +                # the directory in /xen/xen, making cppcheck produce
> +                # relative path from there, so check if "xen/" is a prefix
> +                # of the path and if it's not, check if it can be added to
> +                # have a relative path from the repository instead of from
> +                # /xen/xen
> +                if not text_report_content[i][0].startswith("xen/"):
> +                    # cppcheck first entry is in this format:
> +                    # path/to/file(line,cols), remove (line,cols)
> +                    cppcheck_file = re.sub(r'\(.*\)', '',
> +                                           text_report_content[i][0])
> +                    if os.path.isfile(settings.xen_dir + "/" + cppcheck_file):
> +                        text_report_content[i][0] = \
> +                            "xen/" + text_report_content[i][0]
> +
>              # sort alphabetically for second field (misra rule) and as second
>              # criteria for the first field (file name)
>              text_report_content.sort(key = lambda x: (x[1], x[0]))
> -- 
> 2.34.1
> 

