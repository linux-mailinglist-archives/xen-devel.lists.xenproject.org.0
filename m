Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA46C3441
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512733.792911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ped0e-00014i-S2; Tue, 21 Mar 2023 14:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512733.792911; Tue, 21 Mar 2023 14:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ped0e-00011X-Nh; Tue, 21 Mar 2023 14:30:44 +0000
Received: by outflank-mailman (input) for mailman id 512733;
 Tue, 21 Mar 2023 14:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mk2b=7N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ped0d-0000zf-8s
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:30:43 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4c8b15b-c7f4-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:30:41 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id x3so60407184edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Mar 2023 07:30:41 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 jj4-20020a170907984400b009323f08827dsm5490602ejc.13.2023.03.21.07.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 07:30:40 -0700 (PDT)
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
X-Inumbo-ID: f4c8b15b-c7f4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679409040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dw5DwR90ObyH+956CPpSyKACGHfi9ATtygTds2rSG+0=;
        b=OnyqGXAmd4KXsDVvIof3uTryEQJEGtaA+TfC4ozxKfoLzpWam11Qwom04SlgFt67NF
         QCYJ76acQ0IRYsvlYygAeeGOtP4fwJg4EkpF2p4oQM/8Ou4fNYQu9KDzqXkSMLG1Xh2T
         pZic+OSiIjNCdizPs7/tIvcHtqkgd2/YJAtdfhxA5uEC8bdFaOXpdnK2CK5hMLiIf9Ti
         7/5U5xlzxQRNeZKEig2u5bCOMDhGnrpOmT8KM6dU/SntqCTA7IDqsXDCbev4OLFuk0MP
         dTPjO7cx/j2aI+lV3Z0WHWzJVAWvfQOHMkBAWZwUXpUZYwpCQLxwAaYvnnY/MFz+68BJ
         7BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw5DwR90ObyH+956CPpSyKACGHfi9ATtygTds2rSG+0=;
        b=zsVBHXY4scQFK5ERQin3nIQi9OT2jKuKdtRuidVf9InJSh1srcN/mlJMAVi0Awv8v5
         382gz/h5moQxFgC6N1D8iPQ+BhCwnoFteupsNE7jyfzItJvsrwXsRdg0zxw3NQLCyoLp
         dh9G8q0fZrP7hTEdX8FAEhQXYstl9bzWkr9yLswKTqtuFEytS06N5k/jVtVvESX5pZRW
         HEtnF86m+biVoFABT2IVFh5IzDSBaqGcI2CMTvA86YcVL0/aGkDJccsTJDcDrfnyHIVR
         9gUV5k/mcsrgEwYHtEfEqy5kGPyUOkGuy9aNq8lUEBoXSDVtzPmgzykzdOGo3LDjYgeh
         Z83w==
X-Gm-Message-State: AO0yUKXtLb7+mPIUK8aEhS3nLVdQFidUAbTxY7MKsRT5rVrPKc6aRtTa
	Ia9lRIcxKapVe2fFPMnqJrI=
X-Google-Smtp-Source: AK7set/X7Gtid0hKqDBSEi4mOpHQ/H0XpoLL83keBvCG1he/9arG47ae2gn5VJNNkJdqY+grBAexxg==
X-Received: by 2002:a17:906:7e14:b0:928:c92e:d112 with SMTP id e20-20020a1709067e1400b00928c92ed112mr3212104ejr.50.1679409040443;
        Tue, 21 Mar 2023 07:30:40 -0700 (PDT)
Message-ID: <d7f5482704816920de94b44eb1ffffb1f8941667.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] xen/riscv: introduce boot information structure
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 21 Mar 2023 16:30:38 +0200
In-Reply-To: <674d6337-dbff-fc22-fb32-d196c7bf6b63@suse.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
	 <674d6337-dbff-fc22-fb32-d196c7bf6b63@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-21 at 12:17 +0100, Jan Beulich wrote:
> On 16.03.2023 15:39, Oleksii Kurochko wrote:
> > @@ -50,4 +51,6 @@ void asm_offsets(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_reg=
s, sepc);
> > =C2=A0=C2=A0=C2=A0=C2=A0 OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_=
regs, sstatus);
> > =C2=A0=C2=A0=C2=A0=C2=A0 OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_re=
gs, pregs);
> > +=C2=A0=C2=A0=C2=A0 OFFSET(BI_LINKER_START, struct boot_info, linker_st=
art);
> > +=C2=A0=C2=A0=C2=A0 OFFSET(BI_LOAD_START, struct boot_info, load_start)=
;
> > =C2=A0}
>=20
> May I suggest that you add BLANK(); and a blank line between separate
> groups of OFFSET() uses? This may not matter much right now, but
> it'll
> help readability and findability once the file further grows.
Sure. I'll update it in the next version of the patch.

~ Oleksii

