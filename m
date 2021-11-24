Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02745B3C9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230045.397750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkdd-0001wq-FP; Wed, 24 Nov 2021 05:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230045.397750; Wed, 24 Nov 2021 05:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkdd-0001tm-Bq; Wed, 24 Nov 2021 05:16:09 +0000
Received: by outflank-mailman (input) for mailman id 230045;
 Wed, 24 Nov 2021 05:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQO5=QL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mpkdc-0001tg-9j
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 05:16:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a01e3110-4ce5-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 06:16:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C76431FD37;
 Wed, 24 Nov 2021 05:16:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52F5B13EC2;
 Wed, 24 Nov 2021 05:16:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QP/zEZXKnWHjZgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Nov 2021 05:16:05 +0000
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
X-Inumbo-ID: a01e3110-4ce5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637730965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXLbVTFQswpcW1T0zr6kJg00Md2ajNbGOAaNQSLRhvU=;
	b=nD8rzJ3o9h1MQnzxOkIILIgvd3xpbzs/DGZ/e1XmtI11TA3eDEGv7bqAOeaSSJpihRogAE
	Sy6/bhbc2ymt6WNfOPOsdouPM5si1ThlhAoFrfTYrt0TeDhHWlE5IW6G3+ORdMBMtdKJed
	paWt6a/NE8Ap2SNSFSuXTlNct0EbvVM=
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s>
 <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
 <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
 <f1f1025b-911d-3d27-f408-9c042bc4fca4@gmail.com>
 <alpine.DEB.2.22.394.2111191809100.1412361@ubuntu-linux-20-04-desktop>
 <76163855-c5eb-05db-2f39-3c6bfee46345@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d0b851a5-6546-3958-7d4c-9436f574d62e@suse.com>
Date: Wed, 24 Nov 2021 06:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <76163855-c5eb-05db-2f39-3c6bfee46345@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0zbYD8Udb611Ee1FeeRnGZCxfY94x1rLa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0zbYD8Udb611Ee1FeeRnGZCxfY94x1rLa
Content-Type: multipart/mixed; boundary="vYRbg6aD15TTF9AEtbMSp4LSwBRmT1vYD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>
Message-ID: <d0b851a5-6546-3958-7d4c-9436f574d62e@suse.com>
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s>
 <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
 <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
 <f1f1025b-911d-3d27-f408-9c042bc4fca4@gmail.com>
 <alpine.DEB.2.22.394.2111191809100.1412361@ubuntu-linux-20-04-desktop>
 <76163855-c5eb-05db-2f39-3c6bfee46345@gmail.com>
In-Reply-To: <76163855-c5eb-05db-2f39-3c6bfee46345@gmail.com>

--vYRbg6aD15TTF9AEtbMSp4LSwBRmT1vYD
Content-Type: multipart/mixed;
 boundary="------------D91E9B4B1E22D8AFFDA252EE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D91E9B4B1E22D8AFFDA252EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.11.21 17:46, Oleksandr wrote:
