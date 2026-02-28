Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJCRDGNIomke1gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 02:44:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7631BFC64
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 02:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243318.1543273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw9MD-0002bt-Rz; Sat, 28 Feb 2026 01:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243318.1543273; Sat, 28 Feb 2026 01:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw9MD-0002Za-NX; Sat, 28 Feb 2026 01:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1243318;
 Sat, 28 Feb 2026 01:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eoy0=BA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vw9MC-0002ZU-VA
 for xen-devel@lists.xenproject.org; Sat, 28 Feb 2026 01:43:01 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc8b8db3-1446-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 02:42:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0D4EE6057A;
 Sat, 28 Feb 2026 01:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBB0C19422;
 Sat, 28 Feb 2026 01:42:51 +0000 (UTC)
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
X-Inumbo-ID: cc8b8db3-1446-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772242972;
	bh=QWxFQqcImv7PUWhFYJ4t2rsrZuzrFQJtZYWOFWoYlkA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HzNwHMkKDmvkEKzfVwUOT9nofbGoTNeAvpcERivYdV9Dihn/yLCcBz720zGa7AetO
	 iwXxy0jxIvC0hfmhaRl7fgF1wJ9UmZZtMEf/Nb3Lcr7v20KDANnC2VcxQ1rkcv1jg9
	 OK0Iw8IYUk8Y9ntsOL9KUfYM6GaaSOTC095J1IhYGaslwyaKkcEHw3OEoHl9lKnVOE
	 sYGdPUX+o10NABlIPEYktCLwUAY8+FhLSGEAM0mMmfWCcAS8e2bRJ2IjPykZLM6emB
	 XW/YpMYrXavR0NbnuQfdhTIJFkeEgvPQkgwsoHBl+cdXA9tm09AxLiIxu5Ab9Rbppy
	 YQ7O75FQW1t3A==
Date: Fri, 27 Feb 2026 17:42:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Romain Caritey <Romain.Caritey@microchip.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
In-Reply-To: <74060a96-110f-4d6f-bbad-361021315884@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com> <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com> <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com> <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
 <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com> <5eb4ba3b-f7b6-4cfb-ab67-60198c3f8572@gmail.com> <0c0061ab-acdb-4ceb-92e2-ca4e591ee741@suse.com> <ab0b7dcf-c607-43d3-bb1c-f782c3a71332@gmail.com> <74060a96-110f-4d6f-bbad-361021315884@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,microchip.com,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D7631BFC64
X-Rspamd-Action: no action

On Wed, 18 Feb 2026, Jan Beulich wrote:
> On 18.02.2026 15:38, Oleksii Kurochko wrote:
> > On 2/18/26 2:12 PM, Jan Beulich wrote:
> >> On 18.02.2026 13:58, Oleksii Kurochko wrote:
> >>> On 2/17/26 8:34 AM, Jan Beulich wrote:
> >>>> On 16.02.2026 19:42, Stefano Stabellini wrote:
> >>>>> On Mon, 16 Feb 2026, Jan Beulich wrote:
> >>>>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
> >>>>>>> domain_use_host_layout() is generic enough to be moved to the
> >>>>>>> common header xen/domain.h.
> >>>>>> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
> >>>>>>
> >>>>>>> --- a/xen/include/xen/domain.h
> >>>>>>> +++ b/xen/include/xen/domain.h
> >>>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
> >>>>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
> >>>>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> >>>>>>>    
> >>>>>>> +/*
> >>>>>>> + * Is the domain using the host memory layout?
> >>>>>>> + *
> >>>>>>> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
> >>>>>>> + * To avoid any trouble finding space, it is easier to force using the
> >>>>>>> + * host memory layout.
> >>>>>>> + *
> >>>>>>> + * The hardware domain will use the host layout regardless of
> >>>>>>> + * direct-mapped because some OS may rely on a specific address ranges
> >>>>>>> + * for the devices.
> >>>>>>> + */
> >>>>>>> +#ifndef domain_use_host_layout
> >>>>>>> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
> >>>>>>> +                                    is_hardware_domain(d))
> >>>>>> ... is_domain_direct_mapped() isn't something that I'd like to see further
> >>>>>> proliferate in common (non-DT) code.
> >>>>> Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
> >>>>> domain) on x86 as well. In fact, we already have a working prototype,
> >>>>> although it is not suitable for upstream yet.
> >>>>>
> >>>>> In addition to the PSP use case that we discussed a few months ago,
> >>>>> where the PSP is not behind an IOMMU and therefore exchanged addresses
> >>>>> must be 1:1 mapped, we also have a new use case. We are running the full
> >>>>> Xen-based automotive stack on an Azure instance where SVM (vmentry and
> >>>>> vmexit) is available, but an IOMMU is not present. All virtual machines
> >>>>> are configured as PVH.
> >>>> Hmm. Then adjustments need making, for commentary and macro to be correct
> >>>> on x86. First and foremost none of what is there is true for PV.
> >>> As is_domain_direct_mapped() returns always false for x86, so
> >>> domain_use_host_layout macro will return incorrect value for non-hardware
> >>> domains (dom0?). And as PV domains are not auto_translated domains so are
> >>> always direct-mapped, so technically is_domain_direct_mapped() (or
> >>> domain_use_host_layout()) should return true in such case.
> >> Hmm? PV domains aren't direct-mapped. Direct-map was introduced by Arm for
> >> some special purpose (absence of IOMMU iirc).
> > 
> > I made such conclusion because of the comments in the code mentioned below:
> >   - https://elixir.bootlin.com/xen/v4.21.0/source/tools/libs/guest/xg_dom_x86.c#L1880
> >   - https://elixir.bootlin.com/xen/v4.21.0/source/xen/include/public/features.h#L107
> > 
> > Also, in the comment where it is introduced (d66bf122c0a "xen: introduce XENFEAT_direct_mapped and XENFEAT_not_direct_mapped")
> > is mentioned that:
> >    XENFEAT_direct_mapped is always set for not auto-translated guests.
> 
> Hmm, this you're right with, and XENVER_get_features handling indeed has
> 
>             if ( !paging_mode_translate(d) || is_domain_direct_mapped(d) )
>                 fi.submap |= (1U << XENFEAT_direct_mapped);
> 
> Which now I have a vague recollection of not having been happy with back at
> the time. Based solely on the GFN == MFN statement this may be correct, but
> "GFN" is a questionable term for PV in the first place. See how e.g.
> common/memory.c resorts to using GPFN and GMFN, in line with commentary in
> public/memory.h.
> 
> What the above demonstrates quite well though is that there's no direct
> relationship between XENFEAT_direct_mapped and is_domain_direct_mapped().

