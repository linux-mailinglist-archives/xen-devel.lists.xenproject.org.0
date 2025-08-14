Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24DB25858
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 02:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080466.1440851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umLnP-0006Z6-Q3; Thu, 14 Aug 2025 00:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080466.1440851; Thu, 14 Aug 2025 00:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umLnP-0006X7-NH; Thu, 14 Aug 2025 00:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1080466;
 Thu, 14 Aug 2025 00:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Xan=22=bounce.vates.tech=bounce-md_30504962.689d2d1f.v1-f1e8a651c6aa48e9b725e2357815ab18@srs-se1.protection.inumbo.net>)
 id 1umLnN-0006X1-El
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 00:26:17 +0000
Received: from mail145-23.atl61.mandrillapp.com
 (mail145-23.atl61.mandrillapp.com [198.2.145.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453cffd1-78a5-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 02:26:08 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-23.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4c2QyR0JrSz1XLSD2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:26:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f1e8a651c6aa48e9b725e2357815ab18; Thu, 14 Aug 2025 00:26:07 +0000
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
X-Inumbo-ID: 453cffd1-78a5-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755131167; x=1755401167;
	bh=xmsmBVzxmQ926Nka0Ka5wdHY3/wPcYMZIwTxHs4o9Fg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HBdLsI29mD4LyD78awC+hG8v9SklwF1hph3Tzl+EWCt+liepdDg5aCN15whvqwERC
	 mbJVgB1llqUleneFgK1ztaAq83Bu6T1lyyR4vZbqzhDxNxLQIaw3QJtVZdKKgeI1Fd
	 2Nm5tVt6DV3YscVQe4SH/555WXsNV8FOMZUobnSW71Gh6E4bO+GUHaXcf+XRkN72pF
	 NFkR5mVHhBUwQ7URHr1snC+9KGKAUHq+kq7GWpksefvtsRaYsfMCM/zNKz3nJFqgtq
	 6D6FrFL30qASIDlUlbw3/ej090BzCJoesNBDuy6hkWMvYmiOD7XgWETpe7+TxYrTnv
	 dz9DdvXKn7h7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755131167; x=1755391667; i=teddy.astie@vates.tech;
	bh=xmsmBVzxmQ926Nka0Ka5wdHY3/wPcYMZIwTxHs4o9Fg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RpaQsSmS1z5Q3W9i/A0kvHcOT2x4AcVjr1h78FWibQx4d/4pvV0wQnr7EjJLppUOB
	 GyRsARitODqaaNrSW2GmOPZ14oCWYjkIpskBZVANv34OOu9bjF0uVVoMzcZcdTLdyp
	 1yEvz2siUcEjoaVOtR3JtXkkfTAqTeeDn0zqvTzXNzlytlJIv3Ix1w1Mt88ZSIYFZG
	 soot/TZ8iYXHS3N7qi3nwsowqMPWBBqA/kuIyHEbTywlcIt1fDqVl6/RJnlqFoOchn
	 d0F7J+IdAhZ5NrgDMBUYvc8b6SZZCaexZYjRl4VZ6x2kTvcAeAN7S2m6SKiEFPj33L
	 cuxo6y1yhh0mA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20misra:=20address=20Rule=2011.1=20violation=20in=20cmpxchgptr()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755131165394
Message-Id: <53d285af-e7ce-4736-a91a-5893b1773171@vates.tech>
To: "Dmytro Prokopchuk1" <dmytro_prokopchuk1@epam.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <64882f9ee8e470a2633b8b4d0b5c1cd9d1c0a8c7.1755107902.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <64882f9ee8e470a2633b8b4d0b5c1cd9d1c0a8c7.1755107902.git.dmytro_prokopchuk1@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f1e8a651c6aa48e9b725e2357815ab18?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250814:md
Date: Thu, 14 Aug 2025 00:26:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 13/08/2025 =C3=A0 20:07, Dmytro Prokopchuk1 a =C3=A9crit=C2=A0:
> Misra Rule 11.1 states: "Conversions shall not be performed between a
> pointer to a function and any other type."
> 
> The violation occurs in the macro:
>      __typeof__(**(ptr)) *const o_ =3D (o);                              =
  \
>      __typeof__(**(ptr)) *n_ =3D (n);                                    =
  \
>      ((__typeof__(*(ptr)))__cmpxchg(ptr, (unsigned long)o_,              =
\
>                                     (unsigned long)n_, sizeof(*(ptr)))); =
\
> })
> when it is used for handling function pointers of type:
> typedef void (*)(struct vcpu *, unsigned int).
> The issue happens because the '__cmpxchg()' function returns an 'unsigned
> long', which is then converted back into a function pointer, causing a
> violation of Rule 11.1. In this particular usage, the return value of the
> macro 'cmpxchgptr()' is not required. To address the violation, the macro
> has been replaced to discard the return value of '__cmpxchg()', preventin=
g
> the conversion.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Probably separate macro is too much for this single case.
> 
> And the following will be enought:
> __cmpxchg(&xen_consumers[i], (unsigned long)NULL, (unsigned long)fn, size=
of(*(&xen_consumers[i])));
> ---
>   xen/common/event_channel.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 67700b050a..2094338b28 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -93,6 +93,17 @@ static void cf_check default_xen_notification_fn(
>           vcpu_wake(v);
>   }
>   
> +/*
> + * A slightly more updated variant of cmpxchgptr() where old value
> + * is not returned.
> + */
> +#define cmpxchgptr_noret(ptr, o, n) ({                  \
> +    __typeof__(**(ptr)) *const o_ =3D (o);                \
> +    __typeof__(**(ptr)) *n_ =3D (n);                      \
> +    (void)__cmpxchg(ptr, (unsigned long)o_,             \
> +                    (unsigned long)n_, sizeof(*(ptr))); \
> +})
> +
>   /*
>    * Given a notification function, return the value to stash in
>    * the evtchn->xen_consumer field.
> @@ -106,9 +117,9 @@ static uint8_t get_xen_consumer(xen_event_channel_not=
ification_t fn)
>   
>       for ( i =3D 0; i < ARRAY_SIZE(xen_consumers); i++ )
>       {
> -        /* Use cmpxchgptr() in lieu of a global lock. */
> +        /* Use cmpxchgptr_noret() in lieu of a global lock. */
>           if ( xen_consumers[i] =3D=3D NULL )
> -            cmpxchgptr(&xen_consumers[i], NULL, fn);
> +            cmpxchgptr_noret(&xen_consumers[i], NULL, fn);
>           if ( xen_consumers[i] =3D=3D fn )
>               break;
>       }

AFAICS, Rule 11.1 has a deviation which allows this specific case.

In docs/misra/deviations.rst
> * - R11.1
>   - The conversion from a function pointer to unsigned long or (void \*) =
does
>     not lose any information, provided that the target type has enough bi=
ts
>     to store it.
>   - Tagged as `safe` for ECLAIR.

Here, we are constructing a function pointer from a unsigned long. I 
assume this rule goes the other way it says, and allow converting a 
unsigned long into a function pointer as long as its value is a valid 
function pointer.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



