Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB919F102
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLMNA-0007Fx-JD; Mon, 06 Apr 2020 07:40:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLMN8-0007Fr-UM
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 07:40:43 +0000
X-Inumbo-ID: ea6ddec2-77d9-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea6ddec2-77d9-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 07:40:41 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w26so18015722edu.7
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=aFQrE65ZynsGQgKaw/uB4/EYtHsyrntpjl9oZ1hzedM=;
 b=YMnx72uknjlGZXWV17Lw9MoK34HIfBWN48VTwJynrsBljLLVbBiuDjmYM4UpoUQLCN
 D3uPEb1sbCBeaVLb85H87ISnlsxCTZ2PVe+AfbUdQ+Hk1khCijN89yvdx/5QVtbPYrPt
 5lizR3Zs9MxlIa0frAibWetzzBxUb0yKb96iVzzxB5IBUKywl13T4sToIQCqZa/ahA56
 TETCKV2jfMQmWPMe4TXhnAE262Y4UDHsHu8xmxgk4ZWt84UenogAGl9bylUFnCj162FE
 hgWhNuO20x86ehJVFhogAl9twpf6rUpXCHMtZpimPi6s9rBZIxSNw1dM/4PPwJOtuaEg
 dOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=aFQrE65ZynsGQgKaw/uB4/EYtHsyrntpjl9oZ1hzedM=;
 b=k64zHujvmLssnk5us9gmg2s6r+opRN1DduYJfGWeNnYsulkROfb31txXTrVQT75PiY
 anvw0kigQBikz1IJ2azioPmQBVIWt5DPtfbiJfCvjpcaOQDxF6OvZAzaSdAaN3BWYiEq
 PSKF/PJOgV5FUU47dulWMR4shaYHv99CnqBwBHC4WJ3fI0vXLh+AZRB7aujcbzPCgyZa
 gvR2wMjEVJ1t9CrEevnJ6EBkPudJAztrweOaPAvby/eL/OAC464aQW+lMdrFm4UA8Z8s
 PoOo+sbVOW7TEVxzYhC+tO26FDl6lZ6pMUl+dn/Brod9kF/ru/NGwBs1ySC86W0L1km4
 pV+Q==
X-Gm-Message-State: AGi0PubTLBYiHrWuHloKafdQz8xpk8THn1CqnRSU7yaTp0+6X9ZUGmhl
 pW3k0cpQnIEHrpHJz0djiLo=
X-Google-Smtp-Source: APiQypIm4klUzoFnHSneIdVAhAnozUhDDop8taGrepSTQIeR051gK2VI/teudcpuobJNkKp1v8FA5A==
X-Received: by 2002:a17:906:2443:: with SMTP id
 a3mr19115631ejb.291.1586158840919; 
 Mon, 06 Apr 2020 00:40:40 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id d13sm1807135ejt.74.2020.04.06.00.40.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 00:40:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-6-julien@xen.org>
In-Reply-To: <20200404131017.27330-6-julien@xen.org>
Subject: RE: [PATCH 5/7] xen: include xen/guest_access.h rather than
 asm/guest_access.h
