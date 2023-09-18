Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA37A4503
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 10:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603824.940911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9s1-0002j6-5r; Mon, 18 Sep 2023 08:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603824.940911; Mon, 18 Sep 2023 08:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9s1-0002hP-3D; Mon, 18 Sep 2023 08:44:41 +0000
Received: by outflank-mailman (input) for mailman id 603824;
 Mon, 18 Sep 2023 08:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pP1k=FC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qi9s0-0002hF-4q
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 08:44:40 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e90e1f-55ff-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 10:44:38 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bfb12b24e5so66795011fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 01:44:38 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2e7e08000000b002b6e77e87fcsm1924199ljc.68.2023.09.18.01.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 01:44:37 -0700 (PDT)
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
X-Inumbo-ID: 99e90e1f-55ff-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695026678; x=1695631478; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUL5xPIuoEyo3GAuQNvA7dGIheAnKC3PCPb8S5e5C0g=;
        b=TkFTK9asR56RqqVK+IjXjG07Rjm1cKFXsbLh2YPkkTgph1N9H+iT7Vy8bE41pwxh0X
         y8I9hXya8puCjXNOaQLoxCmPLZImSaF/wDJ1CCvgg4N/RkfvsyqKKYcj0QFjg5V6/HuO
         m2XWMOeTuwMBuvdFAkJk7Ug8hdDGgT933zY1H6QkYRTKekznFpPZNVZb0/KtYEieNOB3
         /IjnHvu62J2BNpSWwxMdXqwsuO2jtRUVmF3rq9blTX4+VxeOPWn2XNhLa2J7g+/Sr6RM
         MPjawxvJ8k0jBeYArAkkYzhTaUDBFx8Rd2sjgmV5EmxjFauUAIYO73hDx+CLT/CpI8HV
         v43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695026678; x=1695631478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUL5xPIuoEyo3GAuQNvA7dGIheAnKC3PCPb8S5e5C0g=;
        b=U15wKeSf9Db6PSevFpSU8NZEOhcIJeJBX0HWvrFix5LVmP67jJoz0zi8Z2TOS5mzPL
         ew3AiB2Gg9ESAinaZJZjZEFwuA7nrre1KP3SA7JE7xQQJRdTvSnnqlaNbHQIdppVMgjL
         dWBOLskrdv9EsO46H+1ciltMUwHOA1506MKSpaOMtHn9SLEI2ZMSbD6VPtfSsNqqAwmB
         I7zPDdbb9FRQj8g+e2ImcsST85/ZrNJ44tpIGhyKPocKOtgqSf8UfrpYX2NfsZDhC+aI
         tOUl56Fr+OS1ux++HcB4kWDaHYt2dll75Ptn/b14+mmDhvZmeQwBLmnEd3Ujq3+CZ9qA
         VnhA==
X-Gm-Message-State: AOJu0YzLO10xy4AONX23cWoeG2OILwimUaB6SIs9clMAIIHeaMxPESAY
	ETUbVIbzbgLzUSdMP9qaIgw=
X-Google-Smtp-Source: AGHT+IExtTMj5zbZ9xonVRjosoUZHfybVcz1dM4K5LA/YB5gQMFWIE8EXHXXA3WbMAGVRBoPO9NfLQ==
X-Received: by 2002:a2e:1f11:0:b0:2bf:f497:52d6 with SMTP id f17-20020a2e1f11000000b002bff49752d6mr4882645ljf.22.1695026677472;
        Mon, 18 Sep 2023 01:44:37 -0700 (PDT)
Message-ID: <cab26d0698d597e2273f2b0ad5ffc2c082440443.camel@gmail.com>
Subject: Re: [PATCH v1 16/29] xen/asm-generic: introduce stub header
 flushtlb.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Date: Mon, 18 Sep 2023 11:44:36 +0300
In-Reply-To: <db6ea8cc-f9d9-d8cf-39ca-89b1aa364117@arm.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <8f5e2ac850eced2153d68effcb36aca1ed065aee.1694702259.git.oleksii.kurochko@gmail.com>
	 <db6ea8cc-f9d9-d8cf-39ca-89b1aa364117@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Jiamei,

On Fri, 2023-09-15 at 13:15 +0800, Jiamei Xie wrote:
> Hi Oleksii
...
>=20
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > +
> > +
> It's duplicated.
Thanks. I'll remove duplication.
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: BSD
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */

~ Oleksii


