Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA6839568
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 17:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670539.1043401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSK1H-0007dU-Dj; Tue, 23 Jan 2024 16:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670539.1043401; Tue, 23 Jan 2024 16:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSK1H-0007ac-B2; Tue, 23 Jan 2024 16:53:03 +0000
Received: by outflank-mailman (input) for mailman id 670539;
 Tue, 23 Jan 2024 16:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSK1F-0007aS-Vz
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 16:53:01 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda116bb-ba0f-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 17:53:00 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51008c86ecbso929879e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 08:53:00 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a19914a000000b005100a7825c0sm165231lfj.282.2024.01.23.08.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:52:59 -0800 (PST)
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
X-Inumbo-ID: dda116bb-ba0f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706028779; x=1706633579; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JpaWbflKtuaDwVgf0RRLiZyZGPhzb0D77kXQO97iFos=;
        b=iKCegx9fHVG019Lx2kd2wOlssMqx9yBh6nJv+laAPYPy25tEDCvSaDNOHyjtfZxPAZ
         W8xiYF1bHv1fUriTMRq5TBx9jEZaPF561t6i93kcsV2WQF6FboQeNtWm27YoBN0zHqCh
         yGsa+fzfwn0REzNDCf2jqrf7x2w4ESl/aanecyYR3B2tHM8pmuZLQvFucnwP53RisZx3
         axATNTvH0NGquI7h9xZ3zSQFcUVlZH5sTDrgOswB12xXT2Lv0lvIOxpby6Ps/YrEdOmq
         jgw5gXZjf94tMUrLrb30T5uwIVzR3IQDOqnStttCtFcrzQvVuFpMcHq/AAbWZztOhKVk
         TPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028779; x=1706633579;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpaWbflKtuaDwVgf0RRLiZyZGPhzb0D77kXQO97iFos=;
        b=d/h8HEhv/dssB7aWFLUv8EzLGd9SfpK+HIEoOew1OUmfuZ08FBlUs2ncTjyIaJuLmc
         bqHEa97C3wEwDpuveNoKSgo6bsF/zD2oX/opuJbSo4Pw5ubBzZp5c2Zhbqhpwa/XCJDO
         RdI54RSeIM+Jpx2CgKnR05psMY6GjTueZ/i1b0RMinQsocvG9vf3qiD1U4Ia1QV7MVrG
         84dn4FvGHmI0/RHjwtF5hfHXyTri6hw3RaIz37iLJSkEbc5D6c29aTJwNEU3E6xttwZ/
         RZXP2rc1N1O+fXPIpoLXZ+qD0XMoVClGeVRlkT1wAMbx/3Qfv0+kTXBJwC7/dMQDJL/p
         8LJA==
X-Gm-Message-State: AOJu0Yy6GFQNsrsMPkQ8Bj3kLyQQP0aMhlp9XfuI/Nko/t/y/p/IegTw
	O5ehRJg6JeEOC0jSjdI5K4Re4/FyUL4EXgqtbKTl8zBxNLHJ44mK
X-Google-Smtp-Source: AGHT+IGTK9HmrHiSpg9vu/6ZROozZ9nuL7cHbYEcd+UCIImmOt/qjRwU4Bcy4bCeqTFaxWETZf4cEg==
X-Received: by 2002:a05:6512:3b8f:b0:50e:74e1:144a with SMTP id g15-20020a0565123b8f00b0050e74e1144amr3375061lfv.15.1706028779385;
        Tue, 23 Jan 2024 08:52:59 -0800 (PST)
Message-ID: <d666a7ee74b7f7a8ccafa59f1ff5b6ea78c12833.camel@gmail.com>
Subject: Re: [PATCH v3 28/34] xen/riscv: add required things to current.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 18:52:42 +0200
In-Reply-To: <61450f5d-a723-4126-8e00-6e7155547e99@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <8fd8d3652eafabf5f5586de91d97ecae077b90ea.1703255175.git.oleksii.kurochko@gmail.com>
	 <61450f5d-a723-4126-8e00-6e7155547e99@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:35 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:> ---
> a/xen/arch/riscv/include/asm/current.h
> > +++ b/xen/arch/riscv/include/asm/current.h
> > @@ -3,6 +3,21 @@
> > =C2=A0#ifndef __ASM_CURRENT_H
> > =C2=A0#define __ASM_CURRENT_H
> > =C2=A0
> > +#include <xen/bug.h>
> > +#include <xen/percpu.h>
> > +#include <asm/processor.h>
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +/* Which VCPU is "current" on this PCPU. */
> > +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
> > +
> > +#define current=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 this_cpu(curr_vcpu)
> > +#define set_current(vcpu)=C2=A0 do { current =3D (vcpu); } while (0)
> > +#define get_cpu_current(cpu)=C2=A0 per_cpu(curr_vcpu, cpu)
> > +
> > +#define guest_cpu_user_regs() ({ BUG(); NULL; })
>=20
> Again with this changed to the "canonical" placeholder:
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks. I'll updarte BUG() part.

~ Oleksii

