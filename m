Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB87EC166
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633593.988572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EJy-00041P-Ia; Wed, 15 Nov 2023 11:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633593.988572; Wed, 15 Nov 2023 11:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EJy-0003yM-Fj; Wed, 15 Nov 2023 11:44:38 +0000
Received: by outflank-mailman (input) for mailman id 633593;
 Wed, 15 Nov 2023 11:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXr+=G4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r3EJw-0003xI-Mb
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:44:36 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57faf81d-83ac-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 12:44:34 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 11D053168E;
 Wed, 15 Nov 2023 06:44:32 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id F0D533168D;
 Wed, 15 Nov 2023 06:44:31 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 81D3531686;
 Wed, 15 Nov 2023 06:44:28 -0500 (EST)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 57faf81d-83ac-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=1byc8tTDalGgfp9r8WtxNSc0wnf6PEpeIh9WLNVUOYE=; b=pIJb
	dSgT9UVyiPRk05M4ckO/xEThRgyiIOQUWhSrmAqKAUtZ6a9kS/btfY3YJHSvo5Rm
	1W5zWfwdCntZOuGCcus98TBP80ybOuASlzm6YpkkfEn0QS2yd5xKEusPenMVY+mU
	I0xp/Ap9G/y1XAHR5apJ9p8NBHLwMnB1WzInEVg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH 6/6] libxl: Add "backend_type" property for the Virtio devices
Date: Wed, 15 Nov 2023 13:44:24 +0200
Message-Id: <20231115114424.3867133-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 5566DE5E-83AC-11EE-BD2C-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Introduce new configuration option "backend_type" for the Virtio
devices in order to specify backend implementation to use.
There are two possible values "qemu" (default) and "standalone".

If backend is in Qemu (backend_type=3Dqemu) and Qemu runs in toolstack
domain (backend=3DDomain-0) then Qemu will be launched automatically
at the guest creation time. For this to work implement "dm_needed"
callback.

Please note, there is no support for Qemu in other domains for
the time being, so the combination of "backend=3DDomD" and
"backend_type=3Dqemu" just won't work.

Qemu configuration for Virtio devices should be described via
"device_model_args" property.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 docs/man/xl.cfg.5.pod.in         |  9 +++++++++
 tools/libs/light/libxl_types.idl |  7 +++++++
 tools/libs/light/libxl_virtio.c  | 29 ++++++++++++++++++++++++++++-
 tools/xl/xl_parse.c              |  3 +++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0fba750815..592aad1d1e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1624,6 +1624,15 @@ are supported. This option is mandatory.
 The Virtio device with transport "pci" must be identified by its B<BDF>.
 See L<xl-pci-configuration(5)> for more details about the format for B<B=
DF>.
=20
+=3Ditem B<backend_type=3DSTRING>
+
+Specifies the software implementation of the backend implementation to u=
se.
+This option doesn't affect the guest's view of the Virtio device.
+
+Both "qemu" and "standalone" are supported. The only difference is
+that for the former the toolstack assists with configuring and launching
+the device-model. If this option is missing, then "qemu" value will be u=
sed.
+
 =3Ditem B<grant_usage=3DBOOLEAN>
=20
 If this option is B<true>, the Xen grants are always enabled.
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
index a86c601994..13b8ade41c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -284,6 +284,12 @@ libxl_virtio_transport =3D Enumeration("virtio_trans=
port", [
     (2, "PCI"),
     ])
