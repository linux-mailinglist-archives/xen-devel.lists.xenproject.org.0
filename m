Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BF84E301
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 15:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678252.1055344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY5Gl-00056P-Ey; Thu, 08 Feb 2024 14:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678252.1055344; Thu, 08 Feb 2024 14:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY5Gl-00053C-Bu; Thu, 08 Feb 2024 14:20:51 +0000
Received: by outflank-mailman (input) for mailman id 678252;
 Thu, 08 Feb 2024 14:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ajo=JR=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rY5Gj-000536-Qw
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 14:20:49 +0000
Received: from sender3-op-o17.zoho.com (sender3-op-o17.zoho.com
 [136.143.184.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4001a791-c68d-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 15:20:47 +0100 (CET)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182]) by mx.zohomail.com
 with SMTPS id 1707402043602976.6873532347577;
 Thu, 8 Feb 2024 06:20:43 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-60491b1fdeaso19566497b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 06:20:43 -0800 (PST)
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
X-Inumbo-ID: 4001a791-c68d-11ee-8a4a-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; t=1707402045; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=erM+YJ+oErLz1jNKp9+2tLdezaW6rMeY2qT5KKWstrvztH4QTQLpT8+x+/eyuRQAeAvm9PDU6AXDJZ1neUiNFYyFlNLe7RrppGP3TaVx3stcGWu4AfhvEUolDtCaIGE58tYcbCn4ls3vik8tjTKJhlPsTC//0V5owQudYxriM8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1707402045; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wH+tUFLsw/E6eFvRCsiAGUx0r/1n1jC6F6nrBzmppjw=; 
	b=J9hCL+1ft5Jj/81uYp0xdbbf7XI7lD/EYRixMIiPMXA+qXxWqTSULPb9SVG1FHWJWMesg9dvJP6Z0bHkiAqVQallz2IpKr/hwDjlPUTDLyfHx572m4OK+NVkM2rFMt/to2Igo8nTSBuaiP2t3GsK5g6ltR1xPr/TjStOqNcvXNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707402045;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wH+tUFLsw/E6eFvRCsiAGUx0r/1n1jC6F6nrBzmppjw=;
	b=AIVdhcoZMerD4D6lqqpCtfuUXWmZh4keWUJaynvcraYbrwod2ZA57iwewvLy8Joz
	HEUQ5Wvi8GztvNF5zSyaYQ4ivuZf14FmqXujk/RvyA+LfBGjSiHj5hAtrJL6ssruVEA
	/Kq8c6Y4KyooHIIAUFpZJgV426cjEVpLuW6EWOT4=
X-Gm-Message-State: AOJu0YwhLq8dVyE4rxutVvRt5Bu0lma8biLEJI6dJiMZjP9Ccv1xj551
	Q0VdZVVEtKzMSGWBCzgxUK20HgclrRQearSa6Ve2TGKJTe2St14MOfq75HO+KB7lLrpxEejEmZr
	xL9jJ6aZSAnWyOytdmPf/60CfRHE=
X-Google-Smtp-Source: AGHT+IFceimg/GjYkEUIUG53o1KeeQn4Mexb/J/g3sLk6W3oX0ZW/RiFta/u/oAk9iluY5p0qczTtxrWAvRabiFMXcA=
X-Received: by 2002:a05:6902:220f:b0:dc6:d2d9:308c with SMTP id
 dm15-20020a056902220f00b00dc6d2d9308cmr8969559ybb.36.1707402042697; Thu, 08
 Feb 2024 06:20:42 -0800 (PST)
MIME-Version: 1.0
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
 <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com> <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
 <CA+zSX=Zou19sjb8ToLTaMjLHLYmqptsMXCT50Y9MwGykOaTrZQ@mail.gmail.com>
 <156f2693-e178-4553-b4b4-f671b0221dfc@suse.com> <CABfawhmYaGCLN2rsi4y+-CJs-AA+01YLEZdbkGvUi3t0MM42=A@mail.gmail.com>
 <6e818fdc-defe-41dd-a931-f5abc7ffce6b@suse.com>
In-Reply-To: <6e818fdc-defe-41dd-a931-f5abc7ffce6b@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 8 Feb 2024 09:20:07 -0500
X-Gmail-Original-Message-ID: <CABfawhmCr7B47HJyWrdZC13J3muA19AOtRK1a6Fmz5kvQ6FdYQ@mail.gmail.com>
Message-ID: <CABfawhmCr7B47HJyWrdZC13J3muA19AOtRK1a6Fmz5kvQ6FdYQ@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@cloud.com>, =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 9:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.02.2024 14:45, Tamas K Lengyel wrote:
> > On Thu, Feb 8, 2024 at 2:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 08.02.2024 05:32, George Dunlap wrote:
> >>> Er, ok, just one more comment: this could allow an altp2m to have mor=
e
> >>> permissions than the host; for example, the host p2m entry could be
> >>> p2m_access_r, but if the altp2m's default_access were p2m_access_rw,
> >>> it would override that.  Is that the behavior we want?  Or do we want
> >>> to do some sort of intersection of permissions?
> >>>
> >>> If the former, I'd propose the comment be adjusted thus:
> >
> > No intersection of permissions please, that needlessly complicates
> > things and makes it hard to reason about the state of a view where
> > default permissions are used. No need to force a specific type of
> > usecase here where the hostp2m's permissions are special just cause we
> > say so. No, the permissions in the hostp2m should not have more weight
> > then the specifically requested default permission.
> >
> >>>
> >>>  * If the entry is invalid, and the host entry was valid, propagate
> >>>  * the host's entry to the altp2m, retaining page order but using the
> >>>  * altp2m's default_access, and indicate that the caller should re-tr=
y
> >>>  * the faulting instruction.
> >>
> >> I find it highly questionable that such blind overriding should be tak=
ing
> >> place.
> >
> > It's not blind overriding, it's the requested default permission set
> > for a view where no entry was present before. It is the expected
> > behavior. It would be way harder to design applications with this
> > feature if it was special cased and it would take different
> > permissions based on what permission is set in another view.
>
> But the default can be only one specific value: How do you make sure that
> R/O, R/X, and R/W mappings all retain their respective restrictions in th=
e
> alternative view? To not over-restrict permissions, the default would the=
n
> need to be RWX, yet then all mappings will have full permission. What am =
I
> missing?

Why do you assume you need to retain the permissions that were set in
the hostp2m across all altp2ms? It is entirely reasonable to set
permissions for a couple entries manually in an altp2m and set the
default to _n, which may be totally different then what the hostp2m
has. When you get the event for entries you didn't manually specify
you can decide which view to switch to, which may be the hostp2m, but
may be some other view.

If you wanted to have a view with a default permission that inherits
permissions that are always at least as restrictive as the hostp2m,
you could do that, but the way to do that would be to introduce a
special mem_access permission to signify that that's the expected
behavior (similar to permissions like n2rwx). I don't think anyone is
asking for that.

Tamas

