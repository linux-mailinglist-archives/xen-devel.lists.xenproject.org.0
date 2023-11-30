Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF66D7FEF80
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 13:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644658.1006003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gTz-0005wG-Ru; Thu, 30 Nov 2023 12:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644658.1006003; Thu, 30 Nov 2023 12:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gTz-0005uS-Ow; Thu, 30 Nov 2023 12:49:31 +0000
Received: by outflank-mailman (input) for mailman id 644658;
 Thu, 30 Nov 2023 12:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Efh=HL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r8gTy-0005uM-Ne
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 12:49:30 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f5fac9-8f7e-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 13:49:29 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9c1e39defso11217971fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 04:49:29 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a2e99d5000000b002c9c45e0688sm133425ljj.86.2023.11.30.04.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 04:49:28 -0800 (PST)
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
X-Inumbo-ID: e6f5fac9-8f7e-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701348569; x=1701953369; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pelFkCWkANKAgxzCBZzrJd87zee7dkzFuPyezHllxD8=;
        b=Q5lxEhFQpz0slx0nxmF7IQDXC4wwA20f1oj/z32LcgN5C/o0ZoC4JgS4VUDMghtiIO
         OBt8sOvv43jLm8LWH9gh3qIX2sLjEsQjwEAa9P+ouKkTsj9TqdFyNEkLLFlVHEfzgC7i
         iORLDDDs3NPXD1i2rcgq99y91z3TSJa5f7+7W+OfaXEznAVj2IZ6HnNTEPiza+3yrOvi
         JCDyiGkBWfxqas3bz1OOfunDHCUiEL/CNMbevheP89CxdtGbtj79Ds/t58K9uA8AVPj4
         RT4mhuclre7WSDZLef9mRGBdF5V+do1DQvaR87YmXw3x/jwAgjJ/zolgn+Jr8Z9xjde7
         TcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701348569; x=1701953369;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pelFkCWkANKAgxzCBZzrJd87zee7dkzFuPyezHllxD8=;
        b=qMwtO3JdY2DkkaF7z0oUI4osEMXoiDl5YGav2MULA/2n26z5tsLMP7yV9Dz8rh8lsH
         En9Xq5c5zwQQKE0+ZgUVGSYXmgjq+dABcpvjNPeeFF2Cw+p0UA61RVLVAsZVEsKDhHQc
         PtJwVNtKTNtQSivkbZXOoiPVsmttaBM5j9DTMTW+vm8T6cE0i5R9SyXGnsWzSZHgK7xM
         /pWO3X8aHswcKKHO+7QJQIMm4mt85tlOOf9ldLMRA4ZfE1d1K6u5MWjCLMkDw+2R46sa
         WqcD5j+/8kDlDcdUmSkbPS2hqWq60rqy+Y0B5lwTapqBTZl524rbosMB2k8vxj0J6XzO
         byoA==
X-Gm-Message-State: AOJu0YwSRuc8l8A8XbyKUeH34FtOkamOiIsBTP1qipm1Wbm0cqrY4tMB
	3gH8rwCAT+fQ7y7pbXscIYM=
X-Google-Smtp-Source: AGHT+IFAqxlJ0k74M26aePoYyTZfey+amgflFihRpggajIqSWnW0dI8e7YzLXr9KqdkyN+X1z7iMTw==
X-Received: by 2002:a2e:9c51:0:b0:2c9:af1b:de5f with SMTP id t17-20020a2e9c51000000b002c9af1bde5fmr5319365ljj.37.1701348569274;
        Thu, 30 Nov 2023 04:49:29 -0800 (PST)
Message-ID: <91e6b2ddcb94263a7a9d3905704f4633a02815f2.camel@gmail.com>
Subject: Re: [PATCH v4 11/14] xen/asm-generic: introduce stub header numa.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Date: Thu, 30 Nov 2023 14:49:27 +0200
In-Reply-To: <2924be5a-cf1c-49ed-a69d-9fa32442ace2@raptorengineering.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <44bb374738ad0cae041a0164812dfd33d091d954.1701093907.git.oleksii.kurochko@gmail.com>
	 <2924be5a-cf1c-49ed-a69d-9fa32442ace2@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Wed, 2023-11-29 at 13:49 -0600, Shawn Anastasio wrote:
> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/arm/include/asm/numa.h b/xen/include/asm-
> > generic/numa.h
> > similarity index 76%
> > rename from xen/arch/arm/include/asm/numa.h
> > rename to xen/include/asm-generic/numa.h
> > index e2bee2bd82..b00fca4978 100644
> > --- a/xen/arch/arm/include/asm/numa.h
> > +++ b/xen/include/asm-generic/numa.h
> > @@ -1,12 +1,15 @@
> > -#ifndef __ARCH_ARM_NUMA_H
> > -#define __ARCH_ARM_NUMA_H
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_NUMA_H
> > +#define __ASM_GENERIC_NUMA_H
> > =C2=A0
> > -#include <xen/mm.h>
> > +#include <xen/stdint.h>
> > =C2=A0
> > -typedef u8 nodeid_t;
> > +typedef uint8_t nodeid_t;
> > =C2=A0
> > =C2=A0#ifndef CONFIG_NUMA
> > =C2=A0
> > +#include <xen/mm-frame.h>
> > +
> > =C2=A0/* Fake one node for now. See also node_online_map. */
> > =C2=A0#define cpu_to_node(cpu) 0
> > =C2=A0#define node_to_cpumask(node)=C2=A0=C2=A0 (cpu_online_map)
> > @@ -26,7 +29,8 @@ extern mfn_t first_valid_mfn;
>=20
> Minor nit: in this part of the file (that wasn't included by git in
> this
> diff), there's a comment that references Arm:
>=20
> =C2=A0/*
> =C2=A0 * TODO: make first_valid_mfn static when NUMA is supported on Arm,
> this
> =C2=A0 * is required because the dummy helpers are using it.
> =C2=A0 */
> =C2=A0extern mfn_t first_valid_mfn;
>=20
> This should probably be changed to generic/GENERIC as you've done
> elsewhere in the series.
>=20
> In any case,
>=20
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>=20
Thanks. I'll update in next patch version.

~ Oleksii


