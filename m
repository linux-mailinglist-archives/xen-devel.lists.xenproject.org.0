Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774CE6620BF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 09:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473403.733983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnxz-0001D5-Qp; Mon, 09 Jan 2023 08:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473403.733983; Mon, 09 Jan 2023 08:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEnxz-0001AI-NW; Mon, 09 Jan 2023 08:57:15 +0000
Received: by outflank-mailman (input) for mailman id 473403;
 Mon, 09 Jan 2023 08:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEnxy-0001AC-Cn
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 08:57:14 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bfca4dc-8ffb-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 09:57:13 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id v25so11860451lfe.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 00:57:13 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a0565123b9500b004b585ff1fcdsm1498813lfv.273.2023.01.09.00.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:57:12 -0800 (PST)
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
X-Inumbo-ID: 9bfca4dc-8ffb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4wkF6tuT3ILdVALUx5K5GPfr+jHcvrDZ50Ltc77TZSE=;
        b=LT3y1fwmkcfrV19NBwv7MfcuvTFRXUz+aLUwjesC+sBDuo2Oz++WmAVAuBMXRAAGpA
         ++30qP5XudDO57RleTOFwSLFUSL36DHLeHJ5L3jWNKS52eI862L6arhv+HwmTsF8xav2
         lte1aAQl1o97GSyzSCpTZ01j4r5B6DKsERe3uUJ2ncHSDzLwH5u7V7JVaUYoBD/TJbIw
         w7IFJ9kxI1DRJOhGozBKLHUp940QAx/f/KFZMQUN2lPm6Ijbs2fUnSgEODTeGkh1Il9j
         /w3ZLOxwR36qOjBsy9ao5O092jNOUT8nKs5FZp6iWRiiB6aKqDSaUmTw5cFucCi/VVHZ
         8qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wkF6tuT3ILdVALUx5K5GPfr+jHcvrDZ50Ltc77TZSE=;
        b=vKnkr9yn0hI+NL1M5XTv31wT59NIeZE/BS5+f5Zkw7MdpHs5c++ojcGdzSMcLgg7TW
         7mGseQZybFb6BZYFi87K8Ncd52iTay6U9/Qsm36MWkmOxhUKjm2JH3SuFc25fgxON0S7
         4Rb4sPf6XQAZZ+qikDCaWUAFAY1ZyxCd3Yl3sAPHK2YFJMSHw8JrgUjtbNt+WdQI76Qu
         jqOGE8OPz3IH9vfoCNS3ijEtX5Bj4Tqkp1WWT2MEyrIuSrJd5agXijPsI/+LeDKYOZ6N
         UDM/6HeBmQdkwnuvVqEx6LPs8mULya7dik8Hx4HOR58pHp48S4t819FlZ0EvSc+QxKHd
         18jg==
X-Gm-Message-State: AFqh2kok6UFyb/1CXhdoaXOEe1672wfmeorVoKl++sTpUw49cNUpWhRO
	7zrc1zExKG9MxSuzAjgngdQ=
X-Google-Smtp-Source: AMrXdXtqGBPuU4BYoI33w6HEcaGy2imRXOppDjWi32nk/MUffs9aCENlAC67IsuEO72f39cdKnYpjw==
X-Received: by 2002:a05:6512:6d4:b0:4cb:1e1:f380 with SMTP id u20-20020a05651206d400b004cb01e1f380mr17009980lff.40.1673254633239;
        Mon, 09 Jan 2023 00:57:13 -0800 (PST)
Message-ID: <572055bcc7b9716700fcb4139afe3697a04b7e98.camel@gmail.com>
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce stack stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 09 Jan 2023 10:57:11 +0200
In-Reply-To: <9c93ee8c-1c7f-d1aa-c0fd-72518e37a74d@suse.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
	 <9c93ee8c-1c7f-d1aa-c0fd-72518e37a74d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-06 at 15:15 +0100, Jan Beulich wrote:
> On 06.01.2023 14:14, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -1,4 +1,10 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.header,=
 "ax", %progbits
> > =C2=A0
> > =C2=A0ENTRY(start)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0 start
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, cpu0_boot_stack
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t0, PAGE_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 sp, sp, t0
> > +
> > +_start_hang:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wfi
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0 _start_hang
>=20
> Nit: I think it would be nice if in a new port assembly code used
> consistent padding between insn mnemonic and operand(s).
>=20
Missed it.
Actually it will be "fixed" in the later patches of the patch series
but i'll fix this while working on a new version of the patch series.

~Oleksii
> Jan


