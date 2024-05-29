Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2938D3CD9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 18:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732248.1138163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMHZ-0007DN-5Z; Wed, 29 May 2024 16:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732248.1138163; Wed, 29 May 2024 16:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCMHZ-0007Aj-2U; Wed, 29 May 2024 16:36:09 +0000
Received: by outflank-mailman (input) for mailman id 732248;
 Wed, 29 May 2024 16:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCMHX-0007Ad-Og
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 16:36:07 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c1d9dbf-1dd9-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 18:36:06 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so23365431fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 09:36:06 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bf2cd3bsm25322251fa.140.2024.05.29.09.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 09:36:05 -0700 (PDT)
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
X-Inumbo-ID: 8c1d9dbf-1dd9-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717000566; x=1717605366; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T70BVXJlLVIQvl4XQvyZ5Z7U/u96RL4MJT8N1NZdq5k=;
        b=KDSb5TZwULl006yTugLsrab6xDOI5NTdVuFxA0jGilWRc6sZFEt4HtnIbgOl+wuYPy
         vlC8kHD/vYQRRJnBPeRkStHeQYePcXJJ/f5zdAPc5aLjF/NlojhWDMiP25nXOd+vDCKy
         6ldZuZ4jfo5i7WBbNp/Q8eXR6Z5YF+dhwO488DvJKCFWzy7NMmJK6mYVzFkvIYEDwjPO
         3YxWt5ReWteoGQt2M6JOC5O+/984SrLmmV0Nycoy30/SPuFHkNHp+MT7RxxdqdbZm2So
         cUZr6+0dRRWIpZryHblHaE4AJczIK1HBAVEvswsy6j0h/kp/T9vadwocIfpzBCXAva7s
         AhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000566; x=1717605366;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T70BVXJlLVIQvl4XQvyZ5Z7U/u96RL4MJT8N1NZdq5k=;
        b=HQvQGdRX2s6UYRg6U38we81/hmNwPQrjoLe/ny4LYWKlNptguGx4o8DpZqQb+sD4dU
         00sjQTKs9tZlKDEc07FUby2U2ciBqbsvslMVe+G0SuqKOWOLtiXX9cRiNjgGzFCtKCbL
         RnvHSs7pq8uRlfFtk7MFc4kEKiV0t46Yvg5svRJkmmDFNe3xwW4CIqGfBCoo3D/Qc2db
         36QBzm3k6EJAkDTOiGuuKn8tzQxY0hHzmXZJ+KDPSnGcS4Fd9qg8U41gl0zh9zRoNM2A
         W0DukzKKK2upr1oCyzaHqbtkHl/LGkW8yspTTn74QQ0YKZwovLhiG4lnZDPaTlEOflhi
         x8ow==
X-Forwarded-Encrypted: i=1; AJvYcCWcADMee+XiC56AsjhRQ2wvn7JeZ997vJWsAuGK5Wj4Gwn0A9EpyifTmhLbg8CRTz1Udb1l1cLSPwfYcoXmEE9sxY4v2sOXRIe1GqFO5E0=
X-Gm-Message-State: AOJu0YwvIfXDUadh65itJAfMRxjk2rIrjwnyyNt3TJ+25TblmRVhGNlu
	446eZ/sspR5L6mr9E0fJQ86w6BHSxr//uc30mWO0ZG3/2ceWa7Yy
X-Google-Smtp-Source: AGHT+IFov/sg0n7n/D64osxKiEyFqQyXiOZE6fNPicZtHRZtPgIMD+F/8xmlyur2pGBYQH25HfNqWw==
X-Received: by 2002:a2e:7212:0:b0:2ea:79ab:6709 with SMTP id 38308e7fff4ca-2ea79ab6889mr16763201fa.31.1717000566102;
        Wed, 29 May 2024 09:36:06 -0700 (PDT)
