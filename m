Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E952680C1F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486933.754369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSWA-000215-Sd; Mon, 30 Jan 2023 11:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486933.754369; Mon, 30 Jan 2023 11:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSWA-0001xa-Pp; Mon, 30 Jan 2023 11:40:10 +0000
Received: by outflank-mailman (input) for mailman id 486933;
 Mon, 30 Jan 2023 11:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMSW9-0001xP-Py
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:40:09 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87cda99-a092-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:40:07 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id mc11so8374488ejb.10
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 03:40:07 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 r15-20020a1709067fcf00b0087fa83790d8sm4433121ejs.13.2023.01.30.03.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:40:06 -0800 (PST)
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
X-Inumbo-ID: d87cda99-a092-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BFVX98D8tqCmSDNnjJJ2ONKYAyOt2WgCH9QPXSnXVJs=;
        b=PybxUaskY0DhOArONfwG32AmbvEBOEb8D5/cHUHEFkpkcc0I83xb/7TE8uObr71hPg
         wemD7+zSYI2gpDh1oYHqG2cYMZrUQ7iAa9LvgWWzWOYdGR5XitNZBY6rFrm3VxQi2nk0
         vmOZL+hX5haJ5BGZwt5r0xzFnteEOfxjSKy0aO14QEROqPFAWBS+HYpOZrhLnu4VX5uZ
         o/vRffpk3cnVoBzsNcRcmV1m5qe1bHo6ZVY655hFkZN7A9v0mqm4mblza9PB+SZncORH
         SYWM8DyVJ8iXA2idYISWroWFD449aPCSYbNQUApjKX1RBBoddAMrvEk2XxXTOpcTH12L
         /SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFVX98D8tqCmSDNnjJJ2ONKYAyOt2WgCH9QPXSnXVJs=;
        b=Aiv+0ZPKhUvcfXaCIUQ6rl+uAMKfDV/sVvUTfeCIHbitqziOzviFF0IR+BhasUtZWl
         oaKxP+QMy4ZviL1MWziqI72Lo/2MXzb7WbbE0Ot16iIo1RBmT1MFf1XncvuJQGcrz9UU
         rps2PONTEGiH0aVpQt9BE+Atp+NME3A/2f4VquTqGfGb1UMMow+V+99GNPfWhbNhK4mB
         1F1HbponDF2UKVrayjGpifchvbVj2TLBNDvaFU+avW22xT7tOUGt4cTuWetk+iJ+iqcI
         JNoMcNIMulqAptdAY/TDPjs56YrfK2Rxici7hBd7olhLGeynTk8M1QIvdr1QfZ5gAdYl
         kh+g==
X-Gm-Message-State: AO0yUKXBitX5/2LTx+FRfNCCmh3M2vL5hzGjdkLFpx21RH4smhdbXeml
	FWDJ7FJgAoVGokX2RVHBFSqKraBPse0=
X-Google-Smtp-Source: AK7set+qPXXnIknIcXX8uIFGMP76+3Vb1o3oautunRSYuFxqXR4DY4uS+BTzqtDYuv8046xTkE9vdw==
X-Received: by 2002:a17:907:7618:b0:888:5d34:dc79 with SMTP id jx24-20020a170907761800b008885d34dc79mr3723428ejc.40.1675078807412;
        Mon, 30 Jan 2023 03:40:07 -0800 (PST)
Message-ID: <27469e861d4777af42b84fb637b24ed47a187647.camel@gmail.com>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Bobby Eshleman
 <bobby.eshleman@gmail.com>
Date: Mon, 30 Jan 2023 13:40:05 +0200
In-Reply-To: <a8219b2d-a22d-63ac-5088-c33610310d6e@xen.org>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
	 <a8219b2d-a22d-63ac-5088-c33610310d6e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Fri, 2023-01-27 at 14:54 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 27/01/2023 13:59, Oleksii Kurochko wrote:
> > +static inline void wfi(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ("wfi");
>=20
> I have starred at this line for a while and I am not quite too sure
> to=20
> understand why we don't need to clobber the memory like we do on Arm.
>=20
I don't have an answer. The code was based on Linux so...
> FWIW, Linux is doing the same, so I guess this is correct. For Arm we
> also follow the Linux implementation.
>=20
> But I am wondering whether we are just too strict on Arm, RISCv
> compiler=20
> offer a different guarantee, or you expect the user to be responsible
> to=20
> prevent the compiler to do harmful optimization.
>=20
> > +/*
> > + * panic() isn't available at the moment so an infinite loop will
> > be
> > + * used temporarily.
> > + * TODO: change it to panic()
> > + */
> > +static inline void die(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 for( ;; ) wfi();
>=20
> Please move wfi() to a newline.
Thanks.

I thought that it is fine to put into one line in this case but I'll
move it to a newline. It's fine.
>=20
> > +}
>=20
~Oleksii


