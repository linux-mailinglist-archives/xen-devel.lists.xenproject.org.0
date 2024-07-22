Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB2939021
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761984.1172070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtR2-0005oe-Pz; Mon, 22 Jul 2024 13:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761984.1172070; Mon, 22 Jul 2024 13:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtR2-0005ih-LZ; Mon, 22 Jul 2024 13:50:40 +0000
Received: by outflank-mailman (input) for mailman id 761984;
 Mon, 22 Jul 2024 13:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVtR1-0005fr-6e
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:50:39 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e88b0e0-4831-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 15:50:36 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721656233591878.2071494759668;
 Mon, 22 Jul 2024 06:50:33 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e087c7ef68bso1478135276.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:50:33 -0700 (PDT)
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
X-Inumbo-ID: 5e88b0e0-4831-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1721656234; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SPrwsLfFdZkmim5/qt9Q67EOHcFY8rXiknz5ShLGZHHidNwQqnce3Aq5783cvUCo9zA4T6BzlKuJLemC/N1afJU0sPrxguafX3Fn1uLYZpUzHmJvWfcCdKSNHXNhJLVlWwdlSVBNDxyGRs6fyar6akHbVuVyNt7ga9V8fUXQrVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721656234; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pOS+nauF4M/zCaaPQbTVSfMIRbttNOeWb1idcvWVq0g=; 
	b=lqT+ycTHge8NJmAUTMMWfHQCOGcc5nVwYDiejQqT1Q+K7EYMTc35brwOZWfVPOoZvbxNxuGUoHriEYhS6rKRd0UhOpLEdobfEJ6MPOU2xqI240s5VVA53DS0AVTlexUYzN6yYxzWyFp6s+s0ED5EOQtaRWBhRCelIyQdZeALHkY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721656234;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pOS+nauF4M/zCaaPQbTVSfMIRbttNOeWb1idcvWVq0g=;
	b=bF4FsI5i+iEyHrvTJHdjdEsk1wMV2IZ6V/kpcDfvawncZQzvQg7YQGgvqJ6JPnpE
	YFWNF1ytgZ77orpHTAtsc8MEB5p6vPKbCJWA8LrbaTtchdz/7PvQyicCVILPkWlIcza
	58dWb72GAEAOmrgEC0u/d+dBAWthuYgAdBQhMQWQ=
X-Forwarded-Encrypted: i=1; AJvYcCUU4OH8zJRVddANHX7VEx3hR2bcBHPX/H9WfRW1WlK9+avqtYDtzXebvk1cvZID4drv2tq2CumToEkuqMx6KuT3fI7fLm0iZv/EhYPACTU=
X-Gm-Message-State: AOJu0YxVa1GSshWdzMyYElXIQrfpwTzVPlNaQdjtHZ7LthAHT5MJq5+x
	HLMo/zbm4O0+6f32x/w1NRWPNDUARwhQj1E8w/eu+bnqVcRfnx9cMFiYzu0BK9/PFSVNBPmTUj5
	W+ooptDpy9Hfa/53Bx0LpQrOISH4=
X-Google-Smtp-Source: AGHT+IEi+1ZiMmHgFKpO6wEHsbtIQtNBBBqn/TpsY3wNvM+L6MQ1LZgXY5WonV+VhXGf1S/Gghq/iaCiIzQdO1mPeJg=
X-Received: by 2002:a05:6902:1109:b0:e03:4efe:df92 with SMTP id
 3f1490d57ef6-e087b9e57camr7236811276.53.1721656232766; Mon, 22 Jul 2024
 06:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240722112752.4981-1-tamas@tklengyel.com> <20240722112752.4981-2-tamas@tklengyel.com>
 <9bd41e19-50f7-43e7-b3ce-c2870a836f79@suse.com>
In-Reply-To: <9bd41e19-50f7-43e7-b3ce-c2870a836f79@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 22 Jul 2024 09:49:56 -0400
X-Gmail-Original-Message-ID: <CABfawhnae-YsFJWKj5qHKFMBA8YRpupoxKw5-D_gZJdV0viR-g@mail.gmail.com>
Message-ID: <CABfawhnae-YsFJWKj5qHKFMBA8YRpupoxKw5-D_gZJdV0viR-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Add tools/fuzz/oss-fuzz/build.sh
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 8:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.07.2024 13:27, Tamas K Lengyel wrote:
> > --- /dev/null
> > +++ b/LICENSES/Apache-2.0
> > @@ -0,0 +1,202 @@
> > +
> > +                                 Apache License
> > +                           Version 2.0, January 2004
> > +                        http://www.apache.org/licenses/
>
> Better https:// (also near the end) nowadays?

This is a copy of https://www.apache.org/licenses/LICENSE-2.0.txt and
I'm not going to start modifying it even for such trivial reasons.


> Other files in this directory also have at least one Valid-License-Identi=
fier:
> line and at least one SPDX-URL: one.

I didn't notice but should be trivial to add.

Tamas

