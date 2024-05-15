Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555168C5E7D
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 02:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721847.1125538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s72yd-0005Ha-CO; Wed, 15 May 2024 00:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721847.1125538; Wed, 15 May 2024 00:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s72yd-0005Fa-9m; Wed, 15 May 2024 00:58:39 +0000
Received: by outflank-mailman (input) for mailman id 721847;
 Wed, 15 May 2024 00:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DUSJ=MS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s72yc-0005FN-Ex
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 00:58:38 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 430cdcba-1256-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 02:58:37 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5731ffcc905so1083403a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 17:58:37 -0700 (PDT)
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
X-Inumbo-ID: 430cdcba-1256-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715734717; x=1716339517; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMaRqChvg6ywj2luDw1uwT8qy9H7hw8ShNEFLXpsHR0=;
        b=KMcSerrE+kEHIqC1zAqGB8vfhK+cXsrWJOZlOtlyRg5QaxaymbwKjMaGgceUhOXOS3
         XivawL8OrpNw7UwtsEQzmIxN8FMAYjwNk9lq4ht02/iozwrPxzmkPfvLqSGpyPRXN4Ti
         tuk+0VzYuHT7IDtgb4O6/h7wftTeRks6Z24BSFi5awj12+xqeAVXwR7Ldq/XxjXkXCw5
         DGGGJ4t3eoAXoz4IE9iDK/TaCFvpn5t1yN8bzsno1uYcs5mZNo44Uw7KACE9IxsglfXw
         kDuvC9GsFkdBRKDpZgSiY1kV9TY1uGcAwTjbcp+9OmXFclYoeX2rz1tf5yExmabYc8N2
         XdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715734717; x=1716339517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMaRqChvg6ywj2luDw1uwT8qy9H7hw8ShNEFLXpsHR0=;
        b=E6BWyYilrYu5OqcG09kvn1PiDq+qpEh1aLOelSmobkN+qauSt3q+qml8xCFA63/ely
         sotKvt91LZQ0LMuRz45xRYepgcRyG+UCEs6cLe+sPdhAMuN9pcDh3xmBTs1VZ9K1sYbg
         Nw12YgQA2UvHbogbx27dO2EgaL73kWl5zz0dtcvxU95cizl6wMwGxxkY/dte8OPUCfpz
         9SwKV6s833rIahQXXJouHpK0T7SQ/p1rHip0LCpwUB9dnDrv/x/J6PkD9nMjyuTycTWT
         mk06SN0lGTbnMpld+SXs3vIZ9iCF5YHQ2ZppO7rSbsZwkF7I0xZ/hkETu2tNViSdsUmT
         H9JQ==
X-Gm-Message-State: AOJu0YxJVByEICjaYCW2NiBMWO4MsY7CH/eoJS12oI2f+jfjp/msdsx4
	MZ2A8hpr7W1pZxZK30ORZtIRKMERbIKkyPOZw1mCiTjp9Of/xeYLHbhW6+IN4q2vFdJBqwmngxQ
	BCn06cHmh6REkyWYFA7qq7JmHIFch/A==
X-Google-Smtp-Source: AGHT+IEdQpDwy8m9i2Rd8tGtRXIifUwAfX7QnVY9yK1Y8SXbL3W7WPFgjhJCNzD+XdNm7QJxeVHETSVmTP2ze5U1ucE=
X-Received: by 2002:a50:ccdd:0:b0:574:eb22:3629 with SMTP id
 4fb4d7f45d1cf-574eb223677mr1734724a12.19.1715734717001; Tue, 14 May 2024
 17:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240508213824.55824-1-leigh@solinno.co.uk> <20240508213824.55824-6-leigh@solinno.co.uk>
