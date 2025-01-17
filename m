Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE7A15995
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 23:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874337.1285059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYv3w-0006pA-OD; Fri, 17 Jan 2025 22:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874337.1285059; Fri, 17 Jan 2025 22:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYv3w-0006nA-L2; Fri, 17 Jan 2025 22:43:36 +0000
Received: by outflank-mailman (input) for mailman id 874337;
 Fri, 17 Jan 2025 22:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYv3v-0006n4-7R
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 22:43:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae19242-d524-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 23:43:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CFB25C6417;
 Fri, 17 Jan 2025 22:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AA7C4CEDD;
 Fri, 17 Jan 2025 22:43:30 +0000 (UTC)
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
X-Inumbo-ID: 7ae19242-d524-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737153811;
	bh=VQkzYmnK1qE/xFXhxxj/74ZXfYa7VSdfUA52jckQ4a8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DSAqSH8C/vbi1DYMrwdANw+ivgxjxccegitIMlbPpe1lqPqvm17AzYi3fX4mJAasI
	 kWasB6j8UvHcN7UYizJp/jtHHiUYyPXwHkKE/wqmxGwSAgo6F3+jBMfE5n2K/8dmNB
	 kx7gSV02bKflZvUb66mIPvV/QJpZqLlNfhfl8F+9qKrWxJqqGOkcnhVc2q7hrPVWRP
	 jCXKiyuNPIScNU6ievCIzIaGjEVswZQLXXgtfbRU9YEjUcltqxw6jlih6MJDyXC/ZH
	 koMQf8cSKS+K5Xad8LmfJVCUlkifFc7VdHf6KZlD7r7MloFNTu7/Vr0TJ0f7zjSEQy
	 WbxnkbZjdAASA==
Date: Fri, 17 Jan 2025 14:43:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, sergiy_kibrik@epam.com, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
In-Reply-To: <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com> <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com> <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop> <Z4oxZSUQ6VARiR0H@macbook.local> <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
 <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-846094575-1737152576=:2684657"
Content-ID: <alpine.DEB.2.22.394.2501171423030.2684657@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-846094575-1737152576=:2684657
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2501171423031.2684657@ubuntu-linux-20-04-desktop>

On Fri, 17 Jan 2025, Jan Beulich wrote:
> On 17.01.2025 13:24, Alejandro Vallejo wrote:
> > On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monné wrote:
> >> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
> >>> On Wed, 1 Mar 2023, Jan Beulich wrote:
> >>>> While we want certain things turned off in shim-exclusive mode, doing
> >>>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
> >>>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
> >>>> a result. Yet allyesconfig wants to enable as much of the functionality
> >>>> as possible.
> >>>>
> >>>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
> >>>> C code using it can remain as is. This isn't just for less code churn,
> >>>> but also because I think that symbol is more logical to use in many
> >>>> (all?) places.
> >>>>
> >>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> ---
> >>>> The new Kconfig control's name is up for improvement suggestions, but I
> >>>> think it's already better than the originally thought of
> >>>> FULL_HYPERVISOR.
> >>>
> >>> I think the approach in general is OK, maybe we can improve the naming
> >>> further. What about one of the following?
> >>>
> >>> NO_PV_SHIM_EXCLUSIVE
> >>> PV_SHIM_NOT_EXCLUSIVE
> >>
> >> IMO negated options are confusing, and if possible I think we should
> >> avoid using them unless strictly necessary.
> > 
> > The problem is that the option is negative in nature. It's asking for
> > hypervisor without _something_. I do agree with Stefano that shim would be
> > better in the name. Otherwise readers are forced to play divination tricks.
> > 
> > How about something like:
> > 
> >     SHIMLESS_HYPERVISOR
> > 
> > That's arguably not negated, preserves "shim" in the name and has the correct
> > polarity for allyesconfig to yield the right thing.
> 
> Except that a hypervisor with this option enabled isn't shim-less, but permits
> working in shim as well as in non-shim mode.

First, let's recognize that we have two opposing requirements. One
requirement is to make it as easy as possible to configure for the user.
Ideally without using negative CONFIG options, such as
NO_PV_SHIM_EXCLUSIVE. From the user point of view, honestly,
PV_SHIM_EXCLUSIVE is a pretty good name. Better than all of the others,
I think.

On the other hand, we have the requirement that we don't want
allyesconfig to end up disabling a bunch of CONFIG options. Now this
requirement can be satisfied easily by adding something like
NO_PV_SHIM_EXCLUSIVE. However, it would go somewhat against the previous
requirement.

So we need a compromise, something that doesn't end up disabling other
CONFIG options, to make allyesconfig happy, but also not too confusing
for the user (which is a matter of personal opinion).

In short, expect that people will have different opinions on this and
will find different compromises better or worse. For one, I prefer to
compromise on "no negative CONFIG options" and use
PV_SHIM_NOT_EXCLUSIVE. Because it serves the allyesconfig goal, and
while it is not as clear as PV_SHIM_EXCLUSIVE, is still better than a
completely generic FULL_HYPERVISOR option, which means nothing to me.

I cannot see a way to have a good and clear non-negated CONFIG option,
and also satisfy the allyesconfig requirement. So I prefer to compromise
on the "non-negated" part.
--8323329-846094575-1737152576=:2684657--

