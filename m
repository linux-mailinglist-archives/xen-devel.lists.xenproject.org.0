Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BBB18786
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 20:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067483.1432199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhuxs-0000IZ-2h; Fri, 01 Aug 2025 18:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067483.1432199; Fri, 01 Aug 2025 18:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhuxr-0000Fo-Vx; Fri, 01 Aug 2025 18:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1067483;
 Fri, 01 Aug 2025 18:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhuxr-0000Fi-Bp
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 18:58:47 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c776738-6f09-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 20:58:45 +0200 (CEST)
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
X-Inumbo-ID: 8c776738-6f09-11f0-b897-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754074724; x=1754333924;
	bh=hF3fXRRemikXKpysMLkzFHck5hyY9cjkXpdyVpV7cYI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hj6rLPnsHphwTNFp5Dv9JNEdAZ+Dde8RuHn4Mvi5T2SJonLdWGj+pBkZzJk1+mmeY
	 4J3qL80DIqEXEmALoRyvuVGmh9ESEywJFrTBstKF4r1vg3RuUvP8YsIL2PP1Zy9r8x
	 kWMn8zkCK68UjvDhuYCgxCVZmNPU8GJZF6MwbWYhxEumA8SHtSVLvrlTere0nAL6Aw
	 06q21q3150bziToFsY4iTgyFwk5yZIRFAuw3hQsv2Re9CqVTn2WU6Vk97A4UzOdt8u
	 EEC2+J/V+znX48fs+MUkN/bx1iUjlJdxBIxmOZeAS6ySb8G8S0/qJ93ulniNTsjL0t
	 d9AzdV+TbPKMA==
Date: Fri, 01 Aug 2025 18:58:39 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] console: make printk_ratelimit_{burst,ms} const
Message-ID: <aI0OWwWkr0wg6FKw@kraken>
In-Reply-To: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com>
References: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ea52ee6d97e7d2fb159eae61bf75f796d4b8517f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 09:30:34AM +0200, Jan Beulich wrote:
> Them not being altered by any means, their __read_mostly attribute is
> actually counter-productive: It causes the compiler to instantiate the
> variables, when already with just the attributes dropped the compiler
> can constant-propagate the values into the sole use site. Make the
> situation yet more explicit by adding const.
>=20
> Also switch the variables away from being plain int, and have the
> parameters of __printk_ratelimit() follow suit. While there also
> similarly adjust the type of "missed" and "lost", and - while touching
> the adjacent line - increase lost_str[] to accommodate any unsigned
> 32-bit number.
>=20
> Fixes: a8b1845a7845 ("Miscellaneous data placement adjustments")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In principle {__,}printk_ratelimit() may also want to have their return
> type changed to bool, but I think doing so would go too far here: This
> would have knock-on effects elsewhere, and it would want considering to
> actually flip polarity.
>=20
> Despite the Fixes: tag I wouldn't consider this for backport.
>=20
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1268,12 +1268,12 @@ void console_end_sync(void)
>   * This enforces a rate limit: not more than one kernel message
>   * every printk_ratelimit_ms (millisecs).
>   */
> -int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
> +int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int ratelimit=
_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
>      static unsigned long toks =3D 10 * 5 * 1000;
>      static unsigned long last_msg;
> -    static int missed;
> +    static unsigned int missed;
>      unsigned long flags;
>      unsigned long long now =3D NOW(); /* ns */
>      unsigned long ms;
> @@ -1288,14 +1288,16 @@ int __printk_ratelimit(int ratelimit_ms,
>          toks =3D ratelimit_burst * ratelimit_ms;
>      if ( toks >=3D ratelimit_ms )
>      {
> -        int lost =3D missed;
> +        unsigned int lost =3D missed;
> +
>          missed =3D 0;
>          toks -=3D ratelimit_ms;
>          spin_unlock(&ratelimit_lock);
>          if ( lost )
>          {
> -            char lost_str[8];
> -            snprintf(lost_str, sizeof(lost_str), "%d", lost);
> +            char lost_str[10];
> +
> +            snprintf(lost_str, sizeof(lost_str), "%u", lost);

Since this code is touched, I would also simplify the entire `if ( lost )`
block (I have it done in another experiment):
=20
            char lost_str[64];
            size_t lost_len =3D snprintf(lost_str, sizeof(lost_str),
                                       "printk: %d messages suppressed.\n",
                                       lost_str);

            /* console_lock may already be acquired by printk(). */
            rspin_lock(&console_lock);
            printk_start_of_line(CONSOLE_PREFIX, cflags);
            __putstr(lost_str, lost_len);
            ...

What do you think?

--
Denis


