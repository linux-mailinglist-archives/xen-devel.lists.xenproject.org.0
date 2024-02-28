Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C73C86B089
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686622.1068848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfK9P-0004k4-0x; Wed, 28 Feb 2024 13:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686622.1068848; Wed, 28 Feb 2024 13:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfK9O-0004iS-Td; Wed, 28 Feb 2024 13:39:10 +0000
Received: by outflank-mailman (input) for mailman id 686622;
 Wed, 28 Feb 2024 13:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Darz=KF=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rfK9N-0004h0-4y
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:39:09 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd585abe-d63e-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 14:39:06 +0100 (CET)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178]) by mx.zohomail.com
 with SMTPS id 1709127540597642.1284075319935;
 Wed, 28 Feb 2024 05:39:00 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc6d9a8815fso5471275276.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:39:00 -0800 (PST)
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
X-Inumbo-ID: bd585abe-d63e-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; t=1709127542; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LRyqE3j19UwntIfaJ0HJtX/y9o9/XX4vm0GOuH/jnMgSp+V2WpvcX4NpOqFDZ5AVZR4T5hFPmJAy7Xx+sS/rJTkJeLp8ljTiwVPnUpN0Zf428NU1ikNiYfWkesv0rpOZcifPZA14bXQ5P0FvuHqaLOEQJEhadBEqAMccj2wYWN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1709127542; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=60avIusnchtcXE++c0JOpCawy+/7NK5IEamagVfQABI=; 
	b=fWBnqHRsOOxuf9STGEkr4WqxyVAsvb5sjftd2jnO9HNpjQwS40lHZVkOJ4FhcnF3ALOIaJjCzNNGblTsAqveK/gM2k0iacA+00IDejzkhmoj32XoCmVqza0NEQfrGJlGj+bewycFl/ay4dUrV6TXI4DweZJkQR5dSFf+IBfCGpk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1709127542;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=60avIusnchtcXE++c0JOpCawy+/7NK5IEamagVfQABI=;
	b=O5a/xxDkSbJO1DdruZjFXBNTTSqpN+YyO4WdrY/wdysa8zqifamfssGKDSLD86sM
	VnsXuwTEt//UEkUk5Af/4EJzQBN9qMYulD5lw+mxRLj1oKfzZ5dtypJbOE+qUXHB5Qm
	vHgD+M3HxfraFtykVSXaqymNyFPxSog2/t1UIiJs=
X-Forwarded-Encrypted: i=1; AJvYcCW63K9G9FwKWpIex+ZmKoX0JbaIZB/20mXSnqb/Ww6oYqpxGBbH3h0jRoBoVYZbJyEIj7YSNxrryv5g02MK2a45lq7fo7PsUN9OFwXW6mM=
X-Gm-Message-State: AOJu0YzlnaAeZIiO2VNE+eiTk3+gCZFiZc8z+9sPHa0cA5dc9QcRT9J6
	QmlsYP1Maj9qMRID3HDmIt6GgdiVniJX86A5dV8gcj4j3X3MedexkNNb5cEjfAgibd6Oq4CPCIL
	qSgpuDDDHAr8RW2jlcnhtqTX+JCI=
X-Google-Smtp-Source: AGHT+IHKWmkwUHqD2Slm7SyWIP+2fb3JCb6sAGlxQhpm3o3Ec5tJkSmXIjZ7DFZSzGZsvxBpRagGlBYz7zbpW02wXtY=
X-Received: by 2002:a5b:54a:0:b0:dcf:30dc:127c with SMTP id
 r10-20020a5b054a000000b00dcf30dc127cmr2543195ybp.18.1709127539658; Wed, 28
 Feb 2024 05:38:59 -0800 (PST)
