Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B4421908
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 23:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201723.356337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXVFS-0007L8-CO; Mon, 04 Oct 2021 21:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201723.356337; Mon, 04 Oct 2021 21:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXVFS-0007Iu-8z; Mon, 04 Oct 2021 21:11:46 +0000
Received: by outflank-mailman (input) for mailman id 201723;
 Mon, 04 Oct 2021 21:11:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ik8X=OY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXVFQ-0007Io-LK
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 21:11:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac1c8039-2557-11ec-bebd-12813bfff9fa;
 Mon, 04 Oct 2021 21:11:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 525D0610C7;
 Mon,  4 Oct 2021 21:11:41 +0000 (UTC)
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
X-Inumbo-ID: ac1c8039-2557-11ec-bebd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633381901;
	bh=QOCsCFQ+z1LjbasUQQYJvIPHsL/KVRjx9nntde4xsGs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=txPcqJN5rqxL7DIs5n66KlwbDTmHGg6vDKrpE7IhD6kiWUOBdRS6spoft24xt2Kc6
	 LtYcyscS4m6H22n1iO2HCNtq0MOO9Ff1fBdUK70VHGbOr/BVzjpFprkmuelFl//O8q
	 jw/3/6hdu08QAmapojDM7csxEdXj7kafXC2FeNqFI+jW8BzDXwJh5iilHEP243LbE3
	 cBWswj/Qc+4oxOO9Lk/RIHsslBc/hFgor8kbHFPB5iiWNTKqoFtyCKCNr92Xb0+VZa
	 V/7Gp7p4rle05aCiX7F8waqy3b9NWmVmEtC32Y6BTSKAnN/OEWc3mukf8nFuLlxM+m
	 qHAeafWX4DuEQ==
Date: Mon, 4 Oct 2021 14:11:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Julien Grall <julien.grall.oss@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
In-Reply-To: <093bc1d5-bf6a-da0a-78b5-7a8dd471a063@gmail.com>
Message-ID: <alpine.DEB.2.21.2110041411100.3209@sstabellini-ThinkPad-T480s>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com> <1632955927-27911-2-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s> <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com>
 <bbbceae1-c382-5e48-0c6b-fbb23fc720f5@gmail.com> <alpine.DEB.2.21.2110011244000.3209@sstabellini-ThinkPad-T480s> <CAJ=z9a2bT4tMn2argJzePUMR2Ke4bmabj+j5QevvwpfnA9ST_w@mail.gmail.com> <093bc1d5-bf6a-da0a-78b5-7a8dd471a063@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-254547066-1633381901=:3209"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-254547066-1633381901=:3209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 2 Oct 2021, Oleksandr wrote:
