Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDF72F9D0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548660.856701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NBc-0000ds-30; Wed, 14 Jun 2023 09:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548660.856701; Wed, 14 Jun 2023 09:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NBc-0000ae-05; Wed, 14 Jun 2023 09:53:08 +0000
Received: by outflank-mailman (input) for mailman id 548660;
 Wed, 14 Jun 2023 09:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRK2=CC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q9NBa-0000Ey-Uq
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:53:06 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e5d7ca-0a99-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 11:53:06 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f629ccb8ebso8153263e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 02:53:06 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l12-20020ac2554c000000b004f76a7e9c62sm9346lfk.173.2023.06.14.02.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 02:53:05 -0700 (PDT)
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
X-Inumbo-ID: 42e5d7ca-0a99-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686736386; x=1689328386;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=orKzMoBpUMdeeyr8hpkefDRWm3s2KPw5fPgz93hCHUs=;
        b=YZ2B+B3wMLFHQChDhCELhZbRvLBtC+a5KmoZdWD7rTaPJfRUM0+Zm8tEjE77BgMB/h
         7R+hdZ+hsiWhnYPnnBgsGHDG3NsHrL6xEe/+nO5K/Ua3xVpNv8IlOFQo7rlJCXBePdI6
         xkuzd2fnR8Z7mspiTIshWu9LQ/5YOMS921CF47XziiDy8mUy6AZqz2tQc1uMM9Ysz3Oe
         C/D5k2A1N0FS4ZAxlo/EpfNNZZbbvHuBqLJMxn+LYQDEY4QU+LJYF26RqNEuWZY7pClp
         IS7DYcX9gzFhbJ2AXoUfpzaHbn909qIFZGZL93+/JtQI0+YlUKKovGmJJL0MHGnz50ho
         hjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686736386; x=1689328386;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orKzMoBpUMdeeyr8hpkefDRWm3s2KPw5fPgz93hCHUs=;
        b=dBY1DpQzU5l/NTBQW6d3YZHou0J2ELf93z3Y6i1Uhox/3I7KZvcV9lF9C+nlFKZGs1
         DYGsgmSAUltEliH9ox/fps9I30p4NRkoIkqfvjnQ1lu0hJ2azKJx8xtWfdvylyMJgjvd
         F1ILXpByMz0Wi6UqNcTxcN6OoUCO3UkTX+w49YZJ43pS6Idcs5nOho7mOMCz4b+CvaOi
         gdW9LOmzg0XAClj/JHOJo2cLa3iIAdtLpFreMWQtA0XfpngNnyVBIbLnxQtndBkOIcfi
         rI/syf8EoRHS8D6pzXxdbmIyKysH1vlHob+ciTDyz/WUYCLkJCGtSYtWCtp2lDlsm7Ri
         QBWQ==
X-Gm-Message-State: AC+VfDzBBwzMipnNT9DKLN1yXHT89SFS/tmFUiK8UbEraoIWlFIyR23T
	ts48bBNHuJsQVsKqwuMPdFA=
X-Google-Smtp-Source: ACHHUZ6bZW1JA0m22CiOmY09h65F2KsqNnqKxW0l8u+8XB8tLph1H7L9KNzp0dgoQvpPZeAEplXv9w==
X-Received: by 2002:a19:2d08:0:b0:4f6:2629:6cf3 with SMTP id k8-20020a192d08000000b004f626296cf3mr6190253lfj.46.1686736385637;
        Wed, 14 Jun 2023 02:53:05 -0700 (PDT)
Message-ID: <30573cb954cc18f976da8b646a43352445991ee0.camel@gmail.com>
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 14 Jun 2023 12:53:04 +0300
In-Reply-To: <a5e1f7e1-a585-9c3c-00cc-69fda9c6a55c@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
	 <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
	 <a5e1f7e1-a585-9c3c-00cc-69fda9c6a55c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-12 at 16:24 +0200, Jan Beulich wrote:
> On 12.06.2023 15:48, Jan Beulich wrote:
> > On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > > -void __init noreturn noinline enable_mmu()
> > > +/*
> > > + * enable_mmu() can't be __init because __init section isn't
> > > part of identity
> > > + * mapping so it will cause an issue after MMU will be enabled.
> > > + */
> >=20
> > As hinted at above already - perhaps the identity mapping wants to
> > be
> > larger, up to covering the entire Xen image? Since it's temporary
> > only anyway, you could even consider using a large page (and RWX
> > permission). You already require no overlap of link and load
> > addresses,
> > so at least small page mappings ought to be possible for the entire
> > image.
>=20
> To expand on that: Assume a future change on this path results in a
> call
> to memcpy() or memset() being introduced by the compiler (and then
> let's
> further assume this only occurs for a specific compiler version).
> Right
> now such a case would be noticed simply because we don't build those
> library functions yet. But it'll likely be a perplexing crash once a
> full
> hypervisor can be built, the more that exception handlers also aren't
> mapped.
It makes sense but for some reason it doesn't crash ( I have a bunch of
patches to run dom0 ) but as I mentioned in the previous e-mail I agree
that probably it would be better to map the whole image using 1 Gb page
table for example.


>=20
> > > - mmu_is_enabled:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Stack should be re-inited as:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 * 1. Right now an address of the stack is r=
elative to load
> > > time
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 addresses what will cau=
se an issue in case of load
> > > start address
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 isn't equal to linker s=
tart address.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 * 2. Addresses in stack are all load time r=
elative which
> > > can be an
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 issue in case when load=
 start address isn't equal to
> > > linker
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 start address.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 * We can't return to the caller because the=
 stack was
> > > reseted
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 * and it may have stash some variable on th=
e stack.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 * Jump to a brand new function as the stack=
 was reseted
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * id_addrs should be in sync with id mappin=
g in
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * setup_initial_pagetables()
> >=20
> > What is "id" meant to stand for here? Also if things need keeping
> > in
> > sync, then a similar comment should exist on the other side.
>=20
> I guess it's meant to stand for "identity mapping", but the common
> use
> of "id" makes we wonder if the variable wouldn't better be
> ident_addrs[].
It would be better. but probably we will remove that variable if we
agree to map the whole Xen instead of parts. So I'll wait for your
response before starting to work on new patch series.

Thanks a lot.

~ Oleksii

