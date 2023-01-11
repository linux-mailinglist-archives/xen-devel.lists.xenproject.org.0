Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F9665671
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 09:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475122.736658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFWmE-0000BW-I2; Wed, 11 Jan 2023 08:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475122.736658; Wed, 11 Jan 2023 08:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFWmE-00008t-Ez; Wed, 11 Jan 2023 08:48:06 +0000
Received: by outflank-mailman (input) for mailman id 475122;
 Wed, 11 Jan 2023 08:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9nX=5I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFWmC-00008n-MY
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 08:48:04 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c86103-918c-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 09:47:59 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id bf43so22462350lfb.6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jan 2023 00:48:02 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a056512348f00b004abc977ad7fsm2618553lfr.294.2023.01.11.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 00:48:01 -0800 (PST)
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
X-Inumbo-ID: a6c86103-918c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8y917LEB/E4gPgzcqGY64IPhYuqoMULpvWHngFQzRlY=;
        b=BhVKKn+O+uKX22E5J26BMzjcOBHqhEzPlMpmecjC6R0s2MyXuFVUXHvXgqg9qjTa0L
         pHoQOWNlpRX8g4iS3gcTPTdzgh7/HysbqbRnAaKWGriyHjHfV63QIODM6PW/X+/fhAZs
         OFHzAfsGzgLvIsdoYXnC4O/jR1a1HpiL3ojVK1eQvbMmVFEW1goJydpNgpinqdMYsURM
         SbjefM9UKh5KTLP9k7oF7h/Ckrn4YZD9c3uBrKNPv8eDsNyuEEa86aAi6mqGBOLQrD36
         7WgLwZNRCm/FMsuNpXDMtcEiDuQsgR3FOxtJIwHX5BMhPz/LYPeHHulFbG0cOq3TpYUa
         cz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8y917LEB/E4gPgzcqGY64IPhYuqoMULpvWHngFQzRlY=;
        b=STTzyJSbXJk+ydwNWfulpZ7GiUc07NiX2HPnnw+2ixmOcThQqHsw80SnHfd6KulDg2
         8gMg+DFBsQc3QQCt2ZA4vCXkMhhDSHj+b8MqfUjKF7UZLLVDkmH/Bcy8G4Aek3IoohZv
         hmKTci+Oc4NOZOyPIQaYlNH5SCCrZ73P6nG4C9wLU03QPzx+FVwO4KghSHqDRO2H3FE5
         EFt6tDivgLspmPnBLEyE8E2gN/75zLVoipsUqkEEwEgFt9MSJom+pcjwg3hcAaDDWCpE
         t1nxEqHZTZfBr1yfGxEuDtOjSvmT28zNCBMAr6Vba6xDLc81SuSmNxwvJsBi75oO/VuG
         YoNw==
X-Gm-Message-State: AFqh2kqJGP7rwzKIAAwATaxaU5Um33gNAuwvzPcNiraOoq1lIlOd0J0x
	KUEXJa8ZOcFMbUu5TnyPQwo=
X-Google-Smtp-Source: AMrXdXsv7jz+fVYF8AXY6KBGKv2KGgu/sAbV+BAjZP+C9tp0SHMCoFBt97GyczbGnJPSQkLCzlTyaA==
X-Received: by 2002:ac2:5604:0:b0:4a4:68b8:c2b6 with SMTP id v4-20020ac25604000000b004a468b8c2b6mr17246519lfd.13.1673426881740;
        Wed, 11 Jan 2023 00:48:01 -0800 (PST)
Message-ID: <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 11 Jan 2023 10:47:59 +0200
In-Reply-To: <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
	 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
	 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-01-10 at 17:58 +0100, Jan Beulich wrote:
> On 10.01.2023 16:17, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0=C2=A0=C2=A0 - Nothing changed
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0=C2=A0 - Remove unneeded now types from <asm/types.h>
>=20
> I guess you went a little too far: Types used in common code, even if
> you
It looks then I didn't understand which one of types are needed.

In "[PATCH v1 2/8] xen/riscv: introduce asm/types.h header file" all
types were introduced as most of them are used in <xen/types.h>:
__{u|s}{8|16|32|64}. Thereby it looks like the following types in
<asm/types.h> should be present from the start:
  typedef __signed__ char __s8;
  typedef unsigned char __u8;

  typedef __signed__ short __s16;
  typedef unsigned short __u16;

  typedef __signed__ int __s32;
  typedef unsigned int __u32;

  #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
  #if defined(CONFIG_RISCV_32)
    typedef __signed__ long long __s64;
    typedef unsigned long long __u64;
  #elif defined (CONFIG_RISCV_64)
    typedef __signed__ long __s64;
    typedef unsigned long __u64;
  #endif
  #endif

 Then it turns out that there is no any sense in:
  typedef signed char s8;
  typedef unsigned char u8;

  typedef signed short s16;
  typedef unsigned short u16;

  typedef signed int s32;
  typedef unsigned int u32;

  typedef signed long long s64;
  typedef unsigned long long u64;
    OR
  typedef signed long s64;
  typedef unsigned long u64;
As I understand instead of them should be used: {u|s}int<N>_t.

All other types such as {v,p}addr_t, register_t and definitions
PRIvaddr, INVALID_PADDR, PRIpaadr, PRIregister should be present in
<asm/types.h> from the start.

Am I right?
> do not build that yet, will want declaring right away imo. Of course
> I
> should finally try and get rid of at least some of the being-phased-
> out
> ones (s8 and s16 look to be relatively low hanging fruit, for
> example,
> and of these only s16 looks to be used in common code) ...
>=20
> Jan
~Oleksii

