Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF008B7BF2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 17:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715023.1116457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1paq-0008C4-8m; Tue, 30 Apr 2024 15:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715023.1116457; Tue, 30 Apr 2024 15:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1paq-0008AX-68; Tue, 30 Apr 2024 15:40:32 +0000
Received: by outflank-mailman (input) for mailman id 715023;
 Tue, 30 Apr 2024 15:40:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zuuf=MD=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s1pap-0008AP-4C
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 15:40:31 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8dfccc2-0707-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 17:40:30 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3c75075ad30so3751201b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 08:40:30 -0700 (PDT)
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
X-Inumbo-ID: f8dfccc2-0707-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714491629; x=1715096429; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrxrbfoyLWJ60uVnMeCrMi9y/QkqAsK61nC/3ja4Zms=;
        b=WyktO/ZT+ieO+C3PuiOVkFFxedGh7ua4VIGSieEpQJ4aJD9E7LLK4lVwQHrrVuzDaL
         sElBl0KWb06SApMol1Q+gj9o39vL0Ri38B4K1nvfbn4wmDz/X1K3NIaeClxutfuoTCaQ
         tqLntKPuf76dQjeIAJl7XTQSVtJqfyVFj2ZmxlrYABOGTHMnpvleZxu9pyXnkYyq4Z9H
         vHnrznJDegXpprFTI27zANvf3c3f62aeFhDTHZxBFwbRmCILwV3N8DBFfLzS4GpoU2kf
         ffkTP2bhKi6GtlvQiFAlWdW/L5P8QYCcPypOxKLEfpU//V0895bXeK6ey4lt1JicdaKE
         GE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491629; x=1715096429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrxrbfoyLWJ60uVnMeCrMi9y/QkqAsK61nC/3ja4Zms=;
        b=I3R8oiIQTdXQIU6Qyu8KuN43UbkzT4tUm8Q3PxW6QfOffqdxL+18qWN4AJrGlTo77l
         l2/Wcia8q2tDBNZDgvy/jb/Og7K9L9GaRLST+9Lt4zs7bNuSz1f4HgwEnuuexSBow/L/
         JvWFtV1DyHU1M+npBFe7TIBRhN02xdSjQPzOe2fMyhStBqRKol8izelG2jFmxshXoMCw
         t6C1P4uWG52bCpvL4TAednnOJ0r7LuPMSUHxvopvfWbXQOzWGDo7RSC9Uzw77GQQ0Mqq
         dszaMi11LuIVXe450YXK3sUwQV1GiRtv+thJ1A8qeWV+/6dmAxIKKMm8dSNAE6bhTfej
         x1GA==
X-Forwarded-Encrypted: i=1; AJvYcCUkNg4z55Mevdny3X2z6N/irlBpShJ/iJxgidSZ+fz3Cj2UokpViaPOlLXvdwARK56AU4jCBVCECf14SmgKCqOVxTbxAI0yeIOUAr0e+Cc=
X-Gm-Message-State: AOJu0YzF0M1oiyKOZaWVwZSEkIZrzdSrKpN6rBd53kqdHA22Cc5IY2Zp
	+QA9hT0RlX5x08WhEDYhkI9fhUW+mq7mq9ywhBHkLE3fUCN4k9j0gCeK47snOFM6UKG/zV6BgI1
	yn8qYf6XH1q9g6L2sHxNYoIG0uILT8SOd
X-Google-Smtp-Source: AGHT+IG/mFzDY9+ytW6v6oFkiVEnfagLXUu2uZMkpB4ph26vuy31Oe3a2028Qkh3TASD/m+8TbKj71swFXFk1q14ucI=
X-Received: by 2002:a05:6870:639e:b0:23d:417c:675 with SMTP id
 t30-20020a056870639e00b0023d417c0675mr1207560oap.41.1714491628689; Tue, 30
 Apr 2024 08:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714322424.git.w1benny@gmail.com> <a26bc4aeba89f7895c79df7e320adfc695b16d50.1714322424.git.w1benny@gmail.com>
 <4d9930d4-4379-4440-83b2-14ebffc7c03d@suse.com>