Message-ID: <3c33c0cc45a8c3b21e5cf8addf2cd34ae017a648.camel@gmail.com>
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,  Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 May 2024 18:36:04 +0200
In-Reply-To: <1b301099b71c61c8e537ec6eb8fe064c3c2348f3.camel@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
	 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
	 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
	 <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
	 <a39c3c03-ef54-4329-833d-03b60f162234@xen.org>
	 <56b97916d1c36040a0be547759d5d10d311c9ed3.camel@gmail.com>
	 <5438a9b1-d13a-415b-95e4-af520c228e01@suse.com>
	 <c72784d5-20d2-4583-9e8a-f8b1cbf31aa6@xen.org>
	 <ded13a36-b790-4989-a952-9a4130293b50@suse.com>
	 <2bc05407cc62c829d63da757e071db51a003eb79.camel@gmail.com>
	 <23790bd6-e06a-4adc-90a9-517f947be00a@suse.com>
	 <1b301099b71c61c8e537ec6eb8fe064c3c2348f3.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 18:29 +0200, Oleksii K. wrote:
> On Wed, 2024-05-29 at 17:22 +0200, Jan Beulich wrote:
> > On 29.05.2024 16:58, Oleksii K. wrote:
> > > static always_inline bool test_bit(int nr, const volatile void
> > > *addr)On
> > > Wed, 2024-05-29 at 12:06 +0200, Jan Beulich wrote:
> > > > On 29.05.2024 11:59, Julien Grall wrote:
> > > > > I didn't realise this was an existing comment. I think the
> > > > > suggestion is=20
> > > > > a little bit odd because you could use the atomic version of
> > > > > the
> > > > > helper.
> > > > >=20
> > > > > Looking at Linux, the second sentence was dropped. But not
> > > > > the
> > > > > first=20
> > > > > one. I would suggest to do the same. IOW keep:
> > > > >=20
> > > > > "
> > > > > If two examples of this operation race, one can appear to
> > > > > succeed
> > > > > but=20
> > > > > actually fail.
> > > > > "
> > > >=20
> > > > As indicated, I'm okay with that being retained, but only in a
> > > > form
> > > > that
> > > > actually makes sense. I've explained before (to Oleksii) what I
> > > > consider
> > > > wrong in this way of wording things.
> > >=20
> > > Would it be suitable to rephrase it in the following way:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 * This operation is non-atomic and can be re=
ordered.
> > > =C2=A0=C2=A0 - * If two examples of this operation race, one can appe=
ar to
> > > =C2=A0=C2=A0 succeed
> > > =C2=A0=C2=A0 - * but actually fail.=C2=A0 You must protect multiple a=
ccesses
> > > with
> > > a
> > > =C2=A0=C2=A0 lock.
> > > =C2=A0=C2=A0 + * If two instances of this operation race, one may suc=
ceed
> > > in
> > > =C2=A0=C2=A0 updating
> > > =C2=A0=C2=A0 + * the bit in memory, but actually fail. It should be
> > > protected
> > > =C2=A0=C2=A0 from
> > > =C2=A0=C2=A0 + * potentially racy behavior.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0 static always_inline bool
> > > =C2=A0=C2=A0=C2=A0 __test_and_set_bit(int nr, volatile void *addr)
> >=20
> > You've lost the "appear to" ahead of "succeed". Yet even with the
> > adjustment
> > I still don't see what the "appear to succeed" really is supposed
> > to
> > mean
> > here. The issue (imo) isn't with success or failure, but with the
> > write of
> > one CPU potentially being immediately overwritten by another CPU,
> > not
> > observing the bit change that the first CPU did. IOW both will
> > succeed (or
> > appear to succeed), but one update may end up being lost. Maybe
> > "...,
> > both
> > may update memory with their view of the new value, not taking into
> > account
> > the update the respectively other one did"? Or "..., both will
> > appear
> > to
> > succeed, but one of the updates may be lost"?
> For me, the first one is clearer.
If then this part of the comment is needed for test_bit() as it is
doing only reading?

> Julien, would that be okay for you?

~ Oleksii


