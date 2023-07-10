Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31674CFB1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561072.877364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIm3m-0000JE-7D; Mon, 10 Jul 2023 08:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561072.877364; Mon, 10 Jul 2023 08:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIm3m-0000GR-4P; Mon, 10 Jul 2023 08:15:54 +0000
Received: by outflank-mailman (input) for mailman id 561072;
 Mon, 10 Jul 2023 08:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMe=C4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qIm3l-0000GL-CP
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:15:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8ddb62-1ef9-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 10:15:51 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so6411432e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 01:15:51 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x23-20020ac25dd7000000b004faf6a87d63sm1608147lfq.38.2023.07.10.01.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:15:50 -0700 (PDT)
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
X-Inumbo-ID: fb8ddb62-1ef9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688976951; x=1691568951;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lKUHGa5/11cgHeI5dBycIE5wsCZp3knTuOZ8P58dfJg=;
        b=K99sQT3TXi4ivuKhRP+VQ3S8tz+NtkCQ9uYLBxhhBz/OsRdtouNgKYgiTQKDp+8Hu6
         Znp7J5+iQ5MPCCyLR5KOXAg1EXhjfaQaoj9phBp7/yCRNwF6wa3EMaxc/Q5SFjYa0kdi
         asbO6C2b1cdWe2/eJILEFQaxm4oE3gbcRbcr8CR/syqQD0xWcqSbuW6mm8UBMAEZUuXg
         F2IlaPgb+HWUAvXOb+umrqI+GOFZpbWcczg77XxVrTLxPG1Q1KxyD3P418mL0rdfaGin
         PF5yWM0iWC54EYKJg9DxWxJIvV0U9MyPrqW6vXr05LkxA18McqhuUi/Q2LoSbi3Up11k
         YZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976951; x=1691568951;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKUHGa5/11cgHeI5dBycIE5wsCZp3knTuOZ8P58dfJg=;
        b=KMHdnZpHno2K2hA0x4vzMot1tSuLTyIMQRxVEUHmVjpBHJhJq/1JW6bVLNpwU4qUCA
         lLj4S5Q6N1qawv8WjycVUx1lkWqs/FC0cHNOqkm5+fT1/Leq7qZYRhzQXmGl/6fKeotK
         9Qy4pM+bcbTX4FVEh0RxhM/Dk3ZJIQ0O2P3PciClRXzcF79dHKtMZRXlHc3oPluWEGVu
         XzyL0Bk47af6FzsqNPi1mnFOrNufX4w3S+Iux9AiLQpY/5UX67JcSb2f1iMxn15mAs/K
         odhdLd4F3HlvjZlNVZCz1xGeEei80QzOy8IrhuxEi/uiad+82/xD6RFmsaznEry29goH
         dCNw==
X-Gm-Message-State: ABy/qLaks4pOkTQCGC/6Ir5q8b6tSdn0Sg9BwLH+aNGo2q/Gj+tNH8F/
	LtUrjYhmbK9G/5WbjyYFOGg=
X-Google-Smtp-Source: APBJJlH3kHi3y+7Cs3dvnNROg+d2nQvAo338PrKA3UcQSzfaLVsZmNLla8yJkWM6rdtT1IyZ4VVs6g==
X-Received: by 2002:a19:645e:0:b0:4fb:8948:2b2b with SMTP id b30-20020a19645e000000b004fb89482b2bmr8374841lfj.48.1688976950717;
        Mon, 10 Jul 2023 01:15:50 -0700 (PDT)
Message-ID: <dcf0130ac1c6332b341a892730c9857e328e62a0.camel@gmail.com>
Subject: Re: [PATCH v2 3/6] xen/riscv: introduce function for physical
 offset calculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 10 Jul 2023 11:15:49 +0300
In-Reply-To: <7ab29494-a74c-5a03-3a91-acf30e39884f@suse.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
	 <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
	 <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
	 <7ab29494-a74c-5a03-3a91-acf30e39884f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-07-07 at 11:35 +0200, Jan Beulich wrote:
> On 07.07.2023 11:12, Oleksii wrote:
> > On Thu, 2023-07-06 at 13:18 +0200, Jan Beulich wrote:
> > > On 19.06.2023 15:34, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -29,6 +29,8 @@ ENTRY(start)
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=
=A0=C2=A0 reset_stack
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 calc_phys_offset
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=
=C2=A0 start_xen
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text, "a=
x", %progbits
> > >=20
> > > Since you call a C function, the code to save/restore a0/a1 needs
> > > to
> > > move here (from patch 4).
> > Thanks. It makes sense.
> > It would be better to move save/restore a0/a1 ( from patch 4 )code
> > here.
> >=20
> > The only one reason I didn't do that before that calc_phys_offset
> > doesn't touch that and it is guaranteed that it will not ( as it
> > doesn't have arguments )
>=20
> How does a function not having parameters guarantee that registers
> used for parameter passing aren't touched? Inside a function, the
> compiler is free to use argument-passing registers just like other
> temporary ones; their values don't need preserving, from all I know
> (otherwise the RISC-V ABI would be different to all other ABIs I
> know of).
Well, you are right that it doesn't guarantee and the calling
convention tells that arg registers should be saved/restored
before/after function call.

But I haven't seen yet that compiler touch arg registers if function
accepts 'void' as an function argument. So 'guarantee' isn't correct
word.

Thanks for the note.

~ Oleksii


