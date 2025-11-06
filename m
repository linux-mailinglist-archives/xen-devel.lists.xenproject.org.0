Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948ADC3C33D
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 16:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157071.1485991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2N5-0007Ir-D6; Thu, 06 Nov 2025 15:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157071.1485991; Thu, 06 Nov 2025 15:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2N5-0007GP-9g; Thu, 06 Nov 2025 15:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1157071;
 Thu, 06 Nov 2025 15:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCkv=5O=bounce.vates.tech=bounce-md_30504962.690cc582.v1-35b18899a5f3438fb6e7c458c2edc1ae@srs-se1.protection.inumbo.net>)
 id 1vH2N4-0007GJ-5A
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 15:57:58 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ba3e496-bb29-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 16:57:56 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d2Rfp1kC0zPm0Wcy
 for <xen-devel@lists.xenproject.org>; Thu,  6 Nov 2025 15:57:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 35b18899a5f3438fb6e7c458c2edc1ae; Thu, 06 Nov 2025 15:57:54 +0000
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
X-Inumbo-ID: 5ba3e496-bb29-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762444674; x=1762714674;
	bh=BYXZ9x9p2TsalxisIObnU5c4RxIs82a+71hF6ySnFmY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JilvSfYEvr6dXrwHWxYLiB83LfWRyOthtMjHDgyI+iFsjLP2/7TfLRkJ1OmlsCwei
	 oMV1L4Fb1vcl6+e4nrXr9jsw6bH/7pityY7ZZgdMq9r3UZLbvyUUP1WQG4gOWYTuch
	 85bm8La/b7ge2ZAMEJTzXkYkw3akhDr4Umk0Yp3uliyBJxDBEwcqGcVQHu+lGillPt
	 IHsk4V+0RkmGnWEq8VR+WvFHlgKeeooWQGCdi2EszVZNL6ABqg7ryy90JO/CPjefMe
	 Xe2O+GE2VO+Y10aww406fwL9oQpvnhR4odfdChpOWlt4Qf6n8YN44YY1qgEzDLkEGc
	 gRq1MjvCQxqRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762444674; x=1762705174; i=teddy.astie@vates.tech;
	bh=BYXZ9x9p2TsalxisIObnU5c4RxIs82a+71hF6ySnFmY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=a456u8IauwgXxWeCaP8ponMjlZ9N5/NmV0vOKTfGM7V5SSR7wOVwdL+lZt729PEjR
	 XE56Tw3LfOJ57tWX7/UtU7IX+lMZmGzP0dqsRacFUJ6LUTtgFs295MjO3GpGjQq7kq
	 M5KuEJSMJ5jWmCNr300Lqbe2ilHdw1aimxWaXS+oun9tKvPO8pin3oMSIlFDxdCmG7
	 Fsjst/qwLXxQpAgQdUgEgvP3NKlt9ey7AvLGUNz8feNdDj5Kl2q0AqwNz6/xnmOgat
	 FboYwbDtYTr8NMqoeWkijMu7iz9epOKApy0cU5QpIku2X7nM69lcVMha8TbvnVleXY
	 MiqkEwhZrCLpA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH]=20xen/x86:=20guest=5Faccess:=20optimize=20raw=5Fx=5Fguest()=20for=20PV=20and=20HVM=20combinations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762444672391
