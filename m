Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD1664C2A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 20:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474938.736397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFK6V-000422-9A; Tue, 10 Jan 2023 19:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474938.736397; Tue, 10 Jan 2023 19:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFK6V-00040L-5W; Tue, 10 Jan 2023 19:16:11 +0000
Received: by outflank-mailman (input) for mailman id 474938;
 Tue, 10 Jan 2023 19:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFK6U-00040F-70
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 19:16:10 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cc27a69-911b-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 20:16:08 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id i9so19100517edj.4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 11:16:08 -0800 (PST)
Received: from 2a02.2378.10b2.ddc1.ip.kyivstar.net
 ([2a02:2378:10b2:ddc1:8e79:90f9:af64:1818])
 by smtp.gmail.com with ESMTPSA id
 p1-20020aa7cc81000000b00499cc326a4fsm913311edt.9.2023.01.10.11.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:16:07 -0800 (PST)
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
X-Inumbo-ID: 3cc27a69-911b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o828iz6JTK7okONjfswkpoOBjebJS1MqqtT+ftr793o=;
        b=QE2F3WSP/YvMYIQ1z1dwdkfsDuVoyIZvAQiSfLeGX5hkDoY7H+ZU2iSARZsURKcO0v
         uWZ1lxiMXl/8uvtBSpSsuL9KmEv1lZKUGSLAY5+XJWmA5D1mY/7ILKFJODGBK/qLoUYD
         zyX0oRRGcEceJ4vFbUTlTbzBHSbWYZc/Xt+g+xij484C6veurxRUlv7prUwPCX+YUeF4
         YNBJX3aJfQDqOjfMaxf1tDjtiIDVQ1UnkBhcFdLjcBI1A5CzUCVbBRaRMubxouBPO7Qy
         5wmhWjSxbpt5Ch0m9S8YAFxfVreAjkyJlwciL3T0MEFzucUs8UFk9b/uC/ptod9diowH
         E90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o828iz6JTK7okONjfswkpoOBjebJS1MqqtT+ftr793o=;
        b=CpETLYbTmuWlAV/rGTO6ZP/QkRSilxp+xgj0OARQEzQ8Ec/b5A/42cdMGAL08Dvi9x
         FSqz5tiz3rN2BeG+y6tJIOshGRdUVl2ujOva3kwQvwCCqepj01+KqmJya7l7LC2sgIpW
         c0WhbhWkuUvaX35Fc/LOH/PngWiguiaw4UjB4MCfVl3zT8bucSvkxRVDch7Dk9RHfFyw
         Snyx2onMhLBxnRUSz+8F6Z6igj4HK3xmmGECDMIvax2n9QH5jAvrRsGg+vUUHg9lml4N
         ssTgvF9IkCOw0AsG9RKsGuWbWzo9DaUg6t6PLhIRmqnE8MD3CPz3x2TB6U2lgU5A5hMB
         3gYg==
X-Gm-Message-State: AFqh2kqLvZRRJrdhjN6jq6xxVt/MJprjtPkz/YyH9yH4GmEySawOFMCK
	jpKIp6fUuSp6CiRGLWI42RU=
X-Google-Smtp-Source: AMrXdXuHJIh9tZBmajvoQ7sCEV6H+1VltAy2kFAubizjyqbH5gL5D1lgW/EEXM/x741+O9swxLfkYQ==
X-Received: by 2002:a05:6402:501c:b0:48f:a9a2:29fa with SMTP id p28-20020a056402501c00b0048fa9a229famr23532127eda.2.1673378168420;
        Tue, 10 Jan 2023 11:16:08 -0800 (PST)
Message-ID: <e15997cf6e765cb23b706889b93ee35a90173a8c.camel@gmail.com>
Subject: Re: [PATCH v3 1/6] xen/riscv: introduce dummy asm/init.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Tue, 10 Jan 2023 21:16:06 +0200
In-Reply-To: <891d0830-7fdc-202a-5f12-2364cae5bce5@suse.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
	 <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673362493.git.oleksii.kurochko@gmail.com>
	 <891d0830-7fdc-202a-5f12-2364cae5bce5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hello Jan,

Sorry for breaking into the conversation.

On Tue, 2023-01-10 at 18:02 +0100, Jan Beulich wrote:
> Arm maintainers,
>=20
> On 10.01.2023 16:17, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/init.h
> > @@ -0,0 +1,12 @@
> > +#ifndef _XEN_ASM_INIT_H
> > +#define _XEN_ASM_INIT_H
> > +
> > +#endif /* _XEN_ASM_INIT_H */
>=20
> instead of having RISC-V introduce an empty stub matching what x86
> has,
Have you had a chance to look at the answer (Re: [PATCH v1 0/8] Basic
early_printk and smoke test implementation) of Andrew:
https://lore.kernel.org/xen-devel/299d913c-8095-ad90-ea3b-d46ef74d4fdc@citr=
ix.com/#t

I agree with his point regarding the usage of __has_include() to not
produce empty headers stubs for RISCV and for future architectures too.

> If maintainers are OK I can start to use __has_include() in the
> correspondent <xen/*.h> files.what would it take to empty Arm's as
> well, allowing both present ones to
> go away and no new one to be introduced? The only thing you have in
> there
> is struct init_info, which doesn't feel like it's properly placed in
> this
> header (x86 has such stuff in setup.h) ...
>=20
> Jan
~Oleksii

