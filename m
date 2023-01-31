Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB6682C81
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 13:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487606.755274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpgG-00046a-E8; Tue, 31 Jan 2023 12:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487606.755274; Tue, 31 Jan 2023 12:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpgG-00043z-BE; Tue, 31 Jan 2023 12:24:08 +0000
Received: by outflank-mailman (input) for mailman id 487606;
 Tue, 31 Jan 2023 12:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMpgE-00043t-TK
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 12:24:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 265c11a3-a162-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 13:24:04 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id z11so14239206ede.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 04:24:04 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 m13-20020aa7c2cd000000b00499b6b50419sm2477349edp.11.2023.01.31.04.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 04:24:03 -0800 (PST)
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
X-Inumbo-ID: 265c11a3-a162-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2kltFoK2okjjXyyfDtDoDJKFwbDdK3iC7eRwue+UiHs=;
        b=aQX2xe0vlEtnVV8+9ASUtxPzSqFBnlpzRpJuFfM+WwOezaoX3NXedeEGBSBAER+iSm
         PKt3SW76EUjzoGhYQrUCswybLTILSONQd7wgeiaRr2SYGPSNzLdq1AeO+VDxvp1T0k/x
         k/HcMZhZ3+d5M4Awmobz+X8dRcl83lhoSjlH6mdFnCJxCSG6dIwqkpSBO3BDNawSAPwR
         G2oJufd0/RBwTg4jIEAwgWtfNy/hrL+QG1OHRhbQpv2ENKcB+jq6lpW69F1yqJonY+FI
         y+tGCHTUX+pMdVs0nI00d3IxxMUtLRQ3FVCs2rIn8EffUQHXNl3PLl0mUvquzIgiypUs
         yHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kltFoK2okjjXyyfDtDoDJKFwbDdK3iC7eRwue+UiHs=;
        b=WM32TX8mPGYBOoP7J9MyAahkGhDAhbubhIbxoDsjW6ATd1NJBSqszC+P9ubhz6324W
         V9+sH+otzNVRbUyDxVDQgyfmk59U66YD2c5hDxosjvGL77UJOXGRo1HA3S7EI+N/Bo9v
         7RAG9yeuGkHd3tSVoCV1zlIKm5vpW5AcAc5cNRkCP09F/8oT7Af9i9z5IpecfFcBay4A
         PMvovUcasJOnmECB0IZ9AiNa0NWGnaj+h7UfqH7++bO54w0gWVL/azEoQG7oUamTDJnm
         bA5qbmg9M7FtZDBIOrIIBBpjt7q0PBf0O7vFaRNthCcWOorT+0E76ONaC9tbC1wfhqZx
         Gmyg==
X-Gm-Message-State: AFqh2krTEhyz0TE2lN6UqREsYmhLDkQKP6h8JCZ4VwiBC5e1XnZCrEqy
	UGFa7QDtak7Zog0+941hYQQ=
X-Google-Smtp-Source: AMrXdXtrq8e1rmhBRv1KU7pAS4kqe6nLqWP+MmTtcWVfLTgoHulWqwSgLw/8GZMx+Me+QCXFEB28ww==
X-Received: by 2002:a50:c005:0:b0:49e:f062:99e6 with SMTP id r5-20020a50c005000000b0049ef06299e6mr41538084edb.28.1675167843575;
        Tue, 31 Jan 2023 04:24:03 -0800 (PST)
Message-ID: <72a7bdfc72161144df741e3a39f628874d88debd.camel@gmail.com>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Bobby Eshleman
 <bobby.eshleman@gmail.com>
Date: Tue, 31 Jan 2023 14:24:02 +0200
In-Reply-To: <8c0bce0b-05bd-5f4b-7b66-f6668ad34899@xen.org>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
	 <a8219b2d-a22d-63ac-5088-c33610310d6e@xen.org>
	 <27469e861d4777af42b84fb637b24ed47a187647.camel@gmail.com>
	 <8c0bce0b-05bd-5f4b-7b66-f6668ad34899@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Mon, 2023-01-30 at 22:11 +0000, Julien Grall wrote:
> Hi,
>=20
> On 30/01/2023 11:40, Oleksii wrote:
> > On Fri, 2023-01-27 at 14:54 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 27/01/2023 13:59, Oleksii Kurochko wrote:
> > > > +static inline void wfi(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ("wfi");
> > >=20
> > > I have starred at this line for a while and I am not quite too
> > > sure
> > > to
> > > understand why we don't need to clobber the memory like we do on
> > > Arm.
> > >=20
> > I don't have an answer. The code was based on Linux so...
>=20
> Hmmm ok. It would probably wise to understand how code imported from=20
> Linux work so we don't end up introducing bug when calling such
> function.
>=20
> =C2=A0From your current use in this patch, I don't expect any issue. That
> may=20
> chance for the others use.
>=20
Could you please share with me a link or explain what kind of problems
may occur in case when we don't clobber the memory in the others use
case during usage of "wfi" ?

As I understand the reason for clobber the memory is to cause GCC to
not keep memory values cached in registers across the
assembler	instruction and not optimize stores/load to the memory.
But current one instruction isn't expected to work with the memory so
it should be safe enough to stall current hart ( CPU ) until an
interrupt might need servicing.

Anyway we can change the code to:
    __asm__ __volatile__ ("wfi" ::: "memory")
In order to be sure that no problems will arise in the future.

> > > FWIW, Linux is doing the same, so I guess this is correct. For
> > > Arm we
> > > also follow the Linux implementation.
> > >=20
> > > But I am wondering whether we are just too strict on Arm, RISCv
> > > compiler
> > > offer a different guarantee, or you expect the user to be
> > > responsible
> > > to
> > > prevent the compiler to do harmful optimization.
> > >=20
> > > > +/*
> > > > + * panic() isn't available at the moment so an infinite loop
> > > > will
> > > > be
> > > > + * used temporarily.
> > > > + * TODO: change it to panic()
> > > > + */
> > > > +static inline void die(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 for( ;; ) wfi();
> > >=20
> > > Please move wfi() to a newline.
> > Thanks.
> >=20
> > I thought that it is fine to put into one line in this case but
> > I'll
> > move it to a newline. It's fine.
>=20
> I am not aware of any place in Xen where we would combine the lines.
> Also, you want a space after 'for'.
>=20
> Cheers,
>=20

~ Oleksii

