Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A78A71E5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 19:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707064.1104549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwmDt-0001kK-0l; Tue, 16 Apr 2024 17:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707064.1104549; Tue, 16 Apr 2024 17:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwmDs-0001iP-Tx; Tue, 16 Apr 2024 17:03:56 +0000
Received: by outflank-mailman (input) for mailman id 707064;
 Tue, 16 Apr 2024 17:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h3dN=LV=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rwmDs-0001iJ-3h
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 17:03:56 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c53a9ae-fc13-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 19:03:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1713287027755943.4546068033253;
 Tue, 16 Apr 2024 10:03:47 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc6d8bd612dso4696904276.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 10:03:47 -0700 (PDT)
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
X-Inumbo-ID: 4c53a9ae-fc13-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1713287029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W2/fh3WAHpzvisyJ1bKbJLyJDlMtM20FfdPzvfFXPpoGZ6Fwqt3dKzIyXJlvJDcXxWHVRCpM+8ccgJ1St6iHCwCZrxOC2LdCzXhyVhx16/iSUufn+7mWYBe+NsWRnWDbH9GCXh42JwiRTvJjrmZ9rJlQ0bVXTcZajaFoSzTQFrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713287029; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Go4dEzn1Ajd6exfmxX0SEKoPMjpljLqVLm4QQhwmFo=; 
	b=hpqusrcBgLLa12+sNbobk+SUSjTafDWaTofbaLdi8KeE8yX4Uk+oueA44tiLtaKYNTgwLzf71X7YxpOlQKnuId6fUqP10zMy6TCJSWGXI3yAqJp74KWiC8I4BfAEXs+107rj4unJRYDdb1p1UUWCtHaum1x9XCtB/UVeVMyDshw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713287029;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7Go4dEzn1Ajd6exfmxX0SEKoPMjpljLqVLm4QQhwmFo=;
	b=fL5sa4d/6CzcUKy0CxOKKI/muIlXhfa9sP/RFYAPeHCzUS4mTjcClqt4hDqTwGw3
	oPKckW5NBhctf1/C8OQi8lvdol11U810dSiYTOBswKjQVUXW0O1EM/8gFjDdoVlErax
	l9LJPIMqSI+d0BYHIMcqWF4cGtKPnbz+KHfGkZ2k=
X-Forwarded-Encrypted: i=1; AJvYcCV3ysiqL6zKDg4+Tm7lWTbeGJxdbOs56FInfCNtCRClAK3vGMCmjf6xsQd+DlmO/KRGM8VExk2A1v+9abocj8/1fnIOHid497aml1V/JAo=
X-Gm-Message-State: AOJu0YxOYggr46n+IDrtAbip72TpL8epiVudlLL1C7EqVcyumj4qkwib
	4tP8N2uaJu4EGQVl5uQvY6Ug1IT2KyChgZ6C86ds6IumVhISXdFQhQvDEtPU88J1zfmKfFDXn4I
	NjDJ9DHKcESAAh51t3mcOvNNp20A=
X-Google-Smtp-Source: AGHT+IFkgvCQJX0/JJjGkjUzRT4x+YettGAbi6GzL6aXS+uv0aQC9A2q1/I9kBzFwcQeUlVCl5bTU25hfPmf0UpeZOs=
X-Received: by 2002:a25:d84a:0:b0:dcc:8c7d:970d with SMTP id
 p71-20020a25d84a000000b00dcc8c7d970dmr12973690ybg.47.1713287026638; Tue, 16
 Apr 2024 10:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240416063121.3469245-1-Sergiy_Kibrik@epam.com> <26950422-3476-4679-8636-405272c279dc@citrix.com>
In-Reply-To: <26950422-3476-4679-8636-405272c279dc@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Apr 2024 10:03:09 -0700
X-Gmail-Original-Message-ID: <CABfawhnOwWLNe4PPFfdjXViCbUi=gfVZBQs9GH0WcMbDgn5Bfw@mail.gmail.com>
Message-ID: <CABfawhnOwWLNe4PPFfdjXViCbUi=gfVZBQs9GH0WcMbDgn5Bfw@mail.gmail.com>
Subject: Re: [XEN PATCH v1 06/15] x86/p2m: guard altp2m code with CONFIG_VMX option
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 3:29=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 16/04/2024 7:31 am, Sergiy Kibrik wrote:
> > Instead of using generic CONFIG_HVM option switch to a bit more specifi=
c
> > CONFIG_VMX option for altp2m support, as it depends on VMX. Also guard
> > altp2m routines, so that it can be disabled completely in the build.
> >
> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>
> Altp2m is not VMX-specific.  It's just no-one has wired it up on AMD, or
> accepted the long-outstanding ARM patchset where it was made to work.
>
> If you want to compile it, you probably want CONFIG_ALTP2M.
>
> However, it's not even x86 specific.  See the uses in common/monitor.c

As Andrew said, it is not VMX specific so shouldn't be tied to that.
Adding a CONFIG_ALTP2M would be OK.

Tamas

