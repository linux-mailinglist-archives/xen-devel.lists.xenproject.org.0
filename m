Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B6968A34D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 20:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489368.757730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO29p-0002Lk-EU; Fri, 03 Feb 2023 19:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489368.757730; Fri, 03 Feb 2023 19:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO29p-0002Ja-Be; Fri, 03 Feb 2023 19:55:37 +0000
Received: by outflank-mailman (input) for mailman id 489368;
 Fri, 03 Feb 2023 19:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pO29o-0002JU-Ag
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 19:55:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7aab1fd-a3fc-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 20:55:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 548F461F54;
 Fri,  3 Feb 2023 19:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEC5C433D2;
 Fri,  3 Feb 2023 19:55:30 +0000 (UTC)
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
X-Inumbo-ID: b7aab1fd-a3fc-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675454131;
	bh=lLRrHJlFYjFEfeAb9WbJomtpWEWCRRS7nGpExue/71c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dRf0W9tLRAZUXD8XVHEU2GATrBroa3rpO3JU+/Ibb3Fawb6eV5S8l7OTC9IV00loZ
	 naGPZF4JPZOrzHoP7Z2MBrZ7cFvIY4BrE5dDgPkHV6rUYyyPJcLLSDyy1x8lQTNpVI
	 ZWm520+nJH9+400ubEBk5wdn46fqfrCtuPo2F8Yc1xg8/tLQ8+wxHXsJMN9qaiN858
	 j9I7WSD5J3zSCGjnAdQsBSugdH5H+teyHYU4HZ9w3WcR2iYkupw4mo7mGrvi0j0ME2
	 tn65cS/dxCK8v5H8SVtTsFQ+ntonPyevidtJXvXu04NB4gsUUNIbGNgaAHaCt7NQ6J
	 YhLngzxRJkVOA==
Date: Fri, 3 Feb 2023 11:55:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: Proposal: List files in Xen originated from external sources
In-Reply-To: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
Message-ID: <alpine.DEB.2.22.394.2302031145530.132504@ubuntu-linux-20-04-desktop>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1397571923-1675453621=:132504"
Content-ID: <alpine.DEB.2.22.394.2302031147040.132504@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1397571923-1675453621=:132504
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2302031147041.132504@ubuntu-linux-20-04-desktop>

On Fri, 3 Feb 2023, Luca Fancellu wrote:
> Hi all,
> 
> I’m starting a proposal for the external files that needs to be removed from the MISRA scan,
> the work was originally started by Michal here:
> https://patchwork.kernel.org/project/xen-devel/patch/20221116092032.4423-1-michal.orzel@amd.com/
> so I started by that thread, the aim of this work is to have an initial format to start as soon as possible to
> exclude the external files from the MISRA scan (at least initially from cppcheck).
> 
> I think we can use the JSON format because it’s easy to integrate it with python and it’s easy to add/remove
> fields from the structure without interfering with the other elements during time, so we can define a structure
> now but if in the future we see the needs for additional field, we can just add them without changes to the
> analysis script.
> 
> In my opinion many of these fields can be left empty in a first push, to let the script exclude the files and during
> time with the contributions of the community we can add the missing informations.
> I think it’s easier for the community to pick an entry, do some research to fill the gaps and push, instead to wait
> until having all the informations before adding the entry.
> 
> 
> This is my first though for the fields, let me know yours:
> 
> docs/misra/external-files.json:
> {
>  "version": "1.0”,
>  "content": [
>    {
>      "path": "relative/path/from/xen/“,
>      "backport": True/False,
>      "origin_project": "URL to origin project",
>      "origin_path": "relative path in the original project",
>      "origin_revision": "revision in original project”
>    }
>  ]
> }
> 
> 
> Maybe, documentation for this file and the fields can reside in docs/misra/external-files.rst.
> 
> Here follows the explanation for the fields:
> 
> path: is a relative path from the xen base folder, it can refer to a file or it can be a path to an entire folder
>          (Taking as example libfdt)

I think "path" should be the only mandatory field. path alone should be
sufficient for a MISRA C scanner to know if a file or directory should
be excluded.


> backport: it’s a boolean flag that says if the file is subject to backport, so every file where this field is true
>                 won’t be included in the analysis. A file is subject to backport when it’s external and it doesn’t
>                 accept direct changes (changes needs to be made in the original project and then backported
>                 to Xen)
> 
> origin_project: url of the repository where this file was originated
> 
> origin_path: relative path in the original project, mostly linked to the original_revision field
> 
> origin_revision: revision of the changes in the repository when this file was taken.
 
These other fields (backport, origin_project, origin_path,
origin_revision) are nice to have but not required. They don't provide
information necessary to exclude something from MISRA C scans, however
they provide information that are useful to the Xen maintainers.

This is to say that we should introduce these fields only if they are
useful to us human maintainers, not automated tools.

That said, I think they are all useful and I would keep them as you did.


> Now, I’m not entirely sure about the field “backport”, because if a file is not subject to backport, then why
> we should not make direct changes? 

"backport" is meant to say that *only* backports are allowed, no direct
changes to the source file. E.g. only backports from Linux commits, so
first you need to get your patch in Linux, then we'll take it from
there.


> Shall we maybe change its codestyle and convert it to Xen codestyle?

Typically if you only accept backports to a file, it doesn't make any
sense to convert it to Xen codestyle. But it is not a hard rule and I
don't think we should say anything in that regard here.


> And then, if the file is not subject to backport and now we “own” the file, there is no more the need to list it
> in the external file, a commit search can reveal when it was converted to Xen codestyle and removed from
> the external file list so we don’t lose the history.

Yes, I agree. If a file is coverted to Xen coding style and follows
MISRA rules, then there is no need to list the file in
docs/misra/external-files.json.


> So we would end up excluding just all the file listed in external-file.json by the analysis.

Right, I think so too
--8323329-1397571923-1675453621=:132504--

