Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF4A01213
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865126.1276411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuju-0003XN-1d; Sat, 04 Jan 2025 03:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865126.1276411; Sat, 04 Jan 2025 03:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTujt-0003VQ-VF; Sat, 04 Jan 2025 03:22:13 +0000
Received: by outflank-mailman (input) for mailman id 865126;
 Sat, 04 Jan 2025 03:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTujr-0003TY-SN
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:22:11 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15bfe244-ca4b-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:22:10 +0100 (CET)
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
X-Inumbo-ID: 15bfe244-ca4b-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960930; x=1736220130;
	bh=60b7b8pCQscBiiojU0VCIPvXex4KqmvkFey65uK8Zws=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hKAkmtpGxYStlExWAS36v9F/wxb/zPlW2XRH5cWPRFS22Ys4t00X6FrgeBlSwJN32
	 6jMuHzhZVfDVWFaECWNL5eVVF/QOrNESQKUlaRFyPMxhl4PfQG4/WmNnqFR9QXm/ho
	 RhRuMLBZzsupAb15Fs2mQwS8ejphijbtEvLMDC9VrjJ7KJxNjgoLB9g8EjB4DXX6mO
	 JyReBU857RvpmO4QeKHUIQs6wpM4hv/cz/IyEhyc7sYdW3RVKvOIIoJSEYjGFi0daI
	 eaZJqv83+SZlxeZEgLll0P8tCXuuFc2Piay8Ka7MiSblc8PWAnpldVtd/oPsIRckVv
	 LOU7ixSpM3w9g==
Date: Sat, 04 Jan 2025 03:22:05 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 21/35] xen/console: introduce console_init_owner()
Message-ID: <Ak6C4enLcSkraItT-41clT-s3Z5GNRGNF7B55ZrJiaS6pND0bt1PLihHZ1ENb2hgJCVJWDOgrlxhlXcJ6ErP7EfhcOeUzbczPwfUBLC6_lM=@proton.me>
In-Reply-To: <be92d586-0185-4753-8f30-2c7fd92f01dd@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com> <be92d586-0185-4753-8f30-2c7fd92f01dd@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 347feed7118373b4e9c4b6134901ee8573de8c19
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 11:31 PM, Jan Beulich <jbeulich@suse.com=
> wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -554,6 +554,22 @@ static void console_find_owner(void)
> > console_set_owner(DOMID_XEN);
> > }
> >
> > +static void console_init_owner(void)
> > +{
> > + domid_t domid;
> > +
> > + /*
> > + * If user specifies so, we fool the switch routine to redirect input
> > + * straight back to Xen.
> > + */
> > + if ( opt_conswitch[1] =3D=3D 'x' )
> > + domid =3D DOMID_XEN;
> > + else
> > + domid =3D get_initial_domain_id();
> > +
> > + console_set_owner(domid);
> > +}
>
>
> Is this function meant to gain a 2nd user? If not, what exactly is the go=
al
> of introducing this new function?

I cannot foresee the second user.
My rationale was moving all console ownership initialization into one place
so the code is better localized.

>
> If the function's addition is warranted, it wants to be __init, matching =
...

I ended up dropping the patch in v3.

>
> > @@ -1160,8 +1168,7 @@ void __init console_endboot(void)
> > register_irq_keyhandler('G', &do_toggle_guest,
> > "toggle host/guest log level adjustment", 0);
> >
> > - /* Serial input is directed to DOM0 by default. */
> > - console_find_owner();
> > + console_init_owner();
> > }
>
>
> ... sole caller.
>
> Jan



