Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA24DDCB1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 16:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292098.496041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVEQr-00016q-7w; Fri, 18 Mar 2022 15:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292098.496041; Fri, 18 Mar 2022 15:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVEQr-00014X-50; Fri, 18 Mar 2022 15:22:25 +0000
Received: by outflank-mailman (input) for mailman id 292098;
 Fri, 18 Mar 2022 15:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QOyl=T5=aculab.com=david.laight@srs-se1.protection.inumbo.net>)
 id 1nVEQp-00014H-QO
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 15:22:23 +0000
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 353bee1c-a6cf-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 16:22:22 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-150-J-EB7TRUPCa955UakG2Ikg-1; Fri, 18 Mar 2022 15:22:20 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 18 Mar 2022 15:22:20 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 18 Mar 2022 15:22:20 +0000
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
X-Inumbo-ID: 353bee1c-a6cf-11ec-853c-5f4723681683
X-MC-Unique: J-EB7TRUPCa955UakG2Ikg-1
From: David Laight <David.Laight@ACULAB.COM>
To: 'Juergen Gross' <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Dell.Client.Kernel@dell.com"
	<Dell.Client.Kernel@dell.com>
CC: Stuart Hayes <stuart.w.hayes@gmail.com>, Hans de Goede
	<hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/dell: add buffer allocation/free functions
 for SMI calls
Thread-Topic: [PATCH] platform/x86/dell: add buffer allocation/free functions
 for SMI calls
Thread-Index: AQHYOto/hyLOp/NEJ0S+JLWvPC30KazFQPKg
Date: Fri, 18 Mar 2022 15:22:19 +0000
Message-ID: <accf95548a8c4374b17c159b9b2d0098@AcuMS.aculab.com>
References: <20220318150950.16843-1-jgross@suse.com>
In-Reply-To: <20220318150950.16843-1-jgross@suse.com>
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

From: Juergen Gross
> Sent: 18 March 2022 15:10
>=20
> The dcdbas driver is used to call SMI handlers for both, dcdbas and
> dell-smbios-smm. Both drivers allocate a buffer for communicating
> with the SMI handler. The physical buffer address is then passed to
> the called SMI handler via %ebx.
>=20
> Unfortunately this doesn't work when running in Xen dom0, as the
> physical address obtained via virt_to_phys() is only a guest physical
> address, and not a machine physical address as needed by SMI.

The physical address from virt_to_phy() is always wrong.
That is the physical address the cpu has for the memory.
What you want is the address the dma master interface needs to use.
That can be different for a physical system - no need for virtualisation.

On x86 they do usually match, but anything with a full iommu
will need completely different addresses.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


