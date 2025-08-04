Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31BB1AB73
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 01:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069860.1433548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj4am-0002kJ-6z; Mon, 04 Aug 2025 23:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069860.1433548; Mon, 04 Aug 2025 23:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj4am-0002gz-4F; Mon, 04 Aug 2025 23:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1069860;
 Mon, 04 Aug 2025 23:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=25og=2Q=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uj4ak-0002gt-Dm
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 23:27:43 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ce51638-718a-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 01:27:40 +0200 (CEST)
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
X-Inumbo-ID: 9ce51638-718a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754350058; x=1754609258;
	bh=w3znrRy3Q3UPwv8hAmfKpkieJIJwL4RGvd+2kM8Zvcc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hSrh4bGIoU0Fm/DnvyOIX+RaAkZg4PKbfPLqcqwjKuEDOmSsGtIdPgM83E5WhXO7p
	 UkXdlqsEtT0Vgmvz2DoWMbPp6F7oxTITGYMX1ArS6KCPKCUZ4hyQKCfkzXRCDMHT+v
	 S78Hfyys0VLwSfsG3PJ4Ulz/C+QZJGc5D9L1GP8RmfCFG6Pa/PlmnUOsWcyMFpEfN9
	 0FipfxmaPttk4fKWPayLazKFVpeug9qg1R8Pvb3tJkdnHbxl4oJR5s6dkfGYu4itjl
	 3w8m5L53izPxZk4gI8Cz46wOD8lb3Z8+xYh2W7h4Zor/NRLgsALknQvLIrbZQ8ii4U
	 DMe4b9PSlYBTg==
Date: Mon, 04 Aug 2025 23:27:34 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] console: make printk_ratelimit_{burst,ms} const
Message-ID: <aJFB3wePhxL5a+xa@kraken>
In-Reply-To: <f0201ab2-db01-440a-98e9-acd3a29e91d3@suse.com>
References: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com> <aI0OWwWkr0wg6FKw@kraken> <f0201ab2-db01-440a-98e9-acd3a29e91d3@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 112008fd4bf757c4e1ff6d9d07ff165ed9ddada8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 09:10:34AM +0200, Jan Beulich wrote:
> On 01.08.2025 20:58, dmkhn@proton.me wrote:
> > On Fri, Aug 01, 2025 at 09:30:34AM +0200, Jan Beulich wrote:
> >> Them not being altered by any means, their __read_mostly attribute is
> >> actually counter-productive: It causes the compiler to instantiate the
> >> variables, when already with just the attributes dropped the compiler
> >> can constant-propagate the values into the sole use site. Make the
> >> situation yet more explicit by adding const.
> >>
> >> Also switch the variables away from being plain int, and have the
> >> parameters of __printk_ratelimit() follow suit. While there also
> >> similarly adjust the type of "missed" and "lost", and - while touching
> >> the adjacent line - increase lost_str[] to accommodate any unsigned
> >> 32-bit number.
> >>
> >> Fixes: a8b1845a7845 ("Miscellaneous data placement adjustments")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> In principle {__,}printk_ratelimit() may also want to have their retur=
n
> >> type changed to bool, but I think doing so would go too far here: This
> >> would have knock-on effects elsewhere, and it would want considering t=
o
> >> actually flip polarity.
> >>
> >> Despite the Fixes: tag I wouldn't consider this for backport.
> >>
> >> --- a/xen/drivers/char/console.c
> >> +++ b/xen/drivers/char/console.c
> >> @@ -1268,12 +1268,12 @@ void console_end_sync(void)
> >>   * This enforces a rate limit: not more than one kernel message
> >>   * every printk_ratelimit_ms (millisecs).
> >>   */
> >> -int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
> >> +int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int rateli=
mit_burst)
> >>  {
> >>      static DEFINE_SPINLOCK(ratelimit_lock);
> >>      static unsigned long toks =3D 10 * 5 * 1000;
> >>      static unsigned long last_msg;
> >> -    static int missed;
> >> +    static unsigned int missed;
> >>      unsigned long flags;
> >>      unsigned long long now =3D NOW(); /* ns */
> >>      unsigned long ms;
> >> @@ -1288,14 +1288,16 @@ int __printk_ratelimit(int ratelimit_ms,
> >>          toks =3D ratelimit_burst * ratelimit_ms;
> >>      if ( toks >=3D ratelimit_ms )
> >>      {
> >> -        int lost =3D missed;
> >> +        unsigned int lost =3D missed;
> >> +
> >>          missed =3D 0;
> >>          toks -=3D ratelimit_ms;
> >>          spin_unlock(&ratelimit_lock);
> >>          if ( lost )
> >>          {
> >> -            char lost_str[8];
> >> -            snprintf(lost_str, sizeof(lost_str), "%d", lost);
> >> +            char lost_str[10];
> >> +
> >> +            snprintf(lost_str, sizeof(lost_str), "%u", lost);
> >
> > Since this code is touched, I would also simplify the entire `if ( lost=
 )`
> > block (I have it done in another experiment):
> >
> >             char lost_str[64];
> >             size_t lost_len =3D snprintf(lost_str, sizeof(lost_str),
> >                                        "printk: %d messages suppressed.=
\n",
> >                                        lost_str);
> >
> >             /* console_lock may already be acquired by printk(). */
> >             rspin_lock(&console_lock);
> >             printk_start_of_line(CONSOLE_PREFIX, cflags);
> >             __putstr(lost_str, lost_len);
> >             ...
> >
> > What do you think?
>=20
> Maybe, but definitely not right in this patch.

Sure, please consider

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20


