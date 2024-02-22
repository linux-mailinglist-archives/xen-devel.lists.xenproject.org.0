Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04767860057
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 19:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684514.1064415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdDR3-0004Tb-Kh; Thu, 22 Feb 2024 18:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684514.1064415; Thu, 22 Feb 2024 18:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdDR3-0004Ro-HW; Thu, 22 Feb 2024 18:04:41 +0000
Received: by outflank-mailman (input) for mailman id 684514;
 Thu, 22 Feb 2024 18:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbB9=J7=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rdDR2-0004Ri-4y
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 18:04:40 +0000
Received: from sender3-op-o18.zoho.com (sender3-op-o18.zoho.com
 [136.143.184.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6245396-d1ac-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 19:04:36 +0100 (CET)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176]) by mx.zohomail.com
 with SMTPS id 1708625072049441.3639280308985;
 Thu, 22 Feb 2024 10:04:32 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-60822b444c9so37573257b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 10:04:31 -0800 (PST)
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
X-Inumbo-ID: d6245396-d1ac-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1708625074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jEA7GQola9rqHS98s0Ex2x5iLJXmXJbp13lAozlLoeEjwM/c1GDtZ4cR+uf5Ou8lh8xtVXYeVHmKG2jCRCHNTpNVa8efHk+yHBl8iaf8k4EZytPCYzG23JxUTcH7TMP4ZvKw0fi45bGbTXZVzQWpdM5Bsmb7GDc6mm9ruOcZxm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1708625074; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gZFGRZm0r/chvCibWsTL41TnqvgsC7Ny3x7SAr9/GyA=; 
	b=En6xbggBkvZs/X+jE4Ar+CCHW9VuJBtHUaCn7zIGljKVvhEsid6ET8Z7NYq4mMId3yf9XWyFc8lBJfR9cB0uKPky+pM6YVKWxCUUGUvPqsdCgVa7fp4SSdeWOByddI8EH5XnLKJjDBnaROn3vyR38zhcdxKAtAWTk5IvYYQFKSA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1708625074;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gZFGRZm0r/chvCibWsTL41TnqvgsC7Ny3x7SAr9/GyA=;
	b=gW1LVELxPuDUlXtnpDuxXUAg/zA2/Ap6C+Z9gZ8P0cgzDLHRm6G99EKIbUj4v3fv
	OOVuJREpcxrQs80vPIy9VYVMhPpsTTZIkTujTgPTQNEAVHubscv/OUcqaXN1YU4xHat
	o5867eVstbi7msXQ2r+J9TVHhuN9GDNGplsQov78=
X-Forwarded-Encrypted: i=1; AJvYcCUbh2yvPF6rj1IGTO1lhmc6KBtOoT5BYIF+zFKeW0/SIbqM+2PRilgGkM3OjFYs+uNpxXqDlXP9YwwjHtX/zmVdXAw8CcQcGNE5lC/zO1g=
X-Gm-Message-State: AOJu0Yy9VMppVDAgc6G9lwff3GHaWDWYEu4zErmMUg0M6tCV60KxJXXU
	Q92R0xbIrp+2ueayW/SJK0Xo1Ae/SewZrmlvL6cKwuVR7lckAhRHKSWr4PSg2R/6X3MpNW5j4Ab
	zfTW0vwi37iNeNlVucuMf15TLXgo=
X-Google-Smtp-Source: AGHT+IFSTXMUjgYOgiBiX66D/d8gwDzXRGnSaETmzkXucjYsmcmKUzXbMGet77X7htDMwzJoSccSCb+WfDDkNQt0mVE=
X-Received: by 2002:a81:e706:0:b0:608:7485:9df4 with SMTP id
 x6-20020a81e706000000b0060874859df4mr6872139ywl.14.1708625071104; Thu, 22 Feb
 2024 10:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20240222090530.62530-1-roger.pau@citrix.com> <20240222090530.62530-2-roger.pau@citrix.com>
 <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
In-Reply-To: <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 22 Feb 2024 13:03:55 -0500
X-Gmail-Original-Message-ID: <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
Message-ID: <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:06=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.02.2024 10:05, Roger Pau Monne wrote:
> > The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the=
 same
> > can be achieved with an atomic increment, which is both simpler to read=
, and
> > avoid any need for a loop.
> >
> > The cmpxchg usage is likely a remnant of 32bit support, which didn't ha=
ve an
> > instruction to do an atomic 64bit add, and instead a cmpxchg had to be =
used.
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-of-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
>
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_in=
fo *pg)
> >
> >  static shr_handle_t get_next_handle(void)
> >  {
> > -    /* Get the next handle get_page style */
> > -    uint64_t x, y =3D next_handle;
> > -    do {
> > -        x =3D y;
> > -    }
> > -    while ( (y =3D cmpxchg(&next_handle, x, x + 1)) !=3D x );
> > -    return x + 1;
> > +    return arch_fetch_and_add(&next_handle, 1) + 1;
> >  }
>
> ... the adding of 1 here is a little odd when taken together with
> next_handle's initializer. Tamas, you've not written that code, but do
> you have any thoughts towards the possible removal of either the
> initializer or the adding here? Plus that variable of course could
> very well do with moving into this function.

I have to say I find the existing logic here hard to parse but by the
looks I don't think we need the + 1 once we switch to
arch_fetch_and_add. Also could go without initializing next_handle to
1. Moving it into the function would not really accomplish anything
other than style AFAICT?

Tamas

