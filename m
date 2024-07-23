Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225E93A4F8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 19:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763442.1173713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJMo-0008MK-1R; Tue, 23 Jul 2024 17:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763442.1173713; Tue, 23 Jul 2024 17:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJMn-0008Jt-V1; Tue, 23 Jul 2024 17:32:01 +0000
Received: by outflank-mailman (input) for mailman id 763442;
 Tue, 23 Jul 2024 17:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWJMm-0008J9-Fu
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 17:32:00 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7766f091-4919-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 19:31:59 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso93376466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:31:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785f1asm562011966b.24.2024.07.23.10.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 10:31:58 -0700 (PDT)
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
X-Inumbo-ID: 7766f091-4919-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721755919; x=1722360719; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6bAnfFZFNgH4dYj68V1dqcWMel69rnrldZ+f8/+qaR0=;
        b=YvRDMuxtR1kC7uEziXx1yNeqnMcACPhPf0xXtQdFuG17tcUNUHyRJPKmPOkI4KyCNw
         JYtjiP28Dm+l8DOHF91z0cNqGiSkfSz27h9lcOwxZWW4Uvo1wkzszRnc1K5sG6XQ7+h+
         wi5rhrF0QKX9CohOSw1TAtcsXsWCIqiG0wiVDqIVeZTD1MVUFKIeuDWAEL5lMgbT9mdI
         JC2b0LtGuoekymAJ4mHAJUKaLBWV+EMVLBFRhi3LWpYfy2Bw18S8dXtltGxUWMchevZM
         THT06UVYJtu4HbHehJMogayEg+mgpGXBpSyRj5gT3SCv0vuMERynfd3ZQR8Be7+zETcI
         pcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721755919; x=1722360719;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bAnfFZFNgH4dYj68V1dqcWMel69rnrldZ+f8/+qaR0=;
        b=XCtSg5j4he3w9P+t0/QI5KwWFWUzhH6XPNclbSkt3BJeZ23fUf+C+K8fR5btdZPz5M
         LCRvyUUx6PrM+cZBU93GbTYdcwsvH7MsY1CvYy3d3YscXzWwdDHiVlI7l7bhTDNzHucL
         8TfI1wmvNGCfzRrLvLTXl4eX+NMA30KVQtH53bJs0o74oN4cs78hJKl/TvMaEmDOYm7w
         eM2M+Wj3zXX0Rmmlp348jFqXvFW/RV0n8KHHM8XcmMz9uO/hRRA4p4EA9ZL+P0LV+IOk
         hhzX9SdZlXbMilyiPr2c3zBeOpAMKapEH/YXFuF+t4/CJe6L8Sf0yJ6PNDgOGYA3vrgV
         7Juw==
X-Gm-Message-State: AOJu0YyCIWA9LTWmPYMmbYNq0oZ43zaA8En1bjBray/fp/eIpcJ/mSpQ
	2O+v4awjA24slKpUUU9rUg9sanB6xKZgDRjgT97WzCiPNuxVZ7Fi
X-Google-Smtp-Source: AGHT+IHfxXQtgkIdwQUJ3zB865IplX6AC+BEVxw/avVQIe+XlcZbITze4dEv9X5o7luf/GyzExk9gg==
X-Received: by 2002:a17:906:c148:b0:a77:d441:c6f1 with SMTP id a640c23a62f3a-a7aab67ae87mr23914866b.33.1721755919122;
        Tue, 23 Jul 2024 10:31:59 -0700 (PDT)
Message-ID: <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
From: oleksii.kurochko@gmail.com
To: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	 <anthony.perard@vates.tech>, Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2024 19:31:58 +0200
In-Reply-To: <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
References: <20240715234631.4468-1-jandryuk@gmail.com>
	 <Zp/GcCUVPX/d/7qx@l14> <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 11:04 -0400, Jason Andryuk wrote:
> On 2024-07-23 11:04, Anthony PERARD wrote:
> > On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
> > > "$dev" needs to be set correctly for backendtype=3Dphy as well as
> > > backendtype=3Dtap.=C2=A0 Move the setting into the conditional, so it
> > > can be
> > > handled properly for each.
> > >=20
> > > (dev could be captured during tap-ctl allocate for blktap module,
> > > but it
> > > would not be set properly for the find_device case.=C2=A0 The
> > > backendtype=3Dtap
> > > case would need to be handled regardless.)
> > >=20
> > > Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy
> > > compatibility")
> >=20
> > Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy
> > compatibility") ?
>=20
> Yes!=C2=A0 Thanks for checking that - I must have grabbed the hash from a=
=20
> local branch.
>=20
> > > Fixes: 76a484193d ("hotplug: Update block-tap")
> > >=20
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> >=20
> > With the fixes tag fix:
> > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>=20
> Thanks again.
>=20
> Oleksii, this is a fix (for an incomplete fix) for 4.19.=C2=A0 76a484193d=
=20
> broke compatibility for block-tap with the blktap2 kernel model (when
> adding support for tapback).=C2=A0 This finishes restoring blktap2
> support.
>=20
> I realize it's late in the release if you don't want to take it.
It's pretty late but I just wanted to clarify:
1. Is so critical that we should have this in 4.19?
2. If we won't take it now, then will it be backported anyway?

~ Oleksii

