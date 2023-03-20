Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3556C2029
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:42:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512069.791696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKSH-0006Kq-Sj; Mon, 20 Mar 2023 18:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512069.791696; Mon, 20 Mar 2023 18:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKSH-0006IY-Os; Mon, 20 Mar 2023 18:42:01 +0000
Received: by outflank-mailman (input) for mailman id 512069;
 Mon, 20 Mar 2023 18:42:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJTx=7M=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1peKSG-0006IO-2H
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 18:42:00 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e48e5c41-c74e-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 19:41:57 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id cy23so50505840edb.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 11:41:57 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 g26-20020a1709064e5a00b00930525d89e2sm4713481ejw.89.2023.03.20.11.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 11:41:56 -0700 (PDT)
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
X-Inumbo-ID: e48e5c41-c74e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679337717;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5sYjg0jBsL2jJxH4vrRssLuchzA6izTtqncZVVtxao=;
        b=BPcliWQNMk87obcfpHKQn+9EIZdm/nKv7VmGPjqf8NmCPcbqWd64SHe1gdCIn5kE5r
         M7E0jOnV0G/ZUJqHZXiO9rrJg0gU2yex5+L7DUmgrSfGIhSPZTJf/SrUJlCQd7NEzdPt
         tSwrrMLk+6NAtosG+ePj/Fsgh82yi4sNBrDBv+xZBXzvoFyQlLLNkVyzAs15NLpp1LD9
         MapLkrYOrFo+Z05O9C1/O0fM7hyT8DqPcHaJBHv2UbdQwosRSUWNibJEjuoUbEcHyYln
         cLWmYN6sfqxhAQGOluSLMy953Y2oPx5anxrFsBw8fYhemCs7Z46CoV20c4Uc+YWmRjZ6
         CW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679337717;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5sYjg0jBsL2jJxH4vrRssLuchzA6izTtqncZVVtxao=;
        b=4CYpvcW2gTBOECkK2JGuoC4S8CdC02bGNRbm+ARClADJYVJb2rb5zRz1KrXyslrPpK
         Ndavrku7qFUF1NNdlBsUaa3/D2JiFII9qFovUPeh6P8IEbQLrz5Fh4RNDLAbLDVNCkBP
         xHyuTYqVaD9e2j8vwYvAX0ht2Nf3U1eyb4t222iX6e63XbdofYncXBRQZ4NPrPBNpi7Q
         6Bolx10zYbsmKNiU1j1LtdrOeRRalzlzaQHm619fP4HNhPiK+4hU5+N7nzKYKXWErtXy
         r9sV8a0CofEEu+MTdo9EKaDbCtpkQrCx8yu6Rf7+H/0GfxLNL+jJwQjp1enl8UKj1ZVX
         zutw==
X-Gm-Message-State: AO0yUKUIUis2kml/rrV8161+G5GdxtcoggGFYBRhYB8nkYNhCu5zRv2y
	7dt1FD5lqaEnWL6UMoXKxtQ=
X-Google-Smtp-Source: AK7set9VO64wcT0abmsv0BNocsxIcxyAwMbDZanuQ0HX+CoKRj3lv9bbGeRi67LYQZpXQlie0tlxYA==
X-Received: by 2002:a17:906:d146:b0:90b:208:6179 with SMTP id br6-20020a170906d14600b0090b02086179mr591925ejb.28.1679337717020;
        Mon, 20 Mar 2023 11:41:57 -0700 (PDT)
