Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5801B31C33
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 16:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090244.1447586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSxn-0000mM-6N; Fri, 22 Aug 2025 14:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090244.1447586; Fri, 22 Aug 2025 14:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSxn-0000kG-3A; Fri, 22 Aug 2025 14:41:55 +0000
Received: by outflank-mailman (input) for mailman id 1090244;
 Fri, 22 Aug 2025 14:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R3KH=3C=bounce.vates.tech=bounce-md_30504962.68a881ae.v1-30e51eda28ee45148822aae41c14ec7b@srs-se1.protection.inumbo.net>)
 id 1upSxm-0000k8-8F
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 14:41:54 +0000
Received: from mail179-29.suw41.mandrillapp.com
 (mail179-29.suw41.mandrillapp.com [198.2.179.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24039d68-7f66-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 16:41:52 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-29.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4c7jZ66hf9z7lmQ7b
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 14:41:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 30e51eda28ee45148822aae41c14ec7b; Fri, 22 Aug 2025 14:41:50 +0000
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
X-Inumbo-ID: 24039d68-7f66-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755873710; x=1756143710;
	bh=NRYzlEOPNrDb3NoHUCe7/NvFmhhJoEj/CrGc45K0Xug=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YP+EcQY5aNce3WRkVFsI8/rOa7etVx/oquwvVfo0s67jDp6/C7a1VUhvhx6pTSxMC
	 vV1rAkPXkAbc5LDTkQIQCeHm/CL1bvk3Ug3/L0s4OHgenGBkUcivoxp/zIVvb4boVa
	 xq6QIhpVaNzojwRxiITaBDwe/ClxmXyPOjD2sT5FureizSnqeBYmxqs21Sjkr/WzaW
	 lx1hmc0l8O5J1nWgJBFH/aZ+2TIKy94vTrxnAUkK4WH8MtFUb8chc17WVQ/n7NLNGH
	 7b3fwwkD/ab2nAgIMrU5F2f1LowtgzSji2xHI+7QYvdZxP4OAAlhh/+B0vqFgNWq1U
	 LnVs/Lfh0e3QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755873710; x=1756134210; i=teddy.astie@vates.tech;
	bh=NRYzlEOPNrDb3NoHUCe7/NvFmhhJoEj/CrGc45K0Xug=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SEkWMFFTb1QZ6Id8uaaAElsVlqXhImMp4dCFwgpQ/4jLMopuEZPfU9rOlw1cc938+
	 mmn1NMkZaMZ0kBOgfc3CIjGJIvVibV5T+GKEZdAs/5xDFI8pDinCTCPHJDicc6zHdM
	 LTZqroW99c9miLOXIlLv/eLl2Z+QiJmmde6tZ1I2Nhkomfm9/Ocyl9R1jprg5KohOt
	 fCZWEqYN5GBph/8Ygv//TcwAwg62Fu2YUFc9Y5ddLdFMSRylirk6t3F+2ghXm7wWRs
	 iQbb2IMsnCA+rNda6J2Y0PhW9YT2poZgutYI/Vm5Kg9TS3lA/KSZh32z4iJKeUOBi3
	 FJTlhCnyroM2g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1]=20tools:=20make=20"opengl"=20generic?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755873708081
Message-Id: <e95fff95-c0f6-4c7b-94ef-dc6a13f21453@vates.tech>
To: "Penny Zheng" <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Edgar.Iglesias@amd.com, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
References: <20250728044007.4026420-1-Penny.Zheng@amd.com>
In-Reply-To: <20250728044007.4026420-1-Penny.Zheng@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.30e51eda28ee45148822aae41c14ec7b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250822:md
Date: Fri, 22 Aug 2025 14:41:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 28/07/2025 =C3=A0 06:45, Penny Zheng a =C3=A9crit=C2=A0:
> Display option, like vnc, sdl, etc, will be checked against in latest QEM=
U
> whether it is compatile with opengl context. And vnc is incompatible with=
 GL
> context.
> Now, when running hvm domain with gl context on, such as
> "device_model_args_hvm =3D ["-display", "sdl,gl=3Don"]", we will fail wit=
h
> the error of "qemu-system-i386: -vnc 127.0.0.1:0,to=3D99: Display vnc is
> incompatible with the GL context", as vnc is set enabled on default
> for HVM domain.
> 
> We shall move "opengl" option out of specifc sdl display, to make it
> generic. Then when users explicitly set "opengl =3D 1", default values fo=
r
> vnc shall be changed to disabled and libxl__dm_vnc() needs to return NULL
> indicating vnc being disabled.
> 
> If users select both vnc and opengl in xl configuration, creation
> will fail and error out incompatible info.
> To keep consistency, we also make "opengl" generic for vfb[] options
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

There is a way to make vnc work with opengl by using the egl-headless 
display (-display egl-headless,gl=3Don), which can coexist along vnc. So 
that we could avoid having "opengl" as a sdl-specific option.

> ---
>   tools/libs/light/libxl_console.c |  4 ++--
>   tools/libs/light/libxl_create.c  | 10 ++++++----
>   tools/libs/light/libxl_dm.c      |  7 ++++++-
>   tools/libs/light/libxl_types.idl |  3 ++-
>   tools/xl/xl_parse.c              | 17 +++++++++--------
>   tools/xl/xl_sxp.c                |  6 +++---
>   6 files changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_co=
nsole.c
> index 044ca64676..fc3dfddc4d 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -694,7 +694,7 @@ static int libxl__device_vfb_setdefault(libxl__gc *gc=
, uint32_t domid,
>       }
>   
>       libxl_defbool_setdefault(&vfb->sdl.enable, false);
> -    libxl_defbool_setdefault(&vfb->sdl.opengl, false);
> +    libxl_defbool_setdefault(&vfb->opengl, false);
>   
>       rc =3D libxl__resolve_domid(gc, vfb->backend_domname, &vfb->backend=
_domid);
>       return rc;
> @@ -733,7 +733,7 @@ static int libxl__set_xenstore_vfb(libxl__gc *gc, uin=
t32_t domid,
>       flexarray_append_pair(back, "sdl",
>                             libxl_defbool_val(vfb->sdl.enable) ? "1" : "0=
");
>       flexarray_append_pair(back, "opengl",
> -                          libxl_defbool_val(vfb->sdl.opengl) ? "1" : "0"=
);
> +                          libxl_defbool_val(vfb->opengl) ? "1" : "0");
>       if (vfb->sdl.xauthority) {
>           flexarray_append_pair(back, "xauthority", vfb->sdl.xauthority);
>       }
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index 4301f17f90..7bbd1ff9b4 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -339,7 +339,12 @@ int libxl__domain_build_info_setdefault(libxl__gc *g=
c,
>           if (!b_info->u.hvm.boot)
>               b_info->u.hvm.boot =3D libxl__strdup(NOGC, "cda");
>   
> -        libxl_defbool_setdefault(&b_info->u.hvm.vnc.enable, true);
> +        libxl_defbool_setdefault(&b_info->u.hvm.opengl, false);
> +
> +        if (libxl_defbool_val(b_info->u.hvm.opengl))
> +            libxl_defbool_setdefault(&b_info->u.hvm.vnc.enable, false);
> +        else
> +            libxl_defbool_setdefault(&b_info->u.hvm.vnc.enable, true);
>           if (libxl_defbool_val(b_info->u.hvm.vnc.enable)) {
>               libxl_defbool_setdefault(&b_info->u.hvm.vnc.findunused, tru=
e);
>               if (!b_info->u.hvm.vnc.listen)
> @@ -347,9 +352,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc=
,
>           }
>   
>           libxl_defbool_setdefault(&b_info->u.hvm.sdl.enable, false);
> -        if (libxl_defbool_val(b_info->u.hvm.sdl.enable)) {
> -            libxl_defbool_setdefault(&b_info->u.hvm.sdl.opengl, false);
> -        }
>   
>           if (libxl_defbool_val(b_info->u.hvm.spice.enable)) {
>               libxl_defbool_setdefault(&b_info->u.hvm.spice.disable_ticke=
ting,
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 511ec76a65..7adf473c81 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -672,6 +672,10 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc=
,
>   const libxl_vnc_info *libxl__dm_vnc(const libxl_domain_config *guest_co=
nfig)
>   {
>       const libxl_vnc_info *vnc =3D NULL;
> +
> +    if (libxl_defbool_val(guest_config->b_info.u.hvm.opengl))
> +        return NULL;
> +
>       if (guest_config->b_info.type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
>           vnc =3D &guest_config->b_info.u.hvm.vnc;
>       } else if (guest_config->num_vfbs > 0) {
> @@ -955,6 +959,7 @@ static int libxl__build_device_model_args_new(libxl__=
gc *gc,
>       const char *path, *chardev;
>       bool is_stubdom =3D libxl_defbool_val(b_info->device_model_stubdoma=
in);
>       int rc;
> +    bool has_opengl =3D libxl_defbool_val(b_info->u.hvm.opengl);
>   
>       dm_args =3D flexarray_make(gc, 16, 1);
>       dm_envs =3D flexarray_make(gc, 16, 1);
> @@ -1084,7 +1089,7 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
>           }
>   
>           flexarray_append(dm_args, vncarg);
> -    } else if (!is_stubdom) {
> +    } else if (!is_stubdom && !has_opengl) {
>           /*
>            * Ensure that by default no vnc server is created.
>            */
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index fe251649f3..ab768381ce 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -349,7 +349,6 @@ libxl_spice_info =3D Struct("spice_info", [
>   
>   libxl_sdl_info =3D Struct("sdl_info", [
>       ("enable",        libxl_defbool),
> -    ("opengl",        libxl_defbool),
>       ("display",       string),
>       ("xauthority",    string),
>       ])
> @@ -670,6 +669,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>                                          ("acpi_firmware",    string),
>                                          ("hdtype",           libxl_hdtyp=
e),
>                                          ("nographic",        libxl_defbo=
ol),
> +                                       ("opengl",           libxl_defboo=
l),
>                                          ("vga",              libxl_vga_i=
nterface_info),
>                                          ("vnc",              libxl_vnc_i=
nfo),
>                                          # keyboard layout, default is en=
-us keyboard
> @@ -748,6 +748,7 @@ libxl_device_vfb =3D Struct("device_vfb", [
>       ("backend_domid", libxl_domid),
>       ("backend_domname",string),
>       ("devid",         libxl_devid),
> +    ("opengl",        libxl_defbool),
>       ("vnc",           libxl_vnc_info),
>       ("sdl",           libxl_sdl_info),
>       # set keyboard layout, default is en-us keyboard
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 28cdbf07c2..9e9adcec77 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -272,7 +272,6 @@ static void parse_top_level_sdl_options(XLU_Config *c=
onfig,
>                                           libxl_sdl_info *sdl)
>   {
>       xlu_cfg_get_defbool(config, "sdl", &sdl->enable, 0);
> -    xlu_cfg_get_defbool(config, "opengl", &sdl->opengl, 0);
>       xlu_cfg_replace_string (config, "display", &sdl->display, 0);
>       xlu_cfg_replace_string (config, "xauthority", &sdl->xauthority, 0);
>   }
> @@ -1291,7 +1290,7 @@ void parse_config_data(const char *config_source,
>   {
>       libxl_physinfo physinfo;
>       const char *buf;
> -    long l, vcpus =3D 0;
> +    long l, vcpus =3D 0, vnc_enabled =3D 0;
>       XLU_Config *config;
>       XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
>                      *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_=
devs;
> @@ -2572,7 +2571,7 @@ skip_nic:
>                   } else if (!strcmp(p, "sdl")) {
>                       libxl_defbool_set(&vfb->sdl.enable, atoi(p2 + 1));
>                   } else if (!strcmp(p, "opengl")) {
> -                    libxl_defbool_set(&vfb->sdl.opengl, atoi(p2 + 1));
> +                    libxl_defbool_set(&vfb->opengl, atoi(p2 + 1));
>                   } else if (!strcmp(p, "display")) {
>                       free(vfb->sdl.display);
>                       vfb->sdl.display =3D strdup(p2 + 1);
> @@ -2791,14 +2790,16 @@ skip_usbdev:
>   
>   #undef parse_extra_args
>   
> +    if (!xlu_cfg_get_long (config, "vnc", &l, 0))
> +        vnc_enabled =3D l;
> +    xlu_cfg_get_defbool(config, "opengl", &b_info->u.hvm.opengl, 0);
> +    if (vnc_enabled && libxl_defbool_val(b_info->u.hvm.opengl)) {
> +        fprintf(stderr, "vnc is incompatible with opengl\n");
> +        exit(1);
> +    }
>       /* If we've already got vfb=3D[] for PV guest then ignore top level
>        * VNC config. */
>       if (c_info->type =3D=3D LIBXL_DOMAIN_TYPE_PV && !d_config->num_vfbs=
) {
> -        long vnc_enabled =3D 0;
> -
> -        if (!xlu_cfg_get_long (config, "vnc", &l, 0))
> -            vnc_enabled =3D l;
> -
>           if (vnc_enabled) {
>               libxl_device_vfb *vfb;
>               libxl_device_vkb *vkb;
> diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
> index 4383ad177a..62a1d012c6 100644
> --- a/tools/xl/xl_sxp.c
> +++ b/tools/xl/xl_sxp.c
> @@ -120,7 +120,7 @@ void printf_info_sexp(int domid, libxl_domain_config =
*d_config, FILE *fh)
>           fprintf(fh, "\t\t\t(sdl %s)\n",
>                  libxl_defbool_to_string(b_info->u.hvm.sdl.enable));
>           fprintf(fh, "\t\t\t(opengl %s)\n",
> -               libxl_defbool_to_string(b_info->u.hvm.sdl.opengl));
> +               libxl_defbool_to_string(b_info->u.hvm.opengl));
>           fprintf(fh, "\t\t\t(nographic %s)\n",
>                  libxl_defbool_to_string(b_info->u.hvm.nographic));
>           fprintf(fh, "\t\t\t(spice %s)\n",
> @@ -219,10 +219,10 @@ void printf_info_sexp(int domid, libxl_domain_confi=
g *d_config, FILE *fh)
>           fprintf(fh, "\t\t\t(vncunused %s)\n",
>                  libxl_defbool_to_string(d_config->vfbs[i].vnc.findunused=
));
>           fprintf(fh, "\t\t\t(keymap %s)\n", d_config->vfbs[i].keymap);
> +        fprintf(fh, "\t\t\t(opengl %s)\n",
> +               libxl_defbool_to_string(d_config->vfbs[i].opengl));
>           fprintf(fh, "\t\t\t(sdl %s)\n",
>                  libxl_defbool_to_string(d_config->vfbs[i].sdl.enable));
> -        fprintf(fh, "\t\t\t(opengl %s)\n",
> -               libxl_defbool_to_string(d_config->vfbs[i].sdl.opengl));
>           fprintf(fh, "\t\t\t(display %s)\n", d_config->vfbs[i].sdl.displ=
ay);
>           fprintf(fh, "\t\t\t(xauthority %s)\n", d_config->vfbs[i].sdl.xa=
uthority);
>           fprintf(fh, "\t\t)\n");



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



