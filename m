Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFDA94C161
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 17:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774396.1184848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc55Z-0003Tf-FP; Thu, 08 Aug 2024 15:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774396.1184848; Thu, 08 Aug 2024 15:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc55Z-0003PQ-BK; Thu, 08 Aug 2024 15:30:05 +0000
Received: by outflank-mailman (input) for mailman id 774396;
 Thu, 08 Aug 2024 15:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc55X-00035H-SA
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 15:30:03 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13ec76f8-559b-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 17:30:01 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so150677366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 08:30:01 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec6bb6sm750360366b.201.2024.08.08.08.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 08:30:00 -0700 (PDT)
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
X-Inumbo-ID: 13ec76f8-559b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723131001; x=1723735801; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6II2XuUSzJzY1eIGTebtiqD9vLiW5hEhnBosZCMU69o=;
        b=ER9Xyn6tp+j1ZhGBixY+B75fhQUhNUZtxugHlEdrvuBAnvbTtgj7GF4gOSbv3UXz8G
         C1xXOZC1SrNRrEcK7a0yncBiloNFeg9OKi/Gh8SizHhj7UqklMdAamWqqU6lgPzpYTEn
         YQtexOL0KIDWVVxA1oPS8KExsBSOxPiYnTXws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131001; x=1723735801;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6II2XuUSzJzY1eIGTebtiqD9vLiW5hEhnBosZCMU69o=;
        b=GtgA10+1v2olusuVCwoc53Xv8Fos2xiSTBZ9ad4iIL5rgfMjYAHG2HFPBDK/mOW0+9
         a+8bOIZ7Bu8f95O6wMEkov1QREz1B6wP5zTokWiRVmfjgcqzb5I5tSXdKt9ksGoTCh1w
         db2L5b8oQqape++yj02u/kmx7AweyKPBXWLfEErq+/4Pmkq67HjNsAS6vj4AzZqUeanP
         /2cnGGoGzqscbAPNu0XfcDqGG2aSo45NBs0W2Y3TtxsyMusmjZTMx81p2Yt9ywcBhSgD
         fPFnfI9g7SZNXUM1KRT1F/pfgB6CTl3w8wSv70aXJ/v18MidhCxooS9T2T/khBivJwIJ
         mygQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDIXwIukFInbI4KK3xfyMLWCybiM/Srsgu0MyI8oTRgujH+pdPIAiQb3rV9dtDGXKWvilCFHyhocFtW12x6NVegGTW3OjZRcKS/oKyY/0=
X-Gm-Message-State: AOJu0Yzu79jG3XW8Y3oioTpN9VgsfdmuWVNa4yUMUYkVpi7eqxYH8j7n
	2aEvUDVTfpDWz+QXUf8n76pK0mSWPuIxUNW5IEauyL2+nci5ua+/I/4Bdvs99Pg6olcvhEuu6g2
	G
X-Google-Smtp-Source: AGHT+IEPW0CRuzjQXw5mwmw9NI9xLnZ3FB9bysWfPiEFYo+6Q7lz7yKjLWWrCJ2IetNW1lgaP5663g==
X-Received: by 2002:a17:907:c7e0:b0:a7a:8876:4427 with SMTP id a640c23a62f3a-a8090c835d0mr158638166b.25.1723131000790;
        Thu, 08 Aug 2024 08:30:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Aug 2024 16:29:58 +0100
Message-Id: <D3AMYKSVBGFR.2IZRXPNCIUUIM@cloud.com>
Subject: Re: xen | Failed pipeline for staging | 08aacc39
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
X-Mailer: aerc 0.17.0
References: <66b4bd64b9733_2f15a5d3890299@gitlab-sidekiq-catchall-v2-754c69bc57-l5rxx.mail> <c655dbd9-046a-451a-a7e8-670a1eaf4ab0@suse.com>
In-Reply-To: <c655dbd9-046a-451a-a7e8-670a1eaf4ab0@suse.com>

On Thu Aug 8, 2024 at 2:02 PM BST, Jan Beulich wrote:
> On 08.08.2024 14:43, GitLab wrote:
> >=20
> >=20
> > Pipeline #1405649318 has failed!
> >=20
> > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits=
/staging )
> >=20
> > Commit: 08aacc39 ( https://gitlab.com/xen-project/hardware/xen/-/commit=
/08aacc392d86d4c7dbebdb5e664060ae2af72057 )
> > Commit Message: x86/emul: Fix misaligned IO breakpoint behaviou...
> > Commit Author: Matthew Barnes
> > Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> >=20
> >=20
> > Pipeline #1405649318 ( https://gitlab.com/xen-project/hardware/xen/-/pi=
pelines/1405649318 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich=
 )
> > had 4 failed jobs.
> >=20
> > Job #7535428747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/75=
35428747/raw )
> >=20
> > Stage: build
> > Name: qemu-system-aarch64-6.0.0-arm64-export
> > Job #7535428873 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/75=
35428873/raw )
> >=20
> > Stage: build
> > Name: alpine-3.18-gcc-debug-arm64-static-shared-mem
> > Job #7535428869 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/75=
35428869/raw )
> >=20
> > Stage: build
> > Name: alpine-3.18-gcc-debug-arm64-staticmem
> > Job #7535429434 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/75=
35429434/raw )
> >=20
> > Stage: test
> > Name: qemu-smoke-dom0less-arm32-gcc
>
> All Arm failures when the three commits under test only touch x86 code.
> How can that be? And Stefano, note how this would needlessly have blocked
> a merge request, if we were already using that model you're proposing to
> switch to.
>
> Jan

I'd argue it the other way around. It would (may?) have prevented reaching =
that
situation in the first place.

Cheers,
Alejandro

