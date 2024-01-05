Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D023F8257BE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 17:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662234.1032242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLmlK-0001Bd-DM; Fri, 05 Jan 2024 16:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662234.1032242; Fri, 05 Jan 2024 16:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLmlK-00018o-A6; Fri, 05 Jan 2024 16:09:34 +0000
Received: by outflank-mailman (input) for mailman id 662234;
 Fri, 05 Jan 2024 16:09:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7fs=IP=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rLmlI-00018i-Ic
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 16:09:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cec942ef-abe4-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 17:09:30 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d4a7f0c4dso17633875e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 08:09:30 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b00336710ddea0sm1647921wrx.59.2024.01.05.08.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 08:09:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 549BC5F933;
 Fri,  5 Jan 2024 16:09:29 +0000 (GMT)
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
X-Inumbo-ID: cec942ef-abe4-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470970; x=1705075770; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPjS24N6aCuE7w72QsslxPMj1wECkZRdY4dZFhSTMGQ=;
        b=Yy3u/dOrTjJ9AXbQ/SOo6SUzSavmMFvBBIZAsWpfe/8yer1PufaisZx1BXodEMjEZU
         P0CUwsO5krl7S+SnImAaRAlEDL5yFYZ9o8pnJ+/L7ehSpvVJI6xiLj3NFhEd+0EQSn+N
         EuptaQ+PN2G650bDJHR6ajSuqmmGtPkAGEIwp+4LsQwrcymOPguNTrTSU6BPC0r8blHX
         61E+g2bDOb+gJ9nhjg39KuXgk4A5Inxi6dgOO6ALcsomAN1ZMsSCseQpWsy+zE5ljXlj
         7/s0hBr0kke4DLBFX0H93JEYwgfcvHtmt81oWLs50aAZHa6Gua+j+wehDv+m+FtwWH12
         WVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470970; x=1705075770;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JPjS24N6aCuE7w72QsslxPMj1wECkZRdY4dZFhSTMGQ=;
        b=sGkdrOwmfHt/VlPqmXM9P/yxJhtFRA/YDSoqfbsZfTndW913xlYfp9hVTbel2PItbU
         BNcJVufc7BJgsg2NF4c7MdwBDwyoHheLRx3VjwglTJAxmIlTGoJNAbOEtf8DMZOUZWQS
         5EFE+s2EZOGbUlEB2u9UcEx3XfOc/YvvxhhkWSLRGy+T1dVYam0VtJ9rAqYYdxEpT6yi
         uIsjbt2OjgPXHdlETgArZy5XpjrDCZXP4rUAHwZSlnLHuGUNMfRuU/EU5tv4GZn0K8YC
         ivvWSj8v157+4okTIPB0k0KlIvzdL6bz1+fl021Sk0WSL43BTomzTwnpOW6D5U0BDB8j
         sKLw==
X-Gm-Message-State: AOJu0Yxm7Sp1fBdcSaLqcEO7yaV4wRLKio56wMoGVb4ziP423rfgDiBm
	9oQRhGGn3Ywwg0tHi9LVEd+i6bVPitzllg==
X-Google-Smtp-Source: AGHT+IFVgvkYokI7P2l5tvklCXid3qCE3ppbuWAimO0DAMUHfSfSv1G9f9CVAS/MkVLQFzp2ejEE/A==
X-Received: by 2002:a05:600c:3f8b:b0:40d:5fd4:ce2c with SMTP id fs11-20020a05600c3f8b00b0040d5fd4ce2cmr1261935wmb.53.1704470970048;
        Fri, 05 Jan 2024 08:09:30 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Huang Rui <ray.huang@amd.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Gerd Hoffmann <kraxel@redhat.com>,  "Michael S . Tsirkin"
 <mst@redhat.com>,  "Stefano Stabellini" <sstabellini@kernel.org>,  Anthony
 PERARD <anthony.perard@citrix.com>,  Antonio Caggiano
 <quic_acaggian@quicinc.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Robert Beckett <bob.beckett@collabora.com>,
  Dmitry Osipenko <dmitry.osipenko@collabora.com>,  Gert Wollny
 <gert.wollny@collabora.com>,  <qemu-devel@nongnu.org>,
  <xen-devel@lists.xenproject.org>,  Gurchetan Singh
 <gurchetansingh@chromium.org>,  <ernunes@redhat.com>,  Alyssa Ross
 <hi@alyssa.is>,  Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
  Alex Deucher
 <alexander.deucher@amd.com>,  Stefano Stabellini
 <stefano.stabellini@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  Xenia Ragiadakou <xenia.ragiadakou@amd.com>,  Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>,  "Honglei Huang"
 <honglei1.huang@amd.com>,  Julia Zhang <julia.zhang@amd.com>,  "Chen
 Jiqian" <Jiqian.Chen@amd.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  AKASHI Takahiro
 <takahiro.akashi@linaro.org>
