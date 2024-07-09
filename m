Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72A92C071
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 18:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756424.1165043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDpV-0005Wj-A1; Tue, 09 Jul 2024 16:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756424.1165043; Tue, 09 Jul 2024 16:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDpV-0005Uv-6d; Tue, 09 Jul 2024 16:36:37 +0000
Received: by outflank-mailman (input) for mailman id 756424;
 Tue, 09 Jul 2024 16:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aI6s=OJ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sRDpT-0005Up-Nw
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 16:36:35 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 663ff57d-3e11-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 18:36:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1720542989991739.5214765680626;
 Tue, 9 Jul 2024 09:36:29 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-64b29539d87so47336877b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 09:36:29 -0700 (PDT)
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
X-Inumbo-ID: 663ff57d-3e11-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1720542991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=knV+5OV4BQg91kOijfXALhvXlepf4gEMflTX1zKdZ9/JbfRCHRw0xV+7AsBHtK8quqZy/Cpp5Ik+vFX2zooQ5dJFeNv2ZUxHxab/UlWrLPZcmvvKAJtDQYMFk4LKFzv/bK5YofAAX2jkxs4VBMOoIFLiKF5DKVRWRs1pa4BCfLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1720542991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p/u/+fBt1SwANb2RqCF6Y/pSfgKgopUbXlXta3Cvzqs=; 
	b=Lxp6ImaGMIaEFC4WzcgrPfxVlEeCN1QaLRWA143tMDpDDwichJAbkQraQiL53aUtRNjcD8Xi5bDjq1tG2Wi8QzxcB8+mqmUdF3dX1X7xSCCccxkicCpBWRRKKySdGggPA9DlkGRh3/ZOcXXVyS/BeSEPSMB7VEimbjhR4zCxKt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1720542991;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=p/u/+fBt1SwANb2RqCF6Y/pSfgKgopUbXlXta3Cvzqs=;
	b=EPugd4CQa9QIZ2/ZkiYdOjZwWNraMq4CXlbQLthc4/ZtTjuFMYVGpQWPRTL6ket1
	3mqfbRrdgJ1Gmlj8hTwG/w7vQZZfK0E8WA9enYTcRdVfB0CFrnj6XGYq6bQIG91CQjY
	X/qztW5O+j7tZ13nVrAKijbluebr46zY5NYRvHfU=
X-Forwarded-Encrypted: i=1; AJvYcCWMaUlumXGq2aXBR/m5Cu+vJRc59yQv6nzTVQN/FWohGwvYX+Id35sq4n5SoPVXfT3YbAINfo5TbrrXTTGdjd77EYIxX8qoTUw3rhFO2Ts=
X-Gm-Message-State: AOJu0YwVNa18Z1Twlf+PkZ4CajLJvzoOK9lZB65lzuVMANQPrZOtjvcR
	pUkJzoXUXQurpIYmXwrK6UJMGrUo/jntYABHwtIdgEsmbh3q8Ik/vniywIFRmQXLES/kbx4xBky
	tO3Xt+vOFKmKQ9Mg6qwvn5hGY0Gg=
X-Google-Smtp-Source: AGHT+IFE+ItH/yi7ocnKCOetZETwvQd2jWH07Q4ry6h/ABjCQBII3pNALl+FXivavqydajhxddmVdeUxnzWWbyY6IJA=
X-Received: by 2002:a0d:dcc4:0:b0:640:bcdf:7d6a with SMTP id
 00721157ae682-658f09d2b71mr33138787b3.32.1720542989029; Tue, 09 Jul 2024
 09:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <CABfawhmkNrMR5opsFZpyEXDaiLMyo8a5bepXL6A+MGnbwBFvAA@mail.gmail.com> <3c8398d3-7317-46e6-9fb6-ab1dde188caf@suse.com>
In-Reply-To: <3c8398d3-7317-46e6-9fb6-ab1dde188caf@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 9 Jul 2024 12:35:53 -0400
X-Gmail-Original-Message-ID: <CABfawhkLvwC2MmSSkk87LNfrh7UcxAUiewSogTbS3heCyfKLdw@mail.gmail.com>
Message-ID: <CABfawhkLvwC2MmSSkk87LNfrh7UcxAUiewSogTbS3heCyfKLdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 12:12=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.07.2024 17:37, Tamas K Lengyel wrote:
> > On Tue, Jun 25, 2024 at 6:47=E2=80=AFPM Tamas K Lengyel <tamas@tklengye=
l.com> wrote:
> >>
> >> This target enables integration into oss-fuzz. Changing invalid input =
return
> >> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding=
 the
> >> missing __wrap_vsnprintf wrapper which is required for successful oss-=
fuzz
> >> build.
> >>
> >> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >
> > Patch ping.
>
> It's on my list of things to look at, yet even if fully ack-ed it couldn'=
t
> go in right now anyway.

Thanks, just wanted to make sure it's not lost.

Tamas

