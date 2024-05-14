Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCCD8C4E54
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721279.1124574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6o6T-0005JN-Dc; Tue, 14 May 2024 09:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721279.1124574; Tue, 14 May 2024 09:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6o6T-0005Gi-Ay; Tue, 14 May 2024 09:05:45 +0000
Received: by outflank-mailman (input) for mailman id 721279;
 Tue, 14 May 2024 09:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y506=MR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s6o6S-0005Gc-Ky
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:05:44 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 233dddc5-11d1-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:05:42 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59cf8140d0so1213876766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:05:41 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7f3dsm691814566b.123.2024.05.14.02.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:05:39 -0700 (PDT)
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
X-Inumbo-ID: 233dddc5-11d1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715677540; x=1716282340; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S32SOD8xQbnu1UbjDRIfbFTfLCH36Ju2ZdHupMbk0kY=;
        b=X96mPUizArhrLPa2yhmH6H+pK9NPjVRZV3pOHU70U8bbh1ACfCylapIYHpFwb2+lZ2
         D2L5yZpxx8+hlKH9aamAB1XBnKQ/iEMbu6d3Ue3Dqhk6kgLnbKFyGWuddTcY7O8vZQWc
         FYbUr1e72IbUxyi71J260sTIA9Jph8Znox52/MKv2Kq7Hinjcx3VbBhR8O7yyIa+cmVF
         iT+lFBL6oid4rLNDcCfTqJpr8Oc9sFdHe58ai4rS4p0AGlIRmbftSTObBT9GvK0gMe2m
         LAGUajzX6Q/cS/YhJH99sVnPYrIQeSkehlNxd+CCrmOOllAIydcxRRiLJZCvDXpELzgD
         Z2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677540; x=1716282340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S32SOD8xQbnu1UbjDRIfbFTfLCH36Ju2ZdHupMbk0kY=;
        b=B81F3eWa0+WwLKWQP+OjoR6vo3NMW4Wq23oNc0z8s1u3+gpa3RJqemc/Pd81HyUXtp
         lENB9UsLnoFFo8c6xDOYpWGT+65+j0nDi2xqEvEwYP+5iz+bqI9dVgTg7w5CzdJMP2Kg
         xVXlPhxhlk2jCnZgD8wAPtytwe/a4th8284aGRTMN2trVxWSMOQ/dCCYJAJhVIgSkmKd
         6s1zPSOwhHFD56jj8wV0YiWty4mslR0nPR9wBJkjitivjK5yxIp9eowVHOIXz6FGKFqi
         Mp33BnYfUt/UpFkg1KyqmCsc3CDawJVWglhBlV0vqFDjNuIsKzeyJlSiqYMEDZ6Ejzw6
         5Wrw==
X-Forwarded-Encrypted: i=1; AJvYcCUzf609SezP4Nlnq1nquSDW5CmKDxohOPgtDi+tLYHZ3s7rx7woMZ20PjhebWdvOp2q7F0yF4Ur2PLHCeOZD0hdxJoq/iha2zJyX+sit8w=
X-Gm-Message-State: AOJu0YzZQ2PKE8p5DmQM8M3yxQgN0CMwiL+EvFtsoWuOmv1Knd2k08Fh
	x3SCnzWgfcDXcyanZQkn8hSE9jcQJKH76WnwKqxn/V9uFblgOuL+
X-Google-Smtp-Source: AGHT+IGGrLCLUalZh5FXkxk5v8rCa/dsNJpHGzP01hX5hyvYdY14iP46Xrzr7GSxpHaLyODrTQzICA==
X-Received: by 2002:a17:906:7110:b0:a59:a18e:3fd9 with SMTP id a640c23a62f3a-a5a2d54c365mr720666766b.5.1715677539982;
        Tue, 14 May 2024 02:05:39 -0700 (PDT)
Message-ID: <7084e5635fc52be7add2f67cdbdd335cad618f7d.camel@gmail.com>
Subject: Re: [RFC PATCH v2 0/5] Add bridge VLAN support
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Leigh Brown
 <leigh@solinno.co.uk>,  xen-devel@lists.xenproject.org
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	 <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 May 2024 11:05:39 +0200
In-Reply-To: <f5300cd1-4200-4957-9e4b-9ba0c1f40fa2@citrix.com>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
	 <f5300cd1-4200-4957-9e4b-9ba0c1f40fa2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-09 at 16:53 +0100, Andrew Cooper wrote:
