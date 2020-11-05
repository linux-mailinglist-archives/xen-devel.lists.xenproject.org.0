Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DBE2A81DC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 16:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19846.45283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kagqt-0000s2-Q4; Thu, 05 Nov 2020 15:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19846.45283; Thu, 05 Nov 2020 15:07:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kagqt-0000rd-Mj; Thu, 05 Nov 2020 15:07:03 +0000
Received: by outflank-mailman (input) for mailman id 19846;
 Thu, 05 Nov 2020 15:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRUF=EL=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
 id 1kagqs-0000rX-GH
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:07:02 +0000
Received: from lizzy.crudebyte.com (unknown [91.194.90.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6398b5fb-6989-4d76-8022-30c9ff95a1e3;
 Thu, 05 Nov 2020 15:07:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mRUF=EL=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
	id 1kagqs-0000rX-GH
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:07:02 +0000
X-Inumbo-ID: 6398b5fb-6989-4d76-8022-30c9ff95a1e3
Received: from lizzy.crudebyte.com (unknown [91.194.90.13])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6398b5fb-6989-4d76-8022-30c9ff95a1e3;
	Thu, 05 Nov 2020 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=J80vtLgb+JbeRkicM5+Hda5f+1nTevLNRPjcN23fEMA=; b=gmBm+m8zcHwMHHa2fbyf7qSnpF
	VqVI9pndK0nmSyWd1OcYVa+E4ZG3spmnE6McjnIX7pDMi1/tkaq49cxQNyXHli4VPovL98u6KEzoL
	lhYH/Pq+xgBOQX6J2SOgcaaLLJhUGOvhrM6r3kZJI7hAeRxPMSkDH/tr6p9oRxFfq9QByss84EBv+
	z20eAc/cng1Ga7DI4JxnB0WoxobrUQnw/76hQgm3JkvfLLqBXjBBEexcVE+F4WEFJS+jta74cbxzM
	V5h9ikuPEZGVlopDEH9OTHCdzNCvmWLe1bfKu6wWWbiJItsB1r0w84DDsfsSgu2eVsDLfjIRboOPU
	H5cePrkw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>, Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P . Berrange" <berrange@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem between 9pfs and Xen
Date: Thu, 05 Nov 2020 16:06:45 +0100
Message-ID: <401148579.MYj8lGMC4g@silver>
In-Reply-To: <2140852.vo20GZeEQY@silver>
References: <20201104115706.3101190-1-philmd@redhat.com> <20201105132346.5e0adf94@bahia.lan> <2140852.vo20GZeEQY@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Donnerstag, 5. November 2020 13:28:31 CET Christian Schoenebeck wrote:
> On Donnerstag, 5. November 2020 13:23:46 CET Greg Kurz wrote:
> > On Thu, 5 Nov 2020 13:15:59 +0100
> >=20
> > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> > > On 11/4/20 6:54 PM, Greg Kurz wrote:
> > > > On Wed, 04 Nov 2020 13:18:09 +0100
> > > >=20
> > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > >> On Mittwoch, 4. November 2020 12:57:04 CET Philippe Mathieu-Daud=E9
>=20
> wrote:
> > > >>> Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
> > > >>> CONFIG_9PFS (probably a wrong conflict resolution). This config is
> > > >>> not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
> > > >>> depends on CONFIG_VIRTFS.
> > > >>>=20
> > > >>> Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
> > > >>>=20
> > > >>> fix the './configure --without-default-devices --enable-xen' buil=
d:
> > > >>>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in
> > > >>>   function
> > > >>>=20
> > > >>> `xen_be_register_common': hw/xen/xen-legacy-backend.c:754: undefi=
ned
> > > >>> reference to `xen_9pfs_ops' /usr/bin/ld:
> > > >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined
> > > >>> reference to
> > > >>> `local_ops' /usr/bin/ld:
> > > >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined
> > > >>> reference
> > > >>> to `synth_ops' /usr/bin/ld:
> > > >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined
> > > >>> reference
> > > >>> to `proxy_ops' collect2: error: ld returned 1 exit status
> > > >>>=20
> > > >>> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> > > >>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > > >>> Acked-by: Greg Kurz <groug@kaod.org>
> > > >>> Tested-by: Greg Kurz <groug@kaod.org>
> > > >>> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > >>=20
> > > >> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > >=20
> > > > Phil,
> > > >=20
> > > > Same questioning as Connie. Do you intend to get this merged or sho=
uld
> > > > Christian or I take care of that ?
> > >=20
> > > Same answer too =3D) If you are preparing a pull request, please go a=
head!
> >=20
> > Heh I've just seen your answer.
> >=20
> > Christian,
> >=20
> > Maybe you can add this patch in your next PR ?
>=20
> Yes, I will prepare a 9p PR today anyway, so I will include this patch.
>=20
> Best regards,
> Christian Schoenebeck

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



