Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03644856A0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 17:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253648.434884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5973-00058M-IH; Wed, 05 Jan 2022 16:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253648.434884; Wed, 05 Jan 2022 16:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5973-00056Z-Ey; Wed, 05 Jan 2022 16:26:09 +0000
Received: by outflank-mailman (input) for mailman id 253648;
 Wed, 05 Jan 2022 16:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isy1=RV=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n5972-00056T-CY
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 16:26:08 +0000
Received: from MTA-14-4.privateemail.com (mta-14-4.privateemail.com
 [198.54.118.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d8969db-6e44-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 17:26:05 +0100 (CET)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 88F9918000B0
 for <xen-devel@lists.xenproject.org>; Wed,  5 Jan 2022 11:26:03 -0500 (EST)
Received: from mail-yb1-f181.google.com (unknown [10.20.151.155])
 by mta-14.privateemail.com (Postfix) with ESMTPA id 6385A18000AC
 for <xen-devel@lists.xenproject.org>; Wed,  5 Jan 2022 11:26:03 -0500 (EST)
Received: by mail-yb1-f181.google.com with SMTP id p15so69196326ybk.10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jan 2022 08:26:03 -0800 (PST)
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
X-Inumbo-ID: 2d8969db-6e44-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641399963;
	bh=VnrkCxdns2SdauawwYGNFyjRjQfEe8mpFl9RwcDx9C4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SoEtOFIVgnsEDzSNaUbGz8tqDvq1DIbwsIlQHCi9NWCDHtXF9gnrhVGZ2N5+mNyCm
	 /XOMA6DtZ0/iEfT6hl2FrvZgGWrt4ZCrdlTAPezQiqIrmoplgHrZVM78ADK6GBnStK
	 uqGpJbWT12MhDYbXdEv9wBE2J3AwZouR0z9brv0k9CrWTPCdQp2MNbfP9VUhGX8eF7
	 NuN25bZ0dbcB0Db3/0/iEIt7aAcG9Ank0qOBZiId7aHKu5zq/15t1FgtdZK8mDgs+D
	 1cIa/tKnu9wuSK4yPWWU/Ott2XgT+9ww7vuu/ZJHlcrHiS5FYQW6ZiTnPbcpeuQZO1
	 Q0JjrYjlrPZbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641399963;
	bh=VnrkCxdns2SdauawwYGNFyjRjQfEe8mpFl9RwcDx9C4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SoEtOFIVgnsEDzSNaUbGz8tqDvq1DIbwsIlQHCi9NWCDHtXF9gnrhVGZ2N5+mNyCm
	 /XOMA6DtZ0/iEfT6hl2FrvZgGWrt4ZCrdlTAPezQiqIrmoplgHrZVM78ADK6GBnStK
	 uqGpJbWT12MhDYbXdEv9wBE2J3AwZouR0z9brv0k9CrWTPCdQp2MNbfP9VUhGX8eF7
	 NuN25bZ0dbcB0Db3/0/iEIt7aAcG9Ank0qOBZiId7aHKu5zq/15t1FgtdZK8mDgs+D
	 1cIa/tKnu9wuSK4yPWWU/Ott2XgT+9ww7vuu/ZJHlcrHiS5FYQW6ZiTnPbcpeuQZO1
	 Q0JjrYjlrPZbQ==
X-Gm-Message-State: AOAM530iW3PE+E8q0eESisFLjr5QHrli/YrG7qhW0Rx7JVslDmPgZrP8
	CL4YxxxeTe+WwuyJvgCP5OC6f8ah6ukAmsim0gY=
X-Google-Smtp-Source: ABdhPJycB0shTHADkwK932sCK7bZiX3TOot3uEgpGPo0SV99J2JoqHonsWdI12bU5iJJB0wy09Fbtw0GIL1wM7SsBC8=
X-Received: by 2002:a25:59d7:: with SMTP id n206mr58700428ybb.426.1641399962622;
 Wed, 05 Jan 2022 08:26:02 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com> <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
 <f13f983f-9190-99d4-7a6d-c73be651896d@suse.com>
In-Reply-To: <f13f983f-9190-99d4-7a6d-c73be651896d@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 5 Jan 2022 11:25:26 -0500
X-Gmail-Original-Message-ID: <CABfawhnNv+KpSm+ZGaRFvkNrooU0_E0TEijs0_WBNtrZ0-y1Jg@mail.gmail.com>
Message-ID: <CABfawhnNv+KpSm+ZGaRFvkNrooU0_E0TEijs0_WBNtrZ0-y1Jg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change()
 should honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Jan 5, 2022 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.01.2022 18:48, Tamas K Lengyel wrote:
> >> I may be entirely wrong and hence that part of the change may also be
> >> wrong, but I'm having trouble seeing why the original
> >> "!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
> >> goal there to pre-fill entries that were previously invalid, instead of
> >> undoing prior intentional divergence from the host P2M? (I have
> >> intentionally not reflected this aspect in the description yet; I can't
> >> really write a description of this without understanding what's going on
> >> in case the original code was correct.)
> >
> > This function only gets called from p2m-ept when the hostp2m gets an
> > update. In that case this check goes through all altp2m's to see if
> > any of them has an entry for what just got changed in the host, and
> > overwrites the altp2m with that from the host. If there is no entry in
> > the altp2m it doesn't pre-populate. That should only happen if the
> > altp2m actually needs it and runs into a pagefault. So it is correct
> > as-is, albeit being a subtle (and undocumented) behavior of the
> > hostp2m and its effect on the altp2m's. But that's why we never
> > actually make any changes on the hostp2m, we always create an altp2m
> > and apply changes (mem_access/remapping) there.
>
> Thanks for the explanation. Effectively this means that the call to
> get_gfn_type_access() can simply be get_gfn_query(). For the patch
> this means that I shouldn't check its return value and also continue
> to pass the new order rather than the minimum of the two (as was the
> case before), as all we're after is the locking of the GFN. It would
> be nice if you could confirm this before I submit a non-RFC v3.

I'm a little lost here.

>
> What I still don't understand is why the function blindly replaces
> any possible entry in the altp2m, i.e. any possible override
> mapping, not even taking into account the original p2m_access_t.

I think the idea was that any changes to the hostp2m will just get
reflected in the altp2m's as a short-cut. If you have many custom
settings in different altp2ms, simply setting the entry in the hostp2m
will ensure all altp2m's get synced to that same setting instead of
having to do a hypercall for each altp2m. I don't see much use of it
otherwise and if we wanted to switch it to leave the altp2m entries
as-is I wouldn't object.

Tamas

