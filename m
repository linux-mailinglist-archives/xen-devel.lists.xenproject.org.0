Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66555816CA3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655893.1023781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFC0y-0001BY-Cl; Mon, 18 Dec 2023 11:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655893.1023781; Mon, 18 Dec 2023 11:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFC0y-000196-9b; Mon, 18 Dec 2023 11:42:28 +0000
Received: by outflank-mailman (input) for mailman id 655893;
 Mon, 18 Dec 2023 11:42:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFC0x-000190-HG
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:42:27 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 845f3f34-9d9a-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 12:42:26 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e3295978aso1390942e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:42:26 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a197501000000b0050e2c05576fsm583581lfe.9.2023.12.18.03.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:42:25 -0800 (PST)
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
X-Inumbo-ID: 845f3f34-9d9a-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702899746; x=1703504546; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QH459F2/taJyBqCg2g2LBxM7hEvnaUFXdcPuPsjZ2So=;
        b=LV+9mR86EDPHK5XZGQxekG0ujzUf9EESMBlgIyVdxQWfu3JErkvOOM0SZlQeRCJ/V4
         dM3KlLk0Vwm2tMdtkEuwvqRt7YKG73c8wBR9L53WGp1VGksb2WhsE0Y+K/8OeW7dcFyD
         rpJs5Up0QE21SqN0FiuiWWeuMwwdCH5wNm+s5kN2O92y+IIz1pu/1hBP1VRl77LLaB1g
         B8G8tF5gu9FyaTvcKwHY79vDTu8tERgZq9zplSEk4pbfMQG/FnTzzKWqFfhU80VeTDUP
         EPQ6/7cGLtpsY/Me3Pwmv/xzb5bMOgtI+OjVuOTXuu0GNdMT4D2dFqhXjDEg7eW5wuSU
         P9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899746; x=1703504546;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH459F2/taJyBqCg2g2LBxM7hEvnaUFXdcPuPsjZ2So=;
        b=bPL679lbpaWWeww377rWb2a0i4crVIbycsqcWmgTULrcz6hPyUX48DzORiQcFytunW
         6HoyfTdyRkZtZzsj95NjQrQVhmgsR+a1tE5bW0QVs36xHXOm88zktStCHGHOcEMynzoJ
         28hfCqwBisLokC7tyTYNe0ytpxpQffJoXaQowUjXFOTiXILCWlNT6Fwlz8dTIWfrHYQa
         GF6sY7Olw440wCHDFC0goDsQo8GzztqsleHaVBHFy7F54vv+MqaqOsYBQSdnqJpSOhgS
         VV6IfEfjUa3HjtMpAScRaBoZZKnefaIGMGsl6GZ+UWttnkOf1He0svVtSBF4ZUsEl5Tm
         KrMw==
X-Gm-Message-State: AOJu0YwWNYlQaFbvUrsHtFa7omhE32zI6hRoVdVG2LPfYUpVlq51TIQR
	sdlNRZCkPEWF3qbbbhlI2ZQ=
X-Google-Smtp-Source: AGHT+IH/imAMcfEYG7znvy7c41OMUBMIrpSfnefBp0FuKVpWOnKHi0b+FAQGpTykp3y3VNO8LMyrfA==
X-Received: by 2002:a05:6512:610:b0:50e:2aff:2964 with SMTP id b16-20020a056512061000b0050e2aff2964mr1243113lfe.30.1702899746132;
        Mon, 18 Dec 2023 03:42:26 -0800 (PST)
Message-ID: <b7b75cffd105ff399505ca5616d0850fdb46480a.camel@gmail.com>
Subject: Re: [PATCH v2 24/39] xen/riscv: introduce asm/irq.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 13:42:25 +0200
In-Reply-To: <ef529ee1-7ae4-4a0b-b089-e26feb3b2743@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <e9fc98cad562dad495ac1eb87b98be77cda72524.1700761381.git.oleksii.kurochko@gmail.com>
	 <479cd511-c01b-4460-bafc-2d3943956914@suse.com>
	 <d50405f2181396931941874f24c5018800cc5b44.camel@gmail.com>
	 <ef529ee1-7ae4-4a0b-b089-e26feb3b2743@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-18 at 11:12 +0100, Jan Beulich wrote:
> On 18.12.2023 11:04, Oleksii wrote:
> > On Thu, 2023-12-14 at 15:09 +0100, Jan Beulich wrote:
> > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V2:
> > > > 	- add ifdef CONFIG_HAS_DEVICE_TREE for things that
> > > > shouldn't be
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in case !CONFIG_HAS_DEVICE_TREE
> > >=20
> > > Is there going to be a RISC-V build without this enabled
> > > (selected)?
> > > If
> > > not, I'd recommend against such pointless #ifdef-ary.
> > For this stage (Xen RISC-V full build), CONFIG_HAS_DEVICE_TREE will
> > not
> > be selected, but it will be in the near future.
>=20
> And from then on it'll always be selected, or only conditionally? In
> the
> former case it would still feel odd if #ifdef-s were introduced.
It will always be selected until ACPI support is provided. I've seen
patches that add ACPI support for the Linux kernel, but I'm not sure if
it is really needed at this point. So, I've planned to go with Device
Tree for quite a while

~ Oleksii