In-Reply-To: <4d9930d4-4379-4440-83b2-14ebffc7c03d@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 30 Apr 2024 17:40:17 +0200
Message-ID: <CAKBKdXgAgb=+Spr_nobWy_zuN-yXTUfAL+Q3MdLDCDVgshOS7Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] x86/hap: Increase the number of initial
 mempool_size to 1024 pages
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 4:47=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.04.2024 18:52, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > This change anticipates scenarios where `max_altp2m` is set to its maxi=
mum
> > supported value (i.e., 512), ensuring sufficient memory is allocated up=
front
> > to accommodate all altp2m tables without initialization failure.
>
> And guests with fewer or even no altp2m-s still need the same bump? You
> know the number of altp2m-s upon domain creation, so why bump by any more
> than what's strictly needed for that?

I have to admit I've considered computing the value which goes to
hap_set_allocation
by simply adding 256 + max_altp2m, but that felt so arbitrary - the
256 value itself
feels arbitrary, as I haven't found any reasoning for it anywhere.

I have also tried to make code changes to make the initial allocation
size configurable
via libxl (possibly reusing the shadow_memkb) - which seemed to me
like the "correct"
solution, but those changes were more complicated than I had
anticipated and I would
definitely not make it till the 4.19 deadline.

Question is, what to do now? Should I change it to 256 + max_altp2m?

> > The necessity for this increase arises from the current mechanism where=
 altp2m
> > tables are allocated at initialization, requiring one page from the mem=
pool
> > for each altp2m view.
>
> So that's the p2m_alloc_table() out of hap_enable()? If you're permitting
> up to 512 altp2m-s, I think it needs considering to not waste up to 2Mb
> without knowing how many of the altp2m-s are actually going to be used.

Yes and I ultimately agree.

> How complicate on-demand allocation would be I can't tell though, I have
> to admit.

That's also a fix I've been trying to work on - to make whole altp2m alloca=
tions
on-demand. Unfortunately, I didn't make it in time.

> > --- a/tools/tests/paging-mempool/test-paging-mempool.c
> > +++ b/tools/tests/paging-mempool/test-paging-mempool.c
> > @@ -35,7 +35,7 @@ static struct xen_domctl_createdomain create =3D {
> >
> >  static uint64_t default_mempool_size_bytes =3D
> >  #if defined(__x86_64__) || defined(__i386__)
> > -    256 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. *=
/
> > +    1024 << 12; /* Only x86 HAP for now.  x86 Shadow needs more work. =
*/
>
> I also can't derive from the description why we'd need to go from 256 to
> 1024 here and ...

It's explained in the code few lines below:

    /*
     * Check that the domain has the expected default allocation size.  Thi=
s
     * will fail if the logic in Xen is altered without an equivalent
     * adjustment here.
     */

I have verified that the default_mempool_size_bytes must reflect the number
of pages in the initial hap_set_allocation() call.

Is it something I should include in the commit message, too?

> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -468,7 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
> >      if ( old_pages =3D=3D 0 )
> >      {
> >          paging_lock(d);
> > -        rv =3D hap_set_allocation(d, 256, NULL);
> > +        rv =3D hap_set_allocation(d, 1024, NULL);
>
> ... here. You talk of (up to) 512 pages there only.
>
> Also isn't there at least one more place where the tool stack (libxl I
> think) would need changing, where Dom0 ballooning needs are calculated?
> And/or doesn't the pool size have a default calculation in the tool
> stack, too?

I have found places in libxl where the mempool_size is calculated, but
that mempool
size is then set AFTER the domain is created via xc_set_paging_mempool_size=
.

In my opinion it doesn't necessarily require change, since it's
expected by the user
to manually set it via shadow_memkb. The only current problem is (which thi=
s
commit is trying to fix) that setting shadow_memkb doesn't help when
max_altp2m > (256 - 1 + vcpus + MAX_NESTEDP2M), since the initial mempool
size is hardcoded.

I didn't find any other places that would require reflecting the
current "256" value.

P.

