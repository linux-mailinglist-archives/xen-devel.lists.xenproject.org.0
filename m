Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E686A8D53
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 00:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505488.778307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXshJ-0002WT-9U; Thu, 02 Mar 2023 23:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505488.778307; Thu, 02 Mar 2023 23:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXshJ-0002UV-5u; Thu, 02 Mar 2023 23:50:53 +0000
Received: by outflank-mailman (input) for mailman id 505488;
 Thu, 02 Mar 2023 23:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXshH-0002UN-K4
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 23:50:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f1137cd-b955-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 00:50:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AF7C615E7;
 Thu,  2 Mar 2023 23:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232A7C433EF;
 Thu,  2 Mar 2023 23:50:47 +0000 (UTC)
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
X-Inumbo-ID: 0f1137cd-b955-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677801048;
	bh=Sdk9Ok/e+YBLzSbWZW3D3COI7xsqH8tIB0rTyM3efRY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o5FOVl9paKdaZxUSsqWRkKDmBJS+og1/3pxvEN+KpLdbFCVxSuMI8oqF1XW7kOp9K
	 5pzeFn3yfmxz8QNUhJlO2s+GYPPihaYUkOEKDmDMavwKLalCn8gQKoLeBdfJlAePN1
	 8mtDAaxXb0ELVr1DdjuBAm9v07iQiK9mi3EA16i0xcvPq/ZTIK2RaWgv7V/vl3YKC2
	 xGWqn2DHPxnpR5ysZsTTb2Sb8u0qyoJ8JKXccSTqVvU62VGxhlk+KCUV2svBNpnKw6
	 e7Z9pt+KIH2MNmh5lH1d7AQ6Dc7Rx/GxJYobj99jQwzBMBEOqBwbmnJ9xOsPbEXQ5w
	 MtSsyXuG1jyIA==
Date: Thu, 2 Mar 2023 15:50:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] xen/cppcheck: add a way to exclude files from
 the scan
In-Reply-To: <D40B74ED-1FB2-440F-A816-A47F837FABD6@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303021550180.863724@ubuntu-linux-20-04-desktop>
References: <20230301095320.264301-1-luca.fancellu@arm.com> <20230301095320.264301-2-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2303011558170.3680@ubuntu-linux-20-04-desktop> <D40B74ED-1FB2-440F-A816-A47F837FABD6@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-535574450-1677801048=:863724"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-535574450-1677801048=:863724
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Mar 2023, Luca Fancellu wrote:
> >> +Exclude file list for xen-analysis script
> >> +=========================================
> >> +
> >> +The code analysis is performed on the Xen codebase for both MISRA checkers and
> >> +static analysis checkers, there are some files however that needs to be removed
> >> +from the findings report because they are not owned by Xen and they must be kept
> >> +in sync with their origin (completely or even partially), hence we can't easily
> >> +fix findings or deviate from them.
> > 
> > I would stay more generic and say something like:
> > 
> > The code analysis is performed on the Xen codebase for both MISRA
> > checkers and static analysis checkers, there are some files however that
> > needs to be removed from the findings report for various reasons (e.g.
> > they are imported from external sources, they generate too many false
> > positive results, etc.).
> > 
> > But what you wrote is also OK.
> 
> I’m ok with that too, I can update with your wordings
> >> 
> >> +++ b/xen/scripts/xen_analysis/exclusion_file_list.py
> >> @@ -0,0 +1,79 @@
> >> +#!/usr/bin/env python3
> >> +
> >> +import os, glob, json
> >> +from . import settings
> >> +
> >> +class ExclusionFileListError(Exception):
> >> +    pass
> >> +
> >> +
> >> +def __cppcheck_path_exclude_syntax(path):
> >> +    # Prepending * to the relative path to match every path where the Xen
> >> +    # codebase could be
> >> +    path = "*" + path
> >> +
> >> +    # Check if the path is to a folder without the wildcard at the end
> >> +    if not (path.endswith(".c") or path.endswith(".h") or path.endswith("*")):
> > 
> > Isn't there a python call to check that it is actually a folder? I think
> > that would be more resilient because otherwise if someone passes a .S or
> > .cpp file it would be detected as directory.
> > 
> > 
> >> +        # The path is to a folder, if it doesn't have the final /, add it
> >> +        if not path.endswith("/"):
> >> +            path = path + "/"
> >> +        # Since the path is a folder, add a wildcard to the end so that
> >> +        # cppcheck will remove every issue related with this path
> >> +        path = path + "*"
> >> +
> >> +    return path
> 
> Yes you are very right, here I wanted to accept the relative path to a folder with
> or without the ending '/*’, but it carries on much more complexity because here the
> relative path can contain wildcards in it, so we can’t use os.path.isdir() which would
> fail.
> 
> At cost of being more strict on how folders shall be declared, I think it’s better to
> enforce the ‘/*’ at the end of a path that is excluding a folder.
> 
> We have a previous check using glob() to ensure path with wildcards are real path
> so we are safe that the passed relative path are OK.
> 
> Dropping the requirement of passing folder paths with or without the ‘/*’ simplifies
> the code and this would be the final result:
> 
> 
> diff --git a/docs/misra/exclude-list.rst b/docs/misra/exclude-list.rst
> index 969539c46beb..c97431a86120 100644
> --- a/docs/misra/exclude-list.rst
> +++ b/docs/misra/exclude-list.rst
> @@ -3,11 +3,11 @@
>  Exclude file list for xen-analysis script
>  =========================================
>  
> -The code analysis is performed on the Xen codebase for both MISRA checkers and
> -static analysis checkers, there are some files however that needs to be removed
> -from the findings report because they are not owned by Xen and they must be kept
> -in sync with their origin (completely or even partially), hence we can't easily
> -fix findings or deviate from them.
> +The code analysis is performed on the Xen codebase for both MISRA
> +checkers and static analysis checkers, there are some files however that
> +needs to be removed from the findings report for various reasons (e.g.
> +they are imported from external sources, they generate too many false
> +positive results, etc.).
>  
>  For this reason the file docs/misra/exclude-list.json is used to exclude every
>  entry listed in that file from the final report.
> @@ -42,3 +42,5 @@ Here is an explanation of the fields inside an object of the "content" array:
>  
>  To ease the review and the modifications of the entries, they shall be listed in
>  alphabetical order referring to the rel_path field.
> +Excluded folder paths shall end with '/*' in order to match everything on that
> +folder.
> diff --git a/xen/scripts/xen_analysis/exclusion_file_list.py b/xen/scripts/xen_analysis/exclusion_file_list.py
> index 4a47a90f5944..871e480586bb 100644
> --- a/xen/scripts/xen_analysis/exclusion_file_list.py
> +++ b/xen/scripts/xen_analysis/exclusion_file_list.py
> @@ -12,15 +12,6 @@ def __cppcheck_path_exclude_syntax(path):
>      # codebase could be
>      path = "*" + path
>  
> -    # Check if the path is to a folder without the wildcard at the end
> -    if not (path.endswith(".c") or path.endswith(".h") or path.endswith("*")):
> -        # The path is to a folder, if it doesn't have the final /, add it
> -        if not path.endswith("/"):
> -            path = path + "/"
> -        # Since the path is a folder, add a wildcard to the end so that
> -        # cppcheck will remove every issue related with this path
> -        path = path + "*"
> -
>      return path
>  
>  
> I’ve included also your wording and I’ve specified in the docs how to exclude a folder.
> 
> Do you think it’s ok to proceed in this way?

Yes I think that's fine. I like that the python script becomes simpler
--8323329-535574450-1677801048=:863724--

