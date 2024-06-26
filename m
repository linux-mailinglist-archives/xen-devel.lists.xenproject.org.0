Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B009182C7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748940.1156923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSsk-0003xd-J7; Wed, 26 Jun 2024 13:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748940.1156923; Wed, 26 Jun 2024 13:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSsk-0003uL-FR; Wed, 26 Jun 2024 13:40:18 +0000
Received: by outflank-mailman (input) for mailman id 748940;
 Wed, 26 Jun 2024 13:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDEV=N4=bounce.vates.tech=bounce-md_30504962.667c1a3d.v1-c22b7e43069140ac8c1ddb7c088bb1f3@srs-se1.protection.inumbo.net>)
 id 1sMSsj-0001bd-0Z
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:40:17 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e055e52-33c1-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:40:15 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W8N9n5MLGz5QkLrN
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 13:40:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c22b7e43069140ac8c1ddb7c088bb1f3; Wed, 26 Jun 2024 13:40:13 +0000
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
X-Inumbo-ID: 9e055e52-33c1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719409213; x=1719669713;
	bh=JHEddISG4C8qf11Zeb09KyLMyQLm7fuVNthb0dV6qkI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Mq8Hs7ycLARiul2BsSSwPeP5OR4um8PD9i76YcI63zkjnq0Bk6J0GfyGT6WlFsZsk
	 L+bJPjxhZetWxdKbZlxnmMsmL7QZLV7Kbq+b+m9HijP+wE7PoxJhnJBlpv3KjBbftV
	 V6eKKH3tOXTVa7+lKpd8xX5xZyyBbc3kP22yZo9LMld/fAd1Ayt2bgUJFQsk3LnRg0
	 cyvH2uDD6pGwbl/B3yUzj7rPnLGqFzs4VOjftsK7GkxtDBTJAPMHxQJSlTZqUqcASP
	 HiYdNCxVlCao2ozHofwVOUv9kFW6IYMmDsUF6gNT/TDWGo3VK1uAR7OOH1fprEBksV
	 wH572luYfwmpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719409213; x=1719669713; i=teddy.astie@vates.tech;
	bh=JHEddISG4C8qf11Zeb09KyLMyQLm7fuVNthb0dV6qkI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vudwB/au3fXMW7xvJ7yVPUQHyZ/fF6k6beOL8RcukZeWA8UwI2LivHrcsV7On7zrT
	 oBfRNroUgUFN0VZZyo1MJPw42h1ymzK8pUQha8dAKMhbw5jx4JiR8fmff+zhNRz1yt
	 4AmQ3MbTptWRyFx38r5Kl02uj/qEt9g5+wDapWNHaWBcHXqrethCA/m3E/ydkoOlZ3
	 rWY4aaNebfK08QRtk0rwesUazAWhDMg0URLFO8dJnac4Gw3fhjIZxxNhSZ88rMZngY
	 hERyNLVJysRHwFGN6MoRjm5pxMunN6wL2lyRDVdxLEnIE6NBhUmVT2ptt1Mm5ypGv0
	 1gb1jLO8nyE2g==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v2]=20iommu/xen:=20Add=20Xen=20PV-IOMMU=20driver?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719409210959
Message-Id: <cc5c2e1d-f5bd-47b3-830f-4bb5298ac106@vates.tech>
To: Robin Murphy <robin.murphy@arm.com>, xen-devel@lists.xenproject.org, iommu@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech> <da3ec316-b001-4711-b323-70af3e6bb014@arm.com> <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech> <c4dc539b-a71b-4323-aa31-b97b39c633a8@arm.com>
In-Reply-To: <c4dc539b-a71b-4323-aa31-b97b39c633a8@arm.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c22b7e43069140ac8c1ddb7c088bb1f3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240626:md
Date: Wed, 26 Jun 2024 13:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Robin,

Le 26/06/2024 =C3=A0 14:09, Robin Murphy a =C3=A9crit=C2=A0:
> On 2024-06-24 3:36 pm, Teddy Astie wrote:
>> Hello Robin,
>> Thanks for the thourough review.
>>
>>>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>>>> index 0af39bbbe3a3..242cefac77c9 100644
>>>> --- a/drivers/iommu/Kconfig
>>>> +++ b/drivers/iommu/Kconfig
>>>> @@ -480,6 +480,15 @@ config VIRTIO_IOMMU
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y here if you int=
end to run this kernel as a guest.
>>>> +config XEN_IOMMU
>>>> +=C2=A0=C2=A0=C2=A0 bool "Xen IOMMU driver"
>>>> +=C2=A0=C2=A0=C2=A0 depends on XEN_DOM0
>>>
>>> Clearly this depends on X86 as well.
>>>
>> Well, I don't intend this driver to be X86-only, even though the current
>> Xen RFC doesn't support ARM (yet). Unless there is a counter-indication
>> for it ?
> 
> It's purely practical - even if you drop the asm/iommu.h stuff it would 
> still break ARM DOM0 builds due to HYPERVISOR_iommu_op() only being 
> defined for x86. And it's better to add a dependency here to make it 
> clear what's *currently* supported, than to add dummy code to allow it 
> to build for ARM if that's not actually tested or usable yet.
> 

Ok, it does exist from the hypervisor side (even though a such Xen build 
is not possible yet), I suppose I just need to add relevant hypercall 
interfaces for arm/arm64 in hypercall{.S,.h}.

