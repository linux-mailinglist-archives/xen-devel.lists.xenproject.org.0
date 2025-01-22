Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9645A19A85
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 22:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876043.1286424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taicV-0007zZ-87; Wed, 22 Jan 2025 21:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876043.1286424; Wed, 22 Jan 2025 21:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taicV-0007wF-4g; Wed, 22 Jan 2025 21:50:43 +0000
Received: by outflank-mailman (input) for mailman id 876043;
 Wed, 22 Jan 2025 21:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhLn=UO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1taicT-0007vD-Ua
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 21:50:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb7f65f6-d90a-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 22:50:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AA5C5C56B5;
 Wed, 22 Jan 2025 21:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53442C4CED2;
 Wed, 22 Jan 2025 21:50:37 +0000 (UTC)
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
X-Inumbo-ID: eb7f65f6-d90a-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737582638;
	bh=d6F70RIYR0XRfB3shU52lDwJDzboOHrtCNl2jxOI9MM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gk2Bu0eFdf6e0zfmZZsKBw19fIBt5UK1Oy/4Zigp5LQsWrYVXn453YWIgANUUb7Y1
	 miPXhcMpIg2FaL6zsHghKagSG6glXfTXiA4unbP7G1hMiAg9KdU+qMCPTI06xiKqp6
	 lW6haKfScQAuO05co2nsvNVvLawJDDG7jF/0J5brUNxdHvBsUGeJDzSyqzxILDkGp9
	 LsZhHswUk0iEDsY+9TUjhvtL1fAOc5A16yUYIz0QwB7qvESFM3QPlfZo9YUG6aOboy
	 7cfNlbJFjl3fgES6hNHI0xiWuYcACd0lCTlnSIz5FjUZywwzXtXkLZTNTMOZwpwrte
	 Q65IYWuuZpnow==
Date: Wed, 22 Jan 2025 13:50:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    sergiy_kibrik@epam.com
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
In-Reply-To: <6c0ebe4b-fc47-4bb0-b317-f854abb63517@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501221349060.11086@ubuntu-linux-20-04-desktop>
References: <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com> <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop> <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com> <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop> <bae48627-fa5b-48b6-b74e-267285175eff@suse.com> <Z49gQBkxCbXIO84D@macbook.local> <41859184-bd9c-420f-96c1-65abe379b81e@suse.com> <Z4_hOmi01AkiYH_k@macbook.local> <c897005a-2e8e-4031-a828-acb8128f7c0c@suse.com>
 <Z5C_EJEtorK2pwGE@macbook.local> <6c0ebe4b-fc47-4bb0-b317-f854abb63517@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1937431721-1737582639=:11086"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1937431721-1737582639=:11086
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Jan 2025, Jan Beulich wrote:
> On 22.01.2025 10:49, Roger Pau Monné wrote:
> > On Wed, Jan 22, 2025 at 09:43:53AM +0100, Jan Beulich wrote:
> >> On 21.01.2025 19:02, Roger Pau Monné wrote:
> >>> On Tue, Jan 21, 2025 at 11:35:42AM +0100, Jan Beulich wrote:
> >>>> On 21.01.2025 09:52, Roger Pau Monné wrote:
> >>>>> On Tue, Jan 21, 2025 at 09:13:38AM +0100, Jan Beulich wrote:
> >>>>>> On 21.01.2025 00:27, Stefano Stabellini wrote:
> >>>>>>> If I understood it right, I like Andrew's suggestion. He is suggesting
> >>>>>>> to do the following:
> >>>>>>>
> >>>>>>> - turning PV_SHIM_EXCLUSIVE into something that does nothing
> >>>>>>
> >>>>>> FTAOD - you mean Kconfig-wise? Andrew clearly didn't say "nothing", but
> >>>>>> "nothing other than making the boolean be a compile time constant".
> >>>>>
> >>>>> Won't making the boolean a compile time constant would also result in
> >>>>> DCO kicking in and removing a fair amount of code?  So even if you
> >>>>> have enabled everything in Kconfig, the resulting hypervisor would
> >>>>> only be suitable to be used as a shim?
> >>>>
> >>>> Of course.
> >>>
> >>> Then what's the point of this approach?  Options will be enabled in
> >>> Kconfig, but the resulting hypervisor build when using allyesconfig
> >>> would have a lot of them short-circuited, making it even worse than
> >>> currently?  As options will get effectively build-time disabled due
> >>> to DCO while enabled in Kconfig.
> >>
> >> Well, I have to direct this question to Andrew. It is specifically
> >> what I'm trying to address with UNCONSTRAINED.
> >>
> >>> Overall I think PV_SHIM_EXCLUSIVE should be excluded from
> >>> allyesconfig, even with Andrew's proposed change.  Otherwise the
> >>> purpose of allyesconfig is defeated if enabling PV_SHIM_EXCLUSIVE
> >>> makes the resulting hypervisor build PV shim only.  IIRC we can
> >>> provide a default alllyes.config with CONFIG_PV_SHIM_EXCLUSIVE=n.
> >>
> >> Hmm, I wasn't aware of the option of using allyes.config. That might be
> >> the route to go, albeit it looks like people using the allyesconfig
> >> target then need to remember to set KCONFIG_ALLCONFIG in the environment
> >> (to <empty> or 1), or to explicitly specify a file name that way. (This
> >> of course ought to be easy enough to arrange for in our automation.)
> > 
> > My knowledge of Kconfig is very limited, but isn't there a default
> > path for such file to be picked up by Kconfig?  I see we already have
> > a xen/tools/kconfig/allrandom.config, I was expecting it would be a
> > matter of dropping an allyes.config in that directory, but I haven't
> > tried.
> 
> Well, I simply looked at the kconfig sources, and my reading of it is
> that it won't even try to open allyes.config when the envvar is absent.

Reading the thread, I think that:

- using allyes.config as Roger suggested
- arranging for KCONFIG_ALLCONFIG to be set as needed
- leaving PV_SHIM_EXCLUSIVE as is

is the simplest way forward
--8323329-1937431721-1737582639=:11086--

