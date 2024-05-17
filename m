Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527488C82F3
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 11:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723948.1129115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tXx-0003OC-SY; Fri, 17 May 2024 09:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723948.1129115; Fri, 17 May 2024 09:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tXx-0003LO-PP; Fri, 17 May 2024 09:06:37 +0000
Received: by outflank-mailman (input) for mailman id 723948;
 Fri, 17 May 2024 09:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7tXw-0003KJ-TB
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 09:06:36 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c38a5394-142c-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 11:06:36 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51f1e8eaee5so1551915e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 02:06:36 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d36d3sm3232504e87.169.2024.05.17.02.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 02:06:35 -0700 (PDT)
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
X-Inumbo-ID: c38a5394-142c-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715936796; x=1716541596; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9wWPg2RcvLbF3/ZiMfHO//CKV1nJJUaxYjJQloOp4Zk=;
        b=ELHtN5BYVTzWsZ1RdIVq4xlEnFT84oDg5aNPPBzF64UmEV+IE/nBCyr+FoaehmtmvS
         4sqxddyQEcyvvBO/H2SqjHNLlG2OzeBdsifJe3VX37bjpTnFVXtcsj/TcGIf12NFzB9V
         vD+q8Ec1yFOmZqAvO4XXqNDrmuFeakpYEHtPlKBL0q+9FYvF14X7BpfQDHd0Dn5Iizfu
         zyYhMm9rhcjXIGiixJ2MFIu+A4GG3uxAXfyLn9dZj5yTeGCxSqzqMrYq2vNHrPzz5Akn
         hXDpEhMA1u86J/ypCSV3htRgXq4z/t8RTEG3Q6oruFKWJV+gCrKvZufPBpGP6E3qGZ95
         oVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715936796; x=1716541596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wWPg2RcvLbF3/ZiMfHO//CKV1nJJUaxYjJQloOp4Zk=;
        b=Ih/MfsNBqGKi2mLrJcLa8jBg9N91IqHqm+5oSJkBbkL0TsGyZP1cJtOmZnqS1I0SFj
         K9wSWdy1t3/alzWmrWMlL0LaXbA1v1zZYghwGLuJqnA43Pc4HadCi/838zmxgBw5mGpj
         D/YTE6uQ/jl5/pbUS1ohvf+3IBXzkKVjgnF8+ZPnEsY/QQys2sHFfzm11LDA50BzDBZG
         Gofqzn8aY948hy9JRCcYlSd8hl5YshYlDxmU51KlAlcT2pjS4fDW1PtOV5VH4Uy9gnGh
         +3qiklCeJDr4NJCDjKABGUOhDC2Acnt7Sj3csXcfFBYPuUwk/mNulloUfhAyNkqVfOZd
         hUYA==
X-Forwarded-Encrypted: i=1; AJvYcCWcMGiGUB43n6Wdag6T9OMUAOZPSyuGUkksvjj2Hiam7Tl4dFhCbvolF4eWsDWVJ6T0yphy9K17i/i4F39pAPT8D81oltu+gfPi6hkbYQ0=
X-Gm-Message-State: AOJu0YxhWMEbzSl/peuz+yS94OgFcC/jORuo7EuOxRSjEa2MI8TlD0eV
	2G7QjdM5x6sDjxTwqZT3c2IyAFMvNyeMhZtlTAXJFKS7zYUrEsy7
X-Google-Smtp-Source: AGHT+IE3yS7zTECqcemNQ4MmtlArLHFK3jnTiNKERP4VSX8hn+HQ9aet/+tj5NIUeTyaEn/Yaelfgg==
X-Received: by 2002:a05:6512:3083:b0:523:892c:44ff with SMTP id 2adb3069b0e04-523892c4573mr3463554e87.1.1715936795570;
        Fri, 17 May 2024 02:06:35 -0700 (PDT)
Message-ID: <9cee6531c9aa6650be803d004b06cc88a25df7f5.camel@gmail.com>
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
Date: Fri, 17 May 2024 11:06:34 +0200
In-Reply-To: <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
	 <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 11:09 +0200, Jan Beulich wrote:
> But this then needs carrying through to ...
>=20
> > --- a/xen/arch/arm/include/asm/arm64/bitops.h
> > +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> > @@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long
> > __ffs(unsigned long word)
> > =C2=A0=C2=A0 */
> > =C2=A0 #define ffz(x)=C2=A0 __ffs(~(x))
> > =C2=A0=20
> > -static inline int flsl(unsigned long x)
> > +static inline int arch_flsl(unsigned long x)
>=20
> ... e.g. here. You don't want to introduce signed/unsigned
> mismatches.
Is it critical for x86 to return int for flsl() and fls() or I can
update the return type for x86 too?

   static always_inline int arch_flsl(unsigned long x)
   {
       long r;
  =20
       asm ( "bsr %1,%0\n\t"
             "jnz 1f\n\t"
             "mov $-1,%0\n"
             "1:" : "=3Dr" (r) : "rm" (x));
       return (int)r+1;
   }
   #define arch_flsl arch_flsl
  =20
   static always_inline int arch_fls(unsigned int x)
   {
       int r;
  =20
       asm ( "bsr %1,%0\n\t"
             "jnz 1f\n\t"
             "mov $-1,%0\n"
             "1:" : "=3Dr" (r) : "rm" (x));
       return r + 1;
   }
   #define arch_fls arch_fls

Any specific reason why 'long' and 'int' types for r are used?

~ Oleksii

