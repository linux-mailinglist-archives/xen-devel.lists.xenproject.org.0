Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3092F750
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 10:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757829.1166963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSC2n-0006cV-GI; Fri, 12 Jul 2024 08:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757829.1166963; Fri, 12 Jul 2024 08:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSC2n-0006aQ-DG; Fri, 12 Jul 2024 08:54:21 +0000
Received: by outflank-mailman (input) for mailman id 757829;
 Fri, 12 Jul 2024 08:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJMA=OM=bounce.vates.tech=bounce-md_30504962.6690ef37.v1-423b19155ec440f2984a98f470f83f25@srs-se1.protection.inumbo.net>)
 id 1sSC2l-0006aK-RD
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 08:54:19 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51bd96a4-402c-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 10:54:18 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WL54R6BfvzB5pJRr
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 08:54:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 423b19155ec440f2984a98f470f83f25; Fri, 12 Jul 2024 08:54:15 +0000
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
X-Inumbo-ID: 51bd96a4-402c-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720774455; x=1721034955;
	bh=qO+oiOH3WwbHOST6Fe1XF8IjBj7vKdUGEsF74kvqpPM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wudujk5a322O2+KxR7079qcfh05F5NWen93H5mjdX3qVpPkRX8gBQm6++ghf0Arfb
	 p1AwK+Lgv4Xm09qPm/xSrfCcCIX2vSUuq6M5/vVTvh3gydWQKFjPTyeAU/Twzb+tx/
	 3X6FBd9Upp67jKd3Q+lWdXgDJ+suE9K1YrDdzsvyxUg9cQm2QWcXo1Kuxd69+61X+o
	 /neoaDwRR/1XbCm1rxy1Pvb1furM1uDjMNaK3mV3ycNwI63r9K0wgEZNmuwlhWNihX
	 uO3ZSQZcoHlyk18KUux+zf0t+wBnHmXiFUPxi7umcuwZx1ppxwZosu5xAqTP9CJ1Ab
	 YERP5esNB/3gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720774455; x=1721034955; i=teddy.astie@vates.tech;
	bh=qO+oiOH3WwbHOST6Fe1XF8IjBj7vKdUGEsF74kvqpPM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QpSGLllITLdfBJxnNRBxMPR6ztcGHtJXiQdA7OZXX07Vk3vqrZG1lxegIROjYOlTq
	 kK553C8W48K0kzC5LPkjgUUtl5MXmoO3T9NHMhCAZ8oPVj4OoG4hsrSSaAZ/5y9Tqa
	 216t4rLGUCk3gOzxTF48YpWwLUuYVXL7B2DTF9w3+H7E4zRBNiheg9fTn0eDsUKkJV
	 bhI1El5lzShyd5jtZcBCEmWh6EoN9CVJP2lmjLE5WcYyASE09o2d/Mr7SbL60ifACF
	 Nb8dcJKPE1XhHMwcn+kRepcEycw76Vnpd3J6OozBEBi3Ce314giSQEPwKA7C1e2o9s
	 Ifs5GKfOyLRXg==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v3=201/5]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720774454181
Message-Id: <3792a096-24fb-4e35-8362-f85a100332f9@vates.tech>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1720703078.git.teddy.astie@vates.tech> <cf749c46f9d3d91bc116c96ee2fd1869164fbe5b.1720703078.git.teddy.astie@vates.tech> <D2MX6BEZAYQG.27FQPQ45OAEHA@cloud.com>
In-Reply-To: <D2MX6BEZAYQG.27FQPQ45OAEHA@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.423b19155ec440f2984a98f470f83f25?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 08:54:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Alejandro, thanks for reply !

