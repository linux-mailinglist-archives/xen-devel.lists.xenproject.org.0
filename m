Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF9831612
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 10:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668672.1041042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOwC-0005ZS-Vn; Thu, 18 Jan 2024 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668672.1041042; Thu, 18 Jan 2024 09:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOwC-0005XG-T6; Thu, 18 Jan 2024 09:43:52 +0000
Received: by outflank-mailman (input) for mailman id 668672;
 Thu, 18 Jan 2024 09:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFDf=I4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQOwB-0005XA-DX
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 09:43:51 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14d52879-b5e6-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 10:43:49 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd2f472665so127782791fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 01:43:49 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a2eb8d1000000b002cccbb7ca38sm2162963ljp.2.2024.01.18.01.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 01:43:48 -0800 (PST)
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
X-Inumbo-ID: 14d52879-b5e6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705571029; x=1706175829; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5k74dhetbsOQhnnb8hZ++JwGAouX+7xHDEJphkDkr5I=;
        b=TpKIqtfQvACZknGHWY0LlM5jtjCnO4QCx434Z9u8zvkVwvQ5TyVjsPL/qy+16N32pO
         ruDrBBn3Z16ol6yjPtERp3jak4dt8s+Q5qavaL82cSFCssaKJow97KVKbMgUuGGYquBX
         ulQQtS8BXURYDhFUwG5iy8ZpWKdmfUUsSHTs4eoj2JsnTaaZ/Wjah/G1MCts5j5izzO1
         uqCkHc9lkwV/x3Pcr3stHBRH0XXBY7UO8G9xMC+QRVtAt5qIH78gguo9GM2PM3V/Ss25
         sEqPvxDL7MoflSnfJd3tHHed1fpyRFctmuf6gmasbRvi3yn59gIC7jU559Ti6SJyuuQ0
         e5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705571029; x=1706175829;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5k74dhetbsOQhnnb8hZ++JwGAouX+7xHDEJphkDkr5I=;
        b=bK/wwnJMiJDh0/aAY+xlYzjjBjVgPANR7SQh895HFJIlnNj80jpQSGpXYdqVU1zghI
         X2gcMod6CAMYl7jUKoRQlwAeHfKlBeoMG0pSDh780VlGxkmdHS3i6hBto8N6EPsst9/b
         euQmGOaJY6drGXX87PPmWA9HNxkiin1BaL554pWEDv+GQbxlZZVjRSc1DgYjFciscQ1M
         4mAULgCXSRhS1PG0g4to6EaBhXTsQOWCh/+BxA3ouTwltSfoxnPbZ/MUSF8Eoh3Gj6Wt
         nq20bgLZBBUAlOjQYWC0MUdy40QGo2fxxAn//Cc0yQnYd/sUcXRBvfYhr9uSQk5IlOWl
         gWEA==
X-Gm-Message-State: AOJu0YxnfIpPuo0VcihxbJKOxZqhw3lZhIlsJ6wMk/7hXf2CWMSAS+iS
	0zlXqaIa4fM3N6g9H+pkR8sUMJ7lU8evVwzxJQC7+HT0g0lAIvTp
X-Google-Smtp-Source: AGHT+IHlBe5oP/7QjfhotJHoTd71T2jdki+jHkWaNzLxpdFYnn7z30wmcTk6Pke5OejKlHkcG1+ZIA==
X-Received: by 2002:a2e:7e0d:0:b0:2cd:2329:24b3 with SMTP id z13-20020a2e7e0d000000b002cd232924b3mr297516ljc.64.1705571028445;
        Thu, 18 Jan 2024 01:43:48 -0800 (PST)
Message-ID: <1c0eb1cdef1fac7695c4fc416128e2bb81cf13aa.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 18 Jan 2024 11:43:40 +0200
In-Reply-To: <23955665-8bd8-4872-a1a5-e3a3711c9512@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
	 <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
	 <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
	 <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
	 <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
	 <1b20fefd125598e2bb62d516495783650da75271.camel@gmail.com>
	 <23955665-8bd8-4872-a1a5-e3a3711c9512@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-17 at 14:42 +0100, Jan Beulich wrote:
> On 17.01.2024 12:37, Oleksii wrote:
> > > > >=20
> > > > > > > Also you want to make sure asm-generic/bitops/bitops-
> > > > > > > bits.h
> > > > > > > is
> > > > > > > really in use here, or else an arch overriding / not
> > > > > > > using
> > > > > > > that
> > > > > > > header may end up screwed.
> > > > > > I am not really understand what do you mean. Could you
> > > > > > please
> > > > > > explain a
> > > > > > little bit more.
> > > > >=20
> > > > > Whichever type you use here, it needs to be in sync with
> > > > > BITOP_BITS_PER_WORD. Hence you want to include the _local_
> > > > > bitops-
> > > > > bits.h
> > > > > here, such that in case of an inconsistent override by an
> > > > > arch
> > > > > the
> > > > > compiler would complain about the two differring #define-s.
> > > > > (IOW
> > > > > an
> > > > > arch overriding BITOP_BITS_PER_WORD cannot re-use this header
> > > > > as-
> > > > > is.)
> > > > >=20
> > > > > The same may, btw, be true for others of the new headers you
> > > > > add
> > > > > -
> > > > > the
> > > > > same #include would therefore be needed there as well.
> > > > Now it clear to me.
> > > >=20
> > > >=20
> > > > It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD, and
> > > > BITS_PER_BYTE are defined in {arm, ppc,
> > > > riscv}/include/asm/bitops.h.
> > > > I expected that any architecture planning to use asm-
> > > > generic/bitops/bitops-bits.h would include it at the beginning
> > > > of
> > > > <arch>/include/asm/bitops.h, similar to what is done for RISC-
> > > > V:
> > > > =C2=A0=C2=A0 #ifndef _ASM_RISCV_BITOPS_H
> > > > =C2=A0=C2=A0 #define _ASM_RISCV_BITOPS_H
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <asm/system.h>
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <asm-generic/bitops/bitops-bits.h>
> > > > =C2=A0=C2=A0 ...
> > > >=20
> > > > But in this case, to allow architecture overrides macros, it is
> > > > necessary to update asm-generic/bitops/bitops-bits.h:
> > > > =C2=A0=C2=A0=C2=A0 #ifndef BITOP_BITS_PER_WORD
> > > > =C2=A0=C2=A0=C2=A0 #define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=
=A0 32
> > > > =C2=A0=C2=A0=C2=A0 #endif
> > > > =C2=A0=C2=A0 ...
> > > > Therefore,=C2=A0 if an architecture needs to override something, it
> > > > will
> > > > add
> > > > #define ... before #include <asm-generic/bitops/bitops-bits.h>.
> > > >=20
> > > > Does it make sense?
> > >=20
> > > Sure. But then the arch also needs to provide a corresponding
> > > typedef
> > > (and bitops-bits.h the fallback one), for use wherever you use
> > > any of
> > > those #define-s.
> > Which one typedef is needed to provide?
> > <asm-generic/bitops/bitops-bits.h> contains only macros.
>=20
> A new one, to replace where right now you use "unsigned int" and I
> initially said you need to use "uint32_t" instead. With what you said
> earlier, uint32_t won't work there (anymore).
Wouldn't it be enough just to "#include <xen/types.h>" in headers where
"uint32_t" is used?

~ Olkesii