In-Reply-To: <20240508213824.55824-6-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 May 2024 20:58:25 -0400
Message-ID: <CAKf6xpt+UTwY0hFuODhpeb6rWOB0kgbqrrFVprP7MZYOTJ59YA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] tools/examples: Example Linux bridge VLAN config
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 6:08=E2=80=AFPM Leigh Brown <leigh@solinno.co.uk> wr=
ote:>
> Add a new directory linux-bridge-vlan with examples files showing
> how to configure systemd-networkd to support a bridge VLAN
> configuration.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> ---
>  tools/examples/linux-bridge-vlan/README       | 68 +++++++++++++++++++
>  tools/examples/linux-bridge-vlan/br0.netdev   |  7 ++
>  tools/examples/linux-bridge-vlan/br0.network  |  8 +++
>  .../examples/linux-bridge-vlan/enp0s0.network | 16 +++++
>  4 files changed, 99 insertions(+)
>  create mode 100644 tools/examples/linux-bridge-vlan/README
>  create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
>  create mode 100644 tools/examples/linux-bridge-vlan/br0.network
>  create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.network

I think putting these in docs/misc/linux-bridge-vlan/ might be a
better location.

> diff --git a/tools/examples/linux-bridge-vlan/README b/tools/examples/lin=
ux-bridge-vlan/README
> new file mode 100644
> index 0000000000..83b9fa3fd6
> --- /dev/null
> +++ b/tools/examples/linux-bridge-vlan/README
> @@ -0,0 +1,68 @@
> +Linux Xen Dom0 single bridge multiple VLAN configuration with systemd
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +This directory contains example files to be placed in /etc/systemd/netwo=
rk
> +to enable a single bridge with multiple VLAN support.
> +
> +The example is to support the scenario where the Xen host network interf=
ace
> +is connected to an Ethernet switch configured as a trunk port. Each doma=
in
> +VIF can then be configured with one or more VLAN IDs, one of which will =
be
> +the PVID.
> +
> +The example files create a bridge device called br0, with a physical int=
erface
> +called enp0s0. You will need to update this with your system's device na=
me.
> +
> +Key points of the configuration are:
> +
> +1. In br0.netdev, VLANFiltering=3Don is set. This is required to ensure =
the
> +   VLAN tags are handled correctly.  If it is not set then the packets
> +   from the VIF interfaces will not have the correct VLAN tags set.
> +
> +2. In br0.network, a system IPv4 address is configured that can be updat=
ed
> +   according to your local network settings.
> +
> +3. In enp0s0.network, Bridge=3Dbr0 sets the bridge device to connect to.=
 There
> +   is also a [BridgeVLAN] section for each VLAN you want to give access
> +   to the switch. Note, if you want to create an internal VLAN private t=
o

For
"for each VLAN you want to give access to the switch"
do you mean:
"for each VLAN you want connected with the external network"
or
"for each VLAN you want accessible on the external network"
?

The "access to the switch" part I find unclear.

> +   the host, do not include its VLAN ID in this file.


> +Domain configuration
> +--------------------
> +
> +Add the vlan=3D keyword to the vif definition in the domain. The simples=
t
> +and most common example is a domain that wishes to connect to a single V=
LAN:
> +
> +vif =3D [ 'mac=3Dxx:xx:xx:xx:xx:xx, bridge=3Dbr0, vlan=3D10' ]
> +
> +If you wish to configure a domain to route between two VLANs, you have t=
wo
> +options. Option 1 is to create multiple interfaces on different VLANs:
> +
> +vif =3D [ 'mac=3Dxx:xx:xx:xx:xx:xx, bridge=3Dbr0, vlan=3D10',
> +       'max=3Dxx:xx:xx:xx:xx:xx, bridge=3Dbr0, vlan=3D20' ]

Hard tab here makes the diff look off, but the file would be aligned.

I think this is good content.  I'm not familiar with the systemd
networking stuff to give an R-b.  But it's only examples, so I think
it should be okay.  I'm not a maintainer, but it would be an Acked-by,
if I were.

Regards,
Jason

