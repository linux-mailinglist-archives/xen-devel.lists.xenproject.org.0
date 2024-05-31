Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E758D573E
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733170.1139286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqMb-0002vT-JY; Fri, 31 May 2024 00:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733170.1139286; Fri, 31 May 2024 00:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqMb-0002tJ-GR; Fri, 31 May 2024 00:43:21 +0000
Received: by outflank-mailman (input) for mailman id 733170;
 Fri, 31 May 2024 00:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCqMZ-0002tD-Fu
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 00:43:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c444246f-1ee6-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 02:43:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D3D66290C;
 Fri, 31 May 2024 00:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E649BC2BBFC;
 Fri, 31 May 2024 00:43:13 +0000 (UTC)
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
X-Inumbo-ID: c444246f-1ee6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717116194;
	bh=fYW4LEG0d2v6XHYpihKqCQJDdPWeRaWNXDK+gNPIzQw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B1ELs8QvgPH11h4MJqJyoa1zyX2/uJftZpy3B9FYK+SKG87p+MM96TOjuJzBrI/O8
	 T5XSLh2gdmjqt19SW/HjuIG0kkhUDerCBNP4Wf1tPwi51pDDoMjyOD4aOBxkxdDBqE
	 yzHTvGFT9jfrKqbWGrzAuvI6qT7ZHkKz8/nO7G5iB9jy/WjT6Ao/mk5hQeSy6/O1gT
	 OxvKe07fZJAh6Taw/5z9Nuuq+MOiUh6qf8jjfWdq7ymB4wZtPy6RBmTiw0J8Q+QPEl
	 beXWZira/poxiWmx8aV4Rj8TRHwBikOU5G8L/taEk5jv/wIXleDrAzyml0QQ+62wDP
	 yWPlH09dlngAQ==
Date: Thu, 30 May 2024 17:43:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/3] CI: Remove CI_COMMIT_REF_PROTECTED requirement for
 HW jobs
In-Reply-To: <ZlfHh_blx1i0eE7O@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2405301715010.2557291@ubuntu-linux-20-04-desktop>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com> <20240529141945.41669-2-andrew.cooper3@citrix.com> <ZlfHh_blx1i0eE7O@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1773755421-1717115846=:2557291"
Content-ID: <alpine.DEB.2.22.394.2405301738011.2557291@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1773755421-1717115846=:2557291
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2405301738012.2557291@ubuntu-linux-20-04-desktop>

On Thu, 30 May 2024, Marek Marczykowski-Górecki wrote:
> On Wed, May 29, 2024 at 03:19:43PM +0100, Andrew Cooper wrote:
> > This restriction doesn't provide any security because anyone with suitable
> > permissions on the HW runners can bypass it with this local patch.
> > 
> > Requiring branches to be protected hampers usability of transient testing
> > branches (specifically, can't delete branches except via the Gitlab UI).
> >
> > Drop the requirement.
> > 
> > Fixes: 746774cd1786 ("automation: introduce a dom0less test run on Xilinx hardware")
> > Fixes: 0ab316e7e15f ("automation: add a smoke and suspend test on an Alder Lake system")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Runners used to be set to run only on protected branches. I think it
> isn't the case anymore from what I see, but it needs checking (I don't
> see specific settings in all the projects). If it were still the case,
> removing variable check would result in jobs forever pending.

Andrew, thank you so much for pointing this out.

I think the idea was that we can specify the individual users with
access to protected branches. We cannot add restrictions for unprotected
branches. So if we set the gitlab runner to only run protected jobs,
then the $CI_COMMIT_REF_PROTECTED check makes sense. Not for security,
but to prevent the jobs from getting stuck waiting for a runner that
will never arrive.

However, like Marek said, now the gitlab runners don't have the
"Protected" check set, so it is all useless :-(

I would prefer to set "Protected" in the gitlab runners settings so that
it becomes easier to specify users that can and cannot trigger the jobs.

Then, we'll need the $CI_COMMIT_REF_PROTECTED check, not for security,
but to avoid pipelines getting stuck for unprotected branches.

It is really difficult to restrict users from triggering jobs in other
way because they are all automatically added to all subprojects.


Would you guys be OK if I set "Protected" in the Xilinx and Qubes gitlab
runners as soon as possible?
--8323329-1773755421-1717115846=:2557291--

