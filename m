Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC42D9A9F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 16:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52308.91390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kopXa-0006n1-A7; Mon, 14 Dec 2020 15:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52308.91390; Mon, 14 Dec 2020 15:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kopXa-0006mc-68; Mon, 14 Dec 2020 15:13:34 +0000
Received: by outflank-mailman (input) for mailman id 52308;
 Mon, 14 Dec 2020 15:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8e0=FS=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1kopXY-0006mX-JJ
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 15:13:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 21b27c20-3919-41de-a59d-eaed9c6f6ebf;
 Mon, 14 Dec 2020 15:13:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-j1oJ2IWxNMmcWJ7fg9-uNw-1; Mon, 14 Dec 2020 10:13:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE16484A5E3;
 Mon, 14 Dec 2020 15:13:22 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D3177086A;
 Mon, 14 Dec 2020 15:13:04 +0000 (UTC)
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
X-Inumbo-ID: 21b27c20-3919-41de-a59d-eaed9c6f6ebf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607958809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiqrpl+XecPgLF6P/gzVO7wMfg7k/CqZgK+4CTUDk8o=;
	b=cTgsyXNo1jQoCkLbKjo1T/4N3So3wPVgXCG517v68ZNJz55trf65H/tcIcwr5ghbRdIN2I
	7oOunf4NHNiLJ6cty7fi908aL2Oi/BA3Pvd6dp+IDdveu059CssVuL8jH3Z6/BwlHO2LxD
	UwHG+v3B3+B/H0B26k2TgIR9xc/IZ3A=
X-MC-Unique: j1oJ2IWxNMmcWJ7fg9-uNw-1
Date: Mon, 14 Dec 2020 16:13:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>, Paul
 Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard
 <anthony.perard@citrix.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Thomas Huth <thuth@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>, Richard
 Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Max Reitz <mreitz@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 30/32] qdev: Rename qdev_get_prop_ptr() to
 object_field_prop_ptr()
Message-ID: <20201214161302.1c4de090@redhat.com>
In-Reply-To: <20201211220529.2290218-31-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
	<20201211220529.2290218-31-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 17:05:27 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The function will be moved to common QOM code, as it is not
