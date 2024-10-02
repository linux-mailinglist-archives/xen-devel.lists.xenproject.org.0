Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC55998CEBD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 10:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808635.1220602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svuh6-0007Ax-1a; Wed, 02 Oct 2024 08:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808635.1220602; Wed, 02 Oct 2024 08:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svuh5-00077u-UH; Wed, 02 Oct 2024 08:26:47 +0000
Received: by outflank-mailman (input) for mailman id 808635;
 Wed, 02 Oct 2024 08:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tl1C=Q6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svuh4-00077o-Ty
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 08:26:46 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0efea913-8098-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 10:26:44 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5389e24a4d1so6410499e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 01:26:44 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fd54e80sm1848077e87.43.2024.10.02.01.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 01:26:43 -0700 (PDT)
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
X-Inumbo-ID: 0efea913-8098-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727857604; x=1728462404; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E+zDyLfjwAZ8Q/13bnws/oxcrTUQAX3DXSXjHlzhBso=;
        b=AvuHlXHLnc1M5F00CkuskHLXTeU45uNUP2FaMV7rtZs4w4tOJgKPLhN2j4DiFM9PzH
         hRnizW0RWpOwf53UQHFDB3YlW8jzkheZgSmf6a1TA/i9P90RZqUF2Ie1h1fjUFPSfXav
         fNGELD4Sp/jQyH06Adu+vLGHLhxMZvcRJgybctlWINj2ZceJWc99mo7gS5lIC/OgqEbj
         lYC/7ZLiHWiWq3kfOgLujqE549u/y1xLMTImVhb/JdkVr+TF/TdzGNtWQpShvJ9YwF2z
         KN2GOT6FA1hpYEAhwm0pNYtjvjPnMmkl2ziD9iCryTU/bM+yrwdsup/7Juw4CqtU/g9/
         WrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727857604; x=1728462404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+zDyLfjwAZ8Q/13bnws/oxcrTUQAX3DXSXjHlzhBso=;
        b=RDOjhN6wigQvUNmGD/pAdCy/SMEmBhNQ+EtQuVpzqrsmdCBe355N4ImBOU4ketrZER
         9brLd8lMczS/gL9ivtl9vgB3Opb3mcCZzasf0fv/3KLHd63HRnn0Ole7rFC7StRmveUP
         Heyu8eT580Z4re9quukIWFVESDWvTs/5Ee4/dLqSkUhKoqsXjOBKRHTeLvBu2V3HH9SZ
         vxWU7V5IxRV0BqAB7RY+3nGmOatJinjLs0HBYV885yK9LF29/tPG76c5vSaTKiQENefX
         ikIwgz7iJwWaLE5DoFo19JH1B6LlR4iZDWHHU+u1wxRne0csBOcURmdQJ7ac70LYeph5
         GT5g==
X-Forwarded-Encrypted: i=1; AJvYcCWyTt83N33BJZ2/tkw24wEuENHZjJ8QEZ7szjfnDqt5XTXaTt72LVJOUuk6gKhtV1W1eaiHPzkvZvo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4EdByiktSjyUMXj2voRzRJvY74zNdTbg8pHYDAxl2z9tBkho0
	W1o2abNMn//iQTFabsckrE4qS/W5lZHb1VIm6oxt8ACD3YdwRE0N
X-Google-Smtp-Source: AGHT+IHt87KSLVJ3w9ZYoEPF8AyowUnlKq/KglRob5/YaQyXpDBjlAm839otyfgWpQqody4xclBXhw==
X-Received: by 2002:a05:6512:114c:b0:539:8aec:ecd3 with SMTP id 2adb3069b0e04-539a07a8384mr1240051e87.55.1727857603764;
        Wed, 02 Oct 2024 01:26:43 -0700 (PDT)
Message-ID: <062739b1537c64690cd969b3262d5b677cf15ac4.camel@gmail.com>
Subject: Re: [PATCH v1 1/2] xen/riscv: initialize bootinfo from dtb
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 02 Oct 2024 10:26:42 +0200
In-Reply-To: <18cfcda5-d2b4-47d6-9f5e-a240e46661c1@suse.com>
References: <cover.1727708956.git.oleksii.kurochko@gmail.com>
	 <f04a3cc3e543298f63845728c599410258a336ca.1727708956.git.oleksii.kurochko@gmail.com>
	 <18cfcda5-d2b4-47d6-9f5e-a240e46661c1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-01 at 17:54 +0200, Jan Beulich wrote:
> On 30.09.2024 17:13, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -28,6 +28,7 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t dtb_addr)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 struct bootmodule *xen_bootmodule;
> > +=C2=A0=C2=A0=C2=A0 size_t fdt_size;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 remove_identity_mapping();
> > =C2=A0
> > @@ -54,6 +55,9 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!xen_bootmodule);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 fdt_size =3D boot_fdt_info(device_tree_flattened, d=
tb_addr);
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(!fdt_size);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 printk("All set up\n");
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 machine_halt();
>=20
> Looks plausible, and judging from Arm code there'll be an actual use
> of fdt_size
> down the road. Or else I would have asked what use the local variable
> is. In
> fact, again from looking at Arm code, I now question the need for the
> xen_bootmodule local var - that has no further use in Arm, and hence
> that's
> likely going to be the case for RISC-V, too.
fdt_size and xen_bootmodule are used only for BUG_ON() now and in
future ( the same as you mentioned as in Arm ). They could be dropped.
I'll do that in the next patch version.

>=20
> However, may I ask that you limit the dependency trees in what you
> submit? This
> series depends on another series, which in turn depends on yet
> something else,
> all not yet committed. That's getting unwieldy, I'm afraid.
Sure, sorry for that. I will limit the depedency trees in future.

~ Oleksii

