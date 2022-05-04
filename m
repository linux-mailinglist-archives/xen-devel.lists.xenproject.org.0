Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E870C51A4FA
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 18:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320896.541883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHYa-00080Z-Et; Wed, 04 May 2022 16:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320896.541883; Wed, 04 May 2022 16:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHYa-0007xr-Bh; Wed, 04 May 2022 16:08:52 +0000
Received: by outflank-mailman (input) for mailman id 320896;
 Wed, 04 May 2022 16:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7kdy=VM=aculab.com=david.laight@srs-se1.protection.inumbo.net>)
 id 1nmHYA-0007x6-1t
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 16:08:26 +0000
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d0d3f81-cbc4-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 18:08:24 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-304-ZFewZZfvOMewltUmmE4nqg-2; Wed, 04 May 2022 17:08:23 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 4 May 2022 17:08:15 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 4 May 2022 17:08:15 +0100
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
X-Inumbo-ID: 6d0d3f81-cbc4-11ec-8fc4-03012f2f19d4
X-MC-Unique: ZFewZZfvOMewltUmmE4nqg-2
From: David Laight <David.Laight@ACULAB.COM>
To: 'Kees Cook' <keescook@chromium.org>, Johannes Berg
	<johannes@sipsolutions.net>
CC: "Gustavo A . R . Silva" <gustavoars@kernel.org>, Keith Packard
	<keithp@keithp.com>, Francis Laniel <laniel_francis@privacyrequired.com>,
	Daniel Axtens <dja@axtens.net>, Dan Williams <dan.j.williams@intel.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Guenter Roeck
	<linux@roeck-us.net>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tadeusz Struk
	<tadeusz.struk@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Al Viro
	<viro@zeniv.linux.org.uk>, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>,
	Andy Lavr <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>,
	"Baowen Zheng" <baowen.zheng@corigine.com>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	"brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
	Christian Brauner <brauner@kernel.org>, =?iso-8859-1?Q?Christian_G=F6ttsche?=
	<cgzones@googlemail.com>, Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>, Cong Wang <cong.wang@bytedance.com>, "David
 Gow" <davidgow@google.com>, David Howells <dhowells@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, Dennis Dalessandro
	<dennis.dalessandro@cornelisnetworks.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Dexuan Cui <decui@microsoft.com>, "Dmitry
 Kasatkin" <dmitry.kasatkin@gmail.com>, Eli Cohen <elic@nvidia.com>, "Eric
 Dumazet" <edumazet@google.com>, Eric Paris <eparis@parisplace.org>, "Eugeniu
 Rosca" <erosca@de.adit-jv.com>, Felipe Balbi <balbi@kernel.org>, Frank Rowand
	<frowand.list@gmail.com>, Franky Lin <franky.lin@broadcom.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Gregory Greenman
	<gregory.greenman@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, "Hante
 Meuleman" <hante.meuleman@broadcom.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Hulk Robot <hulkci@huawei.com>, Jakub Kicinski
	<kuba@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, James Morris
	<jmorris@namei.org>, Jarkko Sakkinen <jarkko@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe
	<axboe@kernel.dk>, Johan Hedberg <johan.hedberg@gmail.com>, John Keeping
	<john@metanate.com>, Juergen Gross <jgross@suse.com>, Kalle Valo
	<kvalo@kernel.org>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>, Kuniyuki Iwashima
	<kuniyu@amazon.co.jp>, "K. Y. Srinivasan" <kys@microsoft.com>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>, Leon Romanovsky
	<leon@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	"linux1394-devel@lists.sourceforge.net"
	<linux1394-devel@lists.sourceforge.net>, "linux-afs@lists.infradead.org"
	<linux-afs@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-integrity@vger.kernel.org"
	<linux-integrity@vger.kernel.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-xtensa@linux-xtensa.org"
	<linux-xtensa@linux-xtensa.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Loic Poulain <loic.poulain@linaro.org>, Louis Peens
	<louis.peens@corigine.com>, Luca Coelho <luciano.coelho@intel.com>, "Luiz
 Augusto von Dentz" <luiz.dentz@gmail.com>, Marc Dionne
	<marc.dionne@auristor.com>, Marcel Holtmann <marcel@holtmann.org>, Mark Brown
	<broonie@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Max
 Filippov" <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>, Muchun Song
	<songmuchun@bytedance.com>, Nathan Chancellor <nathan@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, =?iso-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>, "Rich
 Felker" <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>, Russell King
	<linux@armlinux.org.uk>, "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, "SHA-cyfmac-dev-list@infineon.com"
	<SHA-cyfmac-dev-list@infineon.com>, Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Stefan Richter
	<stefanr@s5r6.in-berlin.de>, Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, Stephen Smalley
	<stephen.smalley.work@gmail.com>, Takashi Iwai <tiwai@suse.com>, Tom Rix
	<trix@redhat.com>, Udipto Goswami <quic_ugoswami@quicinc.com>,
	"wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>, Wei Liu
	<wei.liu@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Xiu Jianfeng <xiujianfeng@huawei.com>,
	"Yang Yingliang" <yangyingliang@huawei.com>
Subject: RE: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
Thread-Topic: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
Thread-Index: AQHYX80GRJFxZRupFEigWcMQWGiaSK0O4MfQ
Date: Wed, 4 May 2022 16:08:15 +0000
Message-ID: <bc2efc31d25e4f42a98f0a5d7a8ad88a@AcuMS.aculab.com>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-3-keescook@chromium.org>
 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
 <202205040819.DEA70BD@keescook>
In-Reply-To: <202205040819.DEA70BD@keescook>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Kees Cook
> Sent: 04 May 2022 16:38
...
> > >     struct something *instance =3D NULL;
> > >     int rc;
> > >
> > >     rc =3D mem_to_flex_dup(&instance, byte_array, count, GFP_KERNEL);
> > >     if (rc)
> > >         return rc;
> >
> > This seems rather awkward, having to set it to NULL, then checking rc
> > (and possibly needing a separate variable for it), etc.
>=20
> I think the errno return is completely required. I had an earlier version
> of this that was much more like a drop-in replacement for memcpy that
> would just truncate or panic, and when I had it all together, I could
> just imagine hearing Linus telling me to start over because it was unsafe
> (truncation may be just as bad as overflow) and disruptive ("never BUG"),
> and that it should be recoverable. So, I rewrote it all to return a
> __must_check errno.
>=20
> Requiring instance to be NULL is debatable, but I feel pretty strongly
> about it because it does handle a class of mistakes (resource leaks),
> and it's not much of a burden to require a known-good starting state.

Why not make it look like malloc() since it seems to be malloc().
That gives a much better calling convention.
Passing pointers and integers by reference can generate horrid code.
(Mostly because it stops the compiler keeping values in registers.)

If you want the type information inside the 'function'
use a #define so that the use is:

=09mem_to_flex_dup(instance, byte_array, count, GFP_KERNEL);
=09if (!instance)
=09=09return ...
(or use ERR_PTR() etc).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