Date: Mon, 20 Mar 2023 09:13:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Marek_Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Fix host pci for stubdom
In-Reply-To: <20230320000554.8219-1-jandryuk@gmail.com>
References: <20230320000554.8219-1-jandryuk@gmail.com>
Message-ID: <A6498A22-B701-4B0A-884E-575EEBD77EAB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 20=2E M=C3=A4rz 2023 00:05:54 UTC schrieb Jason Andryuk <jandryuk@gmail=
=2Ecom>:
>PCI passthrough for an HVM with a stubdom is PV PCI passthrough from
>dom0 to the stubdom, and then QEMU passthrough of the PCI device inside
>the stubdom=2E  xen-pciback has boolean module param passthrough which
>controls "how to export PCI topology to guest"=2E  If passthrough=3D1, th=
e
>frontend shows a PCI SBDF matching the backend host device=2E  When
>passthough=3D0, the frontend will get a sequentially allocated SBDF=2E
>
>libxl passes the host SBDF over QMP to QEMU=2E  For non-stubdom or stubdo=
m
>with passthrough=3D1, this works fine=2E  However, it fails for
>passthrough=3D0 when QEMU can't find the sysfs node for the host SBDF=2E
>
>Handle all these cases=2E  Look for the xenstore frontend nodes=2E  If th=
ey
>are missing, then default to using the QMP command provided SBDF=2E  This
>is the non-stubdom case=2E  If xenstore nodes are found, then read the
>local SBDF from the xenstore nodes=2E  This will handle either
>passthrough=3D0/1 case=2E
>
>Based on a stubdom-specific patch originally by Marek
>Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=2Ecom>, which is b=
ased
>on earlier work by HW42 <hw42@ipsumj=2Ede>
>
>Signed-off-by: Jason Andryuk <jandryuk@gmail=2Ecom>
>---
> hw/xen/xen-host-pci-device=2Ec | 96 +++++++++++++++++++++++++++++++++++-
> hw/xen/xen-host-pci-device=2Eh |  6 +++
> 2 files changed, 101 insertions(+), 1 deletion(-)
>
>diff --git a/hw/xen/xen-host-pci-device=2Ec b/hw/xen/xen-host-pci-device=
=2Ec
>index 8c6e9a1716=2E=2E51a72b432d 100644
>--- a/hw/xen/xen-host-pci-device=2Ec
>+++ b/hw/xen/xen-host-pci-device=2Ec
>@@ -9,6 +9,7 @@
> #include "qemu/osdep=2Eh"
> #include "qapi/error=2Eh"
> #include "qemu/cutils=2Eh"
>+#include "hw/xen/xen-legacy-backend=2Eh"
> #include "xen-host-pci-device=2Eh"
>=20
> #define XEN_HOST_PCI_MAX_EXT_CAP \
>@@ -33,13 +34,101 @@
> #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
> #define IORESOURCE_MEM_64       0x00100000
>=20
>+/*
>+ * Non-passthrough (dom0) accesses are local PCI devices and use the giv=
en BDF
>+ * Passthough (stubdom) accesses are through PV frontend PCI device=2E  =
Those

I'm unable to parse this sentence, which may be due to my unfamiliarity wi=
th Xen terminology=2E

There is also an extra space before "Those"=2E

Best regards,
Bernhard

>+ * either have a BDF identical to the backend's BFD (xen-backend=2Epasst=
hrough=3D1)
>+ * or a local virtual BDF (xen-backend=2Epassthrough=3D0)
>+ *
>+ * We are always given the backend's BDF and need to lookup the appropri=
ate
>+ * local BDF for sysfs access=2E
>+ */
>+static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **er=
rp)
>+{
>+    unsigned int num_devs, len, i;
>+    unsigned int domain, bus, dev, func;
>+    char *be_path;
>+    char path[80];
>+    char *msg;
>+
>+    be_path =3D qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", &l=
en);
>+    if (!be_path) {
>+        /*
>+         * be_path doesn't exist, so we are dealing with a local
>+         * (non-passthough) device=2E
>+         */
>+        d->local_domain =3D d->domain;
>+        d->local_bus =3D d->bus;
>+        d->local_dev =3D d->dev;
>+        d->local_func =3D d->func;
>+
>+        return;
>+    }
>+
>+    snprintf(path, sizeof(path), "%s/num_devs", be_path);
>+    msg =3D qemu_xen_xs_read(xenstore, 0, path, &len);
>+    if (!msg) {
>+        goto err_out;
>+    }
>+
>+    if (sscanf(msg, "%u", &num_devs) !=3D 1) {
>+        error_setg(errp, "Failed to parse %s (%s)", msg, path);
>+        goto err_out;
>+    }
>+    free(msg);
>+
>+    for (i =3D 0; i < num_devs; i++) {
>+        snprintf(path, sizeof(path), "%s/dev-%u", be_path, i);
>+        msg =3D qemu_xen_xs_read(xenstore, 0, path, &len);
>+        if (!msg) {
>+            error_setg(errp, "Failed to read %s", path);
>+            goto err_out;
>+        }
>+        if (sscanf(msg, "%x:%x:%x=2E%x", &domain, &bus, &dev, &func) !=
=3D 4) {
>+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
>+            goto err_out;
>+        }
>+        free(msg);
>+        if (domain !=3D d->domain ||
>+            bus !=3D d->bus ||
>+            dev !=3D d->dev ||
>+            func !=3D d->func)
>+            continue;
>+        snprintf(path, sizeof(path), "%s/vdev-%u", be_path, i);
>+        msg =3D qemu_xen_xs_read(xenstore, 0, path, &len);
>+        if (!msg) {
>+            error_setg(errp, "Failed to read %s", path);
>+            goto out;
>+        }
>+        if (sscanf(msg, "%x:%x:%x=2E%x", &domain, &bus, &dev, &func) !=
=3D 4) {
>+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
>+            goto err_out;
>+        }
>+        free(msg);
>+        d->local_domain =3D domain;
>+        d->local_bus =3D bus;
>+        d->local_dev =3D dev;
>+        d->local_func =3D func;
>+        goto out;
>+    }
>+
>+    error_setg(errp, "Failed to find local %x:%x:%x=2E%x", d->domain, d-=
>bus,
>+               d->dev, d->func);
>+
>+err_out:
>+    free(msg);
>+out:
>+    free(be_path);
>+}
>+
> static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
>                                     const char *name, char *buf, ssize_t=
 size)
> {
>     int rc;
>=20
>     rc =3D snprintf(buf, size, "/sys/bus/pci/devices/%04x:%02x:%02x=2E%d=
/%s",
>-                  d->domain, d->bus, d->dev, d->func, name);
>+                  d->local_domain, d->local_bus, d->local_dev, d->local_=
func,
>+                  name);
>     assert(rc >=3D 0 && rc < size);
> }
>=20
>@@ -342,6 +431,11 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, ui=
nt16_t domain,
>     d->dev =3D dev;
>     d->func =3D func;
>=20
>+    xen_host_pci_fill_local_addr(d, errp);
>+    if (*errp) {
>+        goto error;
>+    }
>+
>     xen_host_pci_config_open(d, errp);
>     if (*errp) {
>         goto error;
>diff --git a/hw/xen/xen-host-pci-device=2Eh b/hw/xen/xen-host-pci-device=
=2Eh
>index 4d8d34ecb0=2E=2E270dcb27f7 100644
>--- a/hw/xen/xen-host-pci-device=2Eh
>+++ b/hw/xen/xen-host-pci-device=2Eh
>@@ -23,6 +23,12 @@ typedef struct XenHostPCIDevice {
>     uint8_t dev;
>     uint8_t func;
>=20
>+    /* different from the above in case of stubdomain */
>+    uint16_t local_domain;
>+    uint8_t local_bus;
>+    uint8_t local_dev;
>+    uint8_t local_func;
>+
>     uint16_t vendor_id;
>     uint16_t device_id;
>     uint32_t class_code;

