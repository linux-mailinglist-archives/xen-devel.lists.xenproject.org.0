Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F553321E3A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88302.165933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFA1-0006Mx-U8; Mon, 22 Feb 2021 17:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88302.165933; Mon, 22 Feb 2021 17:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFA1-0006MY-Qt; Mon, 22 Feb 2021 17:38:17 +0000
Received: by outflank-mailman (input) for mailman id 88302;
 Mon, 22 Feb 2021 17:38:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cC4D=HY=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1lEFA0-0006MT-1g
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:38:16 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d88c079e-5b5f-4c27-af19-e6b89c5bcf92;
 Mon, 22 Feb 2021 17:38:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-011n0yg1NUOpvcUU3B4QYw-1; Mon, 22 Feb 2021 12:38:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92829195D560;
 Mon, 22 Feb 2021 17:38:06 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11BEF5C1BD;
 Mon, 22 Feb 2021 17:37:53 +0000 (UTC)
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
X-Inumbo-ID: d88c079e-5b5f-4c27-af19-e6b89c5bcf92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614015495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lA4izgL6BmBHFfoBO0go7fPCtxFMbj7pq95MLNGllc=;
	b=LnFc6ewXYM4QD9GMDLV9UCERGgaDu5QETE3r3gLZ4aaK1JFNJqKlYdzUURtKeFq9Hatv+T
	L4qz7jClJmYYDyfgmlrdqruyINFRGll7k5pkm+pBJGSp47K960S6J9buQHB6dWnnDEUz5q
	GdW6wRyh4rGPv6MvZX/u6nIcTr9tjM8=
X-MC-Unique: 011n0yg1NUOpvcUU3B4QYw-1
Date: Mon, 22 Feb 2021 18:37:51 +0100
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
Subject: Re: [PATCH v2 07/11] hw/s390x: Explicit the s390-ccw-virtio
 machines support TCG and KVM
Message-ID: <20210222183751.0a8f2d2d.cohuck@redhat.com>
In-Reply-To: <20210219173847.2054123-8-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
	<20210219173847.2054123-8-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

On Fri, 19 Feb 2021 18:38:43 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

I'd lose the 'Explicit' in $SUBJECT.


> All s390-ccw-virtio machines support TCG and KVM.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 2972b607f36..1f168485066 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -586,6 +586,10 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
>      return newsz;
>  }
> =20
> +static const char *const valid_accels[] =3D {
> +    "tcg", "kvm", NULL
> +};
> +
>  static void ccw_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -612,6 +616,7 @@ static void ccw_machine_class_init(ObjectClass *oc, v=
oid *data)
>      mc->possible_cpu_arch_ids =3D s390_possible_cpu_arch_ids;
>      /* it is overridden with 'host' cpu *in kvm_arch_init* */
>      mc->default_cpu_type =3D S390_CPU_TYPE_NAME("qemu");
> +    mc->valid_accelerators =3D valid_accels;
>      hc->plug =3D s390_machine_device_plug;
>      hc->unplug_request =3D s390_machine_device_unplug_request;
>      nc->nmi_monitor_handler =3D s390_nmi;

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