Let's start from the easy case: domain_use_host_layout.

domain_use_host_layout is meant to indicate whether the domain memory
map (e.g. the address of the interrupt controller, the start of RAM,
etc.) matches the host memory map or not.

It is implemented as:

#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
                                   is_hardware_domain(d))

Because on ARM there are two cases:
1) hardware domain is always using the host layout
2) non-hardware domain only use the host layout when directly mapped
(more on the later)


I think this can be generalized and made arch-neutral with the caveat
that it should return False for PV guests as Jan mentioned. After all
the virtual interrupt controller in a PV domain doesn't start at the
same guest physical address of the real interrupt controller. The
comment can be improved, but let's get to it after we talk about
is_domain_direct_mapped.


is_domain_direct_mapped is meant to indicate that a domain's memory is
allocated 1:1 such that GFN == MFN. is_domain_direct_mapped is easily
applicable as-is to PVH and HVM guests where there are two stages of
translation.

What about PV guests? One could take the stance that given that there
are no real GFN space, then GFN is always the same as MFN. But this is
more philosophical than practical.

Practically, is_domain_direct_mapped() triggers a different code path in
xen/common/memory.c:populate_physmap for contiguous 1:1 memory
allocations which is probably undesirable for PV guests.

Practically, there is a related flag exposed to Linux
XENFEAT_direct_mapped. For HVM/PVH guests makes sense to be one and the
same as is_domain_direct_mapped(). This flag is used by Linux to know
whether it can use swiotlb-xen or not. Specifically, swiotlb-xen is only
usable when XENFEAT_direct_mapped is enabled for ARM guests and the
principle could apply to HVM/PVH guests too. What about PV guests?
They also make use of swiotlb-xen and XENFEAT_direct_mapped is set to
True for PV guests today.


In conclusion, is_domain_direct_mapped() was born for autotranslated
guests and is meant to trigger large contigous memory allocations is Xen
and permit the usage of swiotlb-xen in Linux. For PV guests, while we
want swiotlb-xen and the XENFEAT_direct_mapped flag is already set to
True, we don't want to change the memory allocation scheme. 

So I think is_domain_direct_mapped() should be always False on x86:
- PV guests should be always False
- PVH/HVM guests could be True but it is currently unimplemented (AMD
  is working on an implementation)

For compatibility and functionality, XENFEAT_direct_mapped should be
left as is.

The implementation of domain_use_host_layout() can be moved to common
code with a change:


/*
 * Is the auto-translated domain using the host memory layout?
 *
 * domain_use_host_layout() is always False for PV guests.
 *
 * Direct-mapped domains (autotranslated domains with memory allocated
 * contiguously and mapped 1:1 so that GFN == MFN) are always using the
 * host memory layout to avoid address clashes.
 *
 * The hardware domain will use the host layout (regardless of
 * direct-mapped) because some OS may rely on a specific address ranges
 * for the devices. PV Dom0, like any other PV guests, has
 * domain_use_host_layout() returning False.
 */
#define domain_use_host_layout(d) (is_domain_direct_mapped(d) ||
                                   (paging_mode_translate(d) &&
                                    is_hardware_domain(d)))