>=20
> On 20.11.21 04:19, Stefano Stabellini wrote:
>=20
> Hi Stefano, Juergen, all
>=20
>=20
>> Juergen please see the bottom of the email
>>
>> On Fri, 19 Nov 2021, Oleksandr wrote:
>>> On 19.11.21 02:59, Stefano Stabellini wrote:
>>>> On Tue, 9 Nov 2021, Oleksandr wrote:
>>>>> On 28.10.21 19:37, Stefano Stabellini wrote:
>>>>>
>>>>> Hi Stefano
>>>>>
>>>>> I am sorry for the late response.
>>>>>
>>>>>> On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>
>>>>>>> The main reason of this change is that unpopulated-alloc
>>>>>>> code cannot be used in its current form on Arm, but there
>>>>>>> is a desire to reuse it to avoid wasting real RAM pages
>>>>>>> for the grant/foreign mappings.
>>>>>>>
>>>>>>> The problem is that system "iomem_resource" is used for
>>>>>>> the address space allocation, but the really unallocated
>>>>>>> space can't be figured out precisely by the domain on Arm
>>>>>>> without hypervisor involvement. For example, not all device
>>>>>>> I/O regions are known by the time domain starts creating
>>>>>>> grant/foreign mappings. And following the advise from
>>>>>>> "iomem_resource" we might end up reusing these regions by
>>>>>>> a mistake. So, the hypervisor which maintains the P2M for
>>>>>>> the domain is in the best position to provide unused regions
>>>>>>> of guest physical address space which could be safely used
>>>>>>> to create grant/foreign mappings.
>>>>>>>
>>>>>>> Introduce new helper arch_xen_unpopulated_init() which purpose
>>>>>>> is to create specific Xen resource based on the memory regions
>>>>>>> provided by the hypervisor to be used as unused space for Xen
>>>>>>> scratch pages.
>>>>>>>
>>>>>>> If arch doesn't implement arch_xen_unpopulated_init() to
>>>>>>> initialize Xen resource the default "iomem_resource" will be used=
=2E
>>>>>>> So the behavior on x86 won't be changed.
>>>>>>>
>>>>>>> Also fall back to allocate xenballooned pages (steal real RAM
>>>>>>> pages) if we do not have any suitable resource to work with and
>>>>>>> as the result we won't be able to provide unpopulated pages.
>>>>>>>
>>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.co=
m>
>>>>>>> ---
>>>>>>> Changes RFC -> V2:
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - new patch, instead of
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "[RFC PATCH 2/2] xen/unpopul=
ated-alloc: Query hypervisor to
>>>>>>> provide
>>>>>>> unallocated space"
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0=C2=A0 drivers/xen/unpopulated-alloc.c | 89
>>>>>>> +++++++++++++++++++++++++++++++++++++++--
>>>>>>> =C2=A0=C2=A0=C2=A0 include/xen/xen.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>>>>>>> =C2=A0=C2=A0=C2=A0 2 files changed, 88 insertions(+), 3 deletions=
(-)
>>>>>>>
>>>>>>> diff --git a/drivers/xen/unpopulated-alloc.c
>>>>>>> b/drivers/xen/unpopulated-alloc.c
>>>>>>> index a03dc5b..1f1d8d8 100644
>>>>>>> --- a/drivers/xen/unpopulated-alloc.c
>>>>>>> +++ b/drivers/xen/unpopulated-alloc.c
>>>>>>> @@ -8,6 +8,7 @@
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <asm/page.h>
>>>>>>> =C2=A0=C2=A0=C2=A0 +#include <xen/balloon.h>
>>>>>>> =C2=A0=C2=A0=C2=A0 #include <xen/page.h>
>>>>>>> =C2=A0=C2=A0=C2=A0 #include <xen/xen.h>
>>>>>>> =C2=A0=C2=A0=C2=A0 @@ -15,13 +16,29 @@ static DEFINE_MUTEX(list_l=
ock);
>>>>>>> =C2=A0=C2=A0=C2=A0 static struct page *page_list;
>>>>>>> =C2=A0=C2=A0=C2=A0 static unsigned int list_count;
>>>>>>> =C2=A0=C2=A0=C2=A0 +static struct resource *target_resource;
>>>>>>> +static struct resource xen_resource =3D {
>>>>>>> +=C2=A0=C2=A0=C2=A0 .name =3D "Xen unused space",
>>>>>>> +};
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * If arch is not happy with system "iomem_resource" being used =
for
>>>>>>> + * the region allocation it can provide it's own view by=20
>>>>>>> initializing
>>>>>>> + * "xen_resource" with unused regions of guest physical address =

