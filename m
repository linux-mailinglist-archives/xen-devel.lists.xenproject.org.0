Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BBBA211D2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 19:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878762.1288957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqde-0005v5-VC; Tue, 28 Jan 2025 18:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878762.1288957; Tue, 28 Jan 2025 18:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqde-0005sw-S9; Tue, 28 Jan 2025 18:48:42 +0000
Received: by outflank-mailman (input) for mailman id 878762;
 Tue, 28 Jan 2025 18:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcqdd-0005sq-KS
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 18:48:41 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc7ea79-dda8-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 19:48:40 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab68d900c01so647175766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 10:48:40 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc1861939asm7582917a12.12.2025.01.28.10.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 10:48:39 -0800 (PST)
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
X-Inumbo-ID: 7dc7ea79-dda8-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738090120; x=1738694920; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN5Yun5WykiYr20jfdAR3DBUumqD/eSRuq1mIK3T6o8=;
        b=YxviCEXnOsNvjZVJHemvVudw/RVZKt0LqlGMXHv1yQba7ruqFB9tNZcQbeGxYuXh0x
         VB2BbMYHEPrmOfpOFgULRhUuSrDYJBthdrFMLzfqjuTf1irlqVbVZSImStKjJGgovqFh
         ukwcuNzOB+qZUKgEykEKpInzRfQAkwzCTncJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738090120; x=1738694920;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZN5Yun5WykiYr20jfdAR3DBUumqD/eSRuq1mIK3T6o8=;
        b=iyOcTpgdlIJ6y8ZWx+OLGQ6+Yhwq/KKRQ/raCoJ3dn323x+/KVdepX303cw6I6hVnA
         zjP9n/nUE+sGepEAfWO53DT33nRnvgKYCNOVZUQ8xqW0TTTwMxfjXsjuil11jtph/FGI
         RDmd/xOLg/qM3DrI0ZCN4pnzmtClCHQG4wGH5fDG5P802pNQKqIe3jPBpkGNvxERtdaQ
         NWZs7ga48am5T7nd0P7tEjBPwKGTVRNFcQs7M3+o7pl6HfSna0Uas//hAD3gIjkknol3
         DcE9ikciy2AFrMJjoKGiB5dAKY1wxU58eYHOP4y2sosnybqEDVwNUlaPwGaBMpgVBEGn
         V8EA==
X-Forwarded-Encrypted: i=1; AJvYcCVC6wERAaw2efpcCPM7+EtHpAkm7P3sAtWV9l5bKKWIRRjfn96Q90jPd7L9hclgjkXgGVi6if0i9q0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpgaYIVH3yizPlGC7OHOa/nFOP+HMaNSGBi0RIuiUbJSw0Zpun
	pSnfVzDp+UoEutHXbNh792OP80fNYNXnw7EfG1bLqDsP9hLX9VVA3PJkeYYrw40=
X-Gm-Gg: ASbGncu4eWsZgJUgKdZNTkoSlif5/dAaO+0kEEheKc8Jp6GollJHBC0CFXpsCkwJfAe
	BXP6s9f524rP8PWs8T57DlS6+RALjhDiqA6FOiURREIGJ1sd3vYYNx5O/OMRNJBJXyt+M8hMr/m
	5bsKf2GgwTwzGfzltm4qI3u66bdvX67pq9R69kmNTmKnfHV0m8FC6SkdslD0sTIWJ1+A4RK/59n
	Ek0RwkJ+db/D+H2iMxLjkTkTVw+6+AvS27HlMqGPSGLpxHTqnXshc0GnB+x1n3jGSM++EoX0S0o
	FmUh/rFMZ7lIA7X6g78CrbIJCvLxfe3c2mU=
X-Google-Smtp-Source: AGHT+IEbDcBGxWNgg6DhCEa6hExrGkeKCy0PLVyCNMEp9l7A62uxlYPvJ/XTmOzdW2AV8OK1G2K5zg==
X-Received: by 2002:a17:906:7310:b0:ab2:c0b0:3109 with SMTP id a640c23a62f3a-ab6bbbcd478mr484408466b.21.1738090120236;
        Tue, 28 Jan 2025 10:48:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jan 2025 18:48:38 +0000
Message-Id: <D7DXIXNODNSU.B17NMD5C6WNW@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Michal Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
X-Mailer: aerc 0.18.2
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-3-michal.orzel@amd.com>
 <D7D0O214VJBT.18EFVF7AJACYQ@cloud.com>
 <4788ed30-f182-4fd9-aad5-5faca3580e3b@amd.com>
In-Reply-To: <4788ed30-f182-4fd9-aad5-5faca3580e3b@amd.com>

On Mon Jan 27, 2025 at 5:14 PM GMT, Michal Orzel wrote:
>
>
> On 27/01/2025 18:03, Alejandro Vallejo wrote:
> >=20
> >=20
> > Hi,
> >=20
> > On Mon Jan 27, 2025 at 10:45 AM GMT, Michal Orzel wrote:
> >> On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observ=
ed:
> >> arch/arm/platforms/vexpress.c: In function 'vexpress_smp_init':
> >> arch/arm/platforms/vexpress.c:102:12: error: format '%lx' expects argu=
ment of type 'long unsigned int', but argument 2 has type 'long long unsign=
ed int' [-Werror=3Dformat=3D]
> >>   102 |     printk("Set SYS_FLAGS to %"PRIpaddr" (%p)\n",
> >>
> >> When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long=
.
> >> Commit 96f35de69e59 dropped __virt_to_maddr() which used paddr_t as a
> >> return type. Without a cast, the expression type is unsigned long long
> >> which causes the issue. Fix it.
> >>
> >> Fixes: 96f35de69e59 ("x86+Arm: drop (rename) __virt_to_maddr() / __mad=
dr_to_virt()")
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >>  xen/arch/arm/include/asm/mm.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/=
mm.h
> >> index f91ff088f6b1..a0d8e5afe977 100644
> >> --- a/xen/arch/arm/include/asm/mm.h
> >> +++ b/xen/arch/arm/include/asm/mm.h
> >> @@ -263,7 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t sta=
rt, size_t len)
> >>
> >>  #define virt_to_maddr(va) ({                                        \
> >>      vaddr_t va_ =3D (vaddr_t)(va);                                   =
 \
> >> -    (va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK); \
> >> +    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAG=
E_MASK)); \
> >>  })
> >>
> >>  #ifdef CONFIG_ARM_32
> >=20
> > Out of curiosity, why not make va_to_par() and __va_to_par() return pad=
dr_t
> > rather than uint64_t? Then this cast would be unnecessary and the expre=
ssion
> > end up as unsigned long.
> >=20
> > That would also cover any other uses outside this macro.
> >=20
> > Unless I'm missing something else...
> va_to_par() returns uint64_t because PAR_EL1 on Arm64 or PAR on Arm32 sys=
tem registers are both 64bit.
> So, it would not make sense (also it would be confusing) for va_to_par() =
to return already casted value.
> The function ends with _par so it should reflect the register size as the=
 name suggests. Macro is there
> to cast this value as it also takes into account PADDR_MASK and PAGE_MASK=
.
>
> ~Michal

I see. The point is to keep va_to_par() in sync with PAR's width then.

Fair enough then.

Cheers,
Alejandro

