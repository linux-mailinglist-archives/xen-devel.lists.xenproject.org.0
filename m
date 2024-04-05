Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5A89928C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701049.1095100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXJx-0004al-2M; Fri, 05 Apr 2024 00:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701049.1095100; Fri, 05 Apr 2024 00:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXJw-0004Y7-VR; Fri, 05 Apr 2024 00:20:40 +0000
Received: by outflank-mailman (input) for mailman id 701049;
 Fri, 05 Apr 2024 00:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXJv-0004Xz-Jf
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:20:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532fefa4-f2e2-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 02:20:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56F3660C40;
 Fri,  5 Apr 2024 00:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C6AC433F1;
 Fri,  5 Apr 2024 00:20:34 +0000 (UTC)
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
X-Inumbo-ID: 532fefa4-f2e2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712276436;
	bh=obwnA1AJLjBkCRCH7n1AjXqs2iynz4NwOh/ulWZTer8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gsYBul4y7QYTvYyBC5DgpnJsrSo2KsCvR54gSk3lGzCyp6wis7B+u8BazNEuPXL5j
	 ERDntmk92zIgg78c/bNhOngo4J10biQpP1bqe4u9NojGTX0tRb7BGvgRnfLt0NyO9M
	 GaykQesD1GIuFhbtayejQ3XnoBmMppHapccl+ZNTY+UeII3WzZEDquV+zBRgMlYnZW
	 uOkJ0hyUsCIO5i8tRyBEeFXqy5uRdGnL6mE9W1FAgOxmXhojfTnA/H+U1biYL4XNsy
	 EorGAfKEHjPodGqYzN7QeLQSDz4DugaZ1i/RAVNGffUkJB2OpTFQCWFD7KU7/f5Vsa
	 FKpQjm6+KszkA==
Date: Thu, 4 Apr 2024 17:20:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Marco Solieri <marco.solieri@minervasys.tech>, 
    xen-devel@lists.xenproject.org, 
    Andrea Bastoni <andrea.bastoni@minervasys.tech>
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
In-Reply-To: <a12c4f8a-54d8-41b9-8ce8-6628a1d85c1c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2404041720030.2245130@ubuntu-linux-20-04-desktop>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech> <20240315105902.160047-5-carlo.nonato@minervasys.tech> <fa879713-4eee-4905-83f9-6182924cddbb@suse.com> <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
 <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com> <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com> <22ab32bb-b0d0-4d68-8918-5fcb42cc0f88@suse.com> <CAG+AhRVEM+hcEbBO5Konjty8gQtZ0kq27rPjXCqsF627t9fqwg@mail.gmail.com>
 <a12c4f8a-54d8-41b9-8ce8-6628a1d85c1c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1255371334-1712276436=:2245130"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1255371334-1712276436=:2245130
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 Mar 2024, Julien Grall wrote:
> Hi,
> 
> On 27/03/2024 11:39, Carlo Nonato wrote:
> > On Fri, Mar 22, 2024 at 8:26 AM Jan Beulich <jbeulich@suse.com> wrote:
> > > 
> > > On 21.03.2024 18:31, Carlo Nonato wrote:
> > > > On Thu, Mar 21, 2024 at 4:57 PM Jan Beulich <jbeulich@suse.com> wrote:
> > > > > 
> > > > > On 21.03.2024 16:04, Carlo Nonato wrote:
> > > > > > On Tue, Mar 19, 2024 at 4:30 PM Jan Beulich <jbeulich@suse.com>
> > > > > > wrote:
> > > > > > > On 15.03.2024 11:58, Carlo Nonato wrote:
> > > > > > > > --- a/docs/misc/xen-command-line.pandoc
> > > > > > > > +++ b/docs/misc/xen-command-line.pandoc
> > > > > > > > @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> > > > > > > > 
> > > > > > > >   Specify a list of IO ports to be excluded from dom0 access.
> > > > > > > > 
> > > > > > > > +### dom0-llc-colors
> > > > > > > > +> `= List of [ <integer> | <integer>-<integer> ]`
> > > > > > > > +
> > > > > > > > +> Default: `All available LLC colors`
> > > > > > > > +
> > > > > > > > +Specify dom0 LLC color configuration. This option is available
> > > > > > > > only when
> > > > > > > > +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set,
> > > > > > > > all available
> > > > > > > > +colors are used.
> > > > > > > 
> > > > > > > My reservation towards this being a top-level option remains.
> > > > > > 
> > > > > > How can I turn this into a lower-level option? Moving it into
> > > > > > "dom0=" doesn't
> > > > > > seem possible to me. How can I express a list (llc-colors) inside
> > > > > > another list
> > > > > > (dom0)? dom0=llc-colors=0-3,12-15,other-param=... How can I stop
> > > > > > parsing
> > > > > > before reaching other-param?
> > > > > 
> > > > > For example by using a different separator:
> > > > > 
> > > > > dom0=llc-colors=0-3+12-15,other-param=...
> > > > 
> > > > Ok, but that would mean to change the implementation of the parsing
> > > > function
> > > > and to adopt this syntax also in other places, something that I would've
> > > > preferred to avoid. Anyway I'll follow your suggestion.
> > > 
> > > Well, this is all used by Arm only for now. You will want to make sure Arm
> > > folks are actually okay with this alternative approach.
> > > 
> > > Jan
> > 
> > Are you Arm maintainers ok with this?
> 
> Unfortunately no. I find the use of + and "nested" = extremely confusing to
> read.
> 
> There might be other symbols to use (e.g. s/=/:/ s#+#/#), but I am not
> entirely sure the value of trying to cram all the options under a single
> top-level parameter. So I right now, I would prefrr if we stick with the
> existing approach (i.e. introducing dom0-llc-colors).

I also prefer the original as suggested in this version of the patch
--8323329-1255371334-1712276436=:2245130--

