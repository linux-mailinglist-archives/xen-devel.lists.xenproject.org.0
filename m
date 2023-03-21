Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66A6C3498
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512759.792944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedCs-00040v-Mv; Tue, 21 Mar 2023 14:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512759.792944; Tue, 21 Mar 2023 14:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedCs-0003yR-JK; Tue, 21 Mar 2023 14:43:22 +0000
Received: by outflank-mailman (input) for mailman id 512759;
 Tue, 21 Mar 2023 14:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mk2b=7N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pedCq-0003we-MY
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:43:20 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8dd7111-c7f6-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:43:19 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id eg48so60519491edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 21 Mar 2023 07:43:19 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 hy14-20020a1709068a6e00b009351546fb54sm2282501ejc.28.2023.03.21.07.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 07:43:18 -0700 (PDT)
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
X-Inumbo-ID: b8dd7111-c7f6-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679409799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XThZ6lmuLQxDd9DKefQ+06Tp1xtXj4lVszU4dtYqqkk=;
        b=oq4UrdunKqOULpXfch7xlL5BRXTnk2YuD7gMl+5Hql8QAGxFlKB8HTPkPxBvbPvoVh
         9QmnxtKy+oUaAhJ+kRGIiu8Nr/AEqkw+ZAswCfH2Ug6rc86sTm5tUJIr6b63n9i5pF4d
         Q9PrudH11sUgeSiQyx4cOx1ZVeja3s4TZteDxlj3j3bwfWsvudAnwKkAFsjuG9LFY5GX
         Lo9O6XKr8VctwPYksYbXrO35XNSaFTBi5nHncFCz2jJ6zz1/4LIHuR8SOk1n3/fgco1M
         ct/Wo3t40lXACI3+H+HyVHv26klfaASkYObEfHq+c5DgMJPZB5SgyBpTmeGzTEFxubfG
         atPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XThZ6lmuLQxDd9DKefQ+06Tp1xtXj4lVszU4dtYqqkk=;
        b=P9qHxCS1cLUk5HaNJNQZHpmdOTPIdU6wpodtkhW7EagDtShETuF4Ut9zDQLxDOckVn
         eO5ySbVOd9xPQXwKsYwLLGidwARGBz8Ag+n+2qgFTFUoIFR8z71tAEFMXLkOvW7oDSCV
         oF23O5QAcIMrmIx3t5RMpP4w2WPPHWdZwonc06Mc9uvE7CWUq/146rKOBO6CNkUT0XKW
         wA9X3BM6cBp0YDCb4cXJpPzZv9AcMN2jVKSGQEcqybXJUDPMNGdt0CCT1DW9oiFg7Qxx
         MKUv8k8WIVHMd3/BnMexzCU3CSCTtoCcv5QTd7mKZAl3xVUoUd7Zrv6PJiv1gdqyDBRa
         TXfQ==
X-Gm-Message-State: AO0yUKXa9EvAeO31XYWuaoEE+EyJj+nRc22k0CTBn5sTIQVV7DaCKES6
	oEMKgawoDKZJEttGkY89JYY=
X-Google-Smtp-Source: AK7set/3zOqKmmCG8FMCeyhHRo12kUoi03AUOExVtnBOe1OcK7zjVYP43L5JIGpPepVQqY2a7eJbQA==
X-Received: by 2002:a17:906:4ec8:b0:931:95a1:a05a with SMTP id i8-20020a1709064ec800b0093195a1a05amr3108545ejv.62.1679409799147;
        Tue, 21 Mar 2023 07:43:19 -0700 (PDT)
Message-ID: <0c5f4d3a33012c3f7fab163214f49ffa5afe69f2.camel@gmail.com>
Subject: Re: [PATCH v5 2/7] xen/riscv: initialize boot_info structure
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 21 Mar 2023 16:43:17 +0200
In-Reply-To: <b0581373-bc41-f05b-d3c9-d5e12b0111fc@suse.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <1941d4ed64ff6edcc6354d09d6a40db4d6f63c44.1678976127.git.oleksii.kurochko@gmail.com>
	 <b0581373-bc41-f05b-d3c9-d5e12b0111fc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-21 at 12:27 +0100, Jan Beulich wrote:
> On 16.03.2023 15:39, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -1,12 +1,16 @@
> > =C2=A0#include <xen/compile.h>
> > =C2=A0#include <xen/init.h>
> > +#include <xen/kernel.h>
> > =C2=A0
> > +#include <asm/boot-info.h>
> > =C2=A0#include <asm/early_printk.h>
> > =C2=A0
> > =C2=A0/* Xen stack for bringing up the first CPU. */
> > =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> > =C2=A0
> > +struct boot_info boot_info =3D { (unsigned long)&_start, (unsigned
> > long)&_end, 0UL, 0UL };
>=20
> You add no declaration in a header, in which case this wants to be
> static.
Sure.
> It may also want to be __initdata, depending on further planned uses.
I am going to use it only for initial page table initialization.
At least for now.
> I
> would also like to suggest using C99 dedicated initializers and in
> any
> event omit the 0UL initializer values (as that's what the compiler
> will
> use anyway). Yet even then I think the line is still too long and
> hence
> needs wrapping.
>=20
> > @@ -15,11 +19,19 @@ unsigned char __initdata
> > cpu0_boot_stack[STACK_SIZE]
> > =C2=A0 */
> > =C2=A0int dummy_bss __attribute__((unused));
> > =C2=A0
> > +static void fill_boot_info(void)
>=20
> __init?
Yes, should it be __init.
>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 boot_info.load_start =3D (unsigned long)_start;
> > +=C2=A0=C2=A0=C2=A0 boot_info.load_end=C2=A0=C2=A0 =3D (unsigned long)_=
end;
> > +}
>=20
> I'd like to understand how this is intended to work: _start and _end
> are known at compile time, and their value won't change (unless you
> process relocations alongside switching from 1:1 mapping to some
> other virtual memory layout). Therefore - why can't these be put in
> the initializer as well? Guessing that the values derived here are
> different because of being calculated in a PC-relative way, I think
> this really needs a comment. If, of course, this can be relied upon
> in the first place.
Your guessing is correct. In this case addresses of _start and _end
will be calculated in a PC-relative way.
So I'll add a comment.

>=20
> Also please be consistent about the use of unary & when taking the
> address of arrays (or functions). Personally I prefer the & to be
> omitted in such cases, but what I consider relevant is that there
> be no mix (in new code at least).
Sure.

Thanks for the comments.
I'll fix that in the new version of the
patch.

~ Oleksii