> On 02.10.21 10:35, Julien Grall wrote:
> 
> Thank you for your comments!
> 
>       Hi
> 
>       On Sat, 2 Oct 2021, 01:24 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       Bertrand, see comment on ID_AA64MMFR0_EL1 below, any ideas?
> 
> 
>       On Fri, 1 Oct 2021, Oleksandr wrote:
>       > On 01.10.21 10:50, Jan Beulich wrote:
>       > > On 01.10.2021 01:00, Stefano Stabellini wrote:
>       > > > On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
>       > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>       > > > >
>       > > > > We need to pass info about maximum supported guest address
>       > > > > space size to the toolstack on Arm in order to properly
>       > > > > calculate the base and size of the extended region (safe range)
>       > > > > for the guest. The extended region is unused address space which
>       > > > > could be safely used by domain for foreign/grant mappings on Arm.
>       > > > > The extended region itself will be handled by the subsequents
>       > > > > patch.
>       > > > >
>       > > > > Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>       > > > > hap_paddr_bits.
>       > > > >
>       > > > > As we change the size of structure bump the interface version.
>       > > > >
>       > > > > Suggested-by: Julien Grall <jgrall@amazon.com>
>       > > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>       > > > > Reviewed-by: Michal Orzel <michal.orzel@arm.com>
>       > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>       > > I have to admit that I'm a little puzzled to see these R-b-s when ...
>       > >
>       > > > > Please note, that review comments for the RFC version [1] haven't been
>       > > > > addressed yet.
>       > > > > It is not forgotten, some clarification is needed. It will be addressed
>       > > > > for the next version.
>       > > > >
>       > > > > [1]
>       > > > > https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
>       > > ... Oleksandr makes clear this patch isn't really ready yet.
>       >
>       > Unfortunately, this is true. I am still waiting for the clarification [1]
> 
>       Although I was aware of comments to older versions, this is actually the
>       first version of this patch that I reviewed with any level of details; I
>       didn't read previous comments very closely. I tried to find any bugs or
>       problems with it and I couldn't see any, so I gave my reviewed-by. I
>       should have clarified that was meant for the ARM part as I don't have a
>       full understanding of the implications of using hap_paddr_bits on x86
>       for VM migration.
> 
> 
> 
>       But let me take this opportunity to say that although I think the
>       hypercall is OK, I wish we didn't need this patch at all: it is
>       problematic because it touches tools, x86 and ARM hypervisor code all
>       together. It needs at least three acks/reviewed-by to get accepted: from
>       an x86 maintainer, an arm maintainer and from a tools maintainer. I
>       don't say this to criticize the patch acceptance process: this patch
>       makes changes to an existing hypercall so it is only fair that it needs
>       to go through extra levels of scrutiny. For the sake of simplicity and
>       decoupling (reducing dependencies between patches and between
>       components), I think it would be best to introduce an #define for the
>       minimum value of gpaddr_bits and then move this patch at the end of the
>       series; that way it becomes optional.
> 
> 
> It depends what you mean by optional. Yes we can add hack to avoid the hypercall... But the more scalable solution is the hypercall.
> 
> I am slightly concerned that if we don't push for the hypercall now, then there will be no incentive to do it afterwards...
> 
> So I went through Andrew's e-mail to understand what's the request. I understand that there are some problem with migration. But it
> doesn't look like we need to solve them now. Instead,  AFAICT, his main ask for this series is to switch to a domctl.
> 
> It seems the conversation is simply stuck on waiting for Andrew to provide details on what would look like. Did we ping Andrew on
> IRC?
> 
>       Unfortunately the minimum value
>       is 32 (in practice I have never seen less than 40 but the architecture
>       supports 32 as minimum).
> 
> 
> 
>       Actually, the info we are looking for is already exposed via
>       ID_AA64MMFR0_EL1. ID_AA64MMFR0_EL1 can be read from a virtual machine,
>       and Linux let userspace read it [1]. Regardless of this patch series, we
>       should make sure that Xen exposes the right mm64.pa_range value to guest
>       virtual machines. If that is done right, then you can just add support
>       for reading ID_AA64MMFR0_EL1 in libxl/libxc and then we don't need any
>       hypercall modifications changes.
> 
> 
> From my understanding, from a VM PoV "pa_range" should represent the size of the guest physical address space.
> 
> Today, it happens that every VM is using the same P2M size. However, I would rather not make such assumption in the userspace.
> 
> 
>       So, in theory we already have all the interfaces we need, but in
>       practice they don't work: unfortunaly both Xen and Linux mark
>       ID_AA64MMFR0_EL1 as FTR_HIDDEN in cpufeature.c so neither Linux from
>       Xen, not userspace from Linux can actually read the real value :-/
>       They always read zero.
> 
>       (Also I think we have an issue today with p2m_restrict_ipa_bits not
>       updating the mm64.pa_range value. I think that it should be fixed.)
> 
> 
> It looks like it. That should be handled in a separate patch though.
> 
> 
>       Bertrand, do you have any ideas in regards to ID_AA64MMFR0_EL1?
> 
>       If not, maybe we could just go with
>       #define MIN_GPADDR_BITS 32.
> 
> 
> The toolstack would have to consider it as the "maximum" because it may not be safe to expose anything above.
> 
> With 32, we are going to be limited in term of space we can find.
> 
> We could potentially use 40 bits as a minimum. Although it still feels a bit of a hack to me given that the IOMMU may restrict it
> further and the architecture can in theory support less.
> 
> Overall, I still strongly prefer the hypercall approach. If a common one is difficult to achieve, then we can extend the domctl to
> create a domain to provide the p2m_bits (in the same way as we deal for the GIC version) in an arch specific way.
> 
> 
> To summarize:
> If we don't query the hypervisor to provide gpaddr_bits we have two options:
> - The safe option is to use minimum possible value which is 32 bits on Arm64. But, there would be of no practical use.
> - The unsafe option is to use let's say "default" 40 bits and pray it will work in all cases on Arm64 (it is ok on Arm32).
> 
> So we definitely need to query the hypervisor. As it turned out the sysctl approach is not welcome, in the long term we want to have this
> information per domain. I have been absolutely OK with that valid ask since RFC, I just wanted to know what was the preferred way to do
> this (new domctl, existing, etc)...
> 
> I analyzed what Julien had suggested regarding pass gpaddr_bits via Arm's struct xen_arch_domainconfig (I assume, this should be an OUT
> parameter) and I think it makes sense. Taking into the account that the feature freeze date is coming, I will wait a few days, and if there
> are no objections I will send updated version (patch #3 also needs updating as it expects the gpaddr_bits to be in physinfo).


No objections from me, I think Julien's suggestion is a good one.
--8323329-254547066-1633381901=:3209--