>>>>>>> space
>>>>>>> + * provided by the hypervisor.
>>>>>>> + */
>>>>>>> +int __weak arch_xen_unpopulated_init(struct resource *res)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 return -ENOSYS;
>>>>>>> +}
>>>>>>> +
>>>>>>> =C2=A0=C2=A0=C2=A0 static int fill_list(unsigned int nr_pages)
>>>>>>> =C2=A0=C2=A0=C2=A0 {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pg=
map;
>>>>>>> -=C2=A0=C2=A0=C2=A0 struct resource *res;
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct resource *res, *tmp_res =3D NULL;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *vaddr;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, alloc_=
pages =3D round_up(nr_pages,
>>>>>>> PAGES_PER_SECTION);
>>>>>>> -=C2=A0=C2=A0=C2=A0 int ret =3D -ENOMEM;
>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D kz=
alloc(sizeof(*res), GFP_KERNEL);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!res)
>>>>>>> @@ -30,7 +47,7 @@ static int fill_list(unsigned int nr_pages)
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res->name =3D "Xen scr=
atch";
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res->flags =3D IORESOU=
RCE_MEM | IORESOURCE_BUSY;
>>>>>>> =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 ret =3D allocate_resource(=
&iomem_resource, res,
>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D allocate_resource(target_resource, re=
s,
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc_pages * PAGE_SIZE,=
 0, -1,
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGES_PER_SECTION * PAGE=
_SIZE, NULL,
>>>>>>> NULL);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>>>>> @@ -38,6 +55,31 @@ static int fill_list(unsigned int nr_pages)
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 goto err_resource;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Reserve the region previously allocat=
ed from Xen resource
>>>>>>> to avoid
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * re-using it by someone else.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (target_resource !=3D &iomem_resource) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_res =3D kzalloc(s=
izeof(*tmp_res), GFP_KERNEL);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!res) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D -ENOMEM;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 goto err_insert;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_res->name =3D res=
->name;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_res->start =3D re=
s->start;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_res->end =3D res-=
>end;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_res->flags =3D re=
s->flags;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D insert_resour=
ce(&iomem_resource, tmp_res);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("Cannot insert IOMEM resource [%llx -
>>>>>>> %llx]\n",
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_res->start, tmp_res->end);=

>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 kfree(tmp_res);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 goto err_insert;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> I am a bit confused.. why do we need to do this? Who could be
>>>>>> erroneously re-using the region? Are you saying that the next time=

>>>>>> allocate_resource is called it could find the same region again? I=
t
>>>>>> doesn't seem possible?
>>>>> No, as I understand the allocate_resource() being called for the=20
>>>>> same root
>>>>> resource won't provide the same region... We only need to do this=20
>>>>> (insert
>>>>> the
>>>>> region into "iomem_resource") if we allocated it from our *internal=
*
>>>>> "xen_resource", as *global* "iomem_resource" (which is used=20
>>>>> everywhere) is
>>>>> not
>>>>> aware of that region has been already allocated. So inserting a reg=
ion
>>>>> here we
>>>>> reserving it, otherwise it could be reused elsewhere.
>>>> But elsewhere where?
>>> I think, theoretically everywhere where=20
>>> allocate_resource(&iomem_resource,
>>> ...) is called.
>>>
>>>
>>>> Let's say that allocate_resource allocates a range from xen_resource=
=2E
>>>> =C2=A0 From reading the code, it doesn't look like iomem_resource wo=
uld have
>>>> that range because the extended regions described under /hypervisor =
are
>>>> not added automatically to iomem_resource.
>>>>
>>>> So what if we don't call insert_resource? Nothing could allocate the=

>>>> same range because iomem_resource doesn't have it at all and
>>>> xen_resource is not used anywhere if not here.
>>>>
>>>> What am I missing?
>>>
>>> Below my understanding which, of course, might be wrong.
>>>
>>> If we don't claim resource by calling insert_resource (or even
>>> request_resource) here then the same range could be allocated=20
>>> everywhere where
>>> allocate_resource(&iomem_resource, ...) is called.
>>> I don't see what prevents the same range from being allocated. Why=20
>>> actually
>>> allocate_resource(&iomem_resource, ...) can't provide the same range =

