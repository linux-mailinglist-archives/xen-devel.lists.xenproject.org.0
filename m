Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33D8C67DA
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722387.1126281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7F61-0000q2-Vv; Wed, 15 May 2024 13:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722387.1126281; Wed, 15 May 2024 13:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7F61-0000n3-Sf; Wed, 15 May 2024 13:55:05 +0000
Received: by outflank-mailman (input) for mailman id 722387;
 Wed, 15 May 2024 13:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ly6O=MS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7F60-0000mQ-Ka
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:55:04 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baa4d409-12c2-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:55:03 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2e538a264f7so72617041fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:55:03 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbcc5fsm20471331fa.20.2024.05.15.06.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 06:55:02 -0700 (PDT)
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
X-Inumbo-ID: baa4d409-12c2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715781303; x=1716386103; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OhqwbTjcYPKqjA3fcdjahtltKIvrjVq+INTIIqzGjtI=;
        b=FSmOWBf3iT5U0NQltLJUcRWz8OAkH1psFjCRtyUcRn1itkBub02bJjnKA/gyzBErDb
         f4PKnvKzyAPECdcjc+czCUILuemetxVRa6fYC2OXWrQ2Sbrbo9FNZ7KdI+PdtoOVwRhK
         za566tcRBnfsJCHJYM1IvQuBUiqZEbyZ26OT3BxC5qT4o4+fs7xXy8+bI/Mi1OtH/kSp
         Z0HOfoOqV1TioeejXA3uwgf0k2vaAVEEmYrfKW1iQmBggPUKanF3BoszEh4RcA/1YgVw
         OF3IwxHCNDgc3hJeFFXB0F+Xymy3kWmXTWfz0xu85Yntr7i74rkTiX3crj5iVANaZHmI
         W/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781303; x=1716386103;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhqwbTjcYPKqjA3fcdjahtltKIvrjVq+INTIIqzGjtI=;
        b=C3ElbWDUc10vFX8zRBt19onQPsMnaF+Jwd+AoQaLHXx10NX4FVg/yJNyBg68ZXXetF
         EfaJPGQ1oWQ/ISHA8YzuTlu8rcEL0RwdRjQGy8tAxlDZlDrji9xd6VXpQai1l6M6dByF
         jmOH+G3NqaaWNY35j/1P62kVuYjH7sXw5n9NMlDUGZjRpGIqMbDXUY9HlDExYv7XEjky
         VNVqo/5z9KjefyNXkgrhTo0+5czHbobl947h/Qcpu7p4B28W7zLGmVe0wyQXrcZsez0i
         y3OZz8PcrJklIpiS1uq7DEBPh/o45Yi48TJm5JlQZ2gnd1TYAITppdcawx28qcIj+UES
         ZpEA==
X-Forwarded-Encrypted: i=1; AJvYcCUVGHpp+KkAMrtq5Zgo9vkIWoYgDagQJ0HHHTBXIxOtR2Hk/kmF8rA3bulCrERK0n6khTi80GS5uUNaXNaJ7+ek4eW4mJ6ubBWhVZMMWY8=
X-Gm-Message-State: AOJu0YzkAIFE+mX6Qcg7VHA0kY7nNNi/ctwBo9x9iZLfP7/dm4eSf2El
	jRTrzneZqNWhExcrIdAFa+58OVWThZrxkwNs4qeIBJ1c3PSWEqXD
X-Google-Smtp-Source: AGHT+IGybDgSo05OkMM/MRG6inWht+8PNtPdDwzHGj+MKiMbwreRKFd4h5wtPObIQYQVC7TLYuHL+Q==
X-Received: by 2002:a2e:848f:0:b0:2de:48ef:c3e1 with SMTP id 38308e7fff4ca-2e51fd5949emr127218011fa.21.1715781302885;
        Wed, 15 May 2024 06:55:02 -0700 (PDT)
Message-ID: <46fd5c698fc13ffa3e8e82ed507bcfa67a9ef819.camel@gmail.com>
Subject: Re: [PATCH v9 03/15] xen/bitops: implement fls{l}() in common logic
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 15 May 2024 15:55:01 +0200
In-Reply-To: <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
	 <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 11:09 +0200, Jan Beulich wrote:
> On 06.05.2024 12:15, Oleksii Kurochko wrote:
> > Changes in V9:
> > =C2=A0- update return type of fls and flsl() to unsigned int to be
> > aligned with other
> > =C2=A0=C2=A0 bit ops.
>=20
> But this then needs carrying through to ...
>=20
> > --- a/xen/arch/arm/include/asm/arm64/bitops.h
> > +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> > @@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long
> > __ffs(unsigned long word)
> > =C2=A0 */
> > =C2=A0#define ffz(x)=C2=A0 __ffs(~(x))
> > =C2=A0
> > -static inline int flsl(unsigned long x)
> > +static inline int arch_flsl(unsigned long x)
>=20
> ... e.g. here. You don't want to introduce signed/unsigned
> mismatches.
Do you mean that generic flsl() uses 'unsigned int' as a return type,
but arch_flsl continue to use 'int'?

>=20
> Also why do you keep "inline" here, while ...
>=20
> > --- a/xen/arch/x86/include/asm/bitops.h
> > +++ b/xen/arch/x86/include/asm/bitops.h
> > @@ -425,7 +425,7 @@ static always_inline unsigned int
> > arch_ffsl(unsigned long x)
> > =C2=A0 *
> > =C2=A0 * This is defined the same way as ffs.
> > =C2=A0 */
> > -static inline int flsl(unsigned long x)
> > +static always_inline int arch_flsl(unsigned long x)
>=20
> ... you switch to always_inline here?
Because Adnrew's patch with bitops.h for x86 changes to always_inline,
so to be consistent, at least, for architecture.

~ Oleksii

>=20
> (replying out of order)
>=20
> > --- a/xen/arch/arm/include/asm/arm32/bitops.h
> > +++ b/xen/arch/arm/include/asm/arm32/bitops.h
> > @@ -1,7 +1,7 @@
> > =C2=A0#ifndef _ARM_ARM32_BITOPS_H
> > =C2=A0#define _ARM_ARM32_BITOPS_H
> > =C2=A0
> > -#define flsl fls
> > +#define arch_flsl fls
>=20
> It's the Arm maintainers to ultimately judge, but I'd be inclined to
> suggest
>=20
> #define arch_flsl arch_fls
>=20
> instead. That's not only behaviorally closer to what was there
> before, but
> also reduces (a tiny bit) the amount of work the compiler needs to
> carry out.
>=20
> Jan


