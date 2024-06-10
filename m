Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE0901D06
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 10:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737039.1143151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaUJ-0006lz-2Z; Mon, 10 Jun 2024 08:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737039.1143151; Mon, 10 Jun 2024 08:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaUI-0006io-VN; Mon, 10 Jun 2024 08:34:46 +0000
Received: by outflank-mailman (input) for mailman id 737039;
 Mon, 10 Jun 2024 08:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruA2=NM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sGaUH-0006ii-G6
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 08:34:45 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49891480-2704-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 10:34:44 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso416198266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 01:34:44 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c805cc764sm605803266b.76.2024.06.10.01.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 01:34:42 -0700 (PDT)
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
X-Inumbo-ID: 49891480-2704-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718008483; x=1718613283; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FqPUijVzLO/kkuZ31y7nw3TyhqDSp+Y8LEwyr2uuO/g=;
        b=VNysWOs8h4zquLUxS8IGNyVuG+YZaPO+Ob3Knn3mSTem0G5w89GKEH5ZOnOrlhs79u
         Q27HczDXBqkX3M5RhMhvSkmdpcn0Gl/sxJfOTmk8l5yaCS3mLEuZxrY3ZehOZZih0gSJ
         MRfo29+EJ8S87o5jDsvpsIHEXAgPWEmk/TQvk/Tejtb9tHhNo/eCrVCptLw0qsug08Vk
         uHvZN8cqf/KE7nUwROwoW1jJ5EIhYWdZTSpRUyNptsx7FTM2CeOyNC2Sdw5bQEdmpQwV
         nk0wce3qqySXg6f1ePBs1flvLLyuV5izSH6uVoHafcCQU9qaGFe4OOmHx98FrDqJgxp/
         jeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008483; x=1718613283;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FqPUijVzLO/kkuZ31y7nw3TyhqDSp+Y8LEwyr2uuO/g=;
        b=m2dbZK3IIW7JUwJXuQEh6Ej85dus7y/LHuUcVihUJHgxhSVQ3bzXgR7aAOcwHodD2y
         lXUs9eNn/O8/3SAc8nicCj6jeOYZpgtoo4d43bQSzQ30UdmpLu4QNhRsBthRhlsgXCYz
         4q56V7wLe1RG/BkXhjmKiZIt7Gb0b3DEgF84hK7aMD/8ldd5ddKHxCbGpV8LkfAzr7JB
         R50SsslomKGHaNWx7XahDYxZTHaMSiChGyNtCS8aEz7A3h+gCZyGf9JgltMtbv9zEP31
         xA67tHu5hICICN3664PHYu9xrdadF8bkVaiaQ0s0066fbJPJPxkDqxadWG03h2Gf0iVa
         IvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX5vNGwrrl1xbeekO8vDgXs31Fv1KvdNFi385XeI/gjMXcS30I3fCkPhbrn9ngx0u+1en1BC9cVOrEQ7s+D+0FNk6ofBIRCYnWQUFDO9I=
X-Gm-Message-State: AOJu0Yz2Qfo6E6F1C1dkoXy6wOInpSu9m0a9N3DcH6CwDvkrrfH9s42G
	O3Qa5EMg8P7yxSPqjFT1DtW4i8rqJ7ByXOahZscFdCed8o/7V8IF
X-Google-Smtp-Source: AGHT+IH3W+CLY/uNaCTiMr1Pz4aIqkvvN9/0K3WknXtXbu+B2QtXiDRCmmZQujKuO2SqP8BHy0rXeQ==
X-Received: by 2002:a17:907:86a4:b0:a6f:1727:cf4b with SMTP id a640c23a62f3a-a6f1727d4dbmr229189166b.23.1718008483202;
        Mon, 10 Jun 2024 01:34:43 -0700 (PDT)
Message-ID: <d53485f2dd22ae73102311eb582187c911e6be5c.camel@gmail.com>
Subject: Re: [PATCH for-4.19] x86/pvh: declare PVH dom0 supported with
 caveats
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Mon, 10 Jun 2024 10:34:42 +0200
In-Reply-To: <20240607100320.11723-1-roger.pau@citrix.com>
References: <20240607100320.11723-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-06-07 at 12:03 +0200, Roger Pau Monne wrote:
> PVH dom0 is functionally very similar to PVH domU except for the
> domain
> builder and the added set of hypercalls available to it.
>=20
> The main concern with declaring it "Supported" is the lack of some
> features
> when compared to classic PV dom0, hence switch it's status to
> supported with
> caveats.=C2=A0 List the known missing features, there might be more
> features missing
> or not working as expected apart from the ones listed.
>=20
> Note there's some (limited) PVH dom0 testing on both osstest and
> gitlab.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> Hopefully this will attract more testing an resources to PVH dom0 in
> order to
> try to finish the missing features.
> ---
> =C2=A0CHANGELOG.md |=C2=A0 1 +
> =C2=A0SUPPORT.md=C2=A0=C2=A0 | 15 ++++++++++++++-
> =C2=A02 files changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 201478aa1c0e..1778419cae64 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0=C2=A0=C2=A0 - HVM PIRQs are disabled by default.
> =C2=A0=C2=A0=C2=A0 - Reduce IOMMU setup time for hardware domain.
> =C2=A0=C2=A0=C2=A0 - Allow HVM/PVH domains to map foreign pages.
> +=C2=A0=C2=A0 - Declare PVH dom0 supported with caveats.
> =C2=A0 - xl/libxl configures vkb=3D[] for HVM domains with priority over
> vkb_device.
> =C2=A0 - Increase the maximum number of CPUs Xen can be built for from
> 4095 to
> =C2=A0=C2=A0=C2=A0 16383.
> diff --git a/SUPPORT.md b/SUPPORT.md
> index d5d60c62ec11..711aacf34662 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -161,7 +161,20 @@ Requires hardware virtualisation support (Intel
> VMX / AMD SVM).
> =C2=A0Dom0 support requires an IOMMU (Intel VT-d / AMD IOMMU).
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 Status, domU: Supported
> -=C2=A0=C2=A0=C2=A0 Status, dom0: Experimental
> +=C2=A0=C2=A0=C2=A0 Status, dom0: Supported, with caveats
> +
> +PVH dom0 hasn't received the same test coverage as PV dom0, so it
> can exhibit
> +unexpected behavior or issues on some hardware.
> +
> +At least the following features are missing on a PVH dom0:
> +
> +=C2=A0 * PCI SR-IOV and Resizable BARs.
> +
> +=C2=A0 * Native NMI forwarding (nmi=3Ddom0 command line option).
> +
> +=C2=A0 * MCE handling.
> +
> +=C2=A0 * PCI Passthrough to any kind of domUs.
> =C2=A0
> =C2=A0### ARM
> =C2=A0