>>> if it is
>>> free (not-reserved-yet) from it's PoV? The comment above=20
>>> allocate_resource()
>>> says "allocate empty slot in the resource tree given range &=20
>>> alignment". So
>>> this "empty slot" could be exactly the same range.
>>>
>>> I experimented with that a bit trying to call
>>> allocate_resource(&iomem_resource, ...) several times in another=20
>>> place to see
>>> what ranges it returns in both cases (w/ and w/o calling insert_resou=
rce
>>> here). So an experiment confirmed (of course, if I made it correctly)=
=20
>>> that the
>>> same range could be allocated if we didn't call insert_resource()=20
>>> here. And as
>>> I understand there is nothing strange here, as iomem_resource covers =
all
>>> address space initially (0, -1) and everything *not*=20
>>> inserted/requested (in
>>> other words, reserved) yet is considered as free and could be=20
>>> provided if fits
>>> constraints. Or I really missed something?
>> Thanks for the explanation! It was me that didn't know that
>> iomem_resource covers all the address space initially. I thought it wa=
s
>> populated only with actual iomem ranges. Now it makes sense, thanks!
>>
>>
>>> It feels to me that it would be better to call request_resource()=20
>>> instead of
>>> insert_resource(). It seems, that if no conflict happens both=20
>>> functions will
>>> behave in same way, but in case of conflict if the conflicting resour=
ce
>>> entirely fit the new resource the former will return an error. I=20
>>> think, this
>>> way we will be able to detect that a range we are trying to reserve=20
>>> is already
>>> present and bail out early.
>>>
>>>
>>>> Or maybe it is the other way around: core Linux code assumes everyth=
ing
>>>> is described in iomem_resource so something under kernel/ or mm/ wou=
ld
>>>> crash if we start using a page pointing to an address missing from
>>>> iomem_resource?
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgmap =3D kzalloc(size=
of(*pgmap), GFP_KERNEL);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pgmap) {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D -ENOMEM;
>>>>>>> @@ -95,12 +137,40 @@ static int fill_list(unsigned int nr_pages)
>>>>>>> =C2=A0=C2=A0=C2=A0 err_memremap:
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(pgmap);
>>>>>>> =C2=A0=C2=A0=C2=A0 err_pgmap:
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (tmp_res) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_resource(tmp_=
res);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(tmp_res);
>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>> +err_insert:
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_resource(res);=

>>>>>>> =C2=A0=C2=A0=C2=A0 err_resource:
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(res);
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>>> =C2=A0=C2=A0=C2=A0 }
>>>>>>> =C2=A0=C2=A0=C2=A0 +static void unpopulated_init(void)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 static bool inited =3D false;
>>>>>> initialized =3D false
>>>>> ok.
>>>>>
>>>>>
>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (inited)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Try to initialize Xen resource the fi=
rst and fall back to
>>>>>>> default
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * resource if arch doesn't offer one.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D arch_xen_unpopulated_init(&xen_resour=
ce);
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!ret)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_resource =3D &=
xen_resource;
>>>>>>> +=C2=A0=C2=A0=C2=A0 else if (ret =3D=3D -ENOSYS)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_resource =3D &=
iomem_resource;
>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Cannot initia=
lize Xen resource\n");
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 inited =3D true;
>>>>>>> +}
>>>>>> Would it make sense to call unpopulated_init from an init function=
,
>>>>>> rather than every time xen_alloc_unpopulated_pages is called?
>>>>> Good point, thank you. Will do. To be honest, I also don't like the=

