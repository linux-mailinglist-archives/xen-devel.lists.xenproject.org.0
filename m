Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF75A01235
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865257.1276552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvVd-0002Nt-Jg; Sat, 04 Jan 2025 04:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865257.1276552; Sat, 04 Jan 2025 04:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvVd-0002MJ-GB; Sat, 04 Jan 2025 04:11:33 +0000
Received: by outflank-mailman (input) for mailman id 865257;
 Sat, 04 Jan 2025 04:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvVb-0002MB-5o
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:11:32 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8cc286c-ca51-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:11:28 +0100 (CET)
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
X-Inumbo-ID: f8cc286c-ca51-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963887; x=1736223087;
	bh=yzwIUDE2mf7bE1y6V1xydGKJ3GLYX5tWjDmcbyR+z5Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BXvSmlnG/9yDrQXr6UDtvIOuLYd2zxWlK6/tt1SXHned6bu3Fh+EEqXbhf+Qq5wC4
	 rXzHiwKWpM+fL1V+21ik6OZx7d1jN9pHLSCiZ8c0N//2PBeKRUF/z2++iPjTRtDujq
	 EUA2XVfD1mRoelLUS5N1zniQRQ8n0aW+mYnGhJpeYqw85XGX0Zw0LCHy8sqkrgXfQ/
	 Gw4eH+i+YjIAYht8BUGVAjrZnAsQffLaXOdmvB9s1sjx2KoR1epb1GEJxE5wHSx2SS
	 BHy4dCi1ELm/yShRmDUCFYA8eNC0j9iPl0d8f+JLOZwd/fG7Dqn9aJ2+faRqJ4+gk2
	 pvsFWSyQejM3Q==
Date: Sat, 04 Jan 2025 04:11:23 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
Message-ID: <EFbe2P8_qOWpR_7V8U-UwFYC3tuQ0VySWlxIp7aUhqoHGCnmS7ARrYZKyz7jJFWzmDi6Awt-Fhxr2VGhZkOF5nUzIV0W_0teswRX07dGr9k=@proton.me>
In-Reply-To: <Z1q4fPHY_0BzvGT6@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com> <Z1q4fPHY_0BzvGT6@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 01a8615830e2e37424e697a1cb48aa6ee29379e2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Thursday, December 12th, 2024 at 2:18 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:50PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > console_owner_domid() is introduced to obtain the "console owner" domai=
n ID.
> >
> > The call is used in NS8250 emulator to identify the case when physical =
xen
> > console focus is owned by the domain w/ NS8250 emulator, in which case,
> > messages from guest OS are formatted w/o '(XEN)' prefix.
>
>
> Nit: it would be better to not use abbreviations such as w/ or w/o in
> commit messages.

Muscle memory; cleaned up in v3.

>
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/drivers/char/console.c | 5 +++++
> > xen/include/xen/console.h | 1 +
> > 2 files changed, 6 insertions(+)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 52cf64dbf6fd18d599cb88835d03501a23b3e3c4..a8ab5c2bcb98e4cadf9ad2c=
9ad28d297977d0557 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -498,6 +498,11 @@ struct domain *rcu_lock_domain_console_owner(void)
> > return rcu_lock_domain_console_by_id(console_owner);
> > }
> >
> > +domid_t console_owner_domid(void)
> > +{
> > + return console_owner;
> > +}
> > +
> > static bool console_owner_possible(domid_t domid)
> > {
> > struct domain *d;
> > diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
> > index 57c482cfbf2da15b011e64841ea086e779f4588d..83be5794aff6630beaad46f=
910fcc0fc6d833808 100644
> > --- a/xen/include/xen/console.h
> > +++ b/xen/include/xen/console.h
> > @@ -33,6 +33,7 @@ void console_end_log_everything(void);
> >
> > struct domain *rcu_lock_domain_console_owner(void);
> > int console_set_owner(domid_t);
> > +domid_t console_owner_domid(void);
>
>
> I would expect that either the caller already has a domain locked, or
> uses rcu_lock_domain_console_owner() to obtain the domain and then get
> the domid? (d->domain_id?)

If the console focus in the guest, there's no need to prefix each guest OS
printout w/ "(XEN)" and a timestamp. To identify that current ns8250 emulat=
or
is the one who's printing to the physical UART, I introduced this call.

I think ideally, domain should have a flag saying "currently has console
focus" which is set by the console focus switch logic in console driver.

>
>
> It's hard to tell why you need such way to get the console input
> target domid in such a way without seeing a caller to the function.

Sorry for that, addressed in v3.
I ended up dropping the patch after addressing all the feedback.

>
> Thanks, Roger.



