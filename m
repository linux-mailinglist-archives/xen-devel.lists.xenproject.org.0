Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F24E3D75
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293372.498366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcZz-0001Ku-IT; Tue, 22 Mar 2022 11:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293372.498366; Tue, 22 Mar 2022 11:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcZz-0001IQ-FX; Tue, 22 Mar 2022 11:21:35 +0000
Received: by outflank-mailman (input) for mailman id 293372;
 Tue, 22 Mar 2022 11:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWAj=UB=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1nWcZx-0001IG-9C
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:21:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c0e4a3-a9d2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 12:21:31 +0100 (CET)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-7yesWshRPCOYuV9-T0buNg-1; Tue, 22 Mar 2022 07:21:28 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 v15-20020a50f08f000000b0041902200ab4so7551689edl.22
 for <xen-devel@lists.xenproject.org>; Tue, 22 Mar 2022 04:21:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd7dee980sm4080173ejc.30.2022.03.22.04.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 04:21:26 -0700 (PDT)
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
X-Inumbo-ID: 38c0e4a3-a9d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647948089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sI/gJK8PHjVhsB9l+0a1Cbfqayf1bW3iE9HELjmMQqg=;
	b=Wg7np52ZXYBwDiIXbHtAA3ixJ6zTtwLnuAXJBZO2wD9FyehpYHE6oFSkYicNdaKrxU4b2f
	xiHcF0n/MjUj5r6HLxmij1XMOWR4xaeunvM0w0CPUUAaP4M4SzZ74wZWqXzZv80AhAw54F
	8Ax8P0EqR9I/qaiPe4mygtqaLwyuGwo=
X-MC-Unique: 7yesWshRPCOYuV9-T0buNg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bx3w8/lhlewJ7oUWvr/1eh6laDl4Abf2g0d4r2c9J7s=;
        b=IGECR9+Hl5ValVnvOZmVDrBECq6CwqPXglgekppPg+5Pv9rjD5k4kZ2RSyqu0lqJul
         vsM45qfON4sH72gSXuhY7VYzbiAYxlQXHnlkJdQ9RfIt6fZdR8OFGYDBMYEgIPL0pdVS
         /zgZSw4ZATMIk5dDiNlTE9H93yNRg9mqLm6gSrzEO2LlzW71FxW51QLMJ/9SUNOvIVoO
         10eYMKgRIX0+mLwD6Ssdi2hs0TJtcibjS3Vr9jWEPZ0QJH6SsKsOzepoR5xZY+ldzMUD
         7MjHD+7AMbz45kJVxilSI0IMb8xs2PzIm6v8D+eS0/+hLiVbR/N6R6OZlbIs61li+rHz
         ImgQ==
X-Gm-Message-State: AOAM531VXOXXl8BLsbvf7m0RTrY60Pp7aFS/VOJFVnNpsz+fv0RgQegr
	ORpveRPUGPs6ush2TtxJeieinE8BawTMWG7ZhxFgH8t8qJMLbXOVHrdoRdoPmwUCg+Umv0s601f
	NvN5tSrZf0YqCcUvuGNvMfGm0CLU=
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id t3-20020a056402524300b004194ce2cb5cmr6931854edd.151.1647948087465;
        Tue, 22 Mar 2022 04:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiCZtBiS5tBYkHXW9CYVzlZ6xWEpBQiuxdMrs5J8/gCaIPyAwbOSsr9vx7UIAZ7GGLmjEZiA==
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id t3-20020a056402524300b004194ce2cb5cmr6931812edd.151.1647948087187;
        Tue, 22 Mar 2022 04:21:27 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:21:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?=
 Lureau <marcandre.lureau@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter
 Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Jean-Christophe Dubois <jcd@tribudubois.net>, Keith
 Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Yuval Shaia
 <yuval.shaia.ml@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau
 <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, Michael
 Roth <michael.roth@amd.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Kamil Rytarowski
 <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, John Snow
 <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Message-ID: <20220322122124.4f1d76e9@redhat.com>
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>
References: <20220315144156.1595462-1-armbru@redhat.com>
	<20220315144156.1595462-4-armbru@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Mar 2022 15:41:56 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci =
\
> =09     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


for */i386/*
Reviewed-by: Igor Mammedov <imammedo@redhat.com>


nit:
possible miss, see below=20

[...]
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index cf8e500514..0731f70410 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c

missed:

 pfn_list =3D g_malloc(sizeof (*pfn_list) * nr_pfn);


> @@ -396,7 +396,7 @@ go_physmap:
> =20
>      mr_name =3D memory_region_name(mr);
> =20
> -    physmap =3D g_malloc(sizeof(XenPhysmap));
> +    physmap =3D g_new(XenPhysmap, 1);
> =20
>      physmap->start_addr =3D start_addr;
>      physmap->size =3D size;
> @@ -1281,7 +1281,7 @@ static void xen_read_physmap(XenIOState *state)
>          return;
> =20
>      for (i =3D 0; i < num; i++) {
> -        physmap =3D g_malloc(sizeof (XenPhysmap));
> +        physmap =3D g_new(XenPhysmap, 1);
>          physmap->phys_offset =3D strtoull(entries[i], NULL, 16);
>          snprintf(path, sizeof(path),
>                  "/local/domain/0/device-model/%d/physmap/%s/start_addr",
> @@ -1410,7 +1410,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>      xen_pfn_t ioreq_pfn;
>      XenIOState *state;
> =20
> -    state =3D g_malloc0(sizeof (XenIOState));
> +    state =3D g_new0(XenIOState, 1);
> =20
>      state->xce_handle =3D xenevtchn_open(NULL, 0);
>      if (state->xce_handle =3D=3D NULL) {
> @@ -1463,7 +1463,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>      }
> =20
>      /* Note: cpus is empty at this point in init */
> -    state->cpu_by_vcpu_id =3D g_malloc0(max_cpus * sizeof(CPUState *));
> +    state->cpu_by_vcpu_id =3D g_new0(CPUState *, max_cpus);
> =20
>      rc =3D xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
>      if (rc < 0) {
> @@ -1472,7 +1472,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>          goto err;
>      }
> =20
> -    state->ioreq_local_port =3D g_malloc0(max_cpus * sizeof (evtchn_port=
_t));
> +    state->ioreq_local_port =3D g_new0(evtchn_port_t, max_cpus);

[...]


