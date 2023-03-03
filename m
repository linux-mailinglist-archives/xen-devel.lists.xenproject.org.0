Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5606A9578
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505844.778814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2ra-0001Sy-RT; Fri, 03 Mar 2023 10:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505844.778814; Fri, 03 Mar 2023 10:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2ra-0001QU-Od; Fri, 03 Mar 2023 10:42:10 +0000
Received: by outflank-mailman (input) for mailman id 505844;
 Fri, 03 Mar 2023 10:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2rZ-0001QO-Hj
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:42:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c29dda8-b9b0-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 11:42:08 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id m6so3004439lfq.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:42:08 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 t15-20020ac2548f000000b004d093d60f50sm336808lfk.215.2023.03.03.02.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:42:08 -0800 (PST)
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
X-Inumbo-ID: 0c29dda8-b9b0-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677840128;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PW8je0OzBqwNZ1Zc+8H9rgdUp7bKwGY9QPCWAQKXOpE=;
        b=bNqbd3XBiWfSArQpVIsmetkObuO3ere3bu6trL6cKnD8s7LTW8Dn8mtNpnkoc+D7KJ
         YOJHGB4Ry2bT8H+Y9/n0byVb+52nzbXOf7/p7f30Xdf8Zf24i0m8SQSTJyFu87pZMUAR
         jy4mOuIpCOdFSwvm7dUQdrap2rxWFFEeVtw/8ienwLxWBRVBiQRTUyJiNBL+3aSHJeEL
         UCaW0MVS8PNGflm78sHM4wp3vrpi9nLRnZu9choJWQUVsogVap7zVBLnVShSS7iVjQD+
         xI0eLjZHc03pzENgsu50EicO7yUsKkclPUewrMCuP6J3YRdY1HhrxiUyGdlLOBkhpXVL
         gMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677840128;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW8je0OzBqwNZ1Zc+8H9rgdUp7bKwGY9QPCWAQKXOpE=;
        b=kEx7GaXX3fS+qRKvlbAn4/fptOqw2MhafOHe1HHpLQKYVxwG0tuiEllXdRP+g9VJkQ
         jJ58WCRhMT2cHUxWO4pB+lcNIa/6Y1ksj+e5SPvQv9K9tsQcYA6zcfkuUSYTGNGJsVAc
         h0eBPPRyNt45OTBsz6upSWe24nGDS0dyghVPsI4mDPb/dTWFGJhynAD23f/uNOoYVx7h
         UElQcck2bwj4nsLvKt2/tTLnhpEyTbZFpXBHHhyc89JXAnk1r9jFAHrTneiNqDN2tx6b
         57UQplIDCJoe8Cpq9UQVeUH5Bwu8dV/akAGmI9YJD1urX1R8w9E4or5AEQyuvzrQqCJP
         d+0g==
X-Gm-Message-State: AO0yUKUesdRd3YeJq9PlbvAwoEh6CozHQ4drnFLtYUF/gs7IJzmGnsYQ
	dmwhV2qiJBiZdiBP5t5U5l4=
X-Google-Smtp-Source: AK7set9G/HUb3Y+iiBc3lpLWJWZ8FZC8DxW5lQv79fnWEmNwCcdNj9uEB3/mdglhBbcYGsy8JV1dgQ==
X-Received: by 2002:ac2:560b:0:b0:4db:2c28:8974 with SMTP id v11-20020ac2560b000000b004db2c288974mr460818lfd.12.1677840128399;
        Fri, 03 Mar 2023 02:42:08 -0800 (PST)
Message-ID: <415ea0b45a1d6539935ef77181d08aa22e00f7e5.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: initialize .bss section
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Fri, 03 Mar 2023 12:42:06 +0200
In-Reply-To: <009206ce-1750-95f2-7f6f-34c71f0b79ec@citrix.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
	 <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
	 <009206ce-1750-95f2-7f6f-34c71f0b79ec@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-03-03 at 10:33 +0000, Andrew Cooper wrote:
> On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index adf5d6c74a..8887f0cbd4 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -18,6 +19,14 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 t0, SSTATUS_FS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrc=C2=A0=C2=A0=C2=A0=
 CSR_SSTATUS, t0
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Clear the BSS */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t3, __bss_start
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t4, __bss_end
> > +.L_clear_bss:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 zero, (t3=
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 t3, t3, __SIZEOF_POINTER__
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltu=C2=A0=C2=A0=C2=A0 t3, =
t4, .L_clear_bss
>=20
> Using t3/t4 is fine, but it would also have been fine to use t0/t1.
Yeah, I understand that. It was easier to rename and not confuse
something.

Could you please rename them during commit?
Have I to send new patch version?

~ Oleksii

