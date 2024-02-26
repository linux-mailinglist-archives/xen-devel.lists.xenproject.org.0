Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A48672E1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685474.1066255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZ0T-0007Tv-QH; Mon, 26 Feb 2024 11:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685474.1066255; Mon, 26 Feb 2024 11:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZ0T-0007Ra-NK; Mon, 26 Feb 2024 11:18:49 +0000
Received: by outflank-mailman (input) for mailman id 685474;
 Mon, 26 Feb 2024 11:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reZ0S-0007RU-Ec
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:18:48 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8fe5ae-d498-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:18:46 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512fd840142so937877e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:18:46 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05651206cb00b00512f2b3f6afsm799618lff.13.2024.02.26.03.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:18:44 -0800 (PST)
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
X-Inumbo-ID: ce8fe5ae-d498-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708946325; x=1709551125; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6SssqkIv4Nwp63/ViK3ZjJrnf6N+m8jYq7CXWwIuyjA=;
        b=YsDoZioZuFa/JBw64jp0IlYlMHf6ldnKZTYiEmnBpJVRWyS52WmbN3RsctbHU9lH8a
         YxuC9RdUfCmUj09BntU5hcUvTN9hepUN4J8FsoKzpgpXqgnV15BUIpI0Iw3OMEdcOQme
         Tx9gjlf/3JhTRrAR3M16L+kh5e8CfpUJjPz/a1Mzye4zmHNVKeLGKIMbYA3HmzdpHSu9
         z/2BLUUNzxouJSzW5xgpRktaHzhvjuKT9fd2jWTbZm789BForfHnBUMMcqKXN6T66+If
         V+RTCTvuN8N//+TdzOgCSFrsRim0YCKdpEpt2lTVMwLyjoqqNPhyt4f0gbNI/X3mDbm6
         GKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708946325; x=1709551125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SssqkIv4Nwp63/ViK3ZjJrnf6N+m8jYq7CXWwIuyjA=;
        b=d8BAH5sfRZtxglFOSnuNyhMKNozVbtouT24dSjQ3zxkko0Wkuy6DOBhAVyeJzpxWXL
         NV+0Q6ZIFyU8LJjfUIWEquEidGKvO1hV7qTR/vatHD4SbiTeBiSHaJASXIoTnKgFcC2v
         VXwJ/v+rPR8r78+4Z2VUo/0s5ByFN7AVj3OLe3nVd9gYG8YFfan1idrd97J8GGF3ni3p
         OrTNf7QRMRF2Q1Zg8ySCAWKDyfUh19N+yTnzppkb1VqhAyPp07aTLwoVMry1K23VYFLr
         N2iqyQNsEOEDa5gOYCfStFnOKtPBkKiOfm7x3kd36QYEs0pCifuYcDR4FWzx/BQ2CpmI
         KosA==
X-Forwarded-Encrypted: i=1; AJvYcCXl8UW/STlDXMnQkUCrLnmxj0ANZ6oUrAnABnyroxuuHSgHby2cBScUNRzEErPbDCfSGlYiO18WYu01D6ZrqPaW0pbACUerfiyRHkaD24Y=
X-Gm-Message-State: AOJu0YxHCeqPduGRFHPLyZ3pLo4Ff/PotowT6jIDaCWrErQCxS42OQDJ
	y/tghFy5infbmoLQrWrB3z+uOAOwXLDB2w2ObIiiVMklHBFbJ/J/
X-Google-Smtp-Source: AGHT+IGvbDVQE/wPQVc0nEMy3yGMS/33aDInkcjgw+PsaUMLvfTxNux7al+kC/E0m/N8svmT7C30PA==
X-Received: by 2002:a05:6512:4005:b0:512:ae18:74a1 with SMTP id br5-20020a056512400500b00512ae1874a1mr4827765lfb.11.1708946325185;
        Mon, 26 Feb 2024 03:18:45 -0800 (PST)
Message-ID: <56ae27d003b8763af34864ae56433691685c3661.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 26 Feb 2024 12:18:44 +0100
In-Reply-To: <44fd5092-7838-4d28-804b-bbfebfd44886@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
	 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
	 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
	 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
	 <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
	 <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
	 <44fd5092-7838-4d28-804b-bbfebfd44886@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-26 at 10:45 +0100, Jan Beulich wrote:
> On 23.02.2024 13:23, Oleksii wrote:
> > >=20
> > > > > > As 1- and 2-byte cases are emulated I decided that is not
> > > > > > to
> > > > > > provide
> > > > > > sfx argument for emulation macros as it will not have to
> > > > > > much
> > > > > > affect on
> > > > > > emulated types and just consume more performance on acquire
> > > > > > and
> > > > > > release
> > > > > > version of sc/ld instructions.
> > > > >=20
> > > > > Question is whether the common case (4- and 8-byte accesses)
> > > > > shouldn't
> > > > > be valued higher, with 1- and 2-byte emulation being there
> > > > > just
> > > > > to
> > > > > allow things to not break altogether.
> > > > If I understand you correctly, it would make sense to add the
> > > > 'sfx'
> > > > argument for the 1/2-byte access case, ensuring that all
> > > > options
> > > > are
> > > > available for 1/2-byte access case as well.
> > >=20
> > > That's one of the possibilities. As said, I'm not overly worried
> > > about
> > > the emulated cases. For the initial implementation I'd recommend
> > > going
> > > with what is easiest there, yielding the best possible result for
> > > the
> > > 4- and 8-byte cases. If later it turns out repeated
> > > acquire/release
> > > accesses are a problem in the emulation loop, things can be
> > > changed
> > > to explicit barriers, without touching the 4- and 8-byte cases.
> > I am confused then a little bit if emulated case is not an issue.
> >=20
> > For 4- and 8-byte cases for xchg .aqrl is used, for relaxed and
> > aqcuire
> > version of xchg barries are used.
> >=20
> > The similar is done for cmpxchg.
> >=20
> > If something will be needed to change in emulation loop it won't
> > require to change 4- and 8-byte cases.
>=20
> I'm afraid I don't understand your reply.
IIUC, emulated cases it is implemented correctly in terms of usage
barriers. And it also OK not to use sfx for lr/sc instructions and use
only barriers.

For 4- and 8-byte cases are used sfx + barrier depending on the
specific case ( relaxed, acquire, release, generic xchg/cmpxchg ).
What also looks to me correct. But you suggested to provide the best
possible result for 4- and 8-byte cases.=C2=A0

So I don't understand what the best possible result is as the current
one usage of __{cmp}xchg_generic for each specific case  ( relaxed,
acquire, release, generic xchg/cmpxchg ) looks correct to me:
xchg -> (..., ".aqrl", "", "") just suffix .aqrl suffix without
barriers.
xchg_release -> (..., "", RISCV_RELEASE_BARRIER, "" ) use only release
barrier
xchg_acquire -> (..., "", "", RISCV_ACQUIRE_BARRIER ), only acquire
barrier
xchg_relaxed ->  (..., "", "", "") - no barries, no sfx

The similar for cmpxchg().

~ Oleksii