Subject: Re: [PATCH v6 11/11] virtio-gpu: make blob scanout use dmabuf fd
In-Reply-To: <87jzongb9u.fsf@draig.linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9?=
 =?utf-8?Q?e=22's?= message of
	"Fri, 05 Jan 2024 13:28:13 +0000")
References: <20231219075320.165227-1-ray.huang@amd.com>
	<20231219075320.165227-12-ray.huang@amd.com>
	<87jzongb9u.fsf@draig.linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 05 Jan 2024 16:09:29 +0000
Message-ID: <878r53g3t2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Huang Rui <ray.huang@amd.com> writes:
>
>> From: Robert Beckett <bob.beckett@collabora.com>
>>
>> This relies on a virglrenderer change to include the dmabuf fd when
>> returning resource info.
>>
> <snip>
>> +static void virgl_cmd_set_scanout_blob(VirtIOGPU *g,
>> +                                       struct virtio_gpu_ctrl_command *=
cmd)
>> +{
>> +    struct virgl_gpu_resource *vres;
>> +    struct virtio_gpu_framebuffer fb =3D { 0 };
>> +    struct virtio_gpu_set_scanout_blob ss;
>> +    struct virgl_renderer_resource_info info;
>> +    uint64_t fbend;
>> +
>> +    VIRTIO_GPU_FILL_CMD(ss);
>> +    virtio_gpu_scanout_blob_bswap(&ss);
>> +    trace_virtio_gpu_cmd_set_scanout_blob(ss.scanout_id, ss.resource_id,
>> +                                          ss.r.width, ss.r.height, ss.r=
.x,
>> +                                          ss.r.y);
>> +
>> +    if (ss.scanout_id >=3D g->parent_obj.conf.max_outputs) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specifie=
d %d",
>> +                      __func__, ss.scanout_id);
>> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
>> +        return;
>> +    }
>> +
>> +    if (ss.resource_id =3D=3D 0) {
>> +        virtio_gpu_disable_scanout(g, ss.scanout_id);
>> +        return;
>> +    }
>> +
>> +    if (ss.width < 16 ||
>> +        ss.height < 16 ||
>> +        ss.r.x + ss.r.width > ss.width ||
>> +        ss.r.y + ss.r.height > ss.height) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds f=
or"
>> +                      " resource %d, rect (%d,%d)+%d,%d, fb %d %d\n",
>> +                      __func__, ss.scanout_id, ss.resource_id,
>> +                      ss.r.x, ss.r.y, ss.r.width, ss.r.height,
>> +                      ss.width, ss.height);
>> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
>> +        return;
>> +    }
>> +
>> +    if (!console_has_gl(g->parent_obj.scanout[ss.scanout_id].con)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unable to scanout blot with=
out GL!\n", __func__);
>> +        return;
>> +    }
>> +
>> +    vres =3D virgl_gpu_find_resource(g, ss.resource_id);
>> +    if (!vres) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: illegal resource specified %d\n",
>> +                      __func__, ss.resource_id);
>> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>> +        return;
>> +    }
>> +    if (virgl_renderer_resource_get_info(ss.resource_id, &info)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: illegal virgl resource specified %d\n",
>> +                      __func__, ss.resource_id);
>> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
>> +        return;
>> +    }
>
> Minor nit, the format of the following needs to include braces.
>
>> +    if (!vres->res.dmabuf_fd && info.fd)
>> +        vres->res.dmabuf_fd =3D info.fd;
>
> However I'm seeing:
>
>   cc -m64 -mcx16 -Ilibcommon.fa.p -I../../common-user/host/x86_64 -I../..=
/linux-user/include/host/x86_64 -I../../linux-user/include -Iui -I../../ui =
-I/usr/include/capstone -I/usr/include/p11-kit-1 -I/usr/include/pixman-1 -I=
/usr/include/libpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I=
/usr/include/libusb-1.0 -I/usr/include/SDL2 -I/usr/include/glib-2.0 -I/usr/=
lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/libmount -I/usr/includ=
e/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/slirp -I/usr/include/gtk=
-3.0 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/freety=
pe2 -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2=
.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/atk-1.0 -I/usr/include/at=
-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/=
x86_64-linux-gnu/dbus-1.0/include -I/usr/include/vte-2.91 -I/usr/include/vi=
rgl -I/home/alex/lsrc/qemu.git/builds/extra.libs/install/include -I/usr/inc=
lude/cacard -I/usr/include/nss -I/usr/include/nspr -I/usr/include/PCSC -I/u=
sr/include/pipewire-0.3 -I/usr/include/spa-0.2 -fdiagnostics-color=3Dauto -=
Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -fstack-protector-strong -Wu=
ndef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes -Wredundant-d=
ecls -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-=
security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wneste=
d-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 =
-Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-va=
lue -Wno-psabi -Wshadow=3Dlocal -isystem /home/alex/lsrc/qemu.git/linux-hea=
ders -isystem linux-headers -iquote . -iquote /home/alex/lsrc/qemu.git -iqu=
ote /home/alex/lsrc/qemu.git/include -iquote /home/alex/lsrc/qemu.git/host/=
include/x86_64 -iquote /home/alex/lsrc/qemu.git/host/include/generic -iquot=
e /home/alex/lsrc/qemu.git/tcg/i386 -pthread -D_GNU_SOURCE -D_FILE_OFFSET_B=
ITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -fPIE=
 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600 -DNCURSES_WIDECHAR=3D1 -D_REENTRAN=
