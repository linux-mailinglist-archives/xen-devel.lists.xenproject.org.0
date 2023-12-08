Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906580A00F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650520.1016133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXan-0001O8-2X; Fri, 08 Dec 2023 09:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650520.1016133; Fri, 08 Dec 2023 09:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXam-0001Lr-WC; Fri, 08 Dec 2023 09:56:21 +0000
Received: by outflank-mailman (input) for mailman id 650520;
 Fri, 08 Dec 2023 09:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBXal-0001Ll-3Q
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:56:19 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07881ea0-95b0-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:56:17 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54c67b0da54so2550157a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:56:17 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ty14-20020a170907c70e00b00a1d70804ac9sm794036ejc.33.2023.12.08.01.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:56:16 -0800 (PST)
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
X-Inumbo-ID: 07881ea0-95b0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702029376; x=1702634176; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZuUJz0w2QDEFSaIINhUTAFBDKTav9LnB69TlAIMd7mU=;
        b=P0i3w/fJpaPWa8AYUCsoDNLF49nWI0KNrhjjvWPd4tj4hQy654JvE9U7fEYgFlN//C
         rSvi+N0gF/QBD4j0V6YX11f79ozxDWcpvLpEL0WgaUJYeJzR9PS4UC0KZuSkcXdHYkv0
         yqaTKP8d4hC1SUJ6jDZZfjYo0713EiWk9jk3+ZlzobvhRPCEIluEbGhwnG44dwErg7K7
         DqJdoiddQZ8mfJ806GZzTok7PZ6ZL1Mj7xybw++PaqzDk5tunIMIDPXfosNe9rY2UDFE
         r0XKa2MEB0NyD0nSrk8bmLhIqDXoR9VWW/Ktlwt0ZbJ8MmwFTxOSBGmQn2iDsLScuJ/I
         dDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029376; x=1702634176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuUJz0w2QDEFSaIINhUTAFBDKTav9LnB69TlAIMd7mU=;
        b=uMT+atkrIM8wuswQloAKGZwcdaNkyvZJZ7SEgrvvxPjYYvfnHz9v+z2nwsrGPaU2Z6
         h7IxggVFWfHZEZpGAk25F8ajwpV6mKNg3AJUfWlk4x2b4Wo5Xa1M3BqwwSYbOsFyh6XI
         e2xFfp/SByWqeCT+8kZJpu1fUxioOKqyYPbWCHtrnMaTW9ey3KuFO9WxPrPnJNYb+MgW
         Hh/Zq/ap9sTlcukYAvqPEHOOoaQIowe0KKT4nCQSx2FZfYU71yRQ74rZ0z41AdSJKvei
         SOx5UlIPyl7asnMAZeSBFA4QflWNd8q4wPOkPi/NFUzG0P4D9yKBWz8G6NF0C1u2JgPi
         +vnA==
X-Gm-Message-State: AOJu0YxMy4hsQHVC3OxISLO82+ArVG6CAI1jEYt0wt5Gh47I12pmaM4r
	6nLQmc7XF84rlxMV8IDKjZU=
X-Google-Smtp-Source: AGHT+IEL+laq4rQ0K8Vz6wPpJ5l1AESI4XkDDeiOb7DELPfoW+UWGyxH9Io9/+c+VnlTRaeVFMWT6g==
X-Received: by 2002:a17:906:408e:b0:a11:4dc3:d0ce with SMTP id u14-20020a170906408e00b00a114dc3d0cemr1983223ejj.63.1702029376351;
        Fri, 08 Dec 2023 01:56:16 -0800 (PST)
Message-ID: <d019df25e87fcf8e90bb24a13f1791336fcf558e.camel@gmail.com>
Subject: Re: [PATCH v2 00/39] Enable build of full Xen for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:56:15 +0200
In-Reply-To: <0fab3032-5236-48ad-96c8-3ae26b70cb8b@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <0fab3032-5236-48ad-96c8-3ae26b70cb8b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 15:30 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Bobby Eshleman (1):
> > =C2=A0 xen/riscv: introduce asm/atomic.h
> >=20
> > Oleksii Kurochko (38):
> > =C2=A0 xen/riscv: disable unnecessary configs
> > =C2=A0 xen/riscv: use some asm-generic headers
> > =C2=A0 xen/riscv:introduce asm/byteorder.h
> > =C2=A0 xen/riscv: add public arch-riscv.h
> > =C2=A0 xen/riscv: introduce spinlock.h
> > =C2=A0 xen/riscv: introduce fence.h
> > =C2=A0 xen/riscv: introduce arch-riscv/hvm/save.h
> > =C2=A0 xen/riscv: introduce asm/cpufeature.h
> > =C2=A0 xen/riscv: introduce asm/guest_atomics.h
> > =C2=A0 xen/riscv: introduce asm/iommu.h
> > =C2=A0 xen/riscv: introduce asm/nospec.h
> > =C2=A0 xen/riscv: introduce asm/setup.h
> > =C2=A0 xen/riscv: introduce asm/system.h
> > =C2=A0 xen/riscv: introduce bitops.h
> > =C2=A0 xen/riscv: introduce flushtlb.h
> > =C2=A0 xen/riscv: introduce asm/smp.h
> > =C2=A0 xen/riscv: introduce cmpxchg.h
> > =C2=A0 xen/riscv: introduce asm/io.h
> > =C2=A0 xen/riscv: define bug frame tables in xen.lds.S
> > =C2=A0 xen/riscv: introduce bit operations
> > =C2=A0 xen/riscv: introduce asm/domain.h
> > =C2=A0 xen/riscv: introduce asm/guest_access.h
> > =C2=A0 xen/riscv: introduce asm/irq.h
> > =C2=A0 xen/riscv: introduce asm/p2m.h
> > =C2=A0 xen/riscv: introduce asm/regs.h
> > =C2=A0 xen/riscv: introduce asm/time.h
> > =C2=A0 xen/riscv: introduce asm/event.h
>=20
> Throughout here, would you please try to be consistent about (not)
> using asm/
> prefixes?
Sure. I'll skip asm, there is no any sense to use it as it is mentioned
xen/riscv...

~ Oleksii


