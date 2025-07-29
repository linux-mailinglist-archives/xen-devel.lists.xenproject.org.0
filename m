Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E1B154B9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063152.1428946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugs1E-0002i6-TK; Tue, 29 Jul 2025 21:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063152.1428946; Tue, 29 Jul 2025 21:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugs1E-0002fs-QQ; Tue, 29 Jul 2025 21:37:56 +0000
Received: by outflank-mailman (input) for mailman id 1063152;
 Tue, 29 Jul 2025 21:37:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqJK=2K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ugs1D-0002fg-1U
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:37:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4806d43e-6cc4-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:37:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAB344412F;
 Tue, 29 Jul 2025 21:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FACC4CEEF;
 Tue, 29 Jul 2025 21:37:41 +0000 (UTC)
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
X-Inumbo-ID: 4806d43e-6cc4-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753825071;
	bh=o2mCk7BR44gDN8Z8plzQOeSgPYOmfUuCZwC4kZWMzuI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ftutpynFSSBtZte8HEGIo34pqDTURs6Q8NJDsm+neRKJmYaLEIpu8DtJbmmpt29Vt
	 j4tjxnq//Kz0DTyUr3evWATQlgdwH7uxHLYU9M356FIkQtN3W8hGDZ3R4PLkGEjCv1
	 39RJE8KgXTEhSZNDKgCEhwgeRyusUgCkHxUTbTI+stcjLiqmM0GJTJoD1dcsiPlKxa
	 1z5fOJediDc+pXCu9Ci/rVFGZcXfHiCB464LyGhwk2iXZZCc2hjayIeXjGyVNa1m2h
	 xZkN9FTk6kPgmGxX+xsExSJVCYgiWEtgjBKiPh0GIkVF7oXrbZOcrZaTKYJBjWb5u9
	 q6rthX8FbydUg==
Date: Tue, 29 Jul 2025 14:37:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 1/3] misra: address 5.5 pirq_cleanup_check
In-Reply-To: <d96a1ee4-d1da-40b4-8d21-8ce38957f082@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2507291437120.468590@ubuntu-linux-20-04-desktop>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com> <94a49589ab85c8988979f8cfd29c9124d1dedf42.1753822074.git.dmytro_prokopchuk1@epam.com> <d96a1ee4-d1da-40b4-8d21-8ce38957f082@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-608164561-1753825070=:468590"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-608164561-1753825070=:468590
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 29 Jul 2025, Andrew Cooper wrote:
> On 29/07/2025 10:24 pm, Dmytro Prokopchuk1 wrote:
> > diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> > index c8c1bfa615..2efb5f5c78 100644
> > --- a/xen/common/event_channel.c
> > +++ b/xen/common/event_channel.c
> > @@ -672,7 +672,7 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
> >      if ( rc != 0 )
> >      {
> >          info->evtchn = 0;
> > -        pirq_cleanup_check(info, d);
> > +        PIRQ_CLEANUP_CHECK(info, d);
> 
> Well, this is awkward.  This is dead code, but only when you realise ...
> 
> > diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> > index 95034c0d6b..958d0b1aca 100644
> > --- a/xen/include/xen/irq.h
> > +++ b/xen/include/xen/irq.h
> > @@ -185,7 +185,7 @@ extern struct pirq *pirq_get_info(struct domain *d, int pirq);
> >  
> >  void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
> >  
> > -#define pirq_cleanup_check(pirq, d) \
> > +#define PIRQ_CLEANUP_CHECK(pirq, d) \
> >      (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
> >  
> 
> ... what this is really doing.
> 
> Looking at this overall diff, it really is outrageous that we're hiding
> a conditional call like this.
> 
> We should just remove the macro, and expand
> 
>     if ( !pirq->evtchn )
>         pirq_cleanup_check(pirq, d);
> 
> in most of the callsites.  The overall diff will be smaller (no need to
> change the comments), and the end result is proper regular normal C.
 
Yes, would look much better. +1 from me.
--8323329-608164561-1753825070=:468590--

