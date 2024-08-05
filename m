Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F82947DC3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 17:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772235.1182675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazPH-0002So-CI; Mon, 05 Aug 2024 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772235.1182675; Mon, 05 Aug 2024 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazPH-0002R2-9K; Mon, 05 Aug 2024 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 772235;
 Mon, 05 Aug 2024 15:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sazPF-0002Qw-Cj
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 15:13:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529e4304-533d-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 17:13:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ab2baf13d9so14525297a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 08:13:51 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c0casm459190166b.47.2024.08.05.08.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 08:13:50 -0700 (PDT)
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
X-Inumbo-ID: 529e4304-533d-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722870831; x=1723475631; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7xhTf6UWXOOdVzYrJWJTUCMhvxqpinHthVWY5u00adE=;
        b=nn7jYyTA4N/m26YmJZI8YNVLnPAypPEoNi4ZHU2WXnxd6jEl8qoe3oBzrRV9z7k81G
         tM/SH08fzo8o2eXK8THODL5Fbklv3WuyNH+yZdeKhS0ajD0vlremrzLUdfQzZB0PS1JT
         Umt+kuJOe3dflqeKYaQjCk0InIGHiDhWrNAfoIaO9sp8zrwv2xcEX60FsUfylLPa/ixD
         pMtBsOaPvKdjlkX5d0BpGCPIX6U33wUTGTgpY2mDJdvaJ3bRdNoWBp9rxEDPHwVxzmK2
         a13B4vDjxozg9N5qrVVR5SbOzUzHVe+R8K92TORRt3H7uyPzgFWlh59cSKxiMGAZ7kKc
         JhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870831; x=1723475631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xhTf6UWXOOdVzYrJWJTUCMhvxqpinHthVWY5u00adE=;
        b=TcrzvQ4Ao5W2c/Okpz5marA0Gh+mChaH149+ARlKBUpZO8VAGQNICWbNxXTqbvXJwu
         6N6XZ9dTjjEvtv7+9AhU5Ub7sdjelNcw2fkRPK7Z7Eg+6VCipHILO1j29+IYqus/MJ9U
         zAQqwEfYp72i9wTPjuWnL+z/UvVP1k8KaXuaGDTAS0dmlcQWPP37dL3zDyh0HVqnTE+L
         VwkNkJq0o2OwZV4RvC5p/t7vTFyAvRKv+aLOwEJYqe9Fa1i5sjDMVqqt7bNs3aVTGwJD
         avi2YIMJyDvUEfIX5Ft739wKDdewY4yTjSqnPRNZAXWI1vZM0VFqcSTUkxZlUrpphebp
         zm2A==
X-Forwarded-Encrypted: i=1; AJvYcCWD13qqDAaBZMXMcGe9YWUSz2dsQ+R9o9Irit+z4UdG2QcqE24lG+ZKfqQGa2uSizEGMMmXXocjxtYJnQg2EtMnN/hliZuc7YxM2GcKBnI=
X-Gm-Message-State: AOJu0YzX6OYpudRdWePXFa+w9syn7xibNFAmAwdtmuOSBJBd+38Z9n4l
	Eqi8yFyfbwq9BNUFLwAqFTwjfAQHef6By4KzmrHeDyig6GzgSJXC
X-Google-Smtp-Source: AGHT+IGzT7SDS0Pn+VYIQtBRtr+cZUerl75LbF0dF3QY2kSJalpJBqiegw4B2ZAVpwI3+Salt8tdKg==
X-Received: by 2002:a17:906:730f:b0:a6f:501d:c224 with SMTP id a640c23a62f3a-a7dc5100bbcmr936027766b.57.1722870830785;
        Mon, 05 Aug 2024 08:13:50 -0700 (PDT)
Message-ID: <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Mon, 05 Aug 2024 17:13:49 +0200
In-Reply-To: <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > +
> > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)&x=
en_fixmap),
> > PTE_TABLE);
>=20
> I'm a little puzzled by the use of LINK_TO_LOAD() (and LOAD_TO_LINK()
> a
> little further up) here. Don't you have functioning __pa() and
> __va()?
Can __pa() and __va() be used in this case?

According to comments for other architectures, these macros are used
for converting between Xen heap virtual addresses (VA) and machine
addresses (MA). I may have misunderstood what is meant by the Xen heap
in this context, but I'm not sure if xen_fixmap[] and page tables are
considered part of the Xen heap.

~ Oleksii