=20
+libxl_virtio_backend =3D Enumeration("virtio_backend", [
+    (0, "UNKNOWN"),
+    (1, "QEMU"),
+    (2, "STANDALONE"),
+    ])
+
 libxl_passthrough =3D Enumeration("passthrough", [
     (0, "default"),
     (1, "disabled"),
@@ -778,6 +784,7 @@ libxl_device_vkb =3D Struct("device_vkb", [
 libxl_device_virtio =3D Struct("device_virtio", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
+    ("backend_type", libxl_virtio_backend),
     ("type", string),
     ("u", KeyedUnion(None, libxl_virtio_transport, "transport",
               [("unknown", None),
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_vir=
tio.c
index 8062423c75..339a2006f0 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -32,9 +32,20 @@ static int libxl__device_virtio_setdefault(libxl__gc *=
gc, uint32_t domid,
     libxl_defbool_setdefault(&virtio->grant_usage,
                              virtio->backend_domid !=3D LIBXL_TOOLSTACK_=
DOMID);
=20
+    if (virtio->backend_type =3D=3D LIBXL_VIRTIO_BACKEND_UNKNOWN)
+        virtio->backend_type =3D LIBXL_VIRTIO_BACKEND_QEMU;
+
     return 0;
 }
=20
+static int libxl__device_virtio_dm_needed(void *e, unsigned domid)
+{
+    libxl_device_virtio *elem =3D e;
+
+    return elem->backend_type =3D=3D LIBXL_VIRTIO_BACKEND_QEMU &&
+           elem->backend_domid =3D=3D domid;
+}
+
 static int libxl__device_from_virtio(libxl__gc *gc, uint32_t domid,
                                      libxl_device_virtio *virtio,
                                      libxl__device *device)
@@ -55,7 +66,8 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, ui=
nt32_t domid,
                                       flexarray_t *back, flexarray_t *fr=
ont,
                                       flexarray_t *ro_front)
 {
-    const char *transport =3D libxl_virtio_transport_to_string(virtio->t=
ransport);
+    const char *transport =3D libxl_virtio_transport_to_string(virtio->t=
ransport),
+               *backend =3D libxl_virtio_backend_to_string(virtio->backe=
nd_type);
=20
     if (virtio->transport =3D=3D LIBXL_VIRTIO_TRANSPORT_MMIO) {
         flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->u.mmi=
o.irq));
@@ -74,6 +86,7 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, ui=
nt32_t domid,
     }
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport))=
;
+    flexarray_append_pair(back, "backend_type", GCSPRINTF("%s", backend)=
);
     flexarray_append_pair(back, "grant_usage",
                           libxl_defbool_val(virtio->grant_usage) ? "1" :=
 "0");
=20
@@ -166,6 +179,19 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc=
, const char *libxl_path,
         }
     }
=20
+    tmp =3D NULL;
+    rc =3D libxl__xs_read_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/backend_type", be_path), &=
tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        rc =3D libxl_virtio_backend_from_string(tmp, &virtio->backend_ty=
pe);
+        if (rc) {
+            LOG(ERROR, "Unable to parse xenstore node %s/backend_type", =
be_path);
+            goto out;
+        }
+    }
+
     tmp =3D NULL;
     rc =3D libxl__xs_read_checked(gc, XBT_NULL,
                                 GCSPRINTF("%s/grant_usage", be_path), &t=
mp);
@@ -200,6 +226,7 @@ static LIBXL_DEFINE_UPDATE_DEVID(virtio)
 #define libxl_device_virtio_compare NULL
=20
 DEFINE_DEVICE_TYPE_STRUCT(virtio, VIRTIO, virtios,
+    .dm_needed =3D libxl__device_virtio_dm_needed,
     .set_xenstore_config =3D (device_set_xenstore_config_fn_t)
                            libxl__set_xenstore_virtio,
     .from_xenstore =3D (device_from_xenstore_fn_t)libxl__virtio_from_xen=
store,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4544ce2307..234cef5f7e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1215,6 +1215,9 @@ static int parse_virtio_config(libxl_device_virtio =
*virtio, char *token)
     } else if (MATCH_OPTION("transport", token, oparg)) {
         rc =3D libxl_virtio_transport_from_string(oparg, &virtio->transp=
ort);
         if (rc) return rc;
+    } else if (MATCH_OPTION("backend_type", token, oparg)) {
+        rc =3D libxl_virtio_backend_from_string(oparg, &virtio->backend_=
type);
+        if (rc) return rc;
     } else if (MATCH_OPTION("grant_usage", token, oparg)) {
         libxl_defbool_set(&virtio->grant_usage, strtoul(oparg, NULL, 0))=
;
     } else if (MATCH_OPTION("bdf", token, oparg)) {
--=20
2.25.1


