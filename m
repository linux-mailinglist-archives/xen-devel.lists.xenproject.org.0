Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E1C914440
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746232.1153222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLekw-0002Ky-KT; Mon, 24 Jun 2024 08:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746232.1153222; Mon, 24 Jun 2024 08:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLekw-0002JE-HP; Mon, 24 Jun 2024 08:08:54 +0000
Received: by outflank-mailman (input) for mailman id 746232;
 Mon, 24 Jun 2024 08:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLekv-0002Hq-Sb
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:08:53 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe7f1071-3200-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 10:08:53 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so49714911fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:08:53 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec525bf38esm7298071fa.19.2024.06.24.01.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 01:08:50 -0700 (PDT)
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
X-Inumbo-ID: fe7f1071-3200-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216532; x=1719821332; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vHvXAApJ1wIYLBLHdlTsOjuj9210lXtVSO6F8TvfVsA=;
        b=FKktM8p1FLYVEG4AZcnv/gQDeZaMIoR29SmzeKD7DLHgQOZ1kb0dAx/pYN1x+1nJJa
         rx9G5OMeN92yDlDCyBJ7OgmDEWjIwQyVhR8W+neFWADyNewHUVlxCUdmLvPiKw2Ksz9c
         OsYZUS+1d2ZuDEzvyH8F6e64T0CS5W4wo0JBfSv1mjijcUz+ZI/ZXbHZuxPxa8AKLvor
         w198uhRKALViDYN0DQLWKLDNjHi41t1Ni0040j0h56OXDjbShjoWeZJie3GQ+j8nqZzS
         V6I8RyKv4JLdEQv9/ecZdiNfWwfigScT8lF9sucw0mZR+K4hXF3N3JiSK/H2GsMGRWA3
         IktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216532; x=1719821332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vHvXAApJ1wIYLBLHdlTsOjuj9210lXtVSO6F8TvfVsA=;
        b=RhNDLqqQw8tHO6Q9/kVkZwbm16H2pxr3vnsmJQYJJMLjDa8c0aqdfktR6AuHi92J1M
         owRdke65iKb3MImNHcry3tkIauXx0iYgLPHE1lV6z2JkDKKxkFzQkLkWPIS2ERXW6RKN
         pjodyHvPNJ/K8bcxZZQ20Hx2JgBK9gA8YWh+zrgymAv+t5/YZA3e5GYE41nIHSJ3MNov
         EDIk//9IaKsDQS3sV5fHhT4EsEQNl7OuGW1ha/ffp7sc6UVAH+SbK+ii8c5DMLZc1nWv
         UQ8fc2+uMws86cDGon1h1u47AcprB8NpMJUorvgrS/X0nY9CBM4bEcdKCh7uSNkDng5F
         4L4w==
X-Forwarded-Encrypted: i=1; AJvYcCX9IW1jOIrIKZ8QuPHQpYBtqxX4bRtkjTdQHllA8HIvil9y5IZO7TgihhWQwkqY05FE1qaqsii2Nz2v6PjNGeMEy0Eqf+VYw8loRkM4JPI=
X-Gm-Message-State: AOJu0Yw2EaHxYZz8yYu92UtiOp0j6pTBUEBuNV/MFyLSEPpHE1KnfX7E
	64LI9IPf5jhCMnQVeNL4HOYHfDDTFUl0qmpnLMjBRoWYE7qMeJoB
X-Google-Smtp-Source: AGHT+IGkbr2c1idYL9qdNVO4rt5yo1f2p2mUqMbYi9uxIeogf5Cg+ea+Ggamagc5zPGEiBo76vDKUg==
X-Received: by 2002:a2e:a414:0:b0:2ec:1ad3:fb0a with SMTP id 38308e7fff4ca-2ec5b30755fmr22516711fa.43.1719216530726;
        Mon, 24 Jun 2024 01:08:50 -0700 (PDT)
Message-ID: <459be95e245c28f0e3dc85ae2bbc792d4bb7efb1.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/4] xen/xlat: Improvements to compat hypercall
 checking
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Date: Mon, 24 Jun 2024 10:08:49 +0200
In-Reply-To: <dec0441e-c66d-44cd-86cd-7b914320b9c9@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
	 <dec0441e-c66d-44cd-86cd-7b914320b9c9@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 17:34 +0100, Andrew Cooper wrote:
> On 15/04/2024 4:41 pm, Andrew Cooper wrote:
> > This started off as patch 3, and grew somewhat.
> >=20
> > Patches 1-3 are simple and hopefully non-controversial.
> >=20
> > Patch 4 is an attempt to make the headers less fragile, but came
> > with an
> > unexpected complication.=C2=A0 Details in the patch.
> >=20
> > Andrew Cooper (4):
> > =C2=A0 xen/xlat: Sort out whitespace
> > =C2=A0 xen/xlat: Sort structs per file
> > =C2=A0 xen/gnttab: Perform compat/native gnttab_query_size check
>=20
> I'm timing out waiting for a justification on the whitespace comment.
>=20
> Oleksii: Can I get a release ack on this please?=C2=A0 Patch 3 is the mai=
n
> bugfix, which is the insertion of a missing build-time cross-check,
> so
> it's very low risk for the release.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
> Patch 4 was always RFC and not intended to go in as-was.
>=20
> ~Andrew


