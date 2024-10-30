Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83EE9B6519
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 15:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828249.1243110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t69Gy-0004Fe-SK; Wed, 30 Oct 2024 14:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828249.1243110; Wed, 30 Oct 2024 14:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t69Gy-0004E9-O4; Wed, 30 Oct 2024 14:02:08 +0000
Received: by outflank-mailman (input) for mailman id 828249;
 Wed, 30 Oct 2024 14:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQZl=R2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t69Gx-0004E3-Sw
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 14:02:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b50b889-96c7-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 15:02:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a3dc089d8so997896966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 07:02:05 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f030193sm574756166b.85.2024.10.30.07.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 07:02:03 -0700 (PDT)
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
X-Inumbo-ID: 8b50b889-96c7-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhiNTBiODg5LTk2YzctMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjk2OTI1LjQzMzU0NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730296925; x=1730901725; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JpuJQu3WY5NY2VFFN/Lq923sjvm6BVgBvVt779RYlU=;
        b=ChQYtJSyaRMGDc1wbv8l5RqCmyuV2VqerRRRvmhwVnXaSU8fZwuA7liXmJyiECaVGi
         Kkf4kLS77ZazSe+pqGAXjXlMbQ9hhHPtig+/MdOccLzWXPfru85v9/+PtlxdOIbFnsO9
         LoMH6IHYdEXKGFX5EYZ1ZEoQq13ikhU/Rc0l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730296925; x=1730901725;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7JpuJQu3WY5NY2VFFN/Lq923sjvm6BVgBvVt779RYlU=;
        b=uc/fG5O4IC72nrmXMm3Xbs0JfCQ7lO+KZPC0E4AltjQmVnw2yEbSyz8NyHRxNrDImb
         bAx3OUvwS+SxNyGGjE7Rg9UyAGJKJ0iGRh0+BqXXDjXVOikegoh2cJEvEOa5tu9vYu8H
         AnVyjN9otD22wLLJK+ZiYdBFui81nYK+Pm4Nq/82mW3vYXF7F1hDUetvj8Mo3x9XvcaN
         8vgY07h/15p8jVewPtxO7aUbNYfpJ2f4aSF/64MPAlzavkrV8HxIb799oa1TcfYUnVeP
         xKPNnIq/9l1FOY83OZZ3zmbpDmc9NrvARWfnMmtd9/KNjh3OVgKX5z7qyaaCNeGdZ7Wf
         Rc9w==
X-Gm-Message-State: AOJu0YxYWQJF12U6D780EpuzSEePUhzQ/Pe5y/jmTz4G9zQ7dA8iJ4N/
	L8b0JfGLSDkTvtyW5BQvvxkgj/kGE+0w2H+u/75Pzkg9dArak/VK4u5/PRbWhhI=
X-Google-Smtp-Source: AGHT+IF0BzqBNmTq/ik/DYT9mv5KjvvIVP15Q32x0ucJH/CkWvJ7k3dPF+v6WLyb8pf8JA8vUAdO5w==
X-Received: by 2002:a17:907:96aa:b0:a8a:8cdb:83a7 with SMTP id a640c23a62f3a-a9de61eb56bmr1589566266b.54.1730296924396;
        Wed, 30 Oct 2024 07:02:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 14:02:02 +0000
Message-Id: <D5972GVM3YYS.FUTXSOS8C8D4@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Juergen Gross" <jgross@suse.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "Christian Lindig"
 <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>,
 "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 0/6] xen/abi: On wide bitfields inside primitive
 types
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Christian Lindig" <christian.lindig@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
 <D9462785-D2AF-4354-8B07-69413E952B88@cloud.com>
In-Reply-To: <D9462785-D2AF-4354-8B07-69413E952B88@cloud.com>

On Wed Oct 30, 2024 at 8:45 AM GMT, Christian Lindig wrote:
>
>
> > On 29 Oct 2024, at 18:16, Alejandro Vallejo <alejandro.vallejo@cloud.co=
m> wrote:
> >=20
> >=20
> > The invariant I'd like to (slowly) introduce and discuss is that fields=
 may
> > have bitflags (e.g: a packed array of booleans indexed by some enumerat=
ed
> > type), but not be mixed with wider fields in the same primitive type. T=
his
> > ensures any field containing an integer of any kind can be referred by =
pointer
> > and treated the same way as any other with regards to sizeof() and the =
like.
>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>

Thanks.

>
>
> Fine with me but the OCaml part is not very exposed to this.

Yeah, OCaml is pretty far from interacting with these details at all.
>
> =E2=80=94 C

Cheers,
Alejandro

