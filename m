Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7A827202
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663573.1033559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMr5U-0005kz-8O; Mon, 08 Jan 2024 14:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663573.1033559; Mon, 08 Jan 2024 14:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMr5U-0005iv-5c; Mon, 08 Jan 2024 14:58:48 +0000
Received: by outflank-mailman (input) for mailman id 663573;
 Mon, 08 Jan 2024 14:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHUo=IS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rMr5T-0005h4-A5
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:58:47 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbdab64-ae36-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 15:58:45 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so1773734e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:58:45 -0800 (PST)
Received: from [192.168.223.212] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a056512235400b0050e791b4c37sm1176386lfu.97.2024.01.08.06.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 06:58:44 -0800 (PST)
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
X-Inumbo-ID: 6bbdab64-ae36-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704725925; x=1705330725; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FDZDNMvlcMEpJLYDqkluKDfCMuTXN8hFrHBAIU4aeJA=;
        b=mOW89Iqjab3JpTeR7y6bFug9xKq85PV0cw/HhLYpRRMx1M2yNAMSb25n4vuRotC/Ys
         NtxX9wt96uJhiulhogcAltFF116DkcDIa9ffNZd1Ydsa+0RioX81/Wab7QVADqjPZhFz
         XxNR4GaIEsnyIwIzm4S3bbONkLKka2iNFI/MAMQDHKkuVmYhQQR/ou0+mQmkYfGjqPuE
         h0N8KVBvGSa17HXCrWpLGhVQH466Lkg1ShWASpZm4cq8XKpp+oHkHsN9+3ecTDWTNecO
         pDjs6wadYlpNXsG3MdfiCxTYoJl/HfkM62Mt93REXSAWpJ88Rc+t7Q22G3ffuR4mcr2j
         t6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725925; x=1705330725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDZDNMvlcMEpJLYDqkluKDfCMuTXN8hFrHBAIU4aeJA=;
        b=goyCka1Ag8kWnwL0HduBCvpviGZVrGk2NTtCJPHSzk6QBDWd1HkNvTNXJSQX45KlCW
         3ycvPvWHBSudF4pPbn0JsI+m1WFAwYl+qEWThwqLlBxFq1MNderIJ6VlI+RjkdvfhWAq
         aBR9djWENaqUh9TfFXivNh/E95/dYkTtMaxJSxlXgL222oKDSLXzZVt50/AHcCZvY8Qq
         jDGQi9TEtX9Ckik9Sl20w/f03FJODx4QeEPBgASUilgWZyBrfOTHz1wopDtgpOwBuBLf
         ltxJBw4kPlB6hB+kZSIXeiFykrbAUzYsBClYfgys3eeyiE3XNHHZ9XN4JQeTI2VH7AZr
         CMSg==
X-Gm-Message-State: AOJu0YxL/AJArgRLYb2VXqbGHj/IJYzYMwX/GOI2kbgdfImMxa6g+VMw
	4i+iPs94dq8XgMDV9sU+e3U=
X-Google-Smtp-Source: AGHT+IHlSv9Wstb+5hJsxmGbn3EhMJimwOOJcUJu/43H9+F7d1YK126OzKDtxfBYdVcNsOgcfTTHEA==
X-Received: by 2002:ac2:44d8:0:b0:50e:64b4:a266 with SMTP id d24-20020ac244d8000000b0050e64b4a266mr638449lfm.201.1704725924708;
        Mon, 08 Jan 2024 06:58:44 -0800 (PST)
Message-ID: <b70268a03c8d1e00e29724ebe373eaa8c50c064e.camel@gmail.com>
Subject: Re: [PATCH v3 07/34] xen/asm-generic: introdure nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>,  xen-devel@lists.xenproject.org
Date: Mon, 08 Jan 2024 16:58:42 +0200
In-Reply-To: <d096f14c-96ae-46a6-81fc-55ff8fcaaf39@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
	 <d096f14c-96ae-46a6-81fc-55ff8fcaaf39@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-04 at 12:06 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
> > so it has been moved to asm-generic.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> A word may want saying though on ...
>=20
> > --- a/xen/arch/arm/include/asm/nospec.h
> > +++ b/xen/include/asm-generic/nospec.h
> > @@ -1,8 +1,8 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights
> > Reserved. */
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _ASM_GENERIC_NOSPEC_H
> > +#define _ASM_GENERIC_NOSPEC_H
>=20
> ... the removal of the copyright line.
It was automatically decided by Git to do it this way.

I'll try to make it generate a new file instead of moving/renaming
Arm's nospec.h.

~ Oleksii

