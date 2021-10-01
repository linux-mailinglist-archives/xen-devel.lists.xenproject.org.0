Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7041F833
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 01:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200838.355389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWRt4-0003Cx-WE; Fri, 01 Oct 2021 23:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200838.355389; Fri, 01 Oct 2021 23:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWRt4-0003Ak-S8; Fri, 01 Oct 2021 23:24:18 +0000
Received: by outflank-mailman (input) for mailman id 200838;
 Fri, 01 Oct 2021 23:24:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mWRt3-0003AY-CM
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 23:24:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7a4aa65-3f40-4177-a981-0562461300d5;
 Fri, 01 Oct 2021 23:24:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F360C61AAB;
 Fri,  1 Oct 2021 23:24:14 +0000 (UTC)
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
X-Inumbo-ID: a7a4aa65-3f40-4177-a981-0562461300d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633130655;
	bh=cQSyH4lur8SXtMu+/dsjdmdzaTeH2ijSyA9OTpNwYx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ViyZ8aHNcW5LsbhXKJH76Qmje64yqQR/ntJJq00M4GJgxUGnUIKUCJwxI41TJWIHA
	 MSDPOZ6pFASyuJARsbrJO9e888AkAX49El5WumlTs5fgb7GI6tiJpHwhmfbM7HrC19
	 WBfB5ccgfPVGflXQMvruHGDlc64/hZeyjlqYwG+/w4sagCu8CWTBSwRz31PNWoZedu
	 x09w9Ym6IL+zRSegQ6qwBv5wt/TbjvG0MxHfE8Aa1cHurME0AJVZ8TQVvbvDNGzXNo
	 nphnOPcT++AkLJW958Vsd+TrvFKUigq46Ky+8TeLbz8ewV532YD6F5+lcz38YX3qBw
	 dDHTzWE3QKMOg==
Date: Fri, 1 Oct 2021 16:24:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
In-Reply-To: <bbbceae1-c382-5e48-0c6b-fbb23fc720f5@gmail.com>
Message-ID: <alpine.DEB.2.21.2110011244000.3209@sstabellini-ThinkPad-T480s>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com> <1632955927-27911-2-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s> <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com>
 <bbbceae1-c382-5e48-0c6b-fbb23fc720f5@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Bertrand, see comment on ID_AA64MMFR0_EL1 below, any ideas?


On Fri, 1 Oct 2021, Oleksandr wrote:
> On 01.10.21 10:50, Jan Beulich wrote:
> > On 01.10.2021 01:00, Stefano Stabellini wrote:
> > > On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > 
> > > > We need to pass info about maximum supported guest address
> > > > space size to the toolstack on Arm in order to properly
> > > > calculate the base and size of the extended region (safe range)
> > > > for the guest. The extended region is unused address space which
> > > > could be safely used by domain for foreign/grant mappings on Arm.
> > > > The extended region itself will be handled by the subsequents
> > > > patch.
> > > > 
> > > > Use p2m_ipa_bits variable on Arm, the x86 equivalent is
> > > > hap_paddr_bits.
> > > > 
> > > > As we change the size of structure bump the interface version.
> > > > 
> > > > Suggested-by: Julien Grall <jgrall@amazon.com>
> > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > I have to admit that I'm a little puzzled to see these R-b-s when ...
> > 
> > > > Please note, that review comments for the RFC version [1] haven't been
> > > > addressed yet.
> > > > It is not forgotten, some clarification is needed. It will be addressed
> > > > for the next version.
> > > > 
> > > > [1]
> > > > https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
> > ... Oleksandr makes clear this patch isn't really ready yet.
> 
> Unfortunately, this is true. I am still waiting for the clarification [1]

Although I was aware of comments to older versions, this is actually the
first version of this patch that I reviewed with any level of details; I
didn't read previous comments very closely. I tried to find any bugs or
problems with it and I couldn't see any, so I gave my reviewed-by. I
should have clarified that was meant for the ARM part as I don't have a
full understanding of the implications of using hap_paddr_bits on x86
for VM migration.


But let me take this opportunity to say that although I think the
hypercall is OK, I wish we didn't need this patch at all: it is
problematic because it touches tools, x86 and ARM hypervisor code all
together. It needs at least three acks/reviewed-by to get accepted: from
an x86 maintainer, an arm maintainer and from a tools maintainer. I
don't say this to criticize the patch acceptance process: this patch
makes changes to an existing hypercall so it is only fair that it needs
to go through extra levels of scrutiny. For the sake of simplicity and
decoupling (reducing dependencies between patches and between
components), I think it would be best to introduce an #define for the
minimum value of gpaddr_bits and then move this patch at the end of the
series; that way it becomes optional. Unfortunately the minimum value
is 32 (in practice I have never seen less than 40 but the architecture
supports 32 as minimum).


Actually, the info we are looking for is already exposed via
ID_AA64MMFR0_EL1. ID_AA64MMFR0_EL1 can be read from a virtual machine,
and Linux let userspace read it [1]. Regardless of this patch series, we
should make sure that Xen exposes the right mm64.pa_range value to guest
virtual machines. If that is done right, then you can just add support
for reading ID_AA64MMFR0_EL1 in libxl/libxc and then we don't need any
hypercall modifications changes.

So, in theory we already have all the interfaces we need, but in
practice they don't work: unfortunaly both Xen and Linux mark
ID_AA64MMFR0_EL1 as FTR_HIDDEN in cpufeature.c so neither Linux from
Xen, not userspace from Linux can actually read the real value :-/
They always read zero.

(Also I think we have an issue today with p2m_restrict_ipa_bits not
updating the mm64.pa_range value. I think that it should be fixed.)

Bertrand, do you have any ideas in regards to ID_AA64MMFR0_EL1?

If not, maybe we could just go with
#define MIN_GPADDR_BITS 32


[1] https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-registers.html

