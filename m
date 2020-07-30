Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A139F23298C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 03:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0xPQ-00058Y-R0; Thu, 30 Jul 2020 01:31:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k0xPP-00058T-Hy
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 01:30:59 +0000
X-Inumbo-ID: 51f811e6-d204-11ea-aa93-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51f811e6-d204-11ea-aa93-12813bfff9fa;
 Thu, 30 Jul 2020 01:30:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE6CB2072A;
 Thu, 30 Jul 2020 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596072658;
 bh=pwaS2DhviccpLgb8UHdq6zhxMiIUSL6GWPcfbEpYbjk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EuA/oaBXh3DQItnwlASPkdmWLWKe9zRL4amugM2L7tvt13liYGgDaeMSbS4ckiePR
 JzuWBMnPj5N68Wx/mi4PqvjxuxN0zh92gl8VUREFe+uWYflLayTx5e+mXTMCS4J0tc
 DmOUtWBuKXHbxjyE3uvJqO+hgBOvHg0EdhkEx0bQ=
Date: Wed, 29 Jul 2020 18:30:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
Message-ID: <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-914584651-1596056332=:1767"
Content-ID: <alpine.DEB.2.21.2007291402180.1767@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-914584651-1596056332=:1767
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007291402181.1767@sstabellini-ThinkPad-T480s>

On Wed, 29 Jul 2020, Jan Beulich wrote:
> On 29.07.2020 09:08, Bertrand Marquis wrote:
> > > On 28 Jul 2020, at 21:54, Jan Beulich <jbeulich@suse.com> wrote:
> > > 
> > > On 28.07.2020 17:52, Bertrand Marquis wrote:
> > > > At the moment on Arm, a Linux guest running with KTPI enabled will
> > > > cause the following error when a context switch happens in user mode:
> > > > (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> > > > The error is caused by the virtual address for the runstate area
> > > > registered by the guest only being accessible when the guest is running
> > > > in kernel space when KPTI is enabled.
> > > > To solve this issue, this patch is doing the translation from virtual
> > > > address to physical address during the hypercall and mapping the
> > > > required pages using vmap. This is removing the conversion from virtual
> > > > to physical address during the context switch which is solving the
> > > > problem with KPTI.
> > > > This is done only on arm architecture, the behaviour on x86 is not
> > > > modified by this patch and the address conversion is done as before
> > > > during each context switch.
> > > > This is introducing several limitations in comparison to the previous
> > > > behaviour (on arm only):
> > > > - if the guest is remapping the area at a different physical address Xen
> > > > will continue to update the area at the previous physical address. As
> > > > the area is in kernel space and usually defined as a global variable
> > > > this
> > > > is something which is believed not to happen. If this is required by a
> > > > guest, it will have to call the hypercall with the new area (even if it
> > > > is at the same virtual address).
> > > > - the area needs to be mapped during the hypercall. For the same reasons
> > > > as for the previous case, even if the area is registered for a different
> > > > vcpu. It is believed that registering an area using a virtual address
> > > > unmapped is not something done.
> > > 
> > > Beside me thinking that an in-use and stable ABI can't be changed like
> > > this, no matter what is "believed" kernel code may or may not do, I
> > > also don't think having arch-es diverge in behavior here is a good
> > > idea. Use of commonly available interfaces shouldn't lead to head
> > > aches or surprises when porting code from one arch to another. I'm
> > > pretty sure it was suggested before: Why don't you simply introduce
> > > a physical address based hypercall (and then also on x86 at the same
> > > time, keeping functional parity)? I even seem to recall giving a
> > > suggestion how to fit this into a future "physical addresses only"
> > > model, as long as we can settle on the basic principles of that
> > > conversion path that we want to go sooner or later anyway (as I
> > > understand).
> > 
> > I fully agree with the “physical address only” model and i think it must be
> > done. Introducing a new hypercall taking a physical address as parameter
> > is the long term solution (and I would even volunteer to do it in a new
> > patchset).
> > But this would not solve the issue here unless linux is modified.
> > So I do see this patch as a “bug fix”.
> 
> Well, it is sort of implied by my previous reply that we won't get away
> without an OS side change here. The prereq to get away without would be
> that it is okay to change the behavior of a hypercall like you do, and
> that it is okay to make the behavior diverge between arch-es. I think
> I've made pretty clear that I don't think either is really an option.

Hi Jan,

This is a difficult problem to solve and the current situation honestly
sucks: there is no way to solve the problem without making compromises.

The new hypercall is good-to-have in any case (it is a better interface)
but it is not a full solution.  If we introduce a new hypercall we fix
new guests but don't fix existing guests. If we change Linux in any way,
we are still going to have problems with all already-released kernel
binaries. Leaving the issue unfixed is not an option either because the
problem can't be ignored.

There is no simple way out of this situation.


After careful considerations and many discussions (most of them on
xen-devel [1][2]) we came to the realization that changing the behavior
for this hypercall on ARM is the best we can do:

1) it solves the problem for existing guests
2) it has no ill effects as far as we know


Are we happy about it? We are not. It is the best we can do given the
constraints. The rule to never change hypercalls is a good one to have
and I fully support it, but in this unique circumstance it is best to
make an exception.

The idea is to minimize the impact to x86 so that's why Bertrand's patch
is introducing a divergence between Arm and x86 on this hypercall.


In summary, please consider this patch together with its context. This
has been the only time to my memory when we had to do this -- it is
certainly a unique situation.



[1] https://marc.info/?l=xen-devel&m=158946660216159
[2] https://marc.info/?l=xen-devel&m=159067967432381
--8323329-914584651-1596056332=:1767--

