Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6233AD090A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008849.1388015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdcP-0003EW-5R; Fri, 06 Jun 2025 20:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008849.1388015; Fri, 06 Jun 2025 20:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdcP-0003Cz-2i; Fri, 06 Jun 2025 20:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1008849;
 Fri, 06 Jun 2025 20:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Zps=YV=bounce.vates.tech=bounce-md_30504962.68434e8c.v1-aeed00e7af684050a1ed30281fe96756@srs-se1.protection.inumbo.net>)
 id 1uNdcN-0003Cm-Ex
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 20:24:47 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49205a47-4314-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 22:24:46 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4bDXqJ1QW5zlgJ81
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jun 2025 20:24:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 aeed00e7af684050a1ed30281fe96756; Fri, 06 Jun 2025 20:24:44 +0000
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
X-Inumbo-ID: 49205a47-4314-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749241484; x=1749511484;
	bh=qWTqrUaJ22be3xQmtAEmq7viKiC+H8tahl5o7BAj8Pg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OOLHcxROYxDFclRyRFTW6GgvQ3IIdSfKs9RPZKAVSOr7Hxr2hB0L+jicbTcWN+WaP
	 XcWsNyxCOCoJRF50v4FJ4/YxJkNAfVChi8AAafJiwdSmxbZdYZu7YnFdy2c0VSGg70
	 NyZHw9Ytw8XN2IBHdEblWpU9Vcd3TBni/w2foiPRFqVqCma4UDOafVGw4PdeFZmepd
	 WC8sBEXAXpya5NBCPO6Q2GuCaJRl9MQVMadsmsosroeCcs6ux1qPuWOlgbtv5FW7PH
	 W0ZQbcrTUsiEbulWKxvDMV7+sS+aRkvt+XWLZdmDA5plSkGUfXcLnyeO8ApCuVnyFk
	 ixkiuF3Ui3zww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749241484; x=1749501984; i=teddy.astie@vates.tech;
	bh=qWTqrUaJ22be3xQmtAEmq7viKiC+H8tahl5o7BAj8Pg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=akiWoQVAlRF5kRS80/BEmVIxStLHNW5VUNSxU+W65AbAbVusy42LioJDIKIPdn6SZ
	 sG3B6eRuroAgrmasl/hY0sz7U/jbWJvWXc3hycPzr1bjW08jKjIUgPM7qtqysorkOb
	 7wmKWIlILKrt20a+nRDa0IRP81qQJrb2keVwtjW+T1N/5h78HeP241y5IDgMFAL3V4
	 0OX69dPNWSgobo9Is+cWqgh2GEGYpqClPwmYu0/k/lNWC2WcEijI5jZV8jFU39Eab1
	 6lOw/xRwi+SjUI/USXzlxM2WN6iDfsmiGOL0D14Fj9XFhB1Y+R65svicaoHkaRNwrS
	 XQz525kHxQQNg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1]=20xen/console:=20group=20pbuf=20under=20console=20field?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749241482674
Message-Id: <00ffcc4b-b63e-4b4d-8b8f-8d02fb7ef234@vates.tech>
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250606194937.2412579-1-dmukhin@ford.com>
In-Reply-To: <20250606194937.2412579-1-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.aeed00e7af684050a1ed30281fe96756?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250606:md
Date: Fri, 06 Jun 2025 20:24:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 06/06/2025 =C3=A0 21:51, dmkhn@proton.me a =C3=A9crit=C2=A0:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Group all pbuf-related data structures under domain's console field.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/hvm/hvm.c     | 14 +++++++-------
>   xen/common/domain.c        |  8 ++++----
>   xen/drivers/char/console.c | 19 +++++++++++--------
>   xen/include/xen/sched.h    | 12 ++++++------
>   4 files changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4cb2e13046..17d1fd42ce 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -571,16 +571,16 @@ static int cf_check hvm_print_line(
>       if ( !is_console_printable(c) )
>           return X86EMUL_OKAY;
>   
> -    spin_lock(&cd->pbuf_lock);
> +    spin_lock(&cd->console.pbuf_lock);
>       if ( c !=3D '\n' )
> -        cd->pbuf[cd->pbuf_idx++] =3D c;
> -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n')=
 )