T -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon.fa.p/hw_display_virtio-gpu-virgl=
.c.o -MF libcommon.fa.p/hw_display_virtio-gpu-virgl.c.o.d -o libcommon.fa.p=
/hw_display_virtio-gpu-virgl.c.o -c ../../hw/display/virtio-gpu-virgl.c
>   ../../hw/display/virtio-gpu-virgl.c: In function =E2=80=98virgl_cmd_set=
_scanout_blob=E2=80=99:
>   ../../hw/display/virtio-gpu-virgl.c:790:37: error: =E2=80=98struct virg=
l_renderer_resource_info=E2=80=99 has no member named =E2=80=98fd=E2=80=99
>     790 |     if (!vres->res.dmabuf_fd && info.fd)
>         |                                     ^
>   ../../hw/display/virtio-gpu-virgl.c:791:35: error: =E2=80=98struct virg=
l_renderer_resource_info=E2=80=99 has no member named =E2=80=98fd=E2=80=99
>     791 |         vres->res.dmabuf_fd =3D info.fd;
>         |                                   ^
>
> But searching my extra libs (for aemu/gfstream/rutabaga_ffi) I can see
> the bindings.rs but nothing generated a header:
>
>   $ ag -r "virgl_renderer_resource_info"=20
>   crosvm.git/rutabaga_gfx/src/generated/virgl_renderer_bindings.rs
>   33:pub const VIRGL_RENDERER_RESOURCE_INFO_EXT_VERSION: u32 =3D 0;
>   337:pub struct virgl_renderer_resource_info {
>   351:pub struct virgl_renderer_resource_info_ext {
>   353:    pub base: virgl_renderer_resource_info,
>   359:impl Default for virgl_renderer_resource_info_ext {
>   373:        info: *mut virgl_renderer_resource_info,
>   379:        info: *mut virgl_renderer_resource_info_ext,
>
> Which makes me think a) its picked up the older virgl headers and b) the
> crosvm/rutabaf_gfx install needs a fix.

Actually it was libvirglrenderer was too old (I got it the wrong way
round, the rust bindings come from libvirglrenderer). As we want to
build with older libvirglrenderers on older systems I think this needs a
tweak to meson.build, maybe something like:

    config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
                         cc.has_function('virgl_renderer_resource_create_bl=
ob',
                                          prefix: '#include <virglrenderer.=
h>',
                                          dependencies: virgl)
                         and
                         cc.has_member('struct virgl_renderer_resource_info=
', 'fd',
                                       prefix: '#include <virglrenderer.h>',
                                       dependencies: virgl))

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

