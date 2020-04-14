Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19761A778E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOI8F-0001tH-Il; Tue, 14 Apr 2020 09:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DJ5r=56=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1jOI8D-0001tC-Bv
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:45:25 +0000
X-Inumbo-ID: aa32c956-7e34-11ea-b4f4-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aa32c956-7e34-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586857524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqQcjBaUA4/pWS6QQM0cWlmT+P/BcxGgavR3JzzWkIM=;
 b=XsfOTM4xiC3dCT+PCk8qruJvJd1sD/CqDMtu2cPxlsJDcyKiROq81gNwcaL2ccs4uqAUbY
 hPrNvm+4SscYEcrRxWDTrU3LKMNKlZKAPZcR73a6Gh/8L1zFbmJs5aRP+gTljRzFkwqJR6
 A1Jgg1SUAao+Y0KJyMs/ZxqfgdwwmE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ZJN9VRskMtK3FqqwWJ6GCA-1; Tue, 14 Apr 2020 05:45:22 -0400
X-MC-Unique: ZJN9VRskMtK3FqqwWJ6GCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6C2107ACC4;
 Tue, 14 Apr 2020 09:45:18 +0000 (UTC)
Received: from gondolin (ovpn-113-32.ams2.redhat.com [10.36.113.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52EA59F9A1;
 Tue, 14 Apr 2020 09:45:00 +0000 (UTC)
Date: Tue, 14 Apr 2020 11:44:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 2/3] various: Remove unnecessary OBJECT() cast
Message-ID: <20200414114457.06e15bcb.cohuck@redhat.com>
In-Reply-To: <20200412210954.32313-3-f4bug@amsat.org>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-3-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 12 Apr 2020 23:09:53 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The OBJECT() macro is defined as:
>=20
>   #define OBJECT(obj) ((Object *)(obj))
>=20
> Remove unnecessary OBJECT() casts.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef Object;
>   Object *o;
>   @@
>   -   OBJECT(o)
>   +   o
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/bus.c                       | 2 +-
>  hw/ide/ahci-allwinner.c             | 2 +-
>  hw/ipmi/smbus_ipmi.c                | 2 +-
>  hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
>  hw/s390x/sclp.c                     | 2 +-
>  monitor/misc.c                      | 3 +--
>  qom/object.c                        | 4 ++--
>  7 files changed, 11 insertions(+), 12 deletions(-)
>=20

s390x part:

Acked-by: Cornelia Huck <cohuck@redhat.com>


