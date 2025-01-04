Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE9A01201
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865037.1276311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuVj-0002m8-Ow; Sat, 04 Jan 2025 03:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865037.1276311; Sat, 04 Jan 2025 03:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuVj-0002kf-M7; Sat, 04 Jan 2025 03:07:35 +0000
Received: by outflank-mailman (input) for mailman id 865037;
 Sat, 04 Jan 2025 03:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuVh-0002kY-8i
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:07:34 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0968b806-ca49-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:07:31 +0100 (CET)
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
X-Inumbo-ID: 0968b806-ca49-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960050; x=1736219250;
	bh=NZmhaIpPiqVY6052EGTTGgHuFFSYbWuqrzKj7qwJpLQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VwY+8A+1b2zCvRbxYSBz66RSoObZyl5aXdNvrtpJ+Pf3nIkvj1dZEuMfLHIql/a/F
	 jX8qULkFFFYsf2wGumeKcYl2yLxOVu25DhKGFOp7tF1FKM4KKg/GF6GM7ENJm8CaVK
	 TytBTNSsWD2tDbZf+WId5YDJVgxb6laxXp/R++PZAA1K2e5JmioVmiA3o+AOB/pF9X
	 eB3ahIj5OSOJHidmHfiGTGIJ8hZuxvi7ZzNxWWn74Rq2idjrVwhtlRUrnmMfkbUZd1
	 81i+Nqvr0e2mMq5LciQ9daYhPiWrreTRLoVDKd5StJF3vZthXgfGocegQ3Pubd5xAh
	 CQey3nVLlFKcQ==
Date: Sat, 04 Jan 2025 03:07:23 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
Message-ID: <CA3mSmUEpURgjpQUifNWDKDNS2HBsE68ad-RudxX4F45CCn2JL1wLo63_ZYcA7qx4nkD23GvE3BVlMjV0oz75Mssd0A5wQQ6zKlcWRLfhyM=@proton.me>
In-Reply-To: <d9c8e9bf-7eac-48f7-a347-b78e97a16f8f@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com> <d9c8e9bf-7eac-48f7-a347-b78e97a16f8f@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7c489c6c56dde900b90bd11d92bcaa3203dd2700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 7:02 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(unsig=
ned char key)
> >
> > /*
> > * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
> > - * and the DomUs started from Xen at boot.
> > + * and the DomUs.
> > /
> > #define switch_code (opt_conswitch[0]-'a'+1)
> > +
> > /
> > - * console_owner=3D0 =3D> input to xen
> > - * console_owner=3D1 =3D> input to dom0 (or the sole shim domain)
> > - * console_owner=3DN =3D> input to dom(N-1)
> > + * Current console owner domain ID: either Xen or domain w/ d->is_cons=
ole =3D=3D
> > + * true.
>
>
> The switching of number space may better have been a separate patch.
> Albeit maybe I'm just not seeing why it wants combining with the
> introduction of console_set_owner().

This is the part I tried in different variations and finally
ended up w/ plumbing new console owner IDs "address space"
here: console_set_owner() takes domid_t and I decided against intermediate
patch, since it is not a big (in term of lines of code) change.

>
> Actually, is this switching actually complete? What about late hwdom,
> which has a non-zero domain ID?

I did reworks for max_init_domid in v3, I believe it should address late
hwdom scenario.

>
> > + * Initialized in console_endboot().
> > */
> > -static unsigned int __read_mostly console_owner =3D 0;
> > +static domid_t __read_mostly console_owner;
> >
> > -#define max_console_rx (max_init_domid + 1)
> > +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
>
>
> I think "domain" and "console" want switching in the name, as it's a
> domain you're locking, not a console.

Renamed to "console_get_domain_by_id".

>
> > +int console_set_owner(domid_t domid)
>
>
> static? Iirc Misra doesn't like non-static functions which aren't called
> from any other CU.

Yes, but there's a follow on patch which will undo static - hwdom_crashcons=
ole=3D
patch - to drop the user to xen console once dom0 has crashed.
So since there's a need in globally visible symbol, I decided to get rid of=
 static
right away.

>
> Jan



