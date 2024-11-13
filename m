Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A19C74D2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 15:53:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835798.1251655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEjz-0004gU-La; Wed, 13 Nov 2024 14:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835798.1251655; Wed, 13 Nov 2024 14:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEjz-0004ek-In; Wed, 13 Nov 2024 14:53:07 +0000
Received: by outflank-mailman (input) for mailman id 835798;
 Wed, 13 Nov 2024 14:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lrmv=SI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBEjx-0004ea-MA
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 14:53:05 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb3a4461-a1ce-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 15:53:02 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb56cb61baso52789281fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 06:53:02 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178f3ca9sm24111981fa.41.2024.11.13.06.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 06:53:01 -0800 (PST)
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
X-Inumbo-ID: fb3a4461-a1ce-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiM2E0NDYxLWExY2UtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTA5NTgyLjMxNDc1Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731509582; x=1732114382; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L51Zyjy/dO/0R9bMg+bmqTswn/SVfcUyqvgNffwRYEs=;
        b=jmJJkDMalrRlff0jLq3OFVh8dvf7sOM6S9gRtbdSeS5xlem5+mfkmUxI1LM/n+7/+H
         3wC5xwE7Zhl8ANVyQNhq0NYq98x/5314+bPxc8PUbfRj8Vxc+9jVkkAr7MICZnPWlCMg
         13Yc//VlNS73vFtV+gN6aJLbmOyNFLaTYtGO13jHNIfi1KP8pmgnQZ/55s805e4+oZq8
         hWzg4xieAn4XWC9XD5AyKjTL6srMj/qlcxI4lQCdpqJHU+5iLG/HMcPPFS1LRwyEKjwi
         xImRqiG5LTvFltlKFkcDt8zGYILGUfR6Pta6sA+77UQJ/cVEL5V9iD3KMp0bPbYyaDYw
         /2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731509582; x=1732114382;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L51Zyjy/dO/0R9bMg+bmqTswn/SVfcUyqvgNffwRYEs=;
        b=uzhYA7jBluRwGky6CN51KVGWz1iz+TBakTm1ft7DuhQtknb0qS8MotGPtFnaztJcoT
         0zQdajs58N/wsqJWqGNX0//pe9yKjZX4WfRcIii3i2fQ4KKdWIWz7z9qQJ5UAIYq9KeL
         vaNbOMXqZdGumve1HQGiV34rPfzxH8kAnAr0jc94xHGhIImCub3Jf0neAb+rQ86kcQOb
         GIrodLL2RCxh6JU2pVewG0ZK6ZV4AaseyWV6QDgh2qhKyzuK2gqKh6YmYFR8de6sUUVc
         zjpSwIN8RdJjAJQIe43QWni2mg8oCCXn+qQ0/HNUC2vnvfQ4q1KvydMrV+y4u6v3BwyD
         swRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUduFjapTUsXWjkbW3nCnLkpK0WH30Ev+HLGeLzqOWRWrkrGNjvonkBZyxnZZbUSbjhINouQ/rcay8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUXnXkik0nJb52dYy5NxUwI+PgSPqpMPeLaPtg2x3m2ru889kV
	fPIMtLlTVm+5Qp5sRKqvh1xGF2jh/Le2fbIpT9MraTtOxUMMqNvL
X-Google-Smtp-Source: AGHT+IH8lyWhXQdhJHGEgAZMUuI3FoUVoduphY4ROvxdLHWLgOXcW15gWYUaFW0JEMrORPZ0jczTUQ==
X-Received: by 2002:a2e:b8c6:0:b0:2fb:4bee:47ec with SMTP id 38308e7fff4ca-2ff4c6332a5mr23006151fa.33.1731509581594;
        Wed, 13 Nov 2024 06:53:01 -0800 (PST)
Message-ID: <0ac663fc22d0b3dc28abdc31b1e020f7a72ec034.camel@gmail.com>
Subject: Re: Xen 4.20 Development Update [August-October]
From: oleksii.kurochko@gmail.com
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 13 Nov 2024 15:53:00 +0100
In-Reply-To: <8205ea71-858c-4552-819f-2b9753457034@suse.com>
References: 
	<CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
	 <8205ea71-858c-4552-819f-2b9753457034@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Wed, 2024-11-13 at 14:25 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 12.11.24 17:16, Oleksii Kurochko wrote:
> > Hello everyone,
> >=20
> > This email only tracks big items for xen.git tree. Please reply for
> > items you
> > would like to see in 4.20 so that people have an idea what is going
> > on and
> > prioritise accordingly.
> >=20
> > You're welcome to provide description and use cases of the feature
> > you're
> > working on.
> >=20
> > =3D Timeline =3D
> >=20
> > ---> We are here
> > * Last posting date: Nov 29, 2024
> > * Feature freeze date: Dec 20, 2024
> > * Hard code freeze: Jan 17, 2025
> > * RC1: TBD
> > * Release: Feb 21, 2025
> > ( current release schedule: https://wiki.xenproject.org/wiki/=C2=A0
> > Xen_Project_X.YY_Release_Notes <https://wiki.xenproject.org/wiki/=C2=A0
> > Xen_Project_X.YY_Release_Notes> )
> >=20
> > All patches that wish to go into 4.20 must be posted no later than
> > the last posting
> > date. All patches posted after that date will be automatically
> > queued
> > into next release.
> >=20
> > RCs will be arranged immediately after freeze.
> >=20
> > =3D Projects =3D
> >=20
> > =3D=3D Hypervisor =3D=3D
> > * =C2=A0stubdom: reduce xenstore library dependencies (v1)
> > =C2=A0=C2=A0 - =C2=A0Juergen Gross
> > =C2=A0=C2=A0 -
> > https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.co=
m/T/
> > =C2=A0
> > #m8b5af386e2d288961bb6e8f7839650e0cab96a83
> > <https://lore.kernel.org/xen-=20
> > devel/20241010155459.22389-1-jgross@suse.com/T/=20
> > #m8b5af386e2d288961bb6e8f7839650e0cab96a83>
>=20
> This one has been applied already.
Thanks for notifying, I will move it to completed section.

~ Oleksii