>>>>> current
>>>>> approach much.
>>>>>
>>>>>
>>>>>>> =C2=A0=C2=A0=C2=A0 /**
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 * xen_alloc_unpopulated_pages - alloc un=
populated pages
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 * @nr_pages: Number of pages
>>>>>>> @@ -112,6 +182,16 @@ int xen_alloc_unpopulated_pages(unsigned int=

>>>>>>> nr_pages, struct page **pages)
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>>>>>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 unpopulated_init();
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Fall back to default behavior if we d=
o not have any
>>>>>>> suitable
>>>>>>> resource
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to allocate required region from and =
as the result we won't
>>>>>>> be able
>>>>>>> to
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * construct pages.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!target_resource)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return alloc_xenballo=
oned_pages(nr_pages, pages);
>>>>>> The commit message says that the behavior on x86 doesn't change=20
>>>>>> but this
>>>>>> seems to be a change that could impact x86?
>>>>> I don't think, however I didn't tested on x86 and might be wrong, b=
ut
>>>>> according to the current patch, on x86 the "target_resource" is alw=
ays
>>>>> valid
>>>>> and points to the "iomem_resource" as arch_xen_unpopulated_init()=20
>>>>> is not
>>>>> implemented. So there won't be any fallback to use
>>>>> alloc_(free)_xenballooned_pages() here and fill_list() will behave =
as
>>>>> usual.
>>>> =C2=A0=C2=A0 If target_resource is always valid, then we don't need =
this special
>>>> check. In fact, the condition should never be true.
>>>
>>> The target_resource is always valid and points to the=20
>>> "iomem_resource" on x86
>>> (this is equivalent to the behavior before this patch).
>>> On Arm target_resource might be NULL if arch_xen_unpopulated_init()=20
>>> failed,
>>> for example, if no extended regions reported by the hypervisor.
>>> We cannot use "iomem_resource" on Arm, only a resource constructed fr=
om
>>> extended regions. This is why I added that check (and fallback to=20
>>> xenballooned
>>> pages).
>>> What I was thinking is that in case of using old Xen (although we=20
>>> would need
>>> to balloon out RAM pages) we still would be able to keep working, so =

>>> no need
>>> to disable CONFIG_XEN_UNPOPULATED_ALLOC on such setups.
>>>>> You raised a really good question, on Arm we need a fallback to=20
>>>>> balloon
>>>>> out
>>>>> RAM pages again if hypervisor doesn't provide extended regions (we =

>>>>> run on
>>>>> old
>>>>> version, no unused regions with reasonable size, etc), so I decided=
=20
>>>>> to put
>>>>> a
>>>>> fallback code here, an indicator of the failure is invalid
>>>>> "target_resource".
>>>> I think it is unnecessary as we already assume today that
>>>> &iomem_resource is always available.
>>>>> I noticed the patch which is about to be upstreamed that removes
>>>>> alloc_(free)xenballooned_pages API [1]. Right now I have no idea=20
>>>>> how/where
>>>>> this fallback could be implemented as this is under build option=20
>>>>> control
>>>>> (CONFIG_XEN_UNPOPULATED_ALLOC). So the API with the same name is=20
>>>>> either
>>>>> used
>>>>> for unpopulated pages (if set) or ballooned pages (if not set). I=20
>>>>> would
>>>>> appreciate suggestions regarding that. I am wondering would it be=20
>>>>> possible
>>>>> and
>>>>> correctly to have both mechanisms (unpopulated and ballooned)=20
>>>>> enabled by
>>>>> default and some init code to decide which one to use at runtime or=
=20
>>>>> some
>>>>> sort?
>>>> I would keep it simple and remove the fallback from this patch. So:
>>>>
>>>> - if not CONFIG_XEN_UNPOPULATED_ALLOC, then balloon
>>>> - if CONFIG_XEN_UNPOPULATED_ALLOC, then
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - xen_resource if present
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - otherwise iomem_resource
>>> Unfortunately, we cannot use iomem_resource on Arm safely, either=20
>>> xen_resource
>>> or fail (if no fallback exists).
>>>
>>>
>>>> The xen_resource/iomem_resource config can be done at init time usin=
g
>>>> target_resource. At runtime, target_resource is always !=3D NULL so =
we
>>>> just go ahead and use it.
>>>
>>> Thank you for the suggestion. OK, let's keep it simple and drop fallb=
ack
>>> attempts for now. With one remark:
>>> We will make CONFIG_XEN_UNPOPULATED_ALLOC disabled by default on Arm =

>>> in next
>>> patch. So by default everything will behave as usual on Arm (balloon =

>>> out RAM
>>> pages),
>>> if user knows for sure that Xen reports extended regions, he/she can =

>>> enable
>>> the config. This way we won't break anything. What do you think?
>> Actually after reading your replies and explanation I changed opinion:=
 I
>> think we do need the fallback because Linux cannot really assume that
>> it is running on "new Xen" so it definitely needs to keep working if
>> CONFIG_XEN_UNPOPULATED_ALLOC is enabled and the extended regions are n=
ot
>> advertised.
>>
>> I think we'll have to roll back some of the changes introduced by
>> 121f2faca2c0a. That's because even if CONFIG_XEN_UNPOPULATED_ALLOC is
>> enabled we cannot know if we can use unpopulated-alloc or whether we
>> have to use alloc_xenballooned_pages until we parse the /hypervisor no=
de
>> in device tree at runtime.
>=20
> Exactly!
>=20
>=20
>>
>> In short, we cannot switch between unpopulated-alloc and
>> alloc_xenballooned_pages at build time, we have to do it at runtime
>> (boot time).
>=20
> +1
>=20
>=20
> I created a patch to partially revert 121f2faca2c0a "xen/balloon: renam=
e=20
> alloc/free_xenballooned_pages".
>=20
> If there is no objections I will add it to V3 (which is almost ready,=20
> except the fallback bits). Could you please tell me what do you think?
>=20
>=20
>  From dc79bcd425358596d95e715a8bd8b81deaaeb703 Mon Sep 17 00:00:00 2001=

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Date: Tue, 23 Nov 2021 18:14:41 +0200
> Subject: [PATCH] xen/balloon: Bring alloc(free)_xenballooned_pages help=
ers
>  =C2=A0back
>=20
> This patch rolls back some of the changes introduced by commit
> 121f2faca2c0a "xen/balloon: rename alloc/free_xenballooned_pages"
> in order to make possible to still allocate xenballooned pages
> if CONFIG_XEN_UNPOPULATED_ALLOC is enabled.
>=20
> On Arm the unpopulated pages will be allocated on top of extended
> regions provided by Xen via device-tree (the subsequent patches
> will add required bits to support unpopulated-alloc feature on Arm).
> The problem is that extended regions feature has been introduced
> into Xen quite recently (during 4.16 release cycle). So this
> effectively means that Linux must only use unpopulated-alloc on Arm
> if it is running on "new Xen" which advertises these regions.
> But, it will only be known after parsing the "hypervisor" node
> at boot time, so before doing that we cannot assume anything.
>=20
> In order to keep working if CONFIG_XEN_UNPOPULATED_ALLOC is enabled
> and the extended regions are not advertised (Linux is running on
> "old Xen", etc) we need the fallback to alloc_xenballooned_pages().
>=20
> This way we wouldn't reduce the amount of memory usable (wasting
> RAM pages) for any of the external mappings anymore (and eliminate
> XSA-300) with "new Xen", but would be still functional ballooning
> out RAM pages with "old Xen".
>=20
> Also rename alloc(free)_xenballooned_pages to=20
> xen_alloc(free)_ballooned_pages.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  =C2=A0drivers/xen/balloon.c | 20 +++++++++-----------
>  =C2=A0include/xen/balloon.h |=C2=A0 3 +++
>  =C2=A0include/xen/xen.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
>  =C2=A03 files changed, 18 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index ba2ea11..a2c4fc49 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -581,7 +581,6 @@ void balloon_set_new_target(unsigned long target)
>  =C2=A0}
>  =C2=A0EXPORT_SYMBOL_GPL(balloon_set_new_target);
>=20
> -#ifndef CONFIG_XEN_UNPOPULATED_ALLOC
>  =C2=A0static int add_ballooned_pages(unsigned int nr_pages)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 enum bp_state st;
> @@ -610,12 +609,12 @@ static int add_ballooned_pages(unsigned int nr_pa=
ges)
>  =C2=A0}
>=20
>  =C2=A0/**
> - * xen_alloc_unpopulated_pages - get pages that have been ballooned ou=
t
> + * xen_alloc_ballooned_pages - get pages that have been ballooned out
>  =C2=A0 * @nr_pages: Number of pages to get
>  =C2=A0 * @pages: pages returned
>  =C2=A0 * @return 0 on success, error otherwise
>  =C2=A0 */
> -int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page=20
> **pages)
> +int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pag=
es)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pgno =3D 0;
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct page *page;
> @@ -652,23 +651,23 @@ int xen_alloc_unpopulated_pages(unsigned int=20
> nr_pages, struct page **pages)
>  =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>  =C2=A0 out_undo:
>  =C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&balloon_mutex);
> -=C2=A0=C2=A0=C2=A0 xen_free_unpopulated_pages(pgno, pages);
> +=C2=A0=C2=A0=C2=A0 xen_free_ballooned_pages(pgno, pages);
>  =C2=A0=C2=A0=C2=A0=C2=A0 /*
> -=C2=A0=C2=A0=C2=A0 =C2=A0* NB: free_xenballooned_pages will only subtr=
act pgno pages, but=20
> since
> +=C2=A0=C2=A0=C2=A0 =C2=A0* NB: xen_free_ballooned_pages will only subt=
ract pgno pages, but=20
> since
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* target_unpopulated is incremented wit=
h nr_pages at the start we=20
> need
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* to remove the remaining ones also, or=
 accounting will be screwed.
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/
>  =C2=A0=C2=A0=C2=A0=C2=A0 balloon_stats.target_unpopulated -=3D nr_page=
s - pgno;
>  =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>  =C2=A0}
> -EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
> +EXPORT_SYMBOL(xen_alloc_ballooned_pages);
>=20
>  =C2=A0/**
> - * xen_free_unpopulated_pages - return pages retrieved with=20
> get_ballooned_pages
> + * xen_free_ballooned_pages - return pages retrieved with=20
> get_ballooned_pages
>  =C2=A0 * @nr_pages: Number of pages
>  =C2=A0 * @pages: pages to return
>  =C2=A0 */
> -void xen_free_unpopulated_pages(unsigned int nr_pages, struct page=20
> **pages)
> +void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pag=
es)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>=20
> @@ -687,9 +686,9 @@ void xen_free_unpopulated_pages(unsigned int=20
> nr_pages, struct page **pages)
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&balloon_mutex);
>  =C2=A0}
> -EXPORT_SYMBOL(xen_free_unpopulated_pages);
> +EXPORT_SYMBOL(xen_free_ballooned_pages);
>=20
> -#if defined(CONFIG_XEN_PV)
> +#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
>  =C2=A0static void __init balloon_add_region(unsigned long start_pfn,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pages)
>  =C2=A0{
> @@ -712,7 +711,6 @@ static void __init balloon_add_region(unsigned long=
=20
> start_pfn,
>  =C2=A0=C2=A0=C2=A0=C2=A0 balloon_stats.total_pages +=3D extra_pfn_end =
- start_pfn;
>  =C2=A0}
>  =C2=A0#endif
> -#endif
>=20
>  =C2=A0static int __init balloon_init(void)
>  =C2=A0{
> diff --git a/include/xen/balloon.h b/include/xen/balloon.h
> index e93d4f0..f78a6cc 100644
> --- a/include/xen/balloon.h
> +++ b/include/xen/balloon.h
> @@ -26,6 +26,9 @@ extern struct balloon_stats balloon_stats;
>=20
>  =C2=A0void balloon_set_new_target(unsigned long target);
>=20
> +int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pag=
es);
> +void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pag=
es);
> +
>  =C2=A0#ifdef CONFIG_XEN_BALLOON
>  =C2=A0void xen_balloon_init(void);
>  =C2=A0#else
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 9f031b5..410e3e4 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -52,7 +52,13 @@ bool xen_biovec_phys_mergeable(const struct bio_vec =

> *vec1,
>  =C2=A0extern u64 xen_saved_max_mem_size;
>  =C2=A0#endif
>=20
> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>  =C2=A0int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct pa=
ge=20
> **pages);
>  =C2=A0void xen_free_unpopulated_pages(unsigned int nr_pages, struct pa=
ge=20
> **pages);
> +#else
> +#define xen_alloc_unpopulated_pages xen_alloc_ballooned_pages
> +#define xen_free_unpopulated_pages xen_free_ballooned_pages

