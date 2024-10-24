Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FC19AE58C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825221.1239408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xW8-0001PQ-KQ; Thu, 24 Oct 2024 13:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825221.1239408; Thu, 24 Oct 2024 13:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xW8-0001Nu-Ha; Thu, 24 Oct 2024 13:04:44 +0000
Received: by outflank-mailman (input) for mailman id 825221;
 Thu, 24 Oct 2024 13:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3xW7-0001No-As
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:04:43 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88bd249b-9208-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 15:04:42 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso118193666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:04:42 -0700 (PDT)
Received: from premium-test ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912f660dsm615303066b.80.2024.10.24.06.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:04:40 -0700 (PDT)
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
X-Inumbo-ID: 88bd249b-9208-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729775082; x=1730379882; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+6iW4O4E0YZl1jSwsSwmH2ZP34PDf0XgLs00HCSduc=;
        b=JFde8Lfnx3jZA7EgK1vNN01UrwFZQQPAmSp7Ixmd+jyygD+DpJk2IRC8cAEnO5I2P3
         IDUDfYbdVf7WWiqqHs6nCHNZi7oEdGGYartYMdK6eU3XnpHbVN+krdImteRuQZ2gr7ZK
         DYEQzTDPrpvUpqqnRk528pXtgn0Y+XmiMryFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729775082; x=1730379882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+6iW4O4E0YZl1jSwsSwmH2ZP34PDf0XgLs00HCSduc=;
        b=g5L8cerdJ+N4vj0QweewnPh61zEa85foNSUeNS6kh6hJVaTdfRQNnMVfPIVXc3/xLV
         H19mqP3yxnmG87oZvvdR4+Romt1NusudUGCjon3s+OUWcZuMtARsfnelv0Jj5t9Hnung
         kCFbG1SKTxNgFCeK2mUfHTDiv2md/aPD2ZonjfbzoOcf3317WSJ1dO0l2cpCq/d6p3cj
         iRvEDibqXxXtOxYaj2fNGPJkwCGUXmH00C2GXn9NJyYVessqT+LMpiJjJY71RLjqnwQ5
         Dtz9atEdtVAhvY9xmvbCpiJiK83p4I8MV7ClYWZ+7l4cNxRgL1FTK1kEQwVRgnUvHbL2
         gU5w==
X-Gm-Message-State: AOJu0Yz84gAUwbzRLzJ00uEVmvGS5451mr2WKpnp9qX3ZfbVzalDgGzQ
	VjNZ6mPnaZeUz/7KYM0dTx3W/bl05SIevA0e0ZfdqXsZMB0ii9hOv5QeJ4DkYxKT90F8E/vLIY1
	OuKI=
X-Google-Smtp-Source: AGHT+IFVqwhcUsc0UxY3X4eVoYgMHa1m9vy3+XbOIuxDRKWOKj9DTGlTVnM2b+peQad1SapCJOfnvw==
X-Received: by 2002:a17:907:7d92:b0:a9a:c691:dca0 with SMTP id a640c23a62f3a-a9ad2730557mr164772666b.23.1729775081147;
        Thu, 24 Oct 2024 06:04:41 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:04:39 +0100
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 2/6] CI: Refresh the Debian 12 x86_32 container
Message-ID: <3etcrrkyddpkeacuz5swu5s3ohytqwqf437y3evkg7t7neq3hz@nhgvjqvkeqnf>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <f542e8157d7fe419d7b274d749bffde086a28f32.1729760501.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f542e8157d7fe419d7b274d749bffde086a28f32.1729760501.git.javi.merino@cloud.com>

On Thu, Oct 24, 2024 at 11:04:17AM +0100, Javi Merino wrote:
> Rework the container to be non-root, use heredocs for readability, and
> use apt-get --no-install-recommends to keep the size down.  Rename the
> job to x86_32, to be consistent with XEN_TARGET_ARCH and the
> naming scheme of all the other CI jobs:
> ${VERSION}-${ARCH}-${BUILD_NAME}
> 
> Remove build dependencies for building QEMU, as we don't do it since
> e305256e69b1 ("CI: Stop building QEMU in general").
> 
> Remove build dependencies for the documentation as we don't have to
> build it for every single arch.
> 
> This reduces the size of the container from 2.22GB to 1.32Gb.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  automation/build/debian/12-x86_32.dockerfile  | 51 +++++++++++++++++++
>  .../build/debian/bookworm-i386.dockerfile     | 50 ------------------
>  automation/gitlab-ci/build.yaml               |  8 +--
>  automation/scripts/containerize               |  2 +-
>  4 files changed, 56 insertions(+), 55 deletions(-)
>  create mode 100644 automation/build/debian/12-x86_32.dockerfile
>  delete mode 100644 automation/build/debian/bookworm-i386.dockerfile
> 
> diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/12-x86_32.dockerfile
> new file mode 100644
> index 000000000000..d3c67a256212
> --- /dev/null
> +++ b/automation/build/debian/12-x86_32.dockerfile
> @@ -0,0 +1,51 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/i386 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root

This line shouldn't be here.  I forgot to remove it.  The container
has a USER line at the end to set it.

Cheers,
Javi

