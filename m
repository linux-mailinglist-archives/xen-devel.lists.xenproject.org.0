Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B4AC5E22
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998868.1379574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4W9-0004Qz-1Y; Wed, 28 May 2025 00:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998868.1379574; Wed, 28 May 2025 00:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4W8-0004Od-Ue; Wed, 28 May 2025 00:19:36 +0000
Received: by outflank-mailman (input) for mailman id 998868;
 Wed, 28 May 2025 00:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK4W7-0004OR-DI
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:19:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e602045-3b59-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 02:19:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99002A4F62C;
 Wed, 28 May 2025 00:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECCFC4CEED;
 Wed, 28 May 2025 00:19:32 +0000 (UTC)
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
X-Inumbo-ID: 6e602045-3b59-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748391573;
	bh=QL99KBAZLyx/i6cfSBkiqr95rX6p/l42oLqqn06jaPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YXMKx//r9mLgq6q1ty3drsos6ngUY4FVEMyPyJEbHaBtZqcCDzt+yj3kLyK9/Eee5
	 XFkURDcLE03EqPMdgLwtwr5FY0/ogvltt0dFDrHrY3uPovW/hPqA6TCknVVdNYUxIw
	 l/ooQmqonQ5Wpl3pqknzC52Tz+gfvQjQh1DAenYI639BPqDASFIUBfSjt9VLjyOyrR
	 aciJWPtOFK1v+ryItbBNyTJNyvBd7JGnFy/MPv3Eg5fvHmYLxMs4AY7Qjl0mRJ2pVU
	 WwrorYAVBBG2cXsfnfMKT6fwqxYMYWluDYhbQj1bmwjP/yPLlrksH0GqRTkLsDRXEI
	 7t4WLYEURQgPA==
Date: Tue, 27 May 2025 17:19:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony@xenproject.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction
In-Reply-To: <aDXFviVAxsscfKV2@l14>
Message-ID: <alpine.DEB.2.22.394.2505271719250.135336@ubuntu-linux-20-04-desktop>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com> <20250522173640.575452-3-andrew.cooper3@citrix.com> <aDXFviVAxsscfKV2@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Anthony PERARD wrote:
> On Thu, May 22, 2025 at 06:36:39PM +0100, Andrew Cooper wrote:
> > For Qubes, this requires switching from sh to bash.
> > 
> > This reduces the number of times the target filename needs to be written to 1.
> > 
> > Expand the comment to explain the concatination constraints.
> 
> Isn't the correct spelling "concatenation"? Same for the two comments.
> 
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > I would like to find a slightly nicer way of conditional parts, but nothing
> > comes to mind.
> 
> Well, one way I can think of is having a new variable which can carry
> the rootfs part associated with a particular test, then that variable
> can be updated at the time we configure for that test. Something like:
> 
> # init
> declare -a append_rootfs_part
> # or append_rootfs_part=() is probably fine too.
> 
> case $test in
>   argo)
>     append_rootfs_part+=(argo.cpio.gz)
>     # ... other test configuration
>     ;;
> esac
> 
> # Dom0 rootfs
> parts=(
>     rootfs.cpio.gz
>     xen-tools.cpio.gz
>     "${append_rootfs_part[@]}"
> )
> 
> And that should works fine, even if there isn't any extra rootfs part.
> 
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> > index 10af274a0ba7..1dd3f48b3d29 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -187,10 +187,14 @@ Kernel \r on an \m (\l)
> >      rm -rf rootfs
> >  fi
> >  
> > -# Dom0 rootfs
> > -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> > -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> > -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> > +# Dom0 rootfs.  The order or concatination is important; ucode wants to come
> 
>                              ^ of concatenation
> 
> Same typo in the other comment.
> 
> Beside the typo, patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

