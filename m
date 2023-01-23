Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C34677EA4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482988.748846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyMw-0001i1-R2; Mon, 23 Jan 2023 15:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482988.748846; Mon, 23 Jan 2023 15:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyMw-0001gJ-OM; Mon, 23 Jan 2023 15:04:22 +0000
Received: by outflank-mailman (input) for mailman id 482988;
 Mon, 23 Jan 2023 15:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJyMv-0001gD-Ta
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:04:21 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 370f2c96-9b2f-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:04:20 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id r9so11095731wrw.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:04:20 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 h3-20020adfe983000000b002bdf5832843sm21709112wrm.66.2023.01.23.07.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:04:20 -0800 (PST)
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
X-Inumbo-ID: 370f2c96-9b2f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Pe9H5M8lgqXN3yOFU7hWFYm28+tQNyxLI4UL9a/OLk=;
        b=ljCAeerSdzkiVajYOigDrT9dAlZCW1oVKmAu6HCCsvgCs04V0gwIVMVv2FU3py+MN6
         sHau14/RWViTuE/hmz4Ji+c9rnnCccbAVycTnQpuLPCAGtY56UkRymXrdhNDTQ2QwtwY
         7+xUjZhw7EWdi50mIJOvuapnCR9wZFtz+XzIs2Hnt9XaAdc4XsGfoVJ7LCPyuMlaJRaC
         zzafuhd9WJqvMWVUyKQSa+FylKOkMvILTUUO2bv1vRNkY++xgZw/ti9EEMOL07Pj36tA
         UtPNMPpnJhN6Q8h9Iv/Sw/11MNXCdvsgnBgbh7MkRcCRh/ecRcnjdXA/BvExD+PfOd20
         bhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Pe9H5M8lgqXN3yOFU7hWFYm28+tQNyxLI4UL9a/OLk=;
        b=ULlmbcm6hwGuWTufdoUQlnHYvAXOW8S0IiKMZFHTUT8UsufTx02TEgMFfMS7KGcmLy
         V/avaKMa5UQxOYl0tTMtlZLDzycRR044sAeqLQhp5bq+NPSH6QDksixEqtEkDMmUDlo2
         yKwC4U9ZhSjEr/gimZ+nMk4YxUWZoCmN5RXs1xX9qv1UbMDx7Le0s+zF76+kJQN8h9Lw
         WRytQsMYN1cggAj1fajqYDwQSoQM8mRdC6/wFL3Wht+2OlZiyoOd478JiQZwYAjFET7X
         fuXcRIsIfTwBRslxbZ8eyzQqpcDM+UI+AyCvucyIgLarTCmQr64sVCCLAKZoRTCvXa8f
         nuEw==
X-Gm-Message-State: AFqh2kqcmNgzKsrsuukn1XWoscjpFzE8RSWnFkFE188HaNrW4w7z2Eiv
	aL1WkUGCXHe+oWIfMxzJ+JM=
X-Google-Smtp-Source: AMrXdXvdFEzRAEQiD7p9XHBsMlv7mTHqksXzITyIfe+eZ+1xWy+C73rR8qtrPgLOwzW1mLCvAm/Ttg==
X-Received: by 2002:a5d:4c4e:0:b0:2bb:4b40:2d1a with SMTP id n14-20020a5d4c4e000000b002bb4b402d1amr22476897wrt.56.1674486260385;
        Mon, 23 Jan 2023 07:04:20 -0800 (PST)
Message-ID: <61603a7c4ba09012fedbad48b3d7d028ffc9443c.camel@gmail.com>
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Jan 2023 17:04:19 +0200
In-Reply-To: <e8e6bee5-ce59-b171-6134-4473b396df00@suse.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
	 <e8e6bee5-ce59-b171-6134-4473b396df00@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 12:17 +0100, Jan Beulich wrote:
> On 20.01.2023 15:59, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/entry.S
> > @@ -0,0 +1,97 @@
> > +#include <asm/asm.h>
> > +#include <asm/processor.h>
> > +#include <asm/riscv_encoding.h>
> > +#include <asm/traps.h>
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .global handle_exception
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align 4
> > +
> > +handle_exception:
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Exceptions from xen */
> > +save_to_stack:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Save context to stack */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 sp, (RISC=
V_CPU_USER_REGS_OFFSET(sp) -
> > RISCV_CPU_USER_REGS_SIZE) (sp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 sp, =
sp, -RISCV_CPU_USER_REGS_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 t0, RISCV=
_CPU_USER_REGS_OFFSET(t0)(sp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 save_context
> > +
> > +save_context:
>=20
> Just curious: Why not simply fall through here, i.e. why the J which
> really
> is a NOP in this case?
>=20
There is no any specific reason.
I left it for future.
Will remove it in the next patch version.
> Jan


