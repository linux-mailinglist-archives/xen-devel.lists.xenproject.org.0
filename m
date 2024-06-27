Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D291A312
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749913.1158155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMloh-0000Gi-Rw; Thu, 27 Jun 2024 09:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749913.1158155; Thu, 27 Jun 2024 09:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMloh-0000Ei-PI; Thu, 27 Jun 2024 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 749913;
 Thu, 27 Jun 2024 09:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMlog-0000Ec-3T
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:53:22 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15b10aac-346b-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 11:53:20 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a724a8097deso602448266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:53:20 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d71f0edsm43428766b.56.2024.06.27.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:53:19 -0700 (PDT)
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
X-Inumbo-ID: 15b10aac-346b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719482000; x=1720086800; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bcr1yJ7a2WCNZUKDkRcKjzNKgK58hiCPwjTTdezfQtU=;
        b=JLg/yEbwryOt3OUxBHo1rZr/b9VMo9qB1/w7gjbsaP1sfGfV3mthDZNQfyDYtXlmx6
         uifwdZMwlKweVB4FyP0IgLAu0oguswgs7ch2tL0M8PCIiFLD+LwdWRTuHu1d3EWU2ir4
         aReYACeoZ/I8zpCUgB87bSyo85e4TBylShnJH2VHISmF/RGpEmDojvovrqxGnk8MYZXs
         MW5iqqIKfgLi1b8zDEUjGRaZMhBDd6rptsNxRIY3g/UDkHvaCWCCiap5jV2QBczItlj1
         BMLawq2Dzz+RSbI0JSczlMnI5Bsc3nUKEvdh18ZbvJrfVS4oQYkjtTW2oJ1nRhWnE3jr
         dAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719482000; x=1720086800;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcr1yJ7a2WCNZUKDkRcKjzNKgK58hiCPwjTTdezfQtU=;
        b=XTn1JtwN1d9Epta8jvJXvHX+itXeiJdN9iUU0LyIVyEv4K2DKadZKDw5qLyLMof0hK
         XvRHgx/oc6Dsq0SXW3YYCvL0wGDB+lRZ4/DfC8j4jiTqfmQI8j1CBUE3kUoNzeNKDxYI
         o/8ymZnA7MMyuRxNTp5fPnH2Nin230FmTO2DJswQPLhChdVrcAIU/8lGk/m8K94cJvxu
         G3kTvANpPtjlsWBfvqL+KaiDagBShPqlMelh+uh9bqVehdfS5/FJ/7a8LnXgLuYyVtHF
         IgV7z4OzrXUEpb336AHf7beOezBsvELt35Wb4nRUByVmeEXFxyoCZmPdSjQkWNl/Ib+C
         g7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8B5MRynUFnQB+Dhqf8N8M4bni1w1e/zeNxtDqREvl/ZdWebMIYoF2BquPa8TmVIfZU+qO4agIzNVnPNCRkmEBQNnBh8UDMBWsXgDaVww=
X-Gm-Message-State: AOJu0YzpFmxMyDOIfpIQYjn7lLhlZ42z7eZjacrAvznYKGIXu0XJL+ev
	B2UhLJdCHkraWnYmHsLcJPsxaQgkiUwX94HQgclRPvA03K27gCHt
X-Google-Smtp-Source: AGHT+IHzzbfeK9uFSs1OUR8SsEzlrDB4gNprNfrHCnL2/rTqGjR0qWkwgsfRRFeDy2O5agcPOOPkiA==
X-Received: by 2002:a17:906:6bc9:b0:a72:2cb0:fafe with SMTP id a640c23a62f3a-a7242e159camr753489766b.75.1719481999575;
        Thu, 27 Jun 2024 02:53:19 -0700 (PDT)
Message-ID: <bd0d5d46c8368a5f157ec79287a84320dae0c08b.camel@gmail.com>
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory
 node probing
From: oleksii.kurochko@gmail.com
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Date: Thu, 27 Jun 2024 11:53:18 +0200
In-Reply-To: <20240626080428.18480-1-michal.orzel@amd.com>
References: <20240626080428.18480-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-06-26 at 10:04 +0200, Michal Orzel wrote:
> Memory node probing is done as part of early_scan_node() that is
> called
> for each node with depth >=3D 1 (root node is at depth 0). According to
> Devicetree Specification v0.4, chapter 3.4, /memory node can only
> exists
> as a top level node. However, Xen incorrectly considers all the nodes
> with
> unit node name "memory" as RAM. This buggy behavior can result in a
> failure if there are other nodes in the device tree (at depth >=3D 2)
> with
> "memory" as unit node name. An example can be a "memory@xxx" node
> under
> /reserved-memory. Fix it by introducing device_tree_is_memory_node()
> to
> perform all the required checks to assess if a node is a proper
> /memory
> node.
>=20
> Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM
> location and size")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> 4.19: This patch is fixing a possible early boot Xen failure (before
> main
> console is initialized). In my case it results in a warning
> "Shattering
> superpage is not supported" and panic "Unable to setup the directmap
> mappings".
>=20
> If this is too late for this patch to go in, we can backport it after
> the tree
> re-opens.
So if we have a warning/panic and there is no random behaviour, I think
that it would be better to postpone until 4.20 branching.

~ Oleksii

> ---
> =C2=A0xen/arch/arm/bootfdt.c | 28 +++++++++++++++++++++++++++-
> =C2=A01 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 6e060111d95b..23c968e6955d 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -83,6 +83,32 @@ static bool __init
> device_tree_node_compatible(const void *fdt, int node,
> =C2=A0=C2=A0=C2=A0=C2=A0 return false;
> =C2=A0}
> =C2=A0
> +/*
> + * Check if a node is a proper /memory node according to Devicetree
> + * Specification v0.4, chapter 3.4.
> + */
> +static bool __init device_tree_is_memory_node(const void *fdt, int
> node,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int depth)
> +{
> +=C2=A0=C2=A0=C2=A0 const char *type;
> +=C2=A0=C2=A0=C2=A0 int len;
> +
> +=C2=A0=C2=A0=C2=A0 if ( depth !=3D 1 )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> +
> +=C2=A0=C2=A0=C2=A0 if ( !device_tree_node_matches(fdt, node, "memory") )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> +
> +=C2=A0=C2=A0=C2=A0 type =3D fdt_getprop(fdt, node, "device_type", &len);
> +=C2=A0=C2=A0=C2=A0 if ( !type )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> +
> +=C2=A0=C2=A0=C2=A0 if ( (len <=3D 0) || strcmp(type, "memory") )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> +
> +=C2=A0=C2=A0=C2=A0 return true;
> +}
> +
> =C2=A0void __init device_tree_get_reg(const __be32 **cell, uint32_t
> address_cells,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t size_cells, paddr_t =
*start,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t *size)
> @@ -448,7 +474,7 @@ static int __init early_scan_node(const void
> *fdt,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * populated. So we should skip the parsing=
.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( !efi_enabled(EFI_BOOT) &&
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_tree_node_matche=
s(fdt, node, "memory") )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_tree_is_memory_n=
ode(fdt, node, depth) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D process_memory_no=
de(fdt, node, name, depth,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address_cells, size_cel=
ls,
> bootinfo_get_mem());
> =C2=A0=C2=A0=C2=A0=C2=A0 else if ( depth =3D=3D 1 && !dt_node_cmp(name, "=
reserved-memory") )


