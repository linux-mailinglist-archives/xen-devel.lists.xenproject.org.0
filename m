Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F8985DF9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803960.1214807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stS0b-0006dq-LN; Wed, 25 Sep 2024 13:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803960.1214807; Wed, 25 Sep 2024 13:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stS0b-0006cH-Ik; Wed, 25 Sep 2024 13:24:45 +0000
Received: by outflank-mailman (input) for mailman id 803960;
 Wed, 25 Sep 2024 13:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stS0a-0006cB-MR
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:24:44 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86daf47c-7b41-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 15:24:43 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8a706236bfso462628566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 06:24:43 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf496b01sm1859247a12.30.2024.09.25.06.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:24:42 -0700 (PDT)
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
X-Inumbo-ID: 86daf47c-7b41-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727270683; x=1727875483; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+goBqbrQesPjfO4GRM04zbOSYgTalK3Pvs4j1mhxND0=;
        b=cvSUjqrLvRcaIx57b9MhJDO3nJREakip0v66kKUnvkZXTUySyiqUs06FiVOIGJH6r+
         awXxUIPZY8JZ8syvLY67qCFmsiUcWFsirFTvUd2NEQ4D3NWSouRxXB+oMAQiYPfo2D98
         m5meUGLON8PdmEpZPzcP8irzKZCWcUK0wXsf7VQ5/hG4uSPtRzo2Zgw40Z75i3JpOwWR
         77d45QjNUOsmBuIqjGzTZPcVjcvhk7pOmjGraGFdB9zap9S9CiyjARn+Ez06vpRkF+Oc
         vVZq0s21FzjnaUV30u1MF5bAc/bz5xULS8/pBh6ByvE29zpKUEkFqp/P2E3PbRKjQieE
         tr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270683; x=1727875483;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+goBqbrQesPjfO4GRM04zbOSYgTalK3Pvs4j1mhxND0=;
        b=PLPozmC0CxZZEF+lC0jCircxZ5qL/Efnr48tkh4PWx6SJplOUWA3/14XZwpL52zGVv
         QH8BDZfjtnYMUhpg4b9TdIdDNPQG6/j/eF+etUndy9kz6/nddlpbd3pdIiAnipwbiBuo
         7b2DFRK0s/1VrvvVPRjvKQp2L7HTSw971UnizhqnMosz1ZJfGI/KIYrXyEs+Dr8mdzTy
         Ce2bxJb57fhPv71zwx67P/48Lt9n1e6yzV3zatSyqr2DSOKEk1eje3hM+P6/dY3x8EE4
         ER5QhxnHEyN37GbQxiLfC1lJfD0Rfh4NJ9X1zRfy1PugPWAt0y/peMrKjjuT9y6CZs2w
         1qqg==
X-Forwarded-Encrypted: i=1; AJvYcCXOXGFaBSk0sq/utPYSb9GG0a9rVhMAnN7KI4odhtuwhkof9gnhSFY2c/z/r9sO5QM08iXkTvfv4MI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwudcErLqALVialnS6C/YvAC6VdGo8DyRjFKCuTPAVKzgbD1vQw
	ukLS32Nw9ss30pHr+k15CO46+Zjgkm1bKdSpEszfGRSOHzXX7CMi
X-Google-Smtp-Source: AGHT+IHkF8UIsgSyoIDANz/SEzFdZz2aTU4vKypX/z1UNY2YaW1ngNwlqD4eKYa7nd99ZDrrH1zutw==
X-Received: by 2002:a05:6402:26d5:b0:5c4:2d14:c725 with SMTP id 4fb4d7f45d1cf-5c720610bf7mr2911041a12.2.1727270682996;
        Wed, 25 Sep 2024 06:24:42 -0700 (PDT)
Message-ID: <25db63eecf90886bfaee8a2be9b19f26524be3b4.camel@gmail.com>
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
Date: Wed, 25 Sep 2024 15:24:40 +0200
In-Reply-To: <0246f345-76db-4633-bb8d-4c6bc735fe61@citrix.com>
References: <20240912132347.28756-1-roger.pau@citrix.com>
	 <0246f345-76db-4633-bb8d-4c6bc735fe61@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 12:18 +0100, Andrew Cooper wrote:
> On 12/09/2024 2:23 pm, Roger Pau Monne wrote:
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > ---
> > =C2=A0CHANGELOG.md | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 26e7d8dd2ac4..8864ea7eafad 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -9,6 +9,7 @@ The format is based on [Keep a
> > Changelog](https://keepachangelog.com/en/1.0.0/)
> > =C2=A0### Changed
> > =C2=A0 - On x86:
> > =C2=A0=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run tim=
e service
> > call.
> > + - Fixed blkif protocol specification for sector sizes different
> > than 512b.
>=20
> It's minor, but blkif is common, so should go ahead of the "On x86"
> subsection.
Agree, it would be nice to put that in common.

>=20
> Can be fixed on commit.
It would nice. Thanks.

~ Oleksii