>>>> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 switch (cap) {
>>>> +=C2=A0=C2=A0=C2=A0 case IOMMU_CAP_CACHE_COHERENCY:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>
>>> Will the PV-IOMMU only ever be exposed on hardware where that really is
>>> always true?
>>>
>>
>> On the hypervisor side, the PV-IOMMU interface always implicitely flush
>> the IOMMU hardware on map/unmap operation, so at the end of the
>> hypercall, the cache should be always coherent IMO.
> 
> As Jason already brought up, this is not about TLBs or anything cached 
> by the IOMMU itself, it's about the memory type(s) it can create 
> mappings with. Returning true here says Xen guarantees it can use a 
> cacheable memory type which will let DMA snoop the CPU caches. 
> Furthermore, not explicitly handling IOMMU_CACHE in the map_pages op 
> then also implies that it will *always* do that, so you couldn't 
> actually get an uncached mapping even if you wanted one.
> 

Yes, this is a point we are currently discussing on the Xen side.

>>>> +=C2=A0=C2=A0=C2=A0 while (xen_pg_count) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t to_unmap =3D min(xe=
n_pg_count, max_nr_pages);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //pr_info("Unmapping %lx-%=
lx\n", dfn, dfn + to_unmap - 1);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.unmap_pages.dfn =3D dfn=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op.unmap_pages.nr_pages =
=3D to_unmap;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D HYPERVISOR_iommu_o=
p(&op);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_warn("Unmap failure (%lx-%lx)\n", dfn, dfn + to_unmap
>>>> - 1);
>>>
>>> But then how
>>>> would it ever happen anyway? Unmap is a domain op, so a domain which
>>>> doesn't allow unmapping shouldn't offer it in the first place...
>>
>> Unmap failing should be exceptionnal, but is possible e.g with
>> transparent superpages (like Xen IOMMU drivers do). Xen drivers folds
>> appropriate contiguous mappings into superpages entries to optimize
>> memory usage and iotlb. However, if you unmap in the middle of a region
>> covered by a superpage entry, this is no longer a valid superpage entry,
>> and you need to allocate and fill the lower levels, which is faillible
>> if lacking memory.
> 
> OK, so in the worst case you could potentially have a partial unmap 
> failure if the range crosses a superpage boundary and the end part 
> happens to have been folded, and Xen doesn't detect and prepare that 
> allocation until it's already unmapped up to the boundary. If that is 
> so, does the hypercall interface give any information about partial 
> failure, or can any error only be taken to mean that some or all of the 
> given range may or may not have be unmapped now?

The hypercall interface has op.unmap_page.unmapped to indicate the real 
amount of pages actually unmapped even in case of error. If it is less 
than requested initially, it will retry with the remaining part, 
certainly fail afterward. Although, I have the impression that it is 
going to fail silently.

>>> In this case I'd argue that you really *do* want to return short, in th=
e
>>> hope of propagating the error back up and letting the caller know the
>>> address space is now messed up before things start blowing up even more
>>> if they keep going and subsequently try to map new pages into
>>> not-actually-unmapped VAs.
>>
>> While mapping on top of another mapping is ok for us (it's just going to
>> override the previous mapping), I definetely agree that having the
>> address space messed up is not good.
> 
> Oh, indeed, quietly replacing existing PTEs might help paper over errors 
> in this particular instance, but it does then allow *other* cases to go 
> wrong in fun and infuriating ways :)
> 

Yes, but I was wrong at my stance. Our hypercall interface doesn't allow 
mapping on top of another one (it's going to fail with -EADDRINUSE). So 
unmap failing is still going to cause bad issues.

Should iommu_unmap and related code consider the cases where unmapped !=3D 
size and report it appropriately ? So such cases, if ever happening will 
be reported louder and not failing silently.

>>>> +static struct iommu_domain default_domain =3D {
>>>> +=C2=A0=C2=A0=C2=A0 .ops =3D &(const struct iommu_domain_ops){
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .attach_dev =3D default_do=
main_attach_dev
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +};
>>>
>>> Looks like you could make it a static xen_iommu_domain and just use the
>>> normal attach callback? Either way please name it something less
>>> confusing like xen_iommu_identity_domain - "default" is far too
>>> overloaded round here already...
>>>
>>
>> Yes, although, if in the future, we can have either this domain as
>> identity or blocking/paging depending on some upper level configuration.
>> Should we have both identity and blocking domains, and only setting the
>> relevant one in iommu_ops, or keep this naming.
> 
> That's something that can be considered if and when it does happen. For 
> now, if it's going to be pre-mapped as an identity domain, then let's 
> just treat it as such and keep things straightforward.
> 

Let's name it xen_iommu_identity_domain.

>>>> +void __exit xen_iommu_fini(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 pr_info("Unregistering Xen IOMMU driver\n");
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 iommu_device_unregister(&xen_iommu_device);
>>>> +=C2=A0=C2=A0=C2=A0 iommu_device_sysfs_remove(&xen_iommu_device);
>>>> +}
>>>
>>> This is dead code since the Kconfig is only "bool". Either allow it to
>>> be an actual module (and make sure that works), or drop the pretence
>>> altogether.
>>>
>>
>> Ok, I though this function was actually a requirement even if it is not
>> a module.
> 
> No, quite the opposite - even code which is modular doesn't have to 
> support removal if it doesn't want to.
> 

Ok

> Thanks,
> Robin.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


