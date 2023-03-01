Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3A6A7161
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 17:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504157.776727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPTY-0004o5-EM; Wed, 01 Mar 2023 16:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504157.776727; Wed, 01 Mar 2023 16:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPTY-0004lY-Ae; Wed, 01 Mar 2023 16:38:44 +0000
Received: by outflank-mailman (input) for mailman id 504157;
 Wed, 01 Mar 2023 16:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXPTW-0004lP-Qp
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 16:38:42 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 864b4c30-b84f-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 17:38:41 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id m7so18423605lfj.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 08:38:41 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 p3-20020a19f003000000b004db2bda9527sm1782172lfc.121.2023.03.01.08.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 08:38:40 -0800 (PST)
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
X-Inumbo-ID: 864b4c30-b84f-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677688721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NbpnO5tIeYzqkfCFkTIzpe7N8+7qmnQ7Ttj3rc4oxaU=;
        b=ZOLvsThzkDgi5ASOU8cu2L1DhsX2A4ilI/0LwvrQWuhxRlx9J6ayWfG32e735ELxig
         8xirnpOTdZKswStukdWIgz1lIlDLDtFWqdBF9iD1RTXjkAQMujtqw0t6pxknVcouEuzT
         f0ZK00Vy2Si1Zf0okLJTGDk1nMGXYkjWbTGOiPk9o4FdIWhDYcRns8C1yhqlZq9DKqEE
         EQuScYH2nVw371vQ9wzc0r6QJ4L+hkDIvvFzzYlmatRbkvWRTq9oLaOla2nIW2FUcU9D
         gO1NarDuKzut5ql48boXDy2eEcf/uY/CLUzCukcpO6wUnvN90zgYHZsBH9yMwyeWYw7e
         viGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677688721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbpnO5tIeYzqkfCFkTIzpe7N8+7qmnQ7Ttj3rc4oxaU=;
        b=nqThs6W+VKdAB2/nAPd+i+OGTqa04mVc4EGRzV6duSiSU1KOvd9WhNdgNnDzgzIyDJ
         qXygLg1IFtCz8xtfJsKQd0lUedKkOfxYMc3BNj0yLTmiSdwuvxa3rityzug5RzoLY802
         aaSmtRzN2/M1j28cw9lMcnR+FCttGDAKWyrez0ISNvMkPzA1n9kBp+kL7Pm3CNzyd9d6
         TSxzQFp6RcX4K5Yo8InIedCg6tXdv9SHSyljfEVCsU4H9SbtDlfVHpw3bLHtqCcCoUe5
         USD5AR4O5n/QaQxjUyZ4e0qRhw+LCRQBNwA9UeJ9T/BNpF2Uc90rDgX5Gw2Gfdl7p7yt
         IDOQ==
X-Gm-Message-State: AO0yUKXiSNtM2y/IcDqyJLgViqsoKnIxYipuHIjL+Rb9GwwXYMfOdyqD
	EMxSEXEZa4yD4D7yJxPHgmQ=
X-Google-Smtp-Source: AK7set93SfImPFg2f2tEuObe+Qw2nw8H2zh3+fDGryP7JATwCmhA+5cEy6vOax8TXQH7JDHNCe9aRw==
X-Received: by 2002:ac2:4c19:0:b0:4d7:573d:ed24 with SMTP id t25-20020ac24c19000000b004d7573ded24mr1893335lfq.14.1677688720776;
        Wed, 01 Mar 2023 08:38:40 -0800 (PST)
Message-ID: <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 01 Mar 2023 18:38:39 +0200
In-Reply-To: <370809af-75e6-546a-53e4-71a76444f367@xen.org>
References: 
	<74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
	 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Wed, 2023-03-01 at 16:21 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 01/03/2023 16:14, Oleksii Kurochko wrote:
> > During testing of bug.h's macros generic implementation yocto-
> > qemuarm
> > job crashed with data abort:
>=20
> The commit message is lacking some information. You are telling us
> that=20
> there is an error when building with your series, but this doesn't
> tell=20
> me why this is the correct fix.
>=20
> This is also why I asked to have the xen binary because I want to
> check=20
> whether this was a latent bug in Xen or your series effectively=20
> introduce a bug.
>=20
> Note that regardless what I just wrote this is a good idea to align=20
> __proc_info_start. I will try to have a closer look later and propose
> a=20
> commit message and/or any action for your other series.
Regarding binaries please take a look here:
https://lore.kernel.org/xen-devel/aa2862eacccfb0574859bf4cda8f4992baa5d2e1.=
camel@gmail.com/

I am not sure if you get my answer as I had the message from delivery
server that it was blocked for some reason.


~ Oleksii

