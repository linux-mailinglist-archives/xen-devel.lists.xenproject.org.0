Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339CB91A56C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 13:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749974.1158218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnOY-0001K7-Ao; Thu, 27 Jun 2024 11:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749974.1158218; Thu, 27 Jun 2024 11:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMnOY-0001HN-7h; Thu, 27 Jun 2024 11:34:30 +0000
Received: by outflank-mailman (input) for mailman id 749974;
 Thu, 27 Jun 2024 11:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMnOX-0001HH-3o
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 11:34:29 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c3620a-3479-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 13:34:27 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a729d9d7086so90288366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 04:34:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d71f71asm51274866b.66.2024.06.27.04.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 04:34:25 -0700 (PDT)
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
X-Inumbo-ID: 35c3620a-3479-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719488066; x=1720092866; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OpMZ0gh5qeWEIlYr+BaukSY2eykuaBjOr8afxKaYY9w=;
        b=ZTopwcc1sHu/O/ASwMRBQQuhYLFJwSagtGNDLnYHS9cKw2PMaHZO40tOJ3MlbACb1W
         Y6xSzb11nGnWY4XaXBURmHi8p385gSDa7/8TSDpB9hPfDMbGxtjA+J4s+5UCAwkCuCRF
         kkNuROPJ+T4RFHWOYwoO85DRq5P3206vanDoesYM2IGaNGe1uQ1tFvsvs6ClkcwvrwB9
         b37BWprNrOH7UKpg75obq8MqYFCqauF3ZxsR1D0JS5U41+17caqbgGxVdrkYVBxk/3Yy
         gN03mxAIJznCCZLjkgMmmGZ81oo6wP5UIJHO5lwsPgm6J87TocfnfJPZI8Rb/IcLJiQK
         ltLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488066; x=1720092866;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpMZ0gh5qeWEIlYr+BaukSY2eykuaBjOr8afxKaYY9w=;
        b=wslVjV5XvoMdoO/LnsitOKoUrsQ44rO+tg4sLIruUvJ45ySUFUdUXswbdeLUgZQTjh
         tnuaY0AKglQlj4BuZVWGh5afzXoaFmyBHSpvDh0pC/1pqp6OaEWPSmhbNJBzANwIGyfx
         zRRMcDrYc+XXAB6kzQGKpOIP/dv4xdCNukkrL3VvOK2/oAL9adGnjVjnndx36ncY2NJa
         sk8Xk8V0hk4lPRL2LeqAU/3HFFwWVcDRahqCIMmjWtfTLXiXbA9ORUJVjPvkOSA+M9nl
         8VYK4j4dL/8xhx0di0GaraHnIPNiN4nk+RfGEzowNH0OzwJMoExPG3U94XYw6unKYwvJ
         fEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWZxyeOb9MnaPZcQ1Zn+JSG1G7LY4hyAG+v4gcI+QP49fS9TkOwYy4JPvGhinCU1SaktXA13+hMfE+ZHZNJjdVEa35Zc2k2bxGw0YA4QXg=
X-Gm-Message-State: AOJu0YxMSIImHeRmvOnjulfT8iF/GO19CwU2WVHyXM3nKUPMueaHf8qg
	8rCPBq2lY8UL0oZHvaVtIjIuaAOi8rTvFVsFOnPbjhX9ke1QIdeT
X-Google-Smtp-Source: AGHT+IH092yTQb2N1OMooCR3i+gNCPso3B0H251H9XjUfUbLgB4+yEPGweF4hq8CCZYinPD94GRZ9w==
X-Received: by 2002:a17:907:c717:b0:a72:6fc3:9941 with SMTP id a640c23a62f3a-a7296f5d198mr244027266b.16.1719488066247;
        Thu, 27 Jun 2024 04:34:26 -0700 (PDT)
Message-ID: <b73924b47f02d66a12b421b21d959ad7bae389b5.camel@gmail.com>
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory
 node probing
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Thu, 27 Jun 2024 13:34:24 +0200
In-Reply-To: <ae447b0b-f791-4ca8-8b33-3600ae059b47@xen.org>
References: <20240626080428.18480-1-michal.orzel@amd.com>
	 <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
	 <b5c861a4-1431-44c5-a1ec-bc859ea011c3@amd.com>
	 <ae447b0b-f791-4ca8-8b33-3600ae059b47@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-06-27 at 11:32 +0100, Julien Grall wrote:
