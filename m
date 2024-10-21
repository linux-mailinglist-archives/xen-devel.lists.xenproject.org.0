Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E29A5FD0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 11:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823252.1237215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2oXS-0007yt-TJ; Mon, 21 Oct 2024 09:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823252.1237215; Mon, 21 Oct 2024 09:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2oXS-0007vp-QW; Mon, 21 Oct 2024 09:17:22 +0000
Received: by outflank-mailman (input) for mailman id 823252;
 Mon, 21 Oct 2024 09:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ab4=RR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t2oXR-0007vj-NI
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 09:17:21 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46506ce6-8f8d-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 11:17:20 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so40421061fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 02:17:20 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ae24a9csm4539181fa.123.2024.10.21.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 02:17:19 -0700 (PDT)
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
X-Inumbo-ID: 46506ce6-8f8d-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729502240; x=1730107040; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Zkx5OzrR5noIzrXQaE+sP3FfBEoM2+NgFV1MzDY4bs=;
        b=kkXtWCxBGqvlQXQaLDZSZdbWRYPD7oIWizdIPYnFArIZ0qvKDOWxzFgZL5y4EJmRuN
         HybUfWw6gWbsS35MgC8aALmPnYp/QHf/yAH5vt2HboNSi82hhst5Ifa7KTQzrp6ApIzD
         Z8b3RY+fSJj4woDKyc7oNLtNJNS+IQ2giLzWC3y41fDdV4gsMAmC44KkMTPywBMpXh49
         5pYE9j7Y8vrIB7/9Sd+2B2XfJR3eyBrT0vS4Khu7cxlbNjJsI9NRuGYfU4hIlDtLpvhq
         GeUnDuJ5AYrSyFAW0GMhUz/GqrJbxbh0Krh7oD2n7FUkOW+GbqU4WBQUXZkLYl2neFz7
         AsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502240; x=1730107040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Zkx5OzrR5noIzrXQaE+sP3FfBEoM2+NgFV1MzDY4bs=;
        b=rdKSZYQf4gxpTKJFst+DzO8uyBtb7PXQLpjQsX3Wu8r3FlWrd3O/H0SBeoGIR6OXpm
         utHhJ5cim+cnWncrYFTsZzhJH7IeUthwl9bbmUg3R8aTnOpRHBkQp+9gPs0lny/9lHCf
         XNIT35HDKjOH9YXlk+92cYY3Go5xVEf4z5kxKnXSLinF4V1Wq6aHbFniQtXt6jrYq7Zm
         pUb9mPAeuh6pJa5tVQcJxHRs9WLvp0vuxaH37kotX32rPd5SsAtkH3mbDTNWXWYUe/5+
         BJgkoWsjMD0GY1xRUvBTp5mf1PfRTlh2zIx3g9QabEAp1Fi6RIcpJfhZUjRxME2RRdZT
         EmCg==
X-Forwarded-Encrypted: i=1; AJvYcCVlDKCn9bqUMPyyn68rBMrZZnMArQye4vFU5EN4tPjQjEyolcM96Lnw6v0mVPhDEdClVqWbao0mjhY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu86tyooIGjFARQu+fxMibtZ5a1JzZpMmSc5RiCumY0IcWzT0q
	+zSvQNi4CIy0zNtT03+9Jez7NPNZJ6D3UYrVNXX5SmMgWCeeeLRK
X-Google-Smtp-Source: AGHT+IHGBHaw2MgPGUuQ03iYeqiexR9VxkajDDxffzKEOfq8DbVnq5bYywyzob8tVIkgzBBkytDUvQ==
X-Received: by 2002:a05:651c:2105:b0:2fb:266b:e3b2 with SMTP id 38308e7fff4ca-2fb83209eafmr50606361fa.36.1729502239600;
        Mon, 21 Oct 2024 02:17:19 -0700 (PDT)
Message-ID: <43e8ee94d3b7aa5b643db1d81a63e513a8feef57.camel@gmail.com>
Subject: Re: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
From: oleksii.kurochko@gmail.com
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Jan Beulich
	 <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 21 Oct 2024 11:17:18 +0200
In-Reply-To: <D51BO0DX4047.IXQS05RISYW0@cloud.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
	 <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>
	 <2565f369-96e3-4c28-b752-53b1b6a0d968@suse.com>
	 <aebdb0df0ad9fb13db9929f131737bf5479cdf29.camel@gmail.com>
	 <D51BO0DX4047.IXQS05RISYW0@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-10-21 at 08:56 +0100, Alejandro Vallejo wrote:
> On Fri Oct 18, 2024 at 2:17 PM BST, oleksii.kurochko wrote:
> > On Thu, 2024-10-17 at 16:55 +0200, Jan Beulich wrote:
> > > On 16.10.2024 11:15, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/mm.h
> > > > +++ b/xen/arch/riscv/include/asm/mm.h
> > > > @@ -25,8 +25,12 @@
> > > > =C2=A0
> > > > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > > > =C2=A0{
> > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > -=C2=A0=C2=A0=C2=A0 return NULL;
> > > > +=C2=A0=C2=A0=C2=A0 /* Offset in the direct map, accounting for pdx
> > > > compression */
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapo=
ff(ma);
> > >=20
> > > Why the mentioning of PDX compression?
> > It was mentioned because if PDX will be enabled
> > maddr_to_directmapoff()
> > will take into account PDX stuff.
> >=20
> > > =C2=A0At least right now it's unavailable
> > > for RISC-V afaics. Are there plans to change that any time soon?
> > At the moment, I don't have such plans, looking at available
> > platform
> > there are no a lot of benefits of having PDX compression now.
> >=20
> > Perhaps it would be good to add
> > BUILD_BUG_ON(IS_ENABLED(PDX_COMPRESSION)) for the places which
> > should
> > be updated when CONFIG_PDX will be enabled.
> >=20
> > ~ Oleksii
>=20
> I'd just forget about it unless you ever notice you're wasting a lot
> of entries
> in the frame table due to empty space in the memory map. Julien
> measured the
> effect on Amazon's Live Migration as a 10% improvement in downtime
> with PDX
> off.
>=20
> PDX compression shines when you have separate RAM banks at very, very
> disparately far addresses (specifics in pdx.h). Unfortunately the
> flip side of
> this compression is that you get several memory accesses for each
> single
> pdx-(to/from)-mfn conversion. And we do a lot of those. One possible
> solution
> would be to alt-patch the values in the code-stream and avoid the
> perf-hit, but
> that's not merged. Jan had some patches but that didn't make it to
> staging,
> IIRC.
Could you please give me some links in the mailing list with mentioned
patches?

~ Oleksii

