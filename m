Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A127542E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 11:15:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL0s8-0007dD-Ts; Wed, 23 Sep 2020 09:15:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqg6=DA=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1kL0s7-0007d3-GV
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 09:15:31 +0000
X-Inumbo-ID: cbc66b70-c401-46d9-b8e0-4c0f54360d41
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cbc66b70-c401-46d9-b8e0-4c0f54360d41;
 Wed, 23 Sep 2020 09:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600852530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gvE1WWYK2A6oHFuZMILxDD6bW0p1EgPD4Z1lIxbzBuE=;
 b=Jrfs2LcITAMDSUccFeS32EwB3Zj+usnLP2UMFEwzRlaHhZPw6lUe3nbWNu9jjGq+JeASzl
 ivKGvXo8fWtpTHBvI2/Mt3c4sYy3Tj8X/UEuUhgQJmUwCHb/dh5OwvkZlCyjcrq/hxPokA
 Z814Ja5IrlqZFgYb1clktqJvPP3xz3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-rh6mPe3GNYKmYVs-QqDXcQ-1; Wed, 23 Sep 2020 05:15:28 -0400
X-MC-Unique: rh6mPe3GNYKmYVs-QqDXcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0918E81CBE9;
 Wed, 23 Sep 2020 09:15:24 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 218BD73682;
 Wed, 23 Sep 2020 09:15:12 +0000 (UTC)
Date: Wed, 23 Sep 2020 10:15:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Blake <eblake@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alberto Garcia <berto@igalia.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Liu Yuan <namei.unix@gmail.com>,
 Jiri Slaby <jslaby@suse.cz>, Fam Zheng <fam@euphon.net>,
 Paul Durrant <paul@xen.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, sheepdog@lists.wpkg.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Juan Quintela <quintela@redhat.com>, qemu-riscv@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Markus Armbruster <armbru@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-block@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 xen-devel@lists.xenproject.org, Laurent Vivier <laurent@vivier.eu>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v2] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
Message-ID: <20200923091511.GD16268@stefanha-x1.localdomain>
References: <20200922085838.230505-1-stefanha@redhat.com>
 <33631340-e3e3-b10f-4f9a-0e1b295d79ef@redhat.com>
MIME-Version: 1.0
In-Reply-To: <33631340-e3e3-b10f-4f9a-0e1b295d79ef@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 01:35:37PM +0200, Paolo Bonzini wrote:
> On 22/09/20 10:58, Stefan Hajnoczi wrote:
> I think the reviews crossed, are you going to respin using a qatomic_
> prefix?

Yes, let's do qatomic_. I'll send a v3.

Stefan

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9rEh8ACgkQnKSrs4Gr
c8gTtwf+L4MHcbTtPkPfGurD9HXiLneXdmU2Q4SPmoHhAEE2Wbmuh1VKIQNNwt+x
I3kSaG5NIrp9zk9jS8GE9FWVptoivF6LWnPwiKzYpYZyUM9XCn8cAtSI6NYDAihv
92qRGSxnew/1NI16GyTPG1kOYANTA8lB0b4OPYiM9etANay2R+YSLHfE5dX39Tjc
22dNsOVk+wKvzIaNwhuMCbvQIlixtWeD+pdqZ83iVSYfKHv1r2ciEDBVMDwEJPJw
k0jSoJ5Q1uxxkX1WfxuARIqog42u43rhrbhQmpf9di13QrTPotosVA5L7lK/fQ1X
FAhr2AqUH1OMGEVUvZniHgHfu0yLpg==
=Qvv9
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--