Le 11/07/2024 =C3=A0 20:26, Alejandro Vallejo a =C3=A9crit=C2=A0:
> Disclaimer: I haven't looked at the code yet.
> 
> On Thu Jul 11, 2024 at 3:04 PM BST, Teddy Astie wrote:
>> Some operating systems want to use IOMMU to implement various features (=
e.g
>> VFIO) or DMA protection.
>> This patch introduce a proposal for IOMMU paravirtualization for Dom0.
>>
>> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   docs/designs/pv-iommu.md | 105 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>   create mode 100644 docs/designs/pv-iommu.md
>>
>> diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
>> new file mode 100644
>> index 0000000000..c01062a3ad
>> --- /dev/null
>> +++ b/docs/designs/pv-iommu.md
>> @@ -0,0 +1,105 @@
>> +# IOMMU paravirtualization for Dom0
>> +
>> +Status: Experimental
>> +
>> +# Background
>> +
>> +By default, Xen only uses the IOMMU for itself, either to make device a=
dress
>> +space coherent with guest adress space (x86 HVM/PVH) or to prevent devi=
ces
>> +from doing DMA outside it's expected memory regions including the hyper=
visor
>> +(x86 PV).
> 
> "By default...": Do you mean "currently"?
> 

Yes, that's what I mean with default here.

>> +
>> +[1] VFIO - "Virtual Function I/O" - https://www.kernel.org/doc/html/lat=
est/driver-api/vfio.html
>> +
>> +# Design
>> +
>> +The operating system may want to have access to various IOMMU features =
such as
>> +context management and DMA remapping. We can create a new hypercall tha=
t allows
>> +the guest to have access to a new paravirtualized IOMMU interface.
>> +
>> +This feature is only meant to be available for the Dom0, as DomU have s=
ome
>> +emulated devices that can't be managed on Xen side and are not hardware=
, we
>> +can't rely on the hardware IOMMU to enforce DMA remapping.
> 
> Is that the reason though? While it's true we can't mix emulated and real
> devices under the same emulated PCI bus covered by an IOMMU, nothing prev=
ents us
> from stating "the IOMMU(s) configured via PV-IOMMU cover from busN to bus=
M".
> 
> AFAIK, that already happens on systems with several IOMMUs, where they mi=
ght
> affect partially disjoint devices. But I admit I'm no expert on this.
>
I am not a expert on how emulated devices are exposed, but the guest 
will definitely need a way to know if a device is hardware or not.

But I think the situation will be different whether we do PV or HVM. In 
PV, there is no emulated device AFAIK, so no need for identifying. In 
case of HVM, there is though, which we should consider.

There is still the question of interactions between eventual future 
IOMMU emulation (VT-d with QEMU) that can be allowed to act on real 
devices (e.g by relying on the new IOMMU infrastructure) and PV-IOMMU.

