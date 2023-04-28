Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1A6F1F1A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 22:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527512.820200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psULY-0003Mo-Vn; Fri, 28 Apr 2023 20:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527512.820200; Fri, 28 Apr 2023 20:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psULY-0003Jh-Sz; Fri, 28 Apr 2023 20:05:36 +0000
Received: by outflank-mailman (input) for mailman id 527512;
 Fri, 28 Apr 2023 20:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwQI=AT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1psULX-0003Jb-Iv
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 20:05:35 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0918a969-e600-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 22:05:34 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4efe8991bafso386021e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 13:05:34 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004b4cbc942a3sm3471056lfn.127.2023.04.28.13.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 13:05:33 -0700 (PDT)
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
X-Inumbo-ID: 0918a969-e600-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682712334; x=1685304334;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0aND+n7/PKHOEQPKVPWNXIrcaugL76T49hwzjxzmNGU=;
        b=Rl7+/L59pveNTCO1IV9amW2mqiYZ0nJSn7ixOASwqOKUdakKz42WY9nXIZlVo+u9/8
         DKtCLkaQnfcK83PfVocSVv/7GeFpjC/9IjVYoHFDZWfT3fFwczZ0g62GdlmxCafyLHNE
         bLDdQ4XniROIJcwh2RrhsYTNsGoxUi7/g7XjpZL1IOoAeXtpOdZ4p0jRtcGwosPjQn+9
         1OYOdPEobvQWmNKbI1YG58rjIYB6ujtSV9F8MRZyUUHiwyhIRB2LX+d0GQDHJ4W4D5d7
         DpFEfji58BhHThcL3YM6jIUCf85SWd3IWp78WPY3UB5KHR/0r6UAFcO++JgUR7IJVed4
         0Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682712334; x=1685304334;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0aND+n7/PKHOEQPKVPWNXIrcaugL76T49hwzjxzmNGU=;
        b=FDVQVEp/sQRBD7IFLSIlf6mjbzr8j8gPjKaRjIj1QFasdsV+TZOcIT6MKdgxYIN5S/
         4xVSqOh0suEMwmiUA2xYvwE8gUEhH5We2hsy+6XMvMpaJ09wJGeD/P9G6oTIF5iU08DG
         NYNvrTvUT5o8PxyYoGLZ09ATAbTxbVG9MZufsP5bXBxfRwOFl6VOQTgfR0AbYfbUf1ef
         bUaTfW3w+ytaIyqACVyHc0fEoOZGSeNCIZWSabMvBtFvXjTc6EMvNiXfwurTbnhxjaQ1
         +sy77K/kn1dlGnJmgIfrD/eHopAryNl0SVk2kRknH+hO0p/sJ2OeplkQ6baX8tX+TTAH
         FalQ==
X-Gm-Message-State: AC+VfDyEEdtCsYEMTkXDrCAUahhx7NI9sMVI+Fqe1BZT3WGRxKdmbErW
	qXNbEHZ4Mt8PjAGr8h0ClHQ=
X-Google-Smtp-Source: ACHHUZ5j1F8D2DcPWLwMybnj8vOPjyp9/mfCHNRpZdfNlqJyx4IUH/FlROB0BT00LeSbblrTFz6r/g==
X-Received: by 2002:ac2:46f3:0:b0:4ec:8362:1880 with SMTP id q19-20020ac246f3000000b004ec83621880mr1911756lfo.48.1682712333975;
        Fri, 28 Apr 2023 13:05:33 -0700 (PDT)
Message-ID: <5316859bf081d2c00dae784e6700f55747a6635d.camel@gmail.com>
Subject: Re: [PATCH v5 2/4] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Connor Davis
 <connojdavis@gmail.com>,  xen-devel@lists.xenproject.org
Date: Fri, 28 Apr 2023 23:05:32 +0300
In-Reply-To: <2c424759-3072-cd07-913d-c45ae6791ce2@suse.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
	 <5b27693bcdf6d64381314aeef72cfe03dee8d73a.1681918194.git.oleksii.kurochko@gmail.com>
	 <67d8574f-2e0d-4eb6-19aa-67fe7645e35a@suse.com>
	 <ea2d5cfabb9ada64eb975369779ca430f38e9eec.camel@gmail.com>
	 <53257ae8-d306-8c7e-35ff-f3bc3947849b@suse.com>
	 <3d440048717892fe5d3ed7fe3255dc8c9f5d38a3.camel@gmail.com>
	 <2c424759-3072-cd07-913d-c45ae6791ce2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

Hi Jan,

On Mon, 2023-04-24 at 17:35 +0200, Jan Beulich wrote:
> On 24.04.2023 17:16, Oleksii wrote:
> > On Mon, 2023-04-24 at 12:18 +0200, Jan Beulich wrote:
> > > On 21.04.2023 18:01, Oleksii wrote:
> > > > On Thu, 2023-04-20 at 16:36 +0200, Jan Beulich wrote:
> > > > > On 19.04.2023 17:42, Oleksii Kurochko wrote:
> > > > > > +=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((unsigned long)stage1_pgtbl_root >>
> > > > > > PAGE_SHIFT)
> > > > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 satp_mode << SATP_MODE_SHIFT);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 if ( (csr_read(CSR_SATP) >> SATP_MODE_SHIFT=
) =3D=3D
> > > > > > satp_mode
> > > > > > )
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_mode_supported =
=3D true;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 /* Clean MMU root page table and disable MM=
U */
> > > > > > +=C2=A0=C2=A0=C2=A0 stage1_pgtbl_root[index] =3D paddr_to_pte(0=
x0, 0x0);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP, 0);
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile("sfence.vma");
> > > > >=20
> > > > > I guess what you do in this function could do with some more
> > > > > comments.
> > > > > Looks like you're briefly enabling the MMU to check that what
> > > > > you
> > > > > wrote
> > > > > to SATP you can also read back. (Isn't there a register
> > > > > reporting
> > > > > whether the feature is available?)
> > > > I supposed that it has to be but I couldn't find a register in
> > > > docs.
> > >=20
> > > Well, yes, interestingly the register is marked WARL, so
> > > apparently
> > > intended to by used for probing like you do. (I find the
> > > definition
> > > of
> > > WARL a little odd though, as such writes supposedly aren't
> > > necessarily
> > > value preserving. For SATP this might mean that translation is
> > > enabled
> > > by a write of an unsupported mode, with a different number of
> > > levels.
> > > This isn't going to work very well, I'm afraid.)
> > Agree. It will be an issue in case of a different number of levels.
> >=20
> > Then it looks there is no way to check if SATP mode is supported.
> >=20
> > So we have to rely on the fact that the developer specified
> > RV_STAGE1_MODE correctly in the config file.
>=20
> Well, maybe the spec could be clarified in this regard. That WARL
> behavior may be okay for some registers, but as said I think it isn't
> enough of a guarantee for SATP probing. Alistair, Bob - any thoughts?
I've re-read the manual regarding CSR_SATP and the code of detecting
SATP mode will work fine.
From the manual ( 4.1.11
Supervisor Address Translation and Protection (satp) Register ):
=E2=80=9CImplementations are not required to support all MODE settings, and=
 if
satp is written with an unsupported MODE, the entire write has no
effect; no fields in satp are modified.=E2=80=9D

So there is no leave any open question so I'll provide new patch
series.

~ Oleksii



