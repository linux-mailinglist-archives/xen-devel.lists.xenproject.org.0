Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE7321E88
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88322.165999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFMU-0000E5-7T; Mon, 22 Feb 2021 17:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88322.165999; Mon, 22 Feb 2021 17:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFMU-0000Dg-3x; Mon, 22 Feb 2021 17:51:10 +0000
Received: by outflank-mailman (input) for mailman id 88322;
 Mon, 22 Feb 2021 17:51:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cC4D=HY=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1lEFMS-0000Db-As
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:51:08 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 694c1d3e-c040-4445-a358-f4141dc3c2f5;
 Mon, 22 Feb 2021 17:51:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-BUheIuS7NaiFmeoxrS7BDQ-1; Mon, 22 Feb 2021 12:51:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D0F2801965;
 Mon, 22 Feb 2021 17:51:01 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE0141001281;
 Mon, 22 Feb 2021 17:50:46 +0000 (UTC)
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
X-Inumbo-ID: 694c1d3e-c040-4445-a358-f4141dc3c2f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614016267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+4avbp3iRC9wzL9kQsBbVb6oEaX3FYxbdrqhd4FEnE=;
	b=U3s/yYlTK3/NzWSID/Irp/EeEw6YuWOdsdJTXTLCJ8nsgHSo4pvlixJo4etvdVPHOUqFrL
	zGEEF+XtvTJJOk9ixReD7FiSM3dA1dmBW35ngo3OaynS3uXB5PTgT/rfvgd0DlhVix8ylT
	1AeoFI6ke7YmaHq9oMB66DHMKqKUFB0=
X-MC-Unique: BUheIuS7NaiFmeoxrS7BDQ-1
Date: Mon, 22 Feb 2021 18:50:44 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Peter
 Maydell <peter.maydell@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, BALATON Zoltan
 <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>, Richard Henderson
 <richard.henderson@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, =?UTF-8?B?SGVydsOp?= Poussineau
 <hpoussin@reactos.org>, Greg Kurz <groug@kaod.org>, Christian Borntraeger
 <borntraeger@de.ibm.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type()
 return value
Message-ID: <20210222185044.23fccecc.cohuck@redhat.com>
In-Reply-To: <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
	<20210219173847.2054123-2-philmd@redhat.com>
	<20210222182405.3e6e9a6f.cohuck@redhat.com>
	<bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

On Mon, 22 Feb 2021 18:41:07 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/22/21 6:24 PM, Cornelia Huck wrote:
> > On Fri, 19 Feb 2021 18:38:37 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >  =20
> >> MachineClass::kvm_type() can return -1 on failure.
> >> Document it, and add a check in kvm_init().
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/hw/boards.h | 3 ++-
> >>  accel/kvm/kvm-all.c | 6 ++++++
> >>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >> index a46dfe5d1a6..68d3d10f6b0 100644
> >> --- a/include/hw/boards.h
> >> +++ b/include/hw/boards.h
> >> @@ -127,7 +127,8 @@ typedef struct {
> >>   *    implement and a stub device is required.
> >>   * @kvm_type:
> >>   *    Return the type of KVM corresponding to the kvm-type string opt=
ion or
> >> - *    computed based on other criteria such as the host kernel capabi=
lities.
> >> + *    computed based on other criteria such as the host kernel capabi=
lities
> >> + *    (which can't be negative), or -1 on error.
> >>   * @numa_mem_supported:
> >>   *    true if '--numa node.mem' option is supported and false otherwi=
se
> >>   * @smp_parse:
> >> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> >> index 84c943fcdb2..b069938d881 100644
> >> --- a/accel/kvm/kvm-all.c
> >> +++ b/accel/kvm/kvm-all.c
> >> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
> >>                                                              "kvm-type=
",
> >>                                                              &error_ab=
ort);
> >>          type =3D mc->kvm_type(ms, kvm_type);
> >> +        if (type < 0) {
> >> +            ret =3D -EINVAL;
> >> +            fprintf(stderr, "Failed to detect kvm-type for machine '%=
s'\n",
> >> +                    mc->name);
> >> +            goto err;
> >> +        }
> >>      }
> >> =20
> >>      do { =20
> >=20
> > No objection to this patch; but I'm wondering why some non-pseries
> > machines implement the kvm_type callback, when I see the kvm-type
> > property only for pseries? Am I holding my git grep wrong? =20
>=20
> Can it be what David commented here?
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
>=20

Ok, I might be confused about the other ppc machines; but I'm wondering
about the kvm_type callback for mips and arm/virt. Maybe I'm just
confused by the whole mechanism?


