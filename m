Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ABA92972A
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jul 2024 10:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754872.1163170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQNX2-0004p1-FY; Sun, 07 Jul 2024 08:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754872.1163170; Sun, 07 Jul 2024 08:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQNX2-0004mW-CO; Sun, 07 Jul 2024 08:46:04 +0000
Received: by outflank-mailman (input) for mailman id 754872;
 Sun, 07 Jul 2024 08:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rRf=OH=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1sQNX0-0004mQ-JG
 for xen-devel@lists.xenproject.org; Sun, 07 Jul 2024 08:46:02 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5572eb2a-3c3d-11ef-8776-851b0ebba9a2;
 Sun, 07 Jul 2024 10:45:59 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58b966b41fbso3737669a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jul 2024 01:45:59 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77df7949fasm139779566b.32.2024.07.07.01.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 01:45:58 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 337BE5F8E9;
 Sun,  7 Jul 2024 09:45:57 +0100 (BST)
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
X-Inumbo-ID: 5572eb2a-3c3d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720341959; x=1720946759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEYHd1sh+EjPz8zS4wuHhYUp/x5fvS6WFSYzRfKIK4Y=;
        b=orohLGhZO10iyL/uBR760Z3bLwCvHKHoTyDQiq90Dv3eL9SqIdFgH954HXXKsdUwvn
         bDYOYwJZSQAhLGW8TK73I5T05dQ5n8e8iaNJhBt1MKJR+86DaOqYIa34XdM5Dkn2/ABq
         JvnUnfIXNbL+sqw5O/kdt2/qHj37WkClo5bai80naTWoWFURN76sJyDi9zvlEcuKknJL
         G01MzYiuZe7ck5nXk/eBNz+HlVtsW+WuhEQitjbAMyA2rtLbhyCCKe3QVAYG4n/YkLqn
         t4VlshGxmqu5EOHIIacyLsOLLt8Qr0Ru2fEmOqjDcaJre4+3bt1R1N2Ie4eX7Ug8VlP1
         oRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720341959; x=1720946759;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEYHd1sh+EjPz8zS4wuHhYUp/x5fvS6WFSYzRfKIK4Y=;
        b=txNaGu/nBoIrOVzYxYadw47bnb27nzMzAXQsHSbxAiPGg0XEUoKObf2d3HIA2BKRsH
         jgTGMPL5G/x1Dx5nSYgOVBNdGEckpFuUO3uzuzLm+uuzFosJp1in9jaDqv8/C4tyNOCl
         u3RHnwqAJTO4/ESI46k+HfhXVi2Y8bXvayyy5VnJtsaz6FRUOTMxsbOuvUhZUQ+4mkCu
         IAZHEVpiM3FhSyhsxtTCS5juFFun/tvU9tua60wqVLlXvQmblTaWMkAEumfFOV93uvjR
         /zqblwfiwk8juzUy2GdFutmjSCOr/Xh9nDPFmuABcfJvIzQEeDCLoOKYYDBLi502Uhja
         ldAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoTtjNN1uZ2q2gUjhAdCPSPcBxT61ZZNZSDHNdTQ2WCyblecoAZgBtRna4hjp75BQcLIG5dCzOTVb9KLzmgxJjhfh4TdG4SiVKnAlkWWQ=
X-Gm-Message-State: AOJu0Yyqu3B/pGM3EAaKYiL2o8dxvYusCqCEtrqxj/K7NmK227jAcKRx
	N09XF2C8/7sMNSdmNjYc9oh29ClTUt0XCffLXASCThst4Ftkyq9pTRfEDtLxVMQ=
X-Google-Smtp-Source: AGHT+IEqTxgIjYAHeGxiTC62iXRay9Io+j73bhmKVTdLgG9WgBBopxUNhDuGb0w9phOZilXybXRtCA==
X-Received: by 2002:a17:906:ae47:b0:a72:6fc3:9946 with SMTP id a640c23a62f3a-a77ba4604d6mr535188166b.16.1720341958831;
        Sun, 07 Jul 2024 01:45:58 -0700 (PDT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@amd.com>,  Anthony PERARD
 <anthony.perard@vates.tech>,  qemu-devel@nongnu.org,
  sstabellini@kernel.org,  paul@xen.org,  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/2] xen: mapcache: Fix unmapping of first entries in
 buckets