Message-Id: <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
In-Reply-To: <20251031212058.1338332-1-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.35b18899a5f3438fb6e7c458c2edc1ae?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251106:md
Date: Thu, 06 Nov 2025 15:57:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 31/10/2025 =C3=A0 22:25, Grygorii Strashko a =C3=A9crit=C2=A0:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>      (is_hvm_vcpu(current) ?                     \
>       copy_to_user_hvm((dst), (src), (len)) :    \
>       copy_to_guest_pv(dst, src, len))
> 
> How this pattern is working depends on CONFIG_PV/CONFIG_HVM as:
> - PV=3Dy and HVM=3Dy
>    Proper guest access function is selected depending on domain type.
> - PV=3Dy and HVM=3Dn
>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "f=
alse"
>    and compiler will optimize code and skip HVM specific part.
> - PV=3Dn and HVM=3Dy
>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be consti=
fied.
>    No PV specific code will be optimized by compiler.
> - PV=3Dn and HVM=3Dn
>    No guests should possible. The code will still follow PV path.
> 
> Rework raw_x_guest() code to use required functions explicitly for each
> combination of CONFIG_PV/CONFIG_HVM with main intention to optimize code =
for
> (PV=3Dn and HVM=3Dy) case.
> 
> For the case (PV=3Dn and HVM=3Dn) empty stubs are created which return (1=
)
> indicating failure. Hence, no guests should possible in this case -
> which means no access to guest memory  should ever happen.
> The two calls of __raw_copy_to_guest() in common/domain.c->update_runstat=
e_area()
> are fixed for this case by explicitly cast the return value to void
> (MISRA C Rule 17.7).
> 
> Finally build arch/x86/usercopy.c only for PV=3Dy.
> 
> The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is=
:
>    add/remove: 0/10 grow/shrink: 2/90 up/down: 163/-30932 (-30769)
>    Total: Before=3D1937113, After=3D1906344, chg -1.59%
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>   xen/arch/x86/Makefile                   |  2 +-
>   xen/arch/x86/include/asm/guest_access.h | 38 +++++++++++++++++++++++++
>   xen/common/domain.c                     | 10 ++++---
>   3 files changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 407571c510e1..27f131ffeb61 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -71,7 +71,7 @@ obj-y +=3D time.o
>   obj-y +=3D traps-setup.o
>   obj-y +=3D traps.o
>   obj-$(CONFIG_INTEL) +=3D tsx.o
> -obj-y +=3D usercopy.o
> +obj-$(CONFIG_PV) +=3D usercopy.o
>   obj-y +=3D x86_emulate.o
>   obj-$(CONFIG_TBOOT) +=3D tboot.o
>   obj-y +=3D hpet.o
> diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/inclu=
de/asm/guest_access.h
> index 69716c8b41bb..36aeb89524ab 100644
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -13,6 +13,7 @@
>   #include <asm/hvm/guest_access.h>
>   
>   /* Raw access functions: no type checking. */
> +#if defined(CONFIG_PV) && defined(CONFIG_HVM)
>   #define raw_copy_to_guest(dst, src, len)        \
>       (is_hvm_vcpu(current) ?                     \
>        copy_to_user_hvm((dst), (src), (len)) :    \
> @@ -34,6 +35,43 @@
>        copy_from_user_hvm((dst), (src), (len)) :  \
>        __copy_from_guest_pv(dst, src, len))
>   
> +#elif defined(CONFIG_HVM)
> +#define raw_copy_to_guest(dst, src, len)        \
> +     copy_to_user_hvm((dst), (src), (len))
> +#define raw_copy_from_guest(dst, src, len)      \
> +     copy_from_user_hvm((dst), (src), (len))
> +#define raw_clear_guest(dst,  len)              \
> +     clear_user_hvm((dst), (len))
> +#define __raw_copy_to_guest(dst, src, len)      \
> +     copy_to_user_hvm((dst), (src), (len))
> +#define __raw_copy_from_guest(dst, src, len)    \
> +     copy_from_user_hvm((dst), (src), (len))
> +
> +#elif defined(CONFIG_PV)
> +#define raw_copy_to_guest(dst, src, len)        \
> +     copy_to_guest_pv(dst, src, len)
> +#define raw_copy_from_guest(dst, src, len)      \
> +     copy_from_guest_pv(dst, src, len)
> +#define raw_clear_guest(dst,  len)              \
> +     clear_guest_pv(dst, len)
> +#define __raw_copy_to_guest(dst, src, len)      \
> +     __copy_to_guest_pv(dst, src, len)
> +#define __raw_copy_from_guest(dst, src, len)    \
> +     __copy_from_guest_pv(dst, src, len)
> +
> +#else
> +#define raw_copy_to_guest(dst, src, len)        \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#define raw_copy_from_guest(dst, src, len)      \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#define raw_clear_guest(dst, len)               \
> +        ((void)(dst), (void)(len), 1)
> +#define __raw_copy_to_guest(dst, src, len)      \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#define __raw_copy_from_guest(dst, src, len)    \
> +        ((void)(dst), (void)(src), (void)(len), 1)
> +#endif
> +
>   /*
>    * Pre-validate a guest handle.
>    * Allows use of faster __copy_* functions.
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 4f91316ad93e..c603edcc7d46 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1985,8 +1985,9 @@ bool update_runstate_area(struct vcpu *v)
>   #endif
>           guest_handle--;
>           runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1=
, 1);
> +        (void)__raw_copy_to_guest(guest_handle,
> +                                  (void *)(&runstate.state_entry_time + =
1) - 1,
> +                                  1);
>           smp_wmb();
>       }
>   
> @@ -2008,8 +2009,9 @@ bool update_runstate_area(struct vcpu *v)
>       {
>           runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>           smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1=
, 1);
> +        (void)__raw_copy_to_guest(guest_handle,
> +                                  (void *)(&runstate.state_entry_time + =
1) - 1,
> +                                  1);
>       }
>   
>       update_guest_memory_policy(v, &policy);

Alternatively, we can make all the raw_* functions `static inline` and 
have something like this which should have the same effect with much 
less redundancy.

static inline
unsigned int raw_copy_to_user_hvm(void *to, const void *from,
                                   unsigned int len)
{
     if ( IS_ENABLED(CONFIG_HVM) &&
          (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current) )
        copy_to_user_hvm(to, from, len);
     else if ( IS_ENABLED(CONFIG_PV) )
        copy_to_guest_pv(to, from, len);
}

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