MIME-Version: 1.0
References: <20240222090530.62530-1-roger.pau@citrix.com> <20240222090530.62530-2-roger.pau@citrix.com>
 <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com> <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
 <2f68276d-0b10-4cec-8636-5456314c194e@suse.com> <Zd8QtCwp75Phjluc@macbook>
 <de7c8de8-2373-4d78-8aec-c633bb253660@suse.com> <Zd80-IGn13aThDaQ@macbook>
In-Reply-To: <Zd80-IGn13aThDaQ@macbook>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 28 Feb 2024 08:38:23 -0500
X-Gmail-Original-Message-ID: <CABfawhnhT2ppikq9E9xVUgrXw6+DgmYTfBTRBi8b3-i4ZNRG=w@mail.gmail.com>
Message-ID: <CABfawhnhT2ppikq9E9xVUgrXw6+DgmYTfBTRBi8b3-i4ZNRG=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 8:28=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Wed, Feb 28, 2024 at 12:18:31PM +0100, Jan Beulich wrote:
> > On 28.02.2024 11:53, Roger Pau Monn=C3=A9 wrote:
> > > On Fri, Feb 23, 2024 at 08:43:24AM +0100, Jan Beulich wrote:
> > >> On 22.02.2024 19:03, Tamas K Lengyel wrote:
> > >>> On Thu, Feb 22, 2024 at 5:06=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> > >>>> On 22.02.2024 10:05, Roger Pau Monne wrote:
> > >>>>> The usage of a cmpxchg loop in get_next_handle() is unnecessary, =
as the same
> > >>>>> can be achieved with an atomic increment, which is both simpler t=
o read, and
> > >>>>> avoid any need for a loop.
> > >>>>>
> > >>>>> The cmpxchg usage is likely a remnant of 32bit support, which did=
n't have an
> > >>>>> instruction to do an atomic 64bit add, and instead a cmpxchg had =
to be used.
> > >>>>>
> > >>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > >>>>> Signed-of-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > >>>>
> > >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > >>>> albeit ...
> > >>>>
> > >>>>> --- a/xen/arch/x86/mm/mem_sharing.c
> > >>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
> > >>>>> @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct p=
age_info *pg)
> > >>>>>
> > >>>>>  static shr_handle_t get_next_handle(void)
> > >>>>>  {
> > >>>>> -    /* Get the next handle get_page style */
> > >>>>> -    uint64_t x, y =3D next_handle;
> > >>>>> -    do {
> > >>>>> -        x =3D y;
> > >>>>> -    }
> > >>>>> -    while ( (y =3D cmpxchg(&next_handle, x, x + 1)) !=3D x );
> > >>>>> -    return x + 1;
> > >>>>> +    return arch_fetch_and_add(&next_handle, 1) + 1;
> > >>>>>  }
> > >>>>
> > >>>> ... the adding of 1 here is a little odd when taken together with
> > >>>> next_handle's initializer. Tamas, you've not written that code, bu=
t do
> > >>>> you have any thoughts towards the possible removal of either the
> > >>>> initializer or the adding here? Plus that variable of course could
> > >>>> very well do with moving into this function.
> > >>>
> > >>> I have to say I find the existing logic here hard to parse but by t=
he
> > >>> looks I don't think we need the + 1 once we switch to
> > >>> arch_fetch_and_add. Also could go without initializing next_handle =
to
> > >>> 1. Moving it into the function would not really accomplish anything
> > >>> other than style AFAICT?
> > >>
> > >> Well, limiting scope of things can be viewed as purely style, but I
> > >> think it's more than that: It makes intentions more clear and reduce=
s
> > >> the chance of abuse (deliberate or unintentional).
> > >
> > > I'm afraid that whatever is the outcome here, I will defer it to a
> > > further commit, since the purpose here is to be a non-functional
> > > change.
> >
> > That's fine with me, but an ack from Tamas is still pending, unless I
> > missed something somewhere.
>
> No, just wanted to clarify that I wasn't expecting to do further
> changes here, FTAOD.  Not sure if Tamas was expecting me to further
> adjust the code.

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

