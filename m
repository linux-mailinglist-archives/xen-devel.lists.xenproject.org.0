Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9319251726
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:11:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWql-0008Hp-Fs; Tue, 25 Aug 2020 11:10:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+Rh=CD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kAWqk-0008Hk-0M
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:10:46 +0000
X-Inumbo-ID: 1ea5cf03-5390-49ef-aebf-40f6af6f79db
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ea5cf03-5390-49ef-aebf-40f6af6f79db;
 Tue, 25 Aug 2020 11:10:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1E0D5A9F;
 Tue, 25 Aug 2020 07:10:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 Aug 2020 07:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5QMGUa
 hXmB6ijm0W/RME08v9qD2VPGqv0J+RI1BedrM=; b=HbubwryOGkGyHDnp2Wpt43
 cLXkMr54PoTIR8+0uzI2MmCW7CI+h93Kcj1dvzb+Qu7vAhDTaVJLvVuaZvStaVYb
 Df8zY4B8k3QoQBRKhKv5xE9qzfW3hZvWGtp0E7iGJGuxWeR+a7HfsQ4eEpSivDOC
 zZqgT6IDHvqlyeZxSDOQ07kghgPJFHlr/m78pUn//pNHyuz74bQzJJfnsyapV22t
 1GF7080GpvCYtCfNGQFheCr9U3qcmD7dP2NxynNmr+ZExAvLf/fwQ2jImJ4rw4bq
 1EgO3T99yFzPB4OAH4Ci0qyItUXJmKHk4zfQTgJlr8xCNkk25pNTSPM/5+o3Z0Bg
 ==
X-ME-Sender: <xms:svFEX3Jv5HncO8cdy-P9b6IhO_Fzwy7lC3jY_RqDgaDQs9wRaMhJyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:svFEX7L7cQOKuhMthvadnQcuUSTKbqTegLhp__gF1ROVC5Kkt9Oxag>
 <xmx:svFEX_tuIjvMTy_aeYxwMNBDBjfx3f10nGoyqDvpZHq1rvbL053Nhw>
 <xmx:svFEXwYvpltDShHZhyFJGmEgTNYL4oHsQJ0yMbO6Ltdst3dPH9LdqA>
 <xmx:svFEXxzV1ahrzyw3ckl5-QAe3qzvmlZM0wsAZZapOsBLIaTjCgz0yQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 769D7328005A;
 Tue, 25 Aug 2020 07:10:41 -0400 (EDT)
Date: Tue, 25 Aug 2020 13:10:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 22/38] tools/misc: rename xc_dom.h do xenctrl_dom.h
Message-ID: <20200825111038.GA1626@mail-itl>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-23-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8jcWiON1L7A8HfS7"
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-23-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--8jcWiON1L7A8HfS7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 22/38] tools/misc: rename xc_dom.h do xenctrl_dom.h

On Sun, Aug 23, 2020 at 11:35:03AM +0200, Juergen Gross wrote:
> For being able to disentangle lixenctrl and libxenguest headers
> xc_dom.h will need to be public. Prepare that by renaming xc_dom.h
> to xenctrl_dom.h.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Python changes:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

(there is just one usage: xc_dom_gnttab_seed, in
tools/python/xen/lowlevel/xc/xc.c)

