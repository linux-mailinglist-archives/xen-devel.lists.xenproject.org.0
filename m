Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC3D7D2FEE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621280.967606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusEC-0004hf-MR; Mon, 23 Oct 2023 10:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621280.967606; Mon, 23 Oct 2023 10:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusEC-0004fg-Jq; Mon, 23 Oct 2023 10:32:08 +0000
Received: by outflank-mailman (input) for mailman id 621280;
 Mon, 23 Oct 2023 10:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusEA-0004fR-P2
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:32:06 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696cc5d6-718f-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 12:32:05 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507cd62472dso4712131e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:32:05 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a196547000000b005056e9b734esm1657867lfj.151.2023.10.23.03.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:32:05 -0700 (PDT)
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
X-Inumbo-ID: 696cc5d6-718f-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698057125; x=1698661925; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGMYTHGOkTBndFLxXXqmJoQHHn43f4g0HnjO+5XJWkc=;
        b=mt2PR3Sza+VqDL3aKybW9otANjBWLXK0QC1z2FF2IFAv5wfgRQL/jtFkMGJD2wO1j3
         RgdmMWtIdE8DSW16GSn1oG85fShCDPOZJ7oUq90XvP2OXkvX+DnekqEEe+WjSadx9M7Z
         N06lTQYJ0HhsKWtTGhI5UWWyx6Uuc7sQVmbNwLsLvtKKeByx3PIa3qW//fPB8wTw9pwM
         Wm2Vz6WA1kJUeQLIoA9CCNVtgzyhSeCpV/rG4Ypn1S1N0ok7dCvg/xrBlP9YUaRXeNId
         ZFj4dpAEw12hWlDPJ2UVzhIZM3GnUSAjG9tl2dCSkCgi+ftGxcqbaE7O3ihRMPcIHKZO
         Lxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698057125; x=1698661925;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGMYTHGOkTBndFLxXXqmJoQHHn43f4g0HnjO+5XJWkc=;
        b=JUjSgM10nYMkzJhWCoXE8Afj/wmfe4eFLXWdObQuL+sbNfxKk8g7Mzuej+2vbY0l8q
         HuFKjqXWDRE1yZE+Pkn7pu/mEbVmwZDQ1PfViNIZb/92bo74eEyO8pLAshZQlZEDAbcx
         uDdKipKM7riYXbgVdru7ZaU5lvBtzyfi4xKGoCcj4a5aCksuRWP9CSHTXZrBrX75CFnZ
         NtNwgIL473fx2RyBOo+pRIuCs3hsE2VfucBkzmq9wgx/SKVFTlaWNVuX93UET/q9o5uk
         qieJJXC6acskRki+h3ZBbACfuOaHPK/MTu3kUQwKo65+Jv5tBFvTg3iBqR0ObljgiwoF
         3jWw==
X-Gm-Message-State: AOJu0Yzfv6h/K9LpdMCKfxdENmS1wZRqsn/NUTaNZalkrECess/xog1k
	AK4xQW4aB24pSs3QCFlcuoo=
X-Google-Smtp-Source: AGHT+IEcVnyNHX5DKeH7qBKd21fDUIOPZSQYnb9ZD80w+12qu+3hRjMR3QKNxBcogXyk2a/d06Ualg==
X-Received: by 2002:a05:6512:238a:b0:500:943f:11c9 with SMTP id c10-20020a056512238a00b00500943f11c9mr3856829lfv.3.1698057125230;
        Mon, 23 Oct 2023 03:32:05 -0700 (PDT)
Message-ID: <9bb801f1c45cac24f3e3ed3abbbbf3f260a549c8.camel@gmail.com>
Subject: Re: [PATCH v1 06/29] xen/asm-generic: introduce stub header
 grant_table.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:32:04 +0300
In-Reply-To: <3e13d1ea-c242-46ac-c692-8f2237d2a23a@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <f3efdfc93780b62be93fecec68860e12026fe66c.1694702259.git.oleksii.kurochko@gmail.com>
	 <3e13d1ea-c242-46ac-c692-8f2237d2a23a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:19 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/grant_table.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_GRANTTABLE_H__
> > +#define __ASM_GENERIC_GRANTTABLE_H__
> > +
> > +#endif /* __ASM_GENERIC_GRANTTABLE_H__ */
>=20
> This isn't going to work with CONFIG_GRANT_TABLE=3Dy, is it?
Yes, it won't work with CONFIG_GRANT_TABLE=3Dy. Missed that as
CONFIG_GRANT_TABLE is disabled for RISC-V.

It looks like it should be moved to arch specific folder but as I
mentioned before I don't see a lot of sense to introduce an empty
header for new arch each time when it will be needed to enable full Xen
build.

~ Oleksii

