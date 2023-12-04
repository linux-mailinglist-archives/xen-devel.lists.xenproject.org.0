Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC2802ECD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646668.1009164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5QR-0000Gp-8O; Mon, 04 Dec 2023 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646668.1009164; Mon, 04 Dec 2023 09:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5QR-0000ER-59; Mon, 04 Dec 2023 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 646668;
 Mon, 04 Dec 2023 09:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlsO=HP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rA5QP-0000EL-Al
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:39:37 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08c6a262-9289-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:39:35 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50be8ced3ddso1799900e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:39:35 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a0565120b8d00b0050aa4c50590sm1209224lfv.128.2023.12.04.01.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:39:34 -0800 (PST)
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
X-Inumbo-ID: 08c6a262-9289-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701682774; x=1702287574; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aBMA8H0kuDQmGVp/jDoERKw0CVGK2B210u9LQOw/Yg8=;
        b=LvNryooIoSY3WTsUgjavEzrvNL77LUa4SHe0eJO48R41UG/Bd77kygbF5GwAIDPved
         ShMicv/KNcsrY30uIKgl+kkF0QXCfIC5rSZjd344VPqvcFvqBo/f9cOVidfHak4x1bVT
         AQC2CKGoew39zgT4Nb3dRYi35KAo5llhIk1TANxOyAobWfqgkYNBZLG0O5s1OTxY3nFO
         gpE8B5QsaV3h72V7s/JBwelJFCxHrr/qxBh3dfPMMB1z0p6o/byf6zQw/vIYq+pCv7VU
         7q7X2xZAu/yikW6Exz/b5UnCwIpgRaAK2eNREsPqLWccXGvW1JZIJ7vyccvjHi6jbAbG
         60Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682774; x=1702287574;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBMA8H0kuDQmGVp/jDoERKw0CVGK2B210u9LQOw/Yg8=;
        b=jY1pWiE5PIxLp6SAXf+FlaBFYpN/mYopTWTxZREWDpf3BUbZcBPYyTgTTLgulT6FF+
         Als4MaiW1JPiGLlOp6yo/yYtwGuX4aDvbgBcRvE6GHGfrr2MaWZGuBKm92G9gueDj5jZ
         KWClTE/LjGUTazCHc2kg1ETt8LZbXNn47XO0IGNrfRjFeva0RAy/PHVtEITYES4O3d01
         XrA43vYJk0ixr2lm/h7hJ077w6PNCZ7/cjrm7Jp4Dxys0IuFlzbzso/SRJSqtEG1+kiO
         tcPIvMrzgeivY7BvNyDLqgWfWZuNfxee7KvIrPh//k58Cg76dVtPbFMDCOjTT4t5pjVk
         bfBQ==
X-Gm-Message-State: AOJu0YxTPesXfMBcsI5vgcDMzt0sytyzeD+Dwm0rmOR/iqlut3We1une
	q9CFwhBi4YRliHD7saARQoQ=
X-Google-Smtp-Source: AGHT+IHl0Q8Q9weOYwAFkJXH/Q82Rd404rlmLhOXzFYFz8RGHjg5R0fDhg1VVnt0MP/FHYTqnC9mLQ==
X-Received: by 2002:ac2:5382:0:b0:50b:e693:ee20 with SMTP id g2-20020ac25382000000b0050be693ee20mr1197894lfh.31.1701682774418;
        Mon, 04 Dec 2023 01:39:34 -0800 (PST)
Message-ID: <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 04 Dec 2023 11:39:33 +0200
In-Reply-To: <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
	 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
	 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-04 at 09:41 +0100, Jan Beulich wrote:
> On 01.12.2023 21:48, Oleksii Kurochko wrote:
> > Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> > generation of empty <asm/grant_table.h> for cases when
> > CONFIG_GRANT_TABLE is not enabled.
> >=20
> > The following changes were done for Arm:
> > <asm/grant_table.h> should be included directly because it contains
> > gnttab_dom0_frames() macros which is unique for Arm and is used in
> > arch/arm/domain_build.c.
> > <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> > <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE
> > gnttab_dom0_frames
> > won't be available for use in arch/arm/domain_build.c.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>=20
> Not really, no: In particular ...
>=20
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -15,6 +15,7 @@ config CORE_PARKING
> > =C2=A0config GRANT_TABLE
> > =C2=A0	bool "Grant table support" if EXPERT
> > =C2=A0	default y
> > +	depends on ARM || X86
>=20
> ... this I explicitly said I consider wrong to add.
Then I misunderstood you.

What about to do the same as with MEM_ACCESS config and introduce
HAS_GRANT_TABLE?

Or would it be better just update "depends on" to !RISCV && !PPC?

~ Oleksii