> ---
>  stubdom/grub/kexec.c                            | 2 +-
>  tools/helpers/init-xenstore-domain.c            | 2 +-
>  tools/libxc/include/{xc_dom.h =3D> xenctrl_dom.h} | 0
>  tools/libxc/xc_core.c                           | 2 +-
>  tools/libxc/xc_private.c                        | 2 +-
>  tools/libxc/xg_dom_arm.c                        | 2 +-
>  tools/libxc/xg_dom_armzimageloader.c            | 2 +-
>  tools/libxc/xg_dom_binloader.c                  | 2 +-
>  tools/libxc/xg_dom_boot.c                       | 2 +-
>  tools/libxc/xg_dom_compat_linux.c               | 2 +-
>  tools/libxc/xg_dom_core.c                       | 2 +-
>  tools/libxc/xg_dom_decompress.h                 | 2 +-
>  tools/libxc/xg_dom_decompress_unsafe.h          | 2 +-
>  tools/libxc/xg_dom_elfloader.c                  | 2 +-
>  tools/libxc/xg_dom_hvmloader.c                  | 2 +-
>  tools/libxc/xg_dom_x86.c                        | 2 +-
>  tools/libxc/xg_offline_page.c                   | 2 +-
>  tools/libxc/xg_sr_common.h                      | 2 +-
>  tools/libxl/libxl_arm.c                         | 2 +-
>  tools/libxl/libxl_arm.h                         | 2 +-
>  tools/libxl/libxl_create.c                      | 2 +-
>  tools/libxl/libxl_dm.c                          | 2 +-
>  tools/libxl/libxl_dom.c                         | 2 +-
>  tools/libxl/libxl_internal.h                    | 2 +-
>  tools/libxl/libxl_vnuma.c                       | 2 +-
>  tools/libxl/libxl_x86.c                         | 2 +-
>  tools/libxl/libxl_x86_acpi.c                    | 2 +-
>  tools/python/xen/lowlevel/xc/xc.c               | 2 +-
>  tools/xcutils/readnotes.c                       | 2 +-
>  29 files changed, 28 insertions(+), 28 deletions(-)
>  rename tools/libxc/include/{xc_dom.h =3D> xenctrl_dom.h} (100%)
>=20
> diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
> index 0e68b969a2..24001220a9 100644
> --- a/stubdom/grub/kexec.c
> +++ b/stubdom/grub/kexec.c
> @@ -20,7 +20,7 @@
>  #include <sys/mman.h>
> =20
>  #include <xenctrl.h>
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
> =20
>  #include <kernel.h>
>  #include <console.h>
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xe=
nstore-domain.c
> index 4ce8299c3c..5bdb48dc80 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -8,7 +8,7 @@
>  #include <sys/ioctl.h>
>  #include <sys/mman.h>
>  #include <xenctrl.h>
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
>  #include <xenstore.h>
>  #include <xen/sys/xenbus_dev.h>
>  #include <xen-xsm/flask/flask.h>
> diff --git a/tools/libxc/include/xc_dom.h b/tools/libxc/include/xenctrl_d=
om.h
> similarity index 100%
> rename from tools/libxc/include/xc_dom.h
> rename to tools/libxc/include/xenctrl_dom.h
> diff --git a/tools/libxc/xc_core.c b/tools/libxc/xc_core.c
> index 2ee1d205b4..7df1fccd62 100644
> --- a/tools/libxc/xc_core.c
> +++ b/tools/libxc/xc_core.c
> @@ -62,7 +62,7 @@
> =20
>  #include "xg_private.h"
>  #include "xc_core.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include <stdlib.h>
>  #include <unistd.h>
> =20
> diff --git a/tools/libxc/xc_private.c b/tools/libxc/xc_private.c
> index 90974d572e..6ecdf6953f 100644
> --- a/tools/libxc/xc_private.c
> +++ b/tools/libxc/xc_private.c
> @@ -19,7 +19,7 @@
> =20
>  #include "xc_private.h"
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include <stdarg.h>
>  #include <stdlib.h>
>  #include <unistd.h>
> diff --git a/tools/libxc/xg_dom_arm.c b/tools/libxc/xg_dom_arm.c
> index 931404c222..3f66f1d890 100644
> --- a/tools/libxc/xg_dom_arm.c
> +++ b/tools/libxc/xg_dom_arm.c
> @@ -24,7 +24,7 @@
>  #include <xen-tools/libs.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
> =20
>  #define NR_MAGIC_PAGES 4
>  #define CONSOLE_PFN_OFFSET 0
> diff --git a/tools/libxc/xg_dom_armzimageloader.c b/tools/libxc/xg_dom_ar=
mzimageloader.c
> index 0df8c2a4b1..4246c8e5fa 100644
> --- a/tools/libxc/xg_dom_armzimageloader.c
> +++ b/tools/libxc/xg_dom_armzimageloader.c
> @@ -25,7 +25,7 @@
>  #include <inttypes.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
> =20
>  #include <arpa/inet.h> /* XXX ntohl is not the right function... */
> =20
> diff --git a/tools/libxc/xg_dom_binloader.c b/tools/libxc/xg_dom_binloade=
r.c
> index d6f7f2a500..870a921427 100644
> --- a/tools/libxc/xg_dom_binloader.c
> +++ b/tools/libxc/xg_dom_binloader.c
> @@ -83,7 +83,7 @@
>  #include <inttypes.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
> =20
>  #define round_pgup(_p)    (((_p)+(PAGE_SIZE_X86-1))&PAGE_MASK_X86)
>  #define round_pgdown(_p)  ((_p)&PAGE_MASK_X86)
> diff --git a/tools/libxc/xg_dom_boot.c b/tools/libxc/xg_dom_boot.c
> index bb599b33ba..1e31e92244 100644
> --- a/tools/libxc/xg_dom_boot.c
> +++ b/tools/libxc/xg_dom_boot.c
> @@ -31,7 +31,7 @@
>  #include <zlib.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "xc_core.h"
>  #include <xen/hvm/params.h>
>  #include <xen/grant_table.h>
> diff --git a/tools/libxc/xg_dom_compat_linux.c b/tools/libxc/xg_dom_compa=
t_linux.c
> index b3d43feed9..b645f0b14b 100644
> --- a/tools/libxc/xg_dom_compat_linux.c
> +++ b/tools/libxc/xg_dom_compat_linux.c
> @@ -30,7 +30,7 @@
> =20
>  #include "xenctrl.h"
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
> =20
>  /* ---------------------------------------------------------------------=
--- */
> =20
> diff --git a/tools/libxc/xg_dom_core.c b/tools/libxc/xg_dom_core.c
> index 327c8a8575..1c91cce315 100644
> --- a/tools/libxc/xg_dom_core.c
> +++ b/tools/libxc/xg_dom_core.c
> @@ -32,7 +32,7 @@
>  #include <assert.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "_paths.h"
> =20
>  /* ---------------------------------------------------------------------=
--- */
> diff --git a/tools/libxc/xg_dom_decompress.h b/tools/libxc/xg_dom_decompr=
ess.h
> index d9a21cf297..c5ab2e59eb 100644
> --- a/tools/libxc/xg_dom_decompress.h
> +++ b/tools/libxc/xg_dom_decompress.h
> @@ -1,5 +1,5 @@
>  #ifndef __MINIOS__
> -# include "xc_dom.h"
> +# include "xenctrl_dom.h"
>  #else
>  # include "xg_dom_decompress_unsafe.h"
>  #endif
> diff --git a/tools/libxc/xg_dom_decompress_unsafe.h b/tools/libxc/xg_dom_=
decompress_unsafe.h
> index 64f68864b1..fb84b6add8 100644
> --- a/tools/libxc/xg_dom_decompress_unsafe.h
> +++ b/tools/libxc/xg_dom_decompress_unsafe.h
> @@ -1,4 +1,4 @@
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
> =20
>  typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
>                            int (*fill)(void*, unsigned int),
> diff --git a/tools/libxc/xg_dom_elfloader.c b/tools/libxc/xg_dom_elfloade=
r.c
> index b327db219d..7043c3bbba 100644
> --- a/tools/libxc/xg_dom_elfloader.c
> +++ b/tools/libxc/xg_dom_elfloader.c
> @@ -26,7 +26,7 @@
>  #include <inttypes.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "xc_bitops.h"
> =20
>  #define XEN_VER "xen-3.0"
> diff --git a/tools/libxc/xg_dom_hvmloader.c b/tools/libxc/xg_dom_hvmloade=
r.c
> index 3f0bd65547..995a0f3dc3 100644
> --- a/tools/libxc/xg_dom_hvmloader.c
> +++ b/tools/libxc/xg_dom_hvmloader.c
> @@ -26,7 +26,7 @@
>  #include <assert.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "xc_bitops.h"
> =20
>  /* ---------------------------------------------------------------------=
--- */
> diff --git a/tools/libxc/xg_dom_x86.c b/tools/libxc/xg_dom_x86.c
> index 9439805eaa..842dbcccdd 100644
> --- a/tools/libxc/xg_dom_x86.c
> +++ b/tools/libxc/xg_dom_x86.c
> @@ -38,7 +38,7 @@
>  #include <xen-tools/libs.h>
> =20
>  #include "xg_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "xenctrl.h"
> =20
>  /* ---------------------------------------------------------------------=
--- */
> diff --git a/tools/libxc/xg_offline_page.c b/tools/libxc/xg_offline_page.c
> index 19538fc436..77e8889b11 100644
> --- a/tools/libxc/xg_offline_page.c
> +++ b/tools/libxc/xg_offline_page.c
> @@ -28,7 +28,7 @@
>  #include <xc_core.h>
> =20
>  #include "xc_private.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "xg_private.h"
>  #include "xg_save_restore.h"
> =20
> diff --git a/tools/libxc/xg_sr_common.h b/tools/libxc/xg_sr_common.h
> index 35f23fabb5..13fcc47420 100644
> --- a/tools/libxc/xg_sr_common.h
> +++ b/tools/libxc/xg_sr_common.h
> @@ -5,7 +5,7 @@
> =20
>  #include "xg_private.h"
>  #include "xg_save_restore.h"
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include "xc_bitops.h"
> =20
>  #include "xg_sr_stream_format.h"
> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
> index 34f8a29056..975a4d730a 100644
> --- a/tools/libxl/libxl_arm.c
> +++ b/tools/libxl/libxl_arm.c
> @@ -3,7 +3,7 @@
>  #include "libxl_libfdt_compat.h"
>  #include "libxl_arm.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
>  #include <stdbool.h>
>  #include <libfdt.h>
>  #include <assert.h>
> diff --git a/tools/libxl/libxl_arm.h b/tools/libxl/libxl_arm.h
> index 8aef210d4c..52c2ab5e3a 100644
> --- a/tools/libxl/libxl_arm.h
> +++ b/tools/libxl/libxl_arm.h
> @@ -17,7 +17,7 @@
>  #include "libxl_internal.h"
>  #include "libxl_arch.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
> =20
>  _hidden
>  int libxl__prepare_acpi(libxl__gc *gc, libxl_domain_build_info *info,
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index 2814818e34..1031b75159 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -20,7 +20,7 @@
>  #include "libxl_internal.h"
>  #include "libxl_arch.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
>  #include <xenguest.h>
>  #include <xen/hvm/hvm_info_table.h>
>  #include <xen/hvm/e820.h>
> diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> index f2dc5696b9..fec4e0fbe5 100644
> --- a/tools/libxl/libxl_dm.c
> +++ b/tools/libxl/libxl_dm.c
> @@ -19,7 +19,7 @@
> =20
>  #include "libxl_internal.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
>  #include <xen/hvm/e820.h>
>  #include <sys/types.h>
>  #include <pwd.h>
> diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> index f8661e90d4..e2dca64aa1 100644
> --- a/tools/libxl/libxl_dom.c
> +++ b/tools/libxl/libxl_dom.c
> @@ -20,7 +20,7 @@
>  #include "libxl_internal.h"
>  #include "libxl_arch.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
>  #include <xen/hvm/hvm_info_table.h>
>  #include <xen/hvm/hvm_xs_strings.h>
>  #include <xen/hvm/e820.h>
> diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
> index c63d0686fd..e16ae9630b 100644
> --- a/tools/libxl/libxl_internal.h
> +++ b/tools/libxl/libxl_internal.h
> @@ -57,7 +57,7 @@
>  #include <xenctrl.h>
>  #include <xenguest.h>
>  #include <xenhypfs.h>
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
> =20
>  #include <xen-tools/libs.h>
> =20
> diff --git a/tools/libxl/libxl_vnuma.c b/tools/libxl/libxl_vnuma.c
> index 8ec2abb2e6..c2e144ceae 100644
> --- a/tools/libxl/libxl_vnuma.c
> +++ b/tools/libxl/libxl_vnuma.c
> @@ -17,7 +17,7 @@
>  #include "libxl_arch.h"
>  #include <stdlib.h>
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
> =20
>  bool libxl__vnuma_configured(const libxl_domain_build_info *b_info)
>  {
> diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
> index e57f63282e..7d95506e00 100644
> --- a/tools/libxl/libxl_x86.c
> +++ b/tools/libxl/libxl_x86.c
> @@ -1,7 +1,7 @@
>  #include "libxl_internal.h"
>  #include "libxl_arch.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
> =20
>  int libxl__arch_domain_prepare_config(libxl__gc *gc,
>                                        libxl_domain_config *d_config,
> diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libxl/libxl_x86_acpi.c
> index ed6610c84e..3df86c7be5 100644
> --- a/tools/libxl/libxl_x86_acpi.c
> +++ b/tools/libxl/libxl_x86_acpi.c
> @@ -18,7 +18,7 @@
>  #include <xen/hvm/e820.h>
>  #include "libacpi/libacpi.h"
> =20
> -#include <xc_dom.h>
> +#include <xenctrl_dom.h>
> =20
>   /* Number of pages holding ACPI tables */
>  #define NUM_ACPI_PAGES 16
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 8fde5f311f..8c7b184f0b 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -17,7 +17,7 @@
>  #include <arpa/inet.h>
> =20
>  #include <xen/elfnote.h>
> -#include "xc_dom.h"
> +#include "xenctrl_dom.h"
>  #include <xen/hvm/hvm_info_table.h>
>  #include <xen/hvm/params.h>
> =20
> diff --git a/tools/xcutils/readnotes.c b/tools/xcutils/readnotes.c
> index e682dd1a21..a6b7358e70 100644
> --- a/tools/xcutils/readnotes.c
> +++ b/tools/xcutils/readnotes.c
> @@ -12,7 +12,7 @@
>  #include <sys/mman.h>
> =20
>  #include <xg_private.h>
> -#include <xc_dom.h> /* gunzip bits */
> +#include <xenctrl_dom.h> /* gunzip bits */
> =20
>  #include <xen/libelf/libelf.h>
> =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--8jcWiON1L7A8HfS7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9E8a4ACgkQ24/THMrX
1yypkAf/eFIJyradKGU3fiNnmpPSzvWKWTs+iU6k+MpsHVF6h2yheM0IzkTikLcZ
SBOnP/j2N6D0v7z/mQSRPyLEB8ptfWC6bG13ExH/clDU+b6Fnv7PfDI33CCO3H5Q
HBfR3suqYv3HVWghjBIAvsrygnbUFBkU64VuC8s4WFcnuaAVdBIlklwS/DtLuo2g
Mq42oTYyme7ryYXHwJtJ8uap1Z/w8mbUZtfLYaW/bJcRq3EunoqKXx9P7WSHbhvq
kyjIQgqJHNzBOTJ0g8wNEQmGfxMEp08yy6RJIBeLb4CSv2WVP6bXOn0JdP98LmT+
obk5zBDH2DweXG901MM6cB721VpR2g==
=deXr
-----END PGP SIGNATURE-----

--8jcWiON1L7A8HfS7--

