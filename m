Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B550A702C43
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 14:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534742.832067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWxz-00075V-2D; Mon, 15 May 2023 12:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534742.832067; Mon, 15 May 2023 12:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWxy-00073H-Vm; Mon, 15 May 2023 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 534742;
 Mon, 15 May 2023 12:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ei/B=BE=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pyWxx-000737-9H
 for xen-devel@lists.xen.org; Mon, 15 May 2023 12:06:13 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda9536d-f318-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 14:06:05 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ab05018381so117034955ad.2
 for <xen-devel@lists.xen.org>; Mon, 15 May 2023 05:06:05 -0700 (PDT)
Received: from localhost ([122.172.82.60]) by smtp.gmail.com with ESMTPSA id
 t12-20020a170902e84c00b001a687c505e9sm13390424plg.237.2023.05.15.05.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 05:06:02 -0700 (PDT)
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
X-Inumbo-ID: dda9536d-f318-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684152363; x=1686744363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MaJ1hoKbk4appWt+3OAlRAJLplc8pTlP5Thw5ZxratI=;
        b=SJ7N5TTQsXEKmvIwp/ciL5SxDFvd4x5lBWZKR0KsPRxiPAYcM++Dyou82jNZIqkbp5
         xqKGelgz9K3msdarVU2DNYaBNmN9gDKne/Y/giN4siyxb1uepcTxS4tRHDivv4R0r7Wu
         QGRfFbvbQWZ8K+prDTS5nTq3UuX55UE+T77GxDy5iwkG4oLuxasedjzcUWcZ/UjHPp3+
         NEvaVf2RM3/gnzla1LX0LTm7XLnud/bByX7rNmbcSHKqE9uU5Wa+KrMCnoGq7/exJr/P
         bDE3wmKSJAPTcIjyJfS8r3GeEcZYtz6b5yCUxdjO9LPLOxhQmUs1HnJogSBIxmvZqZTQ
         hnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684152363; x=1686744363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaJ1hoKbk4appWt+3OAlRAJLplc8pTlP5Thw5ZxratI=;
        b=DsNg2BWgA+FMgZv0movUCttehYFNL3qsxSxg6lo1HHJLbLcn1X7XaZsxxWD/OJvgQG
         WqGA3BciBQ+PxBBAfg/etavuggv0swWMv8YrFW8ietb1mhDADfvk04LlAmxVuzWA5I30
         UT2GquDQeEIzOQZc9HCswJdYZvSDN/b4UizDFObdq1OUjfcHrGahWxV5K+ohzYpTL3k3
         2zJhvNCowRTCuLvzz+39W3XvEmSpfu8S/se9zATFA4ANgpl7PJY50MN/bxOaKs8/OBwb
         m7RQ/GbOey6jJWTO1oRDUnmgZUaZjgD0MV7GtuMBpFs1FQB6icLZdPi8ziGIe1lMqmn0
         AvuA==
X-Gm-Message-State: AC+VfDz0A5B2/clrG/rFypORvBZ/NlI5TVvtNY/VT26rsaOn94KzvVHL
	nsEAL61l08xwjkXGSry9/e2Few==
X-Google-Smtp-Source: ACHHUZ5wLqdS/db7atxCIX7LJ7htiXQyAOYtfc9oDskkuyhUoAWnSSW2RlHozDpIcMcKoVVR7hLS2A==
X-Received: by 2002:a17:902:d4c9:b0:1ac:637d:5888 with SMTP id o9-20020a170902d4c900b001ac637d5888mr34930419plg.43.1684152363450;
        Mon, 15 May 2023 05:06:03 -0700 (PDT)
Date: Mon, 15 May 2023 17:36:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH V2 2/2] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <20230515120600.bsfw6pe3usae4sl4@vireshk-i7>
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
 <ccf5b1402fb7156be0ef33b44f7b114efbe76319.1683791298.git.viresh.kumar@linaro.org>
 <5dc217d6-ca8f-4c5f-ad7c-2ab30d6647bd@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dc217d6-ca8f-4c5f-ad7c-2ab30d6647bd@perard>