In-Reply-To: <CAJy5ezrfbAzwPWg_YABLy5NwCUiNa31FFR1nAZzy-WC3vXrMhg@mail.gmail.com>
	(Edgar E. Iglesias's message of "Sat, 6 Jul 2024 09:27:43 +0300")
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
	<20240701224421.1432654-3-edgar.iglesias@gmail.com>
	<ZoawbAnukIBkYWCw@l14> <87wmm1m7i3.fsf@draig.linaro.org>
	<ZobuhcLHqUEy_bQs@toto>
	<CAJy5ezrfbAzwPWg_YABLy5NwCUiNa31FFR1nAZzy-WC3vXrMhg@mail.gmail.com>
Date: Sun, 07 Jul 2024 09:45:57 +0100
Message-ID: <87jzhxd1yy.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Edgar E. Iglesias" <edgar.iglesias@gmail.com> writes:

> On Thu, Jul 4, 2024 at 9:48=E2=80=AFPM Edgar E. Iglesias <edgar.iglesias@=
amd.com> wrote:
>
>  On Thu, Jul 04, 2024 at 05:44:52PM +0100, Alex Benn=C3=A9e wrote:
>  > Anthony PERARD <anthony.perard@vates.tech> writes:
>  >=20
>  > > On Tue, Jul 02, 2024 at 12:44:21AM +0200, Edgar E. Iglesias wrote:
>  > >> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>  > >>=20
>  > >> This fixes the clobbering of the entry->next pointer when
>  > >> unmapping the first entry in a bucket of a mapcache.
>  > >>=20
>  > >> Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
>  > >> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
>  > >> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>  > >> ---
>  > >>  hw/xen/xen-mapcache.c | 12 +++++++++++-
>  > >>  1 file changed, 11 insertions(+), 1 deletion(-)
>  > >>=20
>  > >> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
>  > >> index 5f23b0adbe..18ba7b1d8f 100644
>  > >> --- a/hw/xen/xen-mapcache.c
>  > >> +++ b/hw/xen/xen-mapcache.c
>  > >> @@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unl=
ocked(MapCache *mc,
>  > >>          pentry->next =3D entry->next;
>  > >>          g_free(entry);
>  > >>      } else {
>  > >> -        memset(entry, 0, sizeof *entry);
>  > >> +        /*
>  > >> +         * Invalidate mapping but keep entry->next pointing to the=
 rest
>  > >> +         * of the list.
>  > >> +         *
>  > >> +         * Note that lock is already zero here, otherwise we don't=
 unmap.
>  > >> +         */
>  > >> +        entry->paddr_index =3D 0;
>  > >> +        entry->vaddr_base =3D NULL;
>  > >> +        entry->valid_mapping =3D NULL;
>  > >> +        entry->flags =3D 0;
>  > >> +        entry->size =3D 0;
>  > >
>  > > This kind of feels like mc->entry should be an array of pointer rath=
er
>  > > than an array of MapCacheEntry but that seems to work well enough and
>  > > not the first time entries are been cleared like that.
>  >=20
>  > The use of a hand rolled list is a bit of a concern considering QEMU a=
nd
>  > Glib both provide various abstractions used around the rest of the code
>  > base. The original patch that introduces the mapcache doesn't tell me
>  > much about access patterns for the cache, just that it is trying to
>  > solve memory exhaustion issues with lots of dynamic small mappings.
>  >=20
>  > Maybe a simpler structure is desirable?
>  >=20
>  > We also have an interval tree implementation ("qemu/interval-tree.h") =
if
>  > what we really want is a sorted tree of memory that can be iterated
>  > locklessly.
>  >=20
>
>  Yes, it would be interesting to benchmark other options.
>  I agree that we should at minimum reuse existing lists/hash tables.
>
>  We've also had some discussions around removing it partially or alltoget=
her but
>  there are some concerns around that. We're going to need something to
>  keep track of grants. For 32-bit hosts, it's a problem to exhaust virtual
>  address-space if mapping all of the guest (are folks still using 32-bit =
hosts?).
>  There may be other issues aswell.
>
>  Some benefits are that we'll remove some of the complexity and latency f=
or mapping
>  and unmapping stuff continously.
>
> One more thing I forgot to add is that IMO, these larger longer term
> changes should not block this tiny bugfix...

Agreed.

>
> Cheers,
> Edgar=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

