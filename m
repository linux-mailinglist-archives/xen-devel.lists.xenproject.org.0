Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FB84E233
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 14:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678203.1055289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY4in-0004sp-Lx; Thu, 08 Feb 2024 13:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678203.1055289; Thu, 08 Feb 2024 13:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY4in-0004qV-JJ; Thu, 08 Feb 2024 13:45:45 +0000
Received: by outflank-mailman (input) for mailman id 678203;
 Thu, 08 Feb 2024 13:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ajo=JR=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rY4im-0004qP-7l
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 13:45:44 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a99e84-c688-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 14:45:41 +0100 (CET)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177]) by mx.zohomail.com
 with SMTPS id 170739993763192.12847165744085;
 Thu, 8 Feb 2024 05:45:37 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-604a3d33c4dso8941557b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 05:45:37 -0800 (PST)
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
X-Inumbo-ID: 58a99e84-c688-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1707399938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MZNOKKcfMuEihrKl9ms5pooZutHgMwlw6Tm5BWMknV2HSqL/Rr6g6TtekqFTHcPNo89kyStwYcPLvTK2/+474fkVZyqnfS+pFcJFqlxO6t+oTmecp68FXR/uGOvRWWxzPepb0YygPKI8ryzmZH8Ntu7h6LVgG0BOUbyNF+/HZsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1707399938; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tjXjQaxzEOyNGIfNc6u0nIFLCWtCu/UY1BqT0L8u9LE=; 
	b=XaVQKg4QQfJ9VBUaiZef3qgDpC6xubuXCldl4keDdybC4UGdT5ZUoGUoiAwH5x99ugxPetT1ub6vhGoXLY55f2+r/YKYsJy2Jx9H+xJPFcoWHztUbXIqiLl9TJf6y7IFMad/gs/WFH7zR1NMqxP7xMTbIU8CQEABmiH0SnUzcBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707399938;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tjXjQaxzEOyNGIfNc6u0nIFLCWtCu/UY1BqT0L8u9LE=;
	b=MO7qqhIMqQ834IceewfKx4FuvZ6bTWyLjY+sfUZKdWAp0/8rFXJtNASR1zGhRgZi
	OEeUcGbkj6GP3rthqHge9MdMpMCy51Mx9u2wIAzxMaqv7r0BBVSCME6M6TJy5I/96tU
	sVVvcFNZxKORFILHIFIBPgpUnSosgWZKyu+ldylQ=
X-Forwarded-Encrypted: i=1; AJvYcCWFJCpnbglG35aW3UjVCZUvGrB5SQ9w/UpW4KXpwzuaByJVPQzI6RK4rmS+vU6QVIW1dRibKc3LJOh7pBxOCYYmUS4G13DOSOkhavBQjes=
X-Gm-Message-State: AOJu0YzLWVqXfd3MBuCWvw2S6KcUq/roX0PDAeNTPUEDYsp7q+NHazEK
	xqazl/f9cBtELFRDoLvx58cbc13X5dQyjZXjudpzBHTaKioFGq1/6FoYFNUI/YH1Ezyfa+kGfoF
	TZESzTVlnI9Z5t8lXirJ8/KFeA+c=
X-Google-Smtp-Source: AGHT+IGKwratiCXm/VVOg3+QguJ2fjWe+3MCJq+zct0YYRBxrQqTLCOxgjFMCaiZEV4n3asLC4w27OG1MaI2yH4WFcA=
X-Received: by 2002:a81:cf04:0:b0:604:4b89:bf4 with SMTP id
 u4-20020a81cf04000000b006044b890bf4mr8187743ywi.20.1707399936709; Thu, 08 Feb
 2024 05:45:36 -0800 (PST)
MIME-Version: 1.0
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
 <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com> <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
 <CA+zSX=Zou19sjb8ToLTaMjLHLYmqptsMXCT50Y9MwGykOaTrZQ@mail.gmail.com> <156f2693-e178-4553-b4b4-f671b0221dfc@suse.com>
In-Reply-To: <156f2693-e178-4553-b4b4-f671b0221dfc@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 8 Feb 2024 08:45:01 -0500
X-Gmail-Original-Message-ID: <CABfawhmYaGCLN2rsi4y+-CJs-AA+01YLEZdbkGvUi3t0MM42=A@mail.gmail.com>
Message-ID: <CABfawhmYaGCLN2rsi4y+-CJs-AA+01YLEZdbkGvUi3t0MM42=A@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@cloud.com>, =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 2:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.02.2024 05:32, George Dunlap wrote:
> > Er, ok, just one more comment: this could allow an altp2m to have more
> > permissions than the host; for example, the host p2m entry could be
> > p2m_access_r, but if the altp2m's default_access were p2m_access_rw,
> > it would override that.  Is that the behavior we want?  Or do we want
> > to do some sort of intersection of permissions?
> >
> > If the former, I'd propose the comment be adjusted thus:

No intersection of permissions please, that needlessly complicates
things and makes it hard to reason about the state of a view where
default permissions are used. No need to force a specific type of
usecase here where the hostp2m's permissions are special just cause we
say so. No, the permissions in the hostp2m should not have more weight
then the specifically requested default permission.

> >
> >  * If the entry is invalid, and the host entry was valid, propagate
> >  * the host's entry to the altp2m, retaining page order but using the
> >  * altp2m's default_access, and indicate that the caller should re-try
> >  * the faulting instruction.
>
> I find it highly questionable that such blind overriding should be taking
> place.

It's not blind overriding, it's the requested default permission set
for a view where no entry was present before. It is the expected
behavior. It would be way harder to design applications with this
feature if it was special cased and it would take different
permissions based on what permission is set in another view.

Tamas