> specific to TYPE_DEVICE anymore.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes v1 -> v2:
> * Rename to object_field_prop_ptr() instead of object_static_prop_ptr()
> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  include/hw/qdev-properties.h     |  2 +-
>  backends/tpm/tpm_util.c          |  6 ++--
>  hw/block/xen-block.c             |  4 +--
>  hw/core/qdev-properties-system.c | 50 +++++++++++++-------------
>  hw/core/qdev-properties.c        | 60 ++++++++++++++++----------------
>  hw/s390x/css.c                   |  4 +--
>  hw/s390x/s390-pci-bus.c          |  4 +--
>  hw/vfio/pci-quirks.c             |  4 +--
>  8 files changed, 67 insertions(+), 67 deletions(-)
>=20
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 90222822f1..97bb9494ae 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -193,7 +193,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const ch=
ar *name,
>                             const uint8_t *value);
>  void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
> =20
> -void *qdev_get_prop_ptr(Object *obj, Property *prop);
> +void *object_field_prop_ptr(Object *obj, Property *prop);
> =20
>  void qdev_prop_register_global(GlobalProperty *prop);
>  const GlobalProperty *qdev_find_global_prop(Object *obj,
> diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
> index 39b45fa46d..a6e6d3e72f 100644
> --- a/backends/tpm/tpm_util.c
> +++ b/backends/tpm/tpm_util.c
> @@ -35,7 +35,7 @@
>  static void get_tpm(Object *obj, Visitor *v, const char *name, void *opa=
que,
>                      Error **errp)
>  {
> -    TPMBackend **be =3D qdev_get_prop_ptr(obj, opaque);
> +    TPMBackend **be =3D object_field_prop_ptr(obj, opaque);
>      char *p;
> =20
>      p =3D g_strdup(*be ? (*be)->id : "");
> @@ -47,7 +47,7 @@ static void set_tpm(Object *obj, Visitor *v, const char=
 *name, void *opaque,
>                      Error **errp)
>  {
>      Property *prop =3D opaque;
> -    TPMBackend *s, **be =3D qdev_get_prop_ptr(obj, prop);
> +    TPMBackend *s, **be =3D object_field_prop_ptr(obj, prop);
>      char *str;
> =20
>      if (!visit_type_str(v, name, &str, errp)) {
> @@ -67,7 +67,7 @@ static void set_tpm(Object *obj, Visitor *v, const char=
 *name, void *opaque,
>  static void release_tpm(Object *obj, const char *name, void *opaque)
>  {
>      Property *prop =3D opaque;
> -    TPMBackend **be =3D qdev_get_prop_ptr(obj, prop);
> +    TPMBackend **be =3D object_field_prop_ptr(obj, prop);
> =20
>      if (*be) {
>          tpm_backend_reset(*be);
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index bd1aef63a7..718d886e5c 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -336,7 +336,7 @@ static void xen_block_get_vdev(Object *obj, Visitor *=
v, const char *name,
>                                 void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    XenBlockVdev *vdev =3D qdev_get_prop_ptr(obj, prop);
> +    XenBlockVdev *vdev =3D object_field_prop_ptr(obj, prop);
>      char *str;
> =20
>      switch (vdev->type) {
> @@ -396,7 +396,7 @@ static void xen_block_set_vdev(Object *obj, Visitor *=
v, const char *name,
>                                 void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    XenBlockVdev *vdev =3D qdev_get_prop_ptr(obj, prop);
> +    XenBlockVdev *vdev =3D object_field_prop_ptr(obj, prop);
>      char *str, *p;
>      const char *end;
> =20
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index 590c5f3d97..e6d378a34e 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -62,7 +62,7 @@ static void get_drive(Object *obj, Visitor *v, const ch=
ar *name, void *opaque,
>                        Error **errp)
>  {
>      Property *prop =3D opaque;
> -    void **ptr =3D qdev_get_prop_ptr(obj, prop);
> +    void **ptr =3D object_field_prop_ptr(obj, prop);
>      const char *value;
>      char *p;
> =20
> @@ -88,7 +88,7 @@ static void set_drive_helper(Object *obj, Visitor *v, c=
onst char *name,
>  {
>      DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
> -    void **ptr =3D qdev_get_prop_ptr(obj, prop);
> +    void **ptr =3D object_field_prop_ptr(obj, prop);
>      char *str;
>      BlockBackend *blk;
>      bool blk_created =3D false;
> @@ -181,7 +181,7 @@ static void release_drive(Object *obj, const char *na=
me, void *opaque)
>  {
>      DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
> -    BlockBackend **ptr =3D qdev_get_prop_ptr(obj, prop);
> +    BlockBackend **ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      if (*ptr) {
>          AioContext *ctx =3D blk_get_aio_context(*ptr);
> @@ -214,7 +214,7 @@ const PropertyInfo qdev_prop_drive_iothread =3D {
>  static void get_chr(Object *obj, Visitor *v, const char *name, void *opa=
que,
>                      Error **errp)
>  {
> -    CharBackend *be =3D qdev_get_prop_ptr(obj, opaque);
> +    CharBackend *be =3D object_field_prop_ptr(obj, opaque);
>      char *p;
> =20
>      p =3D g_strdup(be->chr && be->chr->label ? be->chr->label : "");
> @@ -226,7 +226,7 @@ static void set_chr(Object *obj, Visitor *v, const ch=
ar *name, void *opaque,
>                      Error **errp)
>  {
>      Property *prop =3D opaque;
> -    CharBackend *be =3D qdev_get_prop_ptr(obj, prop);
> +    CharBackend *be =3D object_field_prop_ptr(obj, prop);
>      Chardev *s;
>      char *str;
> =20
> @@ -262,7 +262,7 @@ static void set_chr(Object *obj, Visitor *v, const ch=
ar *name, void *opaque,
>  static void release_chr(Object *obj, const char *name, void *opaque)
>  {
>      Property *prop =3D opaque;
> -    CharBackend *be =3D qdev_get_prop_ptr(obj, prop);
> +    CharBackend *be =3D object_field_prop_ptr(obj, prop);
> =20
>      qemu_chr_fe_deinit(be, false);
>  }
> @@ -286,7 +286,7 @@ static void get_mac(Object *obj, Visitor *v, const ch=
ar *name, void *opaque,
>                      Error **errp)
>  {
>      Property *prop =3D opaque;
> -    MACAddr *mac =3D qdev_get_prop_ptr(obj, prop);
> +    MACAddr *mac =3D object_field_prop_ptr(obj, prop);
>      char buffer[2 * 6 + 5 + 1];
>      char *p =3D buffer;
> =20
> @@ -301,7 +301,7 @@ static void set_mac(Object *obj, Visitor *v, const ch=
ar *name, void *opaque,
>                      Error **errp)
>  {
>      Property *prop =3D opaque;
> -    MACAddr *mac =3D qdev_get_prop_ptr(obj, prop);
> +    MACAddr *mac =3D object_field_prop_ptr(obj, prop);
>      int i, pos;
>      char *str;
>      const char *p;
> @@ -363,7 +363,7 @@ static void get_netdev(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    NICPeers *peers_ptr =3D qdev_get_prop_ptr(obj, prop);
> +    NICPeers *peers_ptr =3D object_field_prop_ptr(obj, prop);
>      char *p =3D g_strdup(peers_ptr->ncs[0] ? peers_ptr->ncs[0]->name : "=
");
> =20
>      visit_type_str(v, name, &p, errp);
> @@ -374,7 +374,7 @@ static void set_netdev(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    NICPeers *peers_ptr =3D qdev_get_prop_ptr(obj, prop);
> +    NICPeers *peers_ptr =3D object_field_prop_ptr(obj, prop);
>      NetClientState **ncs =3D peers_ptr->ncs;
>      NetClientState *peers[MAX_QUEUE_NUM];
>      int queues, err =3D 0, i =3D 0;
> @@ -436,7 +436,7 @@ static void get_audiodev(Object *obj, Visitor *v, con=
st char* name,
>                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    QEMUSoundCard *card =3D qdev_get_prop_ptr(obj, prop);
> +    QEMUSoundCard *card =3D object_field_prop_ptr(obj, prop);
>      char *p =3D g_strdup(audio_get_id(card));
> =20
>      visit_type_str(v, name, &p, errp);
> @@ -447,7 +447,7 @@ static void set_audiodev(Object *obj, Visitor *v, con=
st char* name,
>                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    QEMUSoundCard *card =3D qdev_get_prop_ptr(obj, prop);
> +    QEMUSoundCard *card =3D object_field_prop_ptr(obj, prop);
>      AudioState *state;
>      int err =3D 0;
>      char *str;
> @@ -549,7 +549,7 @@ static void set_blocksize(Object *obj, Visitor *v, co=
nst char *name,
>  {
>      DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
>      uint64_t value;
>      Error *local_err =3D NULL;
> =20
> @@ -637,7 +637,7 @@ static void get_reserved_region(Object *obj, Visitor =
*v, const char *name,
>                                  void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    ReservedRegion *rr =3D qdev_get_prop_ptr(obj, prop);
> +    ReservedRegion *rr =3D object_field_prop_ptr(obj, prop);
>      char buffer[64];
>      char *p =3D buffer;
>      int rc;
> @@ -653,7 +653,7 @@ static void set_reserved_region(Object *obj, Visitor =
*v, const char *name,
>                                  void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    ReservedRegion *rr =3D qdev_get_prop_ptr(obj, prop);
> +    ReservedRegion *rr =3D object_field_prop_ptr(obj, prop);
>      Error *local_err =3D NULL;
>      const char *endptr;
>      char *str;
> @@ -715,7 +715,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, co=
nst char *name,
>                            void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int32_t value, *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int32_t value, *ptr =3D object_field_prop_ptr(obj, prop);
>      unsigned int slot, fn, n;
>      char *str;
> =20
> @@ -753,7 +753,7 @@ invalid:
>  static int print_pci_devfn(Object *obj, Property *prop, char *dest,
>                             size_t len)
>  {
> -    int32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      if (*ptr =3D=3D -1) {
>          return snprintf(dest, len, "<unset>");
> @@ -777,7 +777,7 @@ static void get_pci_host_devaddr(Object *obj, Visitor=
 *v, const char *name,
>                                   void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    PCIHostDeviceAddress *addr =3D qdev_get_prop_ptr(obj, prop);
> +    PCIHostDeviceAddress *addr =3D object_field_prop_ptr(obj, prop);
>      char buffer[] =3D "ffff:ff:ff.f";
>      char *p =3D buffer;
>      int rc =3D 0;
> @@ -803,7 +803,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor=
 *v, const char *name,
>                                   void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    PCIHostDeviceAddress *addr =3D qdev_get_prop_ptr(obj, prop);
> +    PCIHostDeviceAddress *addr =3D object_field_prop_ptr(obj, prop);
>      char *str, *p;
>      char *e;
>      unsigned long val;
> @@ -893,7 +893,7 @@ static void get_prop_pcielinkspeed(Object *obj, Visit=
or *v, const char *name,
>                                     void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    PCIExpLinkSpeed *p =3D qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkSpeed *p =3D object_field_prop_ptr(obj, prop);
>      int speed;
> =20
>      switch (*p) {
> @@ -921,7 +921,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visit=
or *v, const char *name,
>                                     void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    PCIExpLinkSpeed *p =3D qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkSpeed *p =3D object_field_prop_ptr(obj, prop);
>      int speed;
> =20
>      if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
> @@ -963,7 +963,7 @@ static void get_prop_pcielinkwidth(Object *obj, Visit=
or *v, const char *name,
>                                     void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    PCIExpLinkWidth *p =3D qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkWidth *p =3D object_field_prop_ptr(obj, prop);
>      int width;
> =20
>      switch (*p) {
> @@ -1000,7 +1000,7 @@ static void set_prop_pcielinkwidth(Object *obj, Vis=
itor *v, const char *name,
>                                     void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    PCIExpLinkWidth *p =3D qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkWidth *p =3D object_field_prop_ptr(obj, prop);
>      int width;
> =20
>      if (!visit_type_enum(v, name, &width, prop->info->enum_table,
> @@ -1051,7 +1051,7 @@ static void get_uuid(Object *obj, Visitor *v, const=
 char *name, void *opaque,
>                       Error **errp)
>  {
>      Property *prop =3D opaque;
> -    QemuUUID *uuid =3D qdev_get_prop_ptr(obj, prop);
> +    QemuUUID *uuid =3D object_field_prop_ptr(obj, prop);
>      char buffer[UUID_FMT_LEN + 1];
>      char *p =3D buffer;
> =20
> @@ -1066,7 +1066,7 @@ static void set_uuid(Object *obj, Visitor *v, const=
 char *name, void *opaque,
>                      Error **errp)
>  {
>      Property *prop =3D opaque;
> -    QemuUUID *uuid =3D qdev_get_prop_ptr(obj, prop);
> +    QemuUUID *uuid =3D object_field_prop_ptr(obj, prop);
>      char *str;
> =20
>      if (!visit_type_str(v, name, &str, errp)) {
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index c1dd4ae71b..3d648b088d 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -50,7 +50,7 @@ void qdev_prop_allow_set_link_before_realize(const Obje=
ct *obj,
>      }
>  }
> =20
> -void *qdev_get_prop_ptr(Object *obj, Property *prop)
> +void *object_field_prop_ptr(Object *obj, Property *prop)
>  {
>      void *ptr =3D obj;
>      ptr +=3D prop->offset;
> @@ -100,7 +100,7 @@ void field_prop_get_enum(Object *obj, Visitor *v, con=
st char *name,
>                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>  }
> @@ -109,7 +109,7 @@ void field_prop_set_enum(Object *obj, Visitor *v, con=
st char *name,
>                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>  }
> @@ -138,7 +138,7 @@ static uint32_t qdev_get_prop_mask(Property *prop)
> =20
>  static void bit_prop_set(Object *obj, Property *props, bool val)
>  {
> -    uint32_t *p =3D qdev_get_prop_ptr(obj, props);
> +    uint32_t *p =3D object_field_prop_ptr(obj, props);
>      uint32_t mask =3D qdev_get_prop_mask(props);
>      if (val) {
>          *p |=3D mask;
> @@ -151,7 +151,7 @@ static void prop_get_bit(Object *obj, Visitor *v, con=
st char *name,
>                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint32_t *p =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *p =3D object_field_prop_ptr(obj, prop);
>      bool value =3D (*p & qdev_get_prop_mask(prop)) !=3D 0;
> =20
>      visit_type_bool(v, name, &value, errp);
> @@ -192,7 +192,7 @@ static uint64_t qdev_get_prop_mask64(Property *prop)
> =20
>  static void bit64_prop_set(Object *obj, Property *props, bool val)
>  {
> -    uint64_t *p =3D qdev_get_prop_ptr(obj, props);
> +    uint64_t *p =3D object_field_prop_ptr(obj, props);
>      uint64_t mask =3D qdev_get_prop_mask64(props);
>      if (val) {
>          *p |=3D mask;
> @@ -205,7 +205,7 @@ static void prop_get_bit64(Object *obj, Visitor *v, c=
onst char *name,
>                             void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint64_t *p =3D qdev_get_prop_ptr(obj, prop);
> +    uint64_t *p =3D object_field_prop_ptr(obj, prop);
>      bool value =3D (*p & qdev_get_prop_mask64(prop)) !=3D 0;
> =20
>      visit_type_bool(v, name, &value, errp);
> @@ -237,7 +237,7 @@ static void get_bool(Object *obj, Visitor *v, const c=
har *name, void *opaque,
>                       Error **errp)
>  {
>      Property *prop =3D opaque;
> -    bool *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    bool *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_bool(v, name, ptr, errp);
>  }
> @@ -246,7 +246,7 @@ static void set_bool(Object *obj, Visitor *v, const c=
har *name, void *opaque,
>                       Error **errp)
>  {
>      Property *prop =3D opaque;
> -    bool *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    bool *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_bool(v, name, ptr, errp);
>  }
> @@ -264,7 +264,7 @@ static void get_uint8(Object *obj, Visitor *v, const =
char *name, void *opaque,
>                        Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint8_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint8_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint8(v, name, ptr, errp);
>  }
> @@ -273,7 +273,7 @@ static void set_uint8(Object *obj, Visitor *v, const =
char *name, void *opaque,
>                        Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint8_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint8_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint8(v, name, ptr, errp);
>  }
> @@ -303,7 +303,7 @@ static void get_uint16(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint16_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint16_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint16(v, name, ptr, errp);
>  }
> @@ -312,7 +312,7 @@ static void set_uint16(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint16_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint16_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint16(v, name, ptr, errp);
>  }
> @@ -330,7 +330,7 @@ static void get_uint32(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint32(v, name, ptr, errp);
>  }
> @@ -339,7 +339,7 @@ static void set_uint32(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint32(v, name, ptr, errp);
>  }
> @@ -348,7 +348,7 @@ void field_prop_get_int32(Object *obj, Visitor *v, co=
nst char *name,
>                            void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_int32(v, name, ptr, errp);
>  }
> @@ -357,7 +357,7 @@ static void set_int32(Object *obj, Visitor *v, const =
char *name, void *opaque,
>                        Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_int32(v, name, ptr, errp);
>  }
> @@ -382,7 +382,7 @@ static void get_uint64(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint64_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint64(v, name, ptr, errp);
>  }
> @@ -391,7 +391,7 @@ static void set_uint64(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint64_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint64(v, name, ptr, errp);
>  }
> @@ -400,7 +400,7 @@ static void get_int64(Object *obj, Visitor *v, const =
char *name,
>                        void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int64_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int64_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_int64(v, name, ptr, errp);
>  }
> @@ -409,7 +409,7 @@ static void set_int64(Object *obj, Visitor *v, const =
char *name,
>                        void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    int64_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    int64_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_int64(v, name, ptr, errp);
>  }
> @@ -433,14 +433,14 @@ const PropertyInfo prop_info_int64 =3D {
>  static void release_string(Object *obj, const char *name, void *opaque)
>  {
>      Property *prop =3D opaque;
> -    g_free(*(char **)qdev_get_prop_ptr(obj, prop));
> +    g_free(*(char **)object_field_prop_ptr(obj, prop));
>  }
> =20
>  static void get_string(Object *obj, Visitor *v, const char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    char **ptr =3D qdev_get_prop_ptr(obj, prop);
> +    char **ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      if (!*ptr) {
>          char *str =3D (char *)"";
> @@ -454,7 +454,7 @@ static void set_string(Object *obj, Visitor *v, const=
 char *name,
>                         void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    char **ptr =3D qdev_get_prop_ptr(obj, prop);
> +    char **ptr =3D object_field_prop_ptr(obj, prop);
>      char *str;
> =20
>      if (!visit_type_str(v, name, &str, errp)) {
> @@ -488,7 +488,7 @@ void field_prop_get_size32(Object *obj, Visitor *v, c=
onst char *name,
>                             void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
>      uint64_t value =3D *ptr;
> =20
>      visit_type_size(v, name, &value, errp);
> @@ -498,7 +498,7 @@ static void set_size32(Object *obj, Visitor *v, const=
 char *name, void *opaque,
>                         Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
>      uint64_t value;
> =20
>      if (!visit_type_size(v, name, &value, errp)) {
> @@ -561,7 +561,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v=
, const char *name,
>       */
>      DeviceState *dev =3D DEVICE(obj);
>      Property *prop =3D opaque;
> -    uint32_t *alenptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *alenptr =3D object_field_prop_ptr(obj, prop);
>      void **arrayptr =3D (void *)dev + prop->arrayoffset;
>      void *eltptr;
>      const char *arrayname;
> @@ -603,7 +603,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v=
, const char *name,
>           * being inside the device struct.
>           */
>          arrayprop->prop.offset =3D eltptr - (void *)dev;
> -        assert(qdev_get_prop_ptr(obj, &arrayprop->prop) =3D=3D eltptr);
> +        assert(object_field_prop_ptr(obj, &arrayprop->prop) =3D=3D eltpt=
r);
>          object_property_add(obj, propname,
>                              arrayprop->prop.info->name,
>                              field_prop_getter(arrayprop->prop.info),
> @@ -798,7 +798,7 @@ static void get_size(Object *obj, Visitor *v, const c=
har *name, void *opaque,
>                       Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint64_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_size(v, name, ptr, errp);
>  }
> @@ -807,7 +807,7 @@ static void set_size(Object *obj, Visitor *v, const c=
har *name, void *opaque,
>                       Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint64_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_size(v, name, ptr, errp);
>  }
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 496e2c5801..fe47751df4 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -2344,7 +2344,7 @@ static void get_css_devid(Object *obj, Visitor *v, =
const char *name,
>                            void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    CssDevId *dev_id =3D qdev_get_prop_ptr(obj, prop);
> +    CssDevId *dev_id =3D object_field_prop_ptr(obj, prop);
>      char buffer[] =3D "xx.x.xxxx";
>      char *p =3D buffer;
>      int r;
> @@ -2373,7 +2373,7 @@ static void set_css_devid(Object *obj, Visitor *v, =
const char *name,
>                            void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    CssDevId *dev_id =3D qdev_get_prop_ptr(obj, prop);
> +    CssDevId *dev_id =3D object_field_prop_ptr(obj, prop);
>      char *str;
>      int num, n1, n2;
>      unsigned int cssid, ssid, devid;
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 30511f620e..dd138dae94 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1330,7 +1330,7 @@ static void s390_pci_get_fid(Object *obj, Visitor *=
v, const char *name,
>                           void *opaque, Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint32(v, name, ptr, errp);
>  }
> @@ -1340,7 +1340,7 @@ static void s390_pci_set_fid(Object *obj, Visitor *=
v, const char *name,
>  {
>      S390PCIBusDevice *zpci =3D S390_PCI_DEVICE(obj);
>      Property *prop =3D opaque;
> -    uint32_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      if (!visit_type_uint32(v, name, ptr, errp)) {
>          return;
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index 802979635c..fc8d63c850 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1489,7 +1489,7 @@ static void get_nv_gpudirect_clique_id(Object *obj,=
 Visitor *v,
>                                         Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint8_t *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint8_t *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      visit_type_uint8(v, name, ptr, errp);
>  }
> @@ -1499,7 +1499,7 @@ static void set_nv_gpudirect_clique_id(Object *obj,=
 Visitor *v,
>                                         Error **errp)
>  {
>      Property *prop =3D opaque;
> -    uint8_t value, *ptr =3D qdev_get_prop_ptr(obj, prop);
> +    uint8_t value, *ptr =3D object_field_prop_ptr(obj, prop);
> =20
>      if (!visit_type_uint8(v, name, &value, errp)) {
>          return;