On 12-05-23, 11:43, Anthony PERARD wrote:
> On Thu, May 11, 2023 at 01:20:43PM +0530, Viresh Kumar wrote:
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 24ac92718288..0405f6efe62a 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1619,6 +1619,18 @@ hexadecimal format, without the "0x" prefix and all in lower case, like
> >  Specifies the transport mechanism for the Virtio device, only "mmio" is
> >  supported for now.
> >  
> > +=item B<grant_usage=STRING>
> > +
> > +Specifies the grant usage details for the Virtio device. This can be set to
> > +following values:
> > +
> > +- "default": The default grant setting will be used, enable grants if
> > +  backend-domid != 0.
> 
> I don't think this "default" setting is useful. We could just describe
> what the default is when "grant_usage" setting is missing from the
> configuration.

This is what I suggested earlier [1], maybe I misunderstood what
Juergen said.

> > +- "enabled": The grants are always enabled.
> > +
> > +- "disabled": The grants are always disabled.
> 
> > +            if ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_ENABLED) ||
> > +                ((virtio->grant_usage == LIBXL_VIRTIO_GRANT_USAGE_DEFAULT) &&
> > +                 (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID))) {
> 
> I think libxl can select what the default value should be replace with
> before we start to setup the guest. There's a *_setdefault() phase were
> we set the correct value when a configuration value hasn't been set and
> thus a default value is used. I think this can be done in
>     libxl__device_virtio_setdefault().
> After that, virtio->grant_usage will be true or false, and that's the
> value that should be given to the virtio backend via xenstore.

I am not great with Xen's flow of stuff and so would like to clarify a
few things here since I am confused.

In my case, parse_virtio_config() gets called first followed by
libxl__prepare_dtb(), where I need to use the "grant_usage" field.
Later libxl__device_virtio_setdefault() gets called, anything done
there isn't of much use in my case I guess.

Setting the default value of grant_usage in
libxl__device_virtio_setdefault() doesn't work for me (since
libxl__prepare_dtb() is already called), and I need to set this in
parse_virtio_config() only.

Currently, virtio->backend_domid is getting set via
libxl__resolve_domid() in libxl__device_virtio_setdefault(), which is
too late for me, but is working fine, accidentally I think, since the
default value of the field is 0, which is same as domain id in my
case. I would like to understand though how it works for Disk device
for Oleksandr, since they must also face similar issues. I must be
doing something wrong here :)

Lastly, libxl__virtio_from_xenstore() is never called in my case.
Should I just remove it ? I copied it from some other implementation.

This is how code looks for me currently, I am sure I need to fix it a
bit though, based on reply to above questions.

-------------------------8<-------------------------

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 24ac92718288..3a40ac8cb322 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1619,6 +1619,14 @@ hexadecimal format, without the "0x" prefix and all in lower case, like
 Specifies the transport mechanism for the Virtio device, only "mmio" is
 supported for now.
 
+=item B<grant_usage=BOOLEAN>
+
+If this option is B<true>, the Xen grants are always enabled.
+If this option is B<false>, the Xen grants are always disabled.
+
+If this option is missing, then the default grant setting will be used,
+i.e. enable grants if backend-domid != 0.
+
 =back
 
 =item B<tee="STRING">
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 0a203d22321f..bf846dca8ec0 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1792,6 +1792,9 @@ func (x *DeviceVirtio) fromC(xc *C.libxl_device_virtio) error {
 x.BackendDomname = C.GoString(xc.backend_domname)
 x.Type = C.GoString(xc._type)
 x.Transport = VirtioTransport(xc.transport)
+if err := x.GrantUsage.fromC(&xc.grant_usage);err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
+}
 x.Devid = Devid(xc.devid)
 x.Irq = uint32(xc.irq)
 x.Base = uint64(xc.base)
@@ -1809,6 +1812,9 @@ xc.backend_domname = C.CString(x.BackendDomname)}
 if x.Type != "" {
 xc._type = C.CString(x.Type)}
 xc.transport = C.libxl_virtio_transport(x.Transport)
+if err := x.GrantUsage.toC(&xc.grant_usage); err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
+}
 xc.devid = C.libxl_devid(x.Devid)
 xc.irq = C.uint32_t(x.Irq)
 xc.base = C.uint64_t(x.Base)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a7c17699f80e..e0c6e91bb0ef 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -683,6 +683,7 @@ BackendDomid Domid
 BackendDomname string
 Type string
 Transport VirtioTransport
+GrantUsage Defbool
 Devid Devid
 Irq uint32
 Base uint64
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 97c80d7ed0fa..bc2bd9649b95 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -922,7 +922,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
 
 /* The caller is responsible to complete / close the fdt node */
 static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
