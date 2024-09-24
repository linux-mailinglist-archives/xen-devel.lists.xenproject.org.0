Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8D984363
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802546.1212822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2b8-0004O7-3C; Tue, 24 Sep 2024 10:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802546.1212822; Tue, 24 Sep 2024 10:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2b7-0004LC-Vh; Tue, 24 Sep 2024 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 802546;
 Tue, 24 Sep 2024 10:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st2b6-0004L4-LZ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:16:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184c34c9-7a5e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 12:16:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so756791366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:16:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c6b11sm65725766b.100.2024.09.24.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:16:41 -0700 (PDT)
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
X-Inumbo-ID: 184c34c9-7a5e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727173002; x=1727777802; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w0qVGpJ+/akuCZuKn1T7aXx/OAEEb9GDBpbNflFFJBk=;
        b=J+aMM5FSOazAxVBf9O/AzTq9c/gg8xYt08MmBlD4mehMhsV4TzRij3YZLfCxfNz4w7
         WoqGY2Zdn6jT5fJ0fb+IIs8y1Z65hVtmcmfGQLjMmqVgpDhOowWCFd2Owcvb+pxctiOM
         acAkVxY2x3lvhAEZa6OKUBmHTfEvUmp0omnhZCrUghecageD3p51L2Km2IpdMJA0Peuz
         xfbwiPuvef14dVkrpsFcFFGpSVZUNQCRr3IF0WaAjaMoc+dUgLuX3EX4Jjc65OrroF1W
         B/aHi/4wK8G2tGRYKZPMJvmpJvG42UyGO8hI/Jz6UBm1t1ox3cJKxtpiblq1uo2DtNH9
         BGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727173002; x=1727777802;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0qVGpJ+/akuCZuKn1T7aXx/OAEEb9GDBpbNflFFJBk=;
        b=ovW7xuYPz49GPJwBlNavr/tOYZaSjjaVQu4hEFzsAxt9byYPRV2J4KOOVR1ZcE4RLu
         YMCJ0KtV810+Pn0MItPbNETmuE7b/z/bHzwnYnIUaV+BJCweFlLZDUAad/LUGBsOjSus
         iSuiVeRYufr6ZdyKzbT7+zv7d7fr52PWQFZzSc5tODUrqKy+NFZxh4E0cFDcP4e3kttA
         4D4+WkcQDKvsoxkgkLiQZI8/NDwBQbZ+YZGzy3553Uk2c2Lke4hOgGEdxSk5xU+N07iv
         g3SkO6QIJQ1BOul03IV/fs4ZpoF5KMqEY6+Hbe322rf23B0YiJmt3cyxDqun+v42wMnQ
         Ylrw==
X-Forwarded-Encrypted: i=1; AJvYcCWDSgXD4ATDLFvQ5TICrb3TCqyhVEjUrBDrNoaKOQJpHobH7YkFwfCGkUJDm0son3auNBMQAO6tLT4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkgTSssv9ahoQbjxIjCar7l1lH0VjOx5lpJD1h7QZaBYYnnbAe
	vwMTNi8GM+H4qp7S4aoakkwq2FzbaFnm+VjcXMWUTUYsKPCLTLpS
X-Google-Smtp-Source: AGHT+IFZ5VpVznuDzrxXXq9qlxCQkGvn6yi5XIAqrJlpn14Udlc3gPNrC8X0aLrz18IWIdGZqJrkmQ==
X-Received: by 2002:a17:907:d860:b0:a7d:a080:baa with SMTP id a640c23a62f3a-a90d5034031mr1408468666b.34.1727173001754;
        Tue, 24 Sep 2024 03:16:41 -0700 (PDT)
Message-ID: <2727fcff560d62d2035237a225c0a14fdf0410dc.camel@gmail.com>
Subject: Re: [PATCH v2 5/5] xen/common: move device initialization code to
 common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2024 12:16:40 +0200
In-Reply-To: <13de4165-2df2-4481-974d-30d528dfd8cd@suse.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
	 <0b4d49742f58549ec644944ce1e02c98d7551845.1726579819.git.oleksii.kurochko@gmail.com>
	 <13de4165-2df2-4481-974d-30d528dfd8cd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-23 at 16:43 +0200, Jan Beulich wrote:
> On 17.09.2024 18:15, Oleksii Kurochko wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -12,6 +12,14 @@ config CORE_PARKING
> > =C2=A0	bool
> > =C2=A0	depends on NR_CPUS > 1
> > =C2=A0
> > +config DEVICE_INIT
> > +	bool
> > +	default !X86
>=20
> This can simply be "def_bool y" as ...
>=20
> > +	depends on !X86 && (ACPI || HAS_DEVICE_TREE)
>=20
> ... this enforces all restrictions. As indicated before I'd prefer if
> we
> could get away without yet another Kconfig constant, which would then
> also eliminate my concern about the expression not really covering
> for
> the case where x86 would obtain DT support (and hence likely needing
> the
> initialization here, too). What about ...
>=20
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) +=3D config_data.o
> > =C2=A0obj-$(CONFIG_CORE_PARKING) +=3D core_parking.o
> > =C2=A0obj-y +=3D cpu.o
> > =C2=A0obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
> > +obj-$(CONFIG_DEVICE_INIT) +=3D device.o
>=20
> obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
> obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D device.o
>=20
> ? (Eventually we could then simplify this to just obj-$(CONFIG_ACPI),
> to allow DT on x86, making sure the ACPI part of the file builds for
> x86 but does nothing there.)
I am okay with this solution. It seems I misunderstood you in the first
version of this patch series. When "obj-$(or ... )" was used, I decided
it wasn=E2=80=99t a good approach to use 'or', 'filter-out', or other simil=
ar
functions in Makefiles for such cases. I couldn't come up with a better
solution at the time, so I introduced a new config instead.

The only issue I see with this approach is that in device.c, there is
the following code:
   #ifdef CONFIG_ACPI
  =20
   extern const struct acpi_device_desc _asdevice[], _aedevice[];
  =20
   int __init acpi_device_init(enum device_class class, const void *data,
   int class_type)
      ...
  =20
   #endif
This shouldn't be compiled for X86. However, it will still be compiled
if we simplify to:
   obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
   obj-$(CONFIG_ACPI) +=3D device.o
The situation where we have CONFIG_HAS_DEVICE_TREE=3Dy and CONFIG_ACPI=3Dy
is possible ( if X86 will start or already using CONFIG_HAS_DEVICE_TREE
).=C2=A0The same will be if the second obj looks like: "obj-$(filter-out
$(CONFIG_X86),$(CONFIG_ACPI)) +=3D device.o" and X86 will use
CONFIG_HAS_DEVICE_TREE.

To resolve this, we probably need two separate files: device-dt.c and
device-acpi.c, and then use:
   obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-dt.o
   obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D device-acpi.o

Alternatively, we could make an exception in device.c and add a
!CONFIG_X86 condition:
   #if defined(CONFIG_ACPI) && !defined(CONFIG_X86)
   extern const struct acpi_device_desc _asdevice[], _aedevice[];
  =20
   int __init acpi_device_init(enum device_class class, const void
   *data, int class_type)
   ...
   #endif

~ Oleksii