>=20
>=20
> On 27/06/2024 08:40, Michal Orzel wrote:
> > Hi Julien,
> >=20
> > On 26/06/2024 22:13, Julien Grall wrote:
> > >=20
> > >=20
> > > Hi Michal,
> > >=20
> > > On 26/06/2024 09:04, Michal Orzel wrote:
> > > > Memory node probing is done as part of early_scan_node() that
> > > > is called
> > > > for each node with depth >=3D 1 (root node is at depth 0).
> > > > According to
> > > > Devicetree Specification v0.4, chapter 3.4, /memory node can
> > > > only exists
> > > > as a top level node. However, Xen incorrectly considers all the
> > > > nodes with
> > > > unit node name "memory" as RAM. This buggy behavior can result
> > > > in a
> > > > failure if there are other nodes in the device tree (at depth
> > > > >=3D 2) with
> > > > "memory" as unit node name. An example can be a "memory@xxx"
> > > > node under
> > > > /reserved-memory. Fix it by introducing
> > > > device_tree_is_memory_node() to
> > > > perform all the required checks to assess if a node is a proper
> > > > /memory
> > > > node.
> > > >=20
> > > > Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM
> > > > location and size")
> > > > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > > > ---
> > > > 4.19: This patch is fixing a possible early boot Xen failure
> > > > (before main
> > > > console is initialized). In my case it results in a warning
> > > > "Shattering
> > > > superpage is not supported" and panic "Unable to setup the
> > > > directmap mappings".
> > > >=20
> > > > If this is too late for this patch to go in, we can backport it
> > > > after the tree
> > > > re-opens.
> > >=20
> > > The code looks correct to me, but I am not sure about merging it
> > > to 4.19.
> > >=20
> > > This is not a new bug (in fact has been there since pretty much
> > > Xen on
> > > Arm was created) and we haven't seen any report until today. So
> > > in some
> > > way it would be best to merge it after 4.19 so it can get more
> > > testing.
> > >=20
> > > In the other hand, I guess this will block you. Is this a new
> > > platform?
> > > Is it available?
> > Stefano answered this question. Also, IMO this change is quite
> > straightforward
> > and does not introduce any engineering doubt, so I'm not really
> > sure if it needs
> > more testing.
>=20
> At this stage of the release we should think whether the bug is
> critical=20
> enough (rather than the risk is low enough) to be merged. IMHO, it is
> not because this has been there for the past 12 years...
>=20
> But if we focus on the "riskness". We are rightly changing an
> interface=20
> which possibly someone may have (bogusly) relied on. So there is a=20
> lowish risk that you may end up to break use-case late in the release
> (we are a couple of weeks away) for use-case that never worked in the
> past 12 years.
>=20
> We should also think what the worse that can happen if there is a bug
> in=20
> your series. The worse is we would not be able to boot on already=20
> supported platform. This would be quite a bad regression this late in
> the release. For Device-Tree parsing, I don't think it is enough to
> just=20
> test on just a handful of platforms this late in the release.
>=20
> Which is why to me the answer to "It should be in 4.19" is not=20
> straightforward. If we merge post 4.19, then we give the chance to=20
> people to test, update & adjust their setup if needed.
>=20
> Anyway, ultimately this is Oleksii's decision as the release manager.
I agree with Julien, it would be better to postpone this patch series
until 4.20 branching.

~ Oleksii

>=20
> [...]
>=20
> > > > +/*
> > > > + * Check if a node is a proper /memory node according to
> > > > Devicetree
> > > > + * Specification v0.4, chapter 3.4.
> > > > + */
> > > > +static bool __init device_tree_is_memory_node(const void *fdt,
> > > > int node,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int depth)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 const char *type;
> > > > +=C2=A0=C2=A0=C2=A0 int len;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( depth !=3D 1 )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( !device_tree_node_matches(fdt, node, "memo=
ry") )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 type =3D fdt_getprop(fdt, node, "device_type", =
&len);
> > > > +=C2=A0=C2=A0=C2=A0 if ( !type )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( (len <=3D 0) || strcmp(type, "memory") )
> > >=20
> > > I would consider to use strncmp() to avoid relying on the
> > > property to be
> > > well-formed (i.e. nul-terminated).
> > Are you sure? AFAIR, libfdt returns NULL and -FDT_ERR_TRUNCATED as
> > len if a string is non null terminated.
>=20
> I can't find such code in path. Do you have any pointer?
>=20
> > Also, let's suppose it is somehow not terminated. In that case how
> > could libfdt set len to be > 0?
>=20
> The FDT will store the length of the property otherwise you would not
> be=20
> able to encode property that are just a list of cells (i.e. numbers).
>=20
> > It needs to know where is the end of the string to calculate the
> > length.
>=20
> For the name and the description, it is unclear to why would=20
> fdt_getprop() would only work for string property.
>=20
> Cheers,
>=20