> On 08/05/2024 10:38 pm, Leigh Brown wrote:
> > Hello all,
> >=20
> > I realised over the weekend that there is a valid use case for
> > providing
> > a VIF to a domain that has access to multiple VLANs, e.g. a router.
> > Yes,
> > you can create a VIF per VLAN, but if you start having several
> > VLANs (as
> > I do), it would be nicer to create a single interface that has
> > access to
> > all the relevant VLANs (e.g. enX0.10, enX0.20, etc.).
> >=20
> > So, version 2 changes the name and type of the parameter from an
> > integer
> > called `vid' to a string called `vlan'. The vlan parameter is then
> > parsed by the vif-bridge script (actually, the functions called by
> > it in
> > xen-network-common.sh).
> >=20
> > As it quite a common practice to allocate VLANs in round numbers, I
> > also
> > implemented the ability to specify contiguous or non-contiguous
> > ranges.
> > You can specify whether a VLAN is tagged or untagged, and which
> > VLAN is
> > the PVID (only one PVID is allowed).=C2=A0 For example,
> >=20
> > vif =3D [ 'mac=3Dxx:xx:xx:xx:xx:xx, bridge=3Dbr0, vlan=3D10p/20-29' ]
> >=20
> > will setup the VIF so that 10 is the PVID and VLAN IDs 20 through
> > 29
> > are permitted with tags. Another example:
> >=20
> > vif =3D [ 'mac=3Dxx:xx:xx:xx:xx:xx, bridge=3Dbr0, vlan=3D1p/10+10x9' ]
> >=20
> > will setup the bridge to set 1 as the PVID and permit access with
> > tags for VLAN IDs 10, 20, 30, 40, 50, 60, 70, 80 and 90.
> >=20
> > This patch set enables this capability as follows:
> >=20
> > 1. Adds `vlan' as a new member of the libxl_device_nic structure;
> > 2. Adds support to read and write the vlan parameter from the
> > xenstore;
> > 3. Adds `vlan' as a new keyword for the vif configuration option;
> > 4. Adds support to assign the bridge VLANs in the Linux hotplug
> > scripts;
> > 5. Updated xl-network-configuration(5) manpage and example configs.
> >=20
> > Original blurb below:
> >=20
> > For many years I have been configuring VLANs on my Linux Dom0 by
> > creating VLAN interfaces for each VLAN I wanted to connect a domain
> > to and then a corresponding bridge. So I would tend to have things
> > like:
> >=20
> > enp0s0=C2=A0=C2=A0=C2=A0 -> br0=C2=A0=C2=A0=C2=A0=C2=A0 -> vif1, vif2
> > enp0s0.10 -> br0vl10 -> vif3, vif4
> > enp0s0.20 -> br0vl20 -> vif5
> > dummy0=C2=A0=C2=A0=C2=A0 -> br1=C2=A0=C2=A0=C2=A0=C2=A0 -> vif6
> >=20
> > I recently discovered that iproute2 supports creating bridge VLANs
> > that
> > allows you to assign a VLAN to each of the interfaces associated to
> > a
> > bridge. This allows a greatly simplified configuration where a
> > single
> > bridge can support all the domains, and the iproute2 bridge command
> > can
> > assign each VIF to the required VLAN.=C2=A0 This looks like this:
> >=20
> > # bridge vlan
> > port=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 vlan-id=C2=A0=20
> > enp0s0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1 PVID Egress Untagged
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20
> > br0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1 PVID Egress Untagged
> > vif1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1 PVID Egress Untagged
> > vif2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1 PVID Egress Untagged
> > vif3.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 10 PVID Egress Untagged
> > vif4.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 10 PVID Egress Untagged
> > vif5.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 20 PVID Egress Untagged
> > vif6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 30 PVID Egress Untagged
> >=20
> > This patch set enables this capability as follows:
> >=20
> > 1. Adds `vid' as a new member of the libxl_device_nic structure;
> > 2. Adds support to read and write vid from the xenstore;
> > 3. Adds `vid' as a new keyword for the vif configuration option;
> > 4. Adds support for assign the bridge VLAN in the Linux hotplug
> > scripts.
> >=20
> > I don't believe NetBSD or FreeBSD support this capability, but if
> > they
> > do please point me in the direction of some documentation and/or
> > examples.
> >=20
> > NB: I'm not very familiar with Xen code base so may have missed
> > something important, although I have tested it and it is working
> > well
> > for me.
> >=20
> > Cheers,
> >=20
> > Leigh.
> >=20
> >=20
> > Leigh Brown (5):
> > =C2=A0 tools/libs/light: Add vlan field to libxl_device_nic
> > =C2=A0 tools/xl: add vlan keyword to vif option
> > =C2=A0 tools/hotplug/Linux: Add bridge VLAN support
> > =C2=A0 docs/man: document VIF vlan keyword
> > =C2=A0 tools/examples: Example Linux bridge VLAN config
> >=20
> > =C2=A0docs/man/xl-network-configuration.5.pod.in=C2=A0=C2=A0=C2=A0 |=C2=
=A0 38 ++++++
> > =C2=A0tools/examples/linux-bridge-vlan/README=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 68 +++++++++++
> > =C2=A0tools/examples/linux-bridge-vlan/br0.netdev=C2=A0=C2=A0 |=C2=A0=
=C2=A0 7 ++
> > =C2=A0tools/examples/linux-bridge-vlan/br0.network=C2=A0 |=C2=A0=C2=A0 =
8 ++
> > =C2=A0.../examples/linux-bridge-vlan/enp0s0.network |=C2=A0 16 +++
> > =C2=A0tools/hotplug/Linux/xen-network-common.sh=C2=A0=C2=A0=C2=A0=C2=A0=
 | 111
> > ++++++++++++++++++
> > =C2=A0tools/libs/light/libxl_nic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
10 ++
> > =C2=A0tools/libs/light/libxl_types.idl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0tools/xl/xl_parse.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A09 files changed, 261 insertions(+)
> > =C2=A0create mode 100644 tools/examples/linux-bridge-vlan/README
> > =C2=A0create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
> > =C2=A0create mode 100644 tools/examples/linux-bridge-vlan/br0.network
> > =C2=A0create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.networ=
k
> >=20
>=20
> This is past the last-post date, so Oleksii will need to decide
> whether
> he's happy to make an exception for it.
We also have Feature Freeze this week. But if maintainers think they
have additional/enough time for reviewing this patch series then we can
consider to have in Xen 4.19.

~ Oleksii

>=20
> Anthony is OoO for a month now, so if this is to get in for 4.19,
> then
> it will need reviewing by others.=C2=A0 I've CC'd a few plausible
> candidates...
>=20
> ~Andrew