> +        cd->console.pbuf[cd->console.pbuf_idx++] =3D c;
> +    if ( (cd->console.pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=
=3D '\n') )
>       {
> -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> -        cd->pbuf_idx =3D 0;
> +        cd->console.pbuf[cd->console.pbuf_idx] =3D '\0';
> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->console.pbuf);
> +        cd->console.pbuf_idx =3D 0;
>       }
> -    spin_unlock(&cd->pbuf_lock);
> +    spin_unlock(&cd->console.pbuf_lock);
>   
>       return X86EMUL_OKAY;
>   }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 153cd75340..dd1867b2fe 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>       BUG_ON(!d->is_dying);
>       BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
>   
> -    xfree(d->pbuf);
> +    xfree(d->console.pbuf);
>   
>       argo_destroy(d);
>   
> @@ -862,7 +862,7 @@ struct domain *domain_create(domid_t domid,
>       spin_lock_init(&d->shutdown_lock);
>       d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
>   
> -    spin_lock_init(&d->pbuf_lock);
> +    spin_lock_init(&d->console.pbuf_lock);
>   
>       rwlock_init(&d->vnuma_rwlock);
>   
> @@ -956,8 +956,8 @@ struct domain *domain_create(domid_t domid,
>           goto fail;
>   
>       err =3D -ENOMEM;
> -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> -    if ( !d->pbuf )
> +    d->console.pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> +    if ( !d->console.pbuf )
>           goto fail;
>   
>       if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 616f4968b0..3855962af7 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -769,22 +769,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
>               } while ( --kcount > 0 );
>   
>               *kout =3D '\0';
> -            spin_lock(&cd->pbuf_lock);
> +            spin_lock(&cd->console.pbuf_lock);
>               kcount =3D kin - kbuf;
>               if ( c !=3D '\n' &&
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1))=
 )
> +                 cd->console.pbuf_idx + kout - kbuf < DOMAIN_PBUF_SIZE -=
 1 )

I don't think we want to drop the parentheses here.

>               {
>                   /* buffer the output until a newline */
> -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> -                cd->pbuf_idx +=3D (kout - kbuf);
> +                memcpy(cd->console.pbuf + cd->console.pbuf_idx,
> +                       kbuf,
> +                       kout - kbuf);
> +                cd->console.pbuf_idx +=3D (kout - kbuf);
>               }
>               else
>               {
> -                cd->pbuf[cd->pbuf_idx] =3D '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf=
);
> -                cd->pbuf_idx =3D 0;
> +                cd->console.pbuf[cd->console.pbuf_idx] =3D '\0';
> +                guest_printk(cd,
> +                             XENLOG_G_DEBUG "%s%s\n", cd->console.pbuf, =
kbuf);
> +                cd->console.pbuf_idx =3D 0;
>               }
> -            spin_unlock(&cd->pbuf_lock);
> +            spin_unlock(&cd->console.pbuf_lock);
>           }
>   
>           guest_handle_add_offset(buffer, kcount);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7..637aa09ec4 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -562,12 +562,6 @@ struct domain
>       /* Control-plane tools handle for this domain. */
>       xen_domain_handle_t handle;
>   
> -    /* hvm_print_line() and guest_console_write() logging. */
> -#define DOMAIN_PBUF_SIZE 200
> -    char       *pbuf;
> -    unsigned int pbuf_idx;
> -    spinlock_t  pbuf_lock;
> -
>       /* OProfile support. */
>       struct xenoprof *xenoprof;
>   
> @@ -654,6 +648,12 @@ struct domain
>   
>       /* Console settings. */
>       struct {
> +        /* hvm_print_line() and guest_console_write() logging. */
> +#define DOMAIN_PBUF_SIZE 200
> +        char *pbuf;
> +        unsigned int pbuf_idx;
> +        spinlock_t pbuf_lock;
> +
>           /* Permission to take ownership of the physical console input. =
*/
>           bool input_allowed;
>       } console;


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