> I can definitely see a lot of interesting use cases for a PV-IOMMU interf=
ace
> exposed to domUs (it'd be a subset of that of dom0, obviously); that'd
> allow them to use the IOMMU without resorting to 2-stage translation, whi=
ch has
> terrible IOTLB miss costs.
> 

Makes sense, could be useful for e.g storage domains with support for 
SPDK. Do note that 2-stage IOMMU translation is only supported by very 
modern hardware (e.g Xeon Scalable 4th gen).

>> +
>> +This interface is exposed under the `iommu_op` hypercall.
>> +
>> +In addition, Xen domains are modified in order to allow existence of se=
veral
>> +IOMMU context including a default one that implement default behavior (=
e.g
>> +hardware assisted paging) and can't be modified by guest. DomU cannot h=
ave
>> +contexts, and therefore act as if they only have the default domain.
>> +
>> +Each IOMMU context within a Xen domain is identified using a domain-spe=
cific
>> +context number that is used in the Xen IOMMU subsystem and the hypercal=
l
>> +interface.
>> +
>> +The number of IOMMU context a domain can use is predetermined at domain=
 creation
>> +and is configurable through `dom0-iommu=3Dnb-ctx=3DN` xen cmdline.
> 
> nit: I think it's more typical within Xen to see "nr" rather than "nb"
> 

yes

>> +
>> +# IOMMU operations
>> +
>> +## Alloc context
>> +
>> +Create a new IOMMU context for the guest and return the context number =
to the
>> +guest.
>> +Fail if the IOMMU context limit of the guest is reached.
> 
> or -ENOMEM, I guess.
> 
> I'm guessing from this dom0 takes care of the contexts for guests? Or are=
 these
> contexts for use within dom0 exclusively?
>

Each domain has a set of "IOMMU context" that can be allocated and freed 
(up to a fixed limit at creation of domain).
If there is no available context (if the context number limit is hit), I 
choosed -ENOSPC as error return (-ENOMEM is reserved for lack of memory 
which can also happens).

>> +
>> +A flag can be specified to create a identity mapping.
>> +
>> +## Free context
>> +
>> +Destroy a IOMMU context created previously.
>> +It is not possible to free the default context.
>> +
>> +Reattach context devices to default context if specified by the guest.
>> +
>> +Fail if there is a device in the context and reattach-to-default flag i=
s not
>> +specified.
>> +
>> +## Reattach device
>> +
>> +Reattach a device to another IOMMU context (including the default one).
>> +The target IOMMU context number must be valid and the context allocated=
.
>> +
>> +The guest needs to specify a PCI SBDF of a device he has access to.
>> +
>> +## Map/unmap page
>> +
>> +Map/unmap a page on a context.
>> +The guest needs to specify a gfn and target dfn to map.
> 
> And an "order", I hope; to enable superpages and hugepages without having=
 to
> find out after the fact that the mappings are in fact mergeable and the l=
eaf PTs
> can go away.
> 

In my implementation, I added a "nr_page" parameter to specify how much 
page can be mapped at once (and you can derive the superpages using 
this), I think as you suppose, it can be useful to try optimizing the 
map operation by mapping superpages directly.
The biggest problem is the superpage mapping we would like is going to 
only be valid if the target page of the domain is also a superpage 
(because the actual mapped region will also need to be contiguous in 
actual physical memory, not just from guest point of view)

>> +
>> +## Hardware without IOMMU support
>> +
>> +Operating system needs to be aware on PV-IOMMU capability, and whether =
it is
>> +able to make contexts. However, some operating system may critically fa=
il in
>> +case they are able to make a new IOMMU context. Which is supposed to ha=
ppen
>> +if no IOMMU hardware is available.
>> +
>> +The hypercall interface needs a interface to advertise the ability to c=
reate
>> +and manage IOMMU contexts including the amount of context the guest is =
able
>> +to use. Using these informations, the Dom0 may decide whether to use or=
 not
>> +the PV-IOMMU interface.
> 
> We could just return -ENOTSUPP when there's no IOMMU, then encapsulate a =
random
> lookup with pv_iommu_is_present() and return true or false depending on r=
c.
> 

-ENOTSUPP makes sense, another way that I use to report no support for 
PV-IOMMU is to report limits that means "no operation is actually 
possible" (e.g max_ctx_no =3D 0).

>> +
>> +## Page pool for contexts
>> +
>> +In order to prevent unexpected starving on the hypervisor memory with a
>> +buggy Dom0. We can preallocate the pages the contexts will use and make
>> +map/unmap use these pages instead of allocating them dynamically.
>> +
> 
> That seems dangerous should we need to shatter a superpage asynchronously=
 (i.e:
> due to HW misbehaving and requiring it) and have no more pages in the poo=
l.
> 

Superpage shattering is actually recoverable (if you fail to allocate 
the new leafs, you just keep the superpage entry and do as if nothing 
happened), and report -ENOMEM. Nothing happened from hardware point of view=
.

The modification of the superpage entry into a regular one is only done 
once the leafs are actually valid. A similar story happens when 
collapsing leafs into superpages (you can free the leafs only once the 
hardware doesn't use it anymore e.g after a relevant iotlb_flush).

> Cheers,
> Alejandro

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