Date: Mon, 6 Apr 2020 08:40:39 +0100
Message-ID: <001201d60be6$ab976e20$02c64a60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHjDao9mfUo56zNNvPnoPfBojMtUAMctY5mqDjLfhA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Julien Grall' <jgrall@amazon.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 04 April 2020 14:10
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano =
Stabellini <sstabellini@kernel.org>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Paul Durrant
> <paul@xen.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin Tian =
<kevin.tian@intel.com>
> Subject: [PATCH 5/7] xen: include xen/guest_access.h rather than =
asm/guest_access.h
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Only a few places are actually including asm/guest_access.h. While =
this
> is fine today, a follow-up patch will want to move most of the helpers
> from asm/guest_access.h to xen/guest_access.h.
>=20
> To prepare the move, everyone should include xen/guest_access.h rather
> than asm/guest_access.h.
>=20
> Interestingly, asm-arm/guest_access.h includes xen/guest_access.h. The
> inclusion is now removed as no-one but the latter should include the
> former.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/decode.c                |  2 +-
>  xen/arch/arm/domain.c                |  2 +-
>  xen/arch/arm/guest_walk.c            |  3 ++-
>  xen/arch/arm/guestcopy.c             |  2 +-
>  xen/arch/arm/vgic-v3-its.c           |  2 +-
>  xen/arch/x86/hvm/svm/svm.c           |  2 +-
>  xen/arch/x86/hvm/viridian/viridian.c |  2 +-
>  xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
>  xen/common/libelf/libelf-loader.c    |  2 +-
>  xen/include/asm-arm/guest_access.h   |  1 -
>  xen/include/asm-x86/guest_access.h   | 22 ++++++++++++----------
>  xen/lib/x86/private.h                |  2 +-
>  12 files changed, 23 insertions(+), 21 deletions(-)
>=20
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 144793c8ce..792c2e92a7 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -17,12 +17,12 @@
>   * GNU General Public License for more details.
>   */
>=20
> +#include <xen/guest_access.h>
>  #include <xen/lib.h>
>  #include <xen/sched.h>
>  #include <xen/types.h>
>=20
>  #include <asm/current.h>
> -#include <asm/guest_access.h>
>=20
>  #include "decode.h"
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2190d908eb..b062c232b6 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,6 +12,7 @@
>  #include <xen/bitops.h>
>  #include <xen/errno.h>
>  #include <xen/grant_table.h>
> +#include <xen/guest_access.h>
>  #include <xen/hypercall.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -26,7 +27,6 @@
>  #include <asm/current.h>
>  #include <asm/event.h>
>  #include <asm/gic.h>
> -#include <asm/guest_access.h>
>  #include <asm/guest_atomics.h>
>  #include <asm/irq.h>
>  #include <asm/p2m.h>
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index a1cdd7f4af..b4496c4c86 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -16,8 +16,9 @@
>   */
>=20
>  #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
>  #include <xen/sched.h>
> -#include <asm/guest_access.h>
> +
>  #include <asm/guest_walk.h>
>  #include <asm/short-desc.h>
>=20
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index c8023e2bca..32681606d8 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -1,10 +1,10 @@
>  #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
>=20
>  #include <asm/current.h>
> -#include <asm/guest_access.h>
>=20
>  #define COPY_flush_dcache   (1U << 0)
>  #define COPY_from_guest     (0U << 1)
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 6e153c698d..58d939b85f 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -32,6 +32,7 @@
>  #include <xen/bitops.h>
>  #include <xen/config.h>
>  #include <xen/domain_page.h>
> +#include <xen/guest_access.h>
>  #include <xen/lib.h>
>  #include <xen/init.h>
>  #include <xen/softirq.h>
> @@ -39,7 +40,6 @@
>  #include <xen/sched.h>
>  #include <xen/sizes.h>
>  #include <asm/current.h>
> -#include <asm/guest_access.h>
>  #include <asm/mmio.h>
>  #include <asm/gic_v3_defs.h>
>  #include <asm/gic_v3_its.h>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 888f504a94..9e14a451eb 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -16,6 +16,7 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>=20
> +#include <xen/guest_access.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/trace.h>
> @@ -34,7 +35,6 @@
>  #include <asm/cpufeature.h>
>  #include <asm/processor.h>
>  #include <asm/amd.h>
> -#include <asm/guest_access.h>
>  #include <asm/debugreg.h>
>  #include <asm/msr.h>
>  #include <asm/i387.h>
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c =
b/xen/arch/x86/hvm/viridian/viridian.c
> index 977c1bc54f..dc7183a546 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -5,12 +5,12 @@
>   * Hypervisor Top Level Functional Specification for more =
information.
>   */
>=20
> +#include <xen/guest_access.h>
>  #include <xen/sched.h>
>  #include <xen/version.h>
>  #include <xen/hypercall.h>
>  #include <xen/domain_page.h>
>  #include <xen/param.h>
> -#include <asm/guest_access.h>
>  #include <asm/guest/hyperv-tlfs.h>
>  #include <asm/paging.h>
>  #include <asm/p2m.h>
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 1c398fdb6e..98e9c91ea3 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -15,6 +15,7 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>=20
> +#include <xen/guest_access.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/param.h>
> @@ -31,7 +32,6 @@
>  #include <asm/regs.h>
>  #include <asm/cpufeature.h>
>  #include <asm/processor.h>
> -#include <asm/guest_access.h>
>  #include <asm/debugreg.h>
>  #include <asm/msr.h>
>  #include <asm/p2m.h>
> diff --git a/xen/common/libelf/libelf-loader.c =
b/xen/common/libelf/libelf-loader.c
> index 0f468727d0..629cc0d3e6 100644
> --- a/xen/common/libelf/libelf-loader.c
> +++ b/xen/common/libelf/libelf-loader.c
> @@ -16,7 +16,7 @@
>   */
>=20
>  #ifdef __XEN__
> -#include <asm/guest_access.h>
> +#include <xen/guest_access.h>
>  #endif
>=20
>  #include "libelf-private.h"
> diff --git a/xen/include/asm-arm/guest_access.h =
b/xen/include/asm-arm/guest_access.h
> index 4046d50347..93d56868f1 100644
> --- a/xen/include/asm-arm/guest_access.h
> +++ b/xen/include/asm-arm/guest_access.h
> @@ -1,7 +1,6 @@
>  #ifndef __ASM_ARM_GUEST_ACCESS_H__
>  #define __ASM_ARM_GUEST_ACCESS_H__
>=20
> -#include <xen/guest_access.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
>=20
> diff --git a/xen/include/asm-x86/guest_access.h =
b/xen/include/asm-x86/guest_access.h
> index 9ee275d01f..5c3dfc47b6 100644
> --- a/xen/include/asm-x86/guest_access.h
> +++ b/xen/include/asm-x86/guest_access.h
> @@ -54,22 +54,24 @@
>=20
>  /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
>  #define guest_handle_to_param(hnd, type) ({                  \
> +    typeof((hnd).p) _x =3D (hnd).p;                            \
> +    XEN_GUEST_HANDLE_PARAM(type) _y =3D { _x };                \
>      /* type checking: make sure that the pointers inside     \
>       * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
>       * the same type, then return hnd */                     \
> -    (void)((typeof(&(hnd).p)) 0 =3D=3D                           \
> -        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
> -    (hnd);                                                   \
> +    (void)(&_x =3D=3D &_y.p);                                    \
> +    _y;                                                      \
>  })
>=20
>  /* Cast a XEN_GUEST_HANDLE_PARAM to XEN_GUEST_HANDLE */
> -#define guest_handle_from_param(hnd, type) ({                \
> -    /* type checking: make sure that the pointers inside     \
> -     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
> -     * the same type, then return hnd */                     \
> -    (void)((typeof(&(hnd).p)) 0 =3D=3D                           \
> -        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
> -    (hnd);                                                   \
> +#define guest_handle_from_param(hnd, type) ({               \
> +    typeof((hnd).p) _x =3D (hnd).p;                           \
> +    XEN_GUEST_HANDLE(type) _y =3D { _x };                     \
> +    /* type checking: make sure that the pointers inside    \
> +     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of   \
> +     * the same type, then return hnd */                    \
> +    (void)(&_x =3D=3D &_y.p);                                   \
> +    _y;                                                     \
>  })
>=20

The commit comment would have the reader believe that this patch is just =
some changes in header file inclusion. These last two hunks are =
something else so I would suggest they get split out into a separate =
patch.

  Paul

>  #define guest_handle_for_field(hnd, type, fld)          \
> diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
> index b793181464..2d53bd3ced 100644
> --- a/xen/lib/x86/private.h
> +++ b/xen/lib/x86/private.h
> @@ -4,12 +4,12 @@
>  #ifdef __XEN__
>=20
>  #include <xen/bitops.h>
> +#include <xen/guest_access.h>
>  #include <xen/kernel.h>
>  #include <xen/lib.h>
>  #include <xen/nospec.h>
>  #include <xen/types.h>
>=20
> -#include <asm/guest_access.h>
>  #include <asm/msr-index.h>
>=20
>  #define copy_to_buffer_offset copy_to_guest_offset
> --
> 2.17.1