Could you please make those inline functions instead?

Other than that I'm fine with the approach.


Juergen

--------------D91E9B4B1E22D8AFFDA252EE
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------D91E9B4B1E22D8AFFDA252EE--

--vYRbg6aD15TTF9AEtbMSp4LSwBRmT1vYD--

--0zbYD8Udb611Ee1FeeRnGZCxfY94x1rLa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGdypQFAwAAAAAACgkQsN6d1ii/Ey+U
qggAleg7TZwcLaoxNn8cgsaI7Dk9x/Tu4CkWNictgNZuvQjKxZkoDYCi04MJXI3ooPP3bzMCTgYy
7cxbyYrIH7k47ditG2eovbAb72SNGLtBDfDwqBpMwfSj9RRhIOSgD2Ju0yTXHb8qFxQw3GeStJ5y
aZNPCfXqqQb7d8oXXbmqUlTVVoqwhH+AvSAHnZPChxo+Epjytm8K2zoTlsq+h+ZL3EIfUsuMXQei
10Y2xyDkRxmhw/5DsIAzfAtuRqvT6wQlG5hRMgnvn/sDUy+LWme/KbuRZqkxJVx+IFfwc653XufN
f8LGf/IDya6PVaFYT+A+ejS2cAstBRO1IFEiL4sUEQ==
=24n9
-----END PGP SIGNATURE-----

--0zbYD8Udb611Ee1FeeRnGZCxfY94x1rLa--

