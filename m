Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050F88A2CA0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 12:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704533.1100959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvEJt-00005K-7p; Fri, 12 Apr 2024 10:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704533.1100959; Fri, 12 Apr 2024 10:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvEJt-0008VN-3s; Fri, 12 Apr 2024 10:39:45 +0000
Received: by outflank-mailman (input) for mailman id 704533;
 Fri, 12 Apr 2024 10:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bSQ=LR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rvEJs-0008VH-Cm
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 10:39:44 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83b17cd-f8b8-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 12:39:43 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d487659bso975704e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 03:39:41 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a2e8e8c000000b002d496ecda1csm483883ljk.61.2024.04.12.03.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 03:39:40 -0700 (PDT)
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
X-Inumbo-ID: f83b17cd-f8b8-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712918381; x=1713523181; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XeWUnvvhRkLNQhqxUOjt98pOH1Z4EAQyc0vk4tFsq8w=;
        b=MpZNUp/I78H+/M2n2aPvX4w9QTeYypHTh21Y5A+XjftnNdHbsPHBOtm/fbwCsII8d+
         cYQ9U08PcNuyasI4npEvkDAFEFOye70TOaDqFu4OaqYVNE7oMk1JHsAY5+WxQG1IaVv1
         Q9QwXZTlm4Uk3TTolsyU49v+kCPfww4aZJb1IwKdxQ3IYGGLCMy45gV6aBQlvA+duGg4
         isjWT05l1O13P17yruWFDyL6/yxXSgk5CCm/Qe+ZOjafpm0RqcR36m13/HDEt4CEHUyE
         LbUw0Y8e4FudhGt3ssbfN4aR1VZJ1G2zgB3kOE/7J3HwOoaFR5/duodtVxf/1AlmUcBk
         txQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712918381; x=1713523181;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeWUnvvhRkLNQhqxUOjt98pOH1Z4EAQyc0vk4tFsq8w=;
        b=euaR9ihdFnSx44FrYMOm+GI5/9a3s5CauLQtHmWhdeQSBNXgK8S4XZjal2W+COLGt5
         1z8MdIYQIHsTazD+gWwrTDLCkkZK+ZDxXn6U89mHyyZQ10umq9HGj0NpxIhZqCDnc6eN
         i/WJzwvAkBJ6dhdcnWGMtpIiPvKqWjRLWnD86sk3l31dC5+QCHxkksItgy4GDZRISgxr
         1eXuoXzB0C1Pgt+7OhzAZYMXLdmisgfeJEedBxvMvhjC1o8avC02ftZqlevyNj3pinTN
         Y3OILfRdUJLXh5X1QJCgeiZ+TrA/kqcXQmkl14ch9gYYGoL2Q2HHuMCVuQxQtjL9OsDm
         QpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK3F0QQ/ELn3znQBaGqVAEcKgXViz251XdwjgbWVfzdM7TNYSzULV6u978fHLyvTQgOFOAeuJ3iVF3TqA4+O1CaB4+Az8dTmTKPayZRgU=
X-Gm-Message-State: AOJu0YwA1XJr4njP9p1WR9/oQSgw3Gm2l2JGYq/ByUULJVyuF5tKwL6u
	ZtBBVZ9y9e6UTGW781YeqqH7tYO2fKF7ry6ZQTMdrJrw2B2BSPW/
X-Google-Smtp-Source: AGHT+IF5aFMErCE4RJaaLt5rdV3T8WQClliapvrjcI26NEkG92saBbdWO02Z1IoWVDGIgzuIirU/AA==
X-Received: by 2002:a05:651c:502:b0:2d6:d8a3:8c08 with SMTP id o2-20020a05651c050200b002d6d8a38c08mr1372816ljp.12.1712918380982;
        Fri, 12 Apr 2024 03:39:40 -0700 (PDT)
Message-ID: <d9b571b02580e264a4a61e7035a82315fe15838d.camel@gmail.com>
Subject: Re: [PATCH v7 10/19] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 12 Apr 2024 12:39:39 +0200
In-Reply-To: <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <6a6c4ef8663d9da8c8a2aba4baf0286f31566edf.1712137031.git.oleksii.kurochko@gmail.com>
	 <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-04-08 at 10:23 +0200, Jan Beulich wrote:
> > +static always_inline void _add_sized(volatile void *p,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 un=
signed long x, unsigned int
> > size)
> > +{
> > +=C2=A0=C2=A0=C2=A0 switch ( size )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case 1: writeb(read_atomic((volatile uint8_t *)p) +=
 x, p);
> > break;
> > +=C2=A0=C2=A0=C2=A0 case 2: writew(read_atomic((volatile uint16_t *)p) =
+ x, p);
> > break;
> > +=C2=A0=C2=A0=C2=A0 case 4: writel(read_atomic((volatile uint32_t *)p) =
+ x, p);
> > break;
> > +#ifndef CONFIG_RISCV_32
> > +=C2=A0=C2=A0=C2=A0 case 8: writeq(read_atomic((volatile uint64_t *)p) =
+ x, p);
> > break;
> > +#endif
>=20
> Any particular reason for using read_atomic() but write{b,w,l,q}()
> here?
It was done because write_atomic() wants to have pointer as a first
argument, but read_atomic() returns a value.

As an option it can be used read{b,w,l,q}() instead of read_atomic() to
have the code consistent with write{b,w,l,q}.

Another option is to left as is and add the comment.

~ Oleksii