-                                        uint32_t irq, uint32_t backend_domid)
+                                        uint32_t irq, uint32_t backend_domid,
+                                        bool grant_usage)
 {
     int res;
     gic_interrupt intr;
@@ -945,7 +946,7 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
-    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+    if (grant_usage) {
         uint32_t iommus_prop[2];
 
         iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
@@ -959,11 +960,12 @@ static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
 }
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
-                                 uint32_t irq, uint32_t backend_domid)
+                                 uint32_t irq, uint32_t backend_domid,
+                                 bool grant_usage)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, grant_usage);
     if (res) return res;
 
     return fdt_end_node(fdt);
@@ -1019,11 +1021,11 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
 
 static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
                                         uint32_t irq, const char *type,
-                                        uint32_t backend_domid)
+                                        uint32_t backend_domid, bool grant_usage)
 {
     int res;
 
-    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid, grant_usage);
     if (res) return res;
 
     /* Add device specific nodes */
@@ -1363,7 +1365,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                                           disk->backend_domid,
+                                           disk->backend_domid != LIBXL_TOOLSTACK_DOMID) );
             }
         }
 
@@ -1373,12 +1376,13 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
                 continue;
 
-            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+            if (libxl_defbool_val(virtio->grant_usage))
                 iommu_needed = true;
 
             FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
                                               virtio->irq, virtio->type,
-                                              virtio->backend_domid) );
+                                              virtio->backend_domid,
+                                              libxl_defbool_val(virtio->grant_usage)) );
         }
 
         /*
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c10292e0d7e3..c5c0d1f91793 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -740,6 +740,7 @@ libxl_device_virtio = Struct("device_virtio", [
     ("backend_domname", string),
     ("type", string),
     ("transport", libxl_virtio_transport),
+    ("grant_usage", libxl_defbool),
     ("devid", libxl_devid),
     # Note that virtio-mmio parameters (irq and base) are for internal
     # use by libxl and can't be modified.
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index f8a78e22d156..19d834984777 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -23,8 +23,16 @@ static int libxl__device_virtio_setdefault(libxl__gc *gc, uint32_t domid,
                                            libxl_device_virtio *virtio,
                                            bool hotplug)
 {
-    return libxl__resolve_domid(gc, virtio->backend_domname,
-                                &virtio->backend_domid);
+    int rc;
+
+    rc = libxl__resolve_domid(gc, virtio->backend_domname,
+                              &virtio->backend_domid);
+    if (rc < 0) return rc;
+
+    libxl_defbool_setdefault(&virtio->grant_usage,
+                             virtio->backend_domid != LIBXL_TOOLSTACK_DOMID);
+
+    return 0;
 }
 
 static int libxl__device_from_virtio(libxl__gc *gc, uint32_t domid,
@@ -48,11 +56,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
                                       flexarray_t *ro_front)
 {
     const char *transport = libxl_virtio_transport_to_string(virtio->transport);
+    const char *grant_usage = libxl_defbool_to_string(virtio->grant_usage);
 
     flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
     flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
     flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
     flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
+    flexarray_append_pair(back, "grant_usage", GCSPRINTF("%s", grant_usage));
 
     return 0;
 }
@@ -104,6 +114,15 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
         }
     }
 
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/grant_usage", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        libxl_defbool_set(&virtio->grant_usage, strtoul(tmp, NULL, 0));
+    }
+
     tmp = NULL;
     rc = libxl__xs_read_checked(gc, XBT_NULL,
 				GCSPRINTF("%s/type", be_path), &tmp);
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4e1..aa2bb214091e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1208,6 +1208,9 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
     char *oparg;
     int rc;
 
+    libxl_defbool_setdefault(&virtio->grant_usage,
+                             virtio->backend_domid != 0);
+
     if (MATCH_OPTION("backend", token, oparg)) {
         virtio->backend_domname = strdup(oparg);
     } else if (MATCH_OPTION("type", token, oparg)) {
@@ -1215,6 +1218,8 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
     } else if (MATCH_OPTION("transport", token, oparg)) {
         rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
         if (rc) return rc;
+    } else if (MATCH_OPTION("grant_usage", token, oparg)) {
+        libxl_defbool_set(&virtio->grant_usage, strtoul(oparg, NULL, 0));
     } else {
         fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
         return -1;


-- 
viresh

[1] https://lore.kernel.org/all/016edde8-e47e-a988-e5c1-f5aad0d4b60d@suse.com/

