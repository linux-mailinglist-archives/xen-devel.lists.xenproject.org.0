Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2E8569AE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681936.1060939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raekf-00023Q-Rd; Thu, 15 Feb 2024 16:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681936.1060939; Thu, 15 Feb 2024 16:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raekf-00021H-Of; Thu, 15 Feb 2024 16:38:21 +0000
Received: by outflank-mailman (input) for mailman id 681936;
 Thu, 15 Feb 2024 16:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1Z8=JY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raeke-00021B-IL
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:38:20 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a053a8f4-cc20-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 17:38:19 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so13854821fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 08:38:19 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a2ea282000000b002d0f905ddf9sm350166lja.18.2024.02.15.08.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 08:38:18 -0800 (PST)
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
X-Inumbo-ID: a053a8f4-cc20-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708015099; x=1708619899; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pFKN2F8CAqIawWvV7bli4CjJ841AKOlmGdXyw9Q8je4=;
        b=hDfXGvvO0SjvnQCvPJo1RgFRONOZOmJP+Np+LFKXZSh+iVG9ojI+TdM0INPQgkYRJc
         ztdxn/9hG3CpwH2kbkq2X2w2eWSMsc5BtUfTgZ7nJej+pf+tgB5w8igaJIzl2bKPLNUs
         cJ30JsSbk5ZJnppon1QkXMYWiA6HmOZxiCx6X5azTYXqXF7e/5Sr+gXtWvPC/aKX32oE
         eH8C9JznlUbOD13U2IHzr0yx4R03/0FOex4k+PKlvhkLuiQgQl2uKuXbYuyvEXICt0wU
         u31ELGKLdeqsoK7L1NzFUiwMLU4xzDDaIuWQqUggHrBcEP9EePSjXERfFzM6IU9LEc7i
         kjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015099; x=1708619899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFKN2F8CAqIawWvV7bli4CjJ841AKOlmGdXyw9Q8je4=;
        b=srFSDWH/GogTBiRGeXA+JbSLviGDMH6C9GyYuLJnGCQv3J4NJNH12OaxO3vKh30Mpl
         g2Ehjd9+0U8Lvg+TUW6Qlv3BXKg4qnYr6uSvqC+5+yfzsrurmSOtyV6EZjzyMhpOSGTD
         0nPu8ZNWiPOZP7q0ZYc92RaCEvomF8Ncu22RaLbE3BjirF9kqfS8evzshLnE+cao2azz
         eiwfQph2vTFuxa2B6ikjErXFGCEhVaiL2G/btD4p4K7pZwxR2kmmKoZAATHoHKMAY5ac
         NBahy8KUxqGX/ZazNDqsRQIXBV1SdQo0/SMPTsaaZlbIMi1gvUkT7arZ0OCIKTMTnOMf
         vj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3EFqLyy+UWObaakUZzoRK5V46wSRnL5zyRsuJWgF3cUFCt9y1qOcMRGjt1yT9M7/z1vLLXkcWGq1TI7g+huFAO/KvezN9iTukCAiyXAI=
X-Gm-Message-State: AOJu0YxYpGz3L0St/o8VMW2LxWVKmLmto3/NOKOIE02BdgyprtBan8JR
	dJ/18+Y7cY/8casrFLQIo72Z963x0VMbVvVtyeSVTD9hDTUjOYev
X-Google-Smtp-Source: AGHT+IFW6u92havSTdHGYAwHEhf4tPCyJ3yDp5vCqTsXvZ+d8d4YwscSHgF6I2ulIOefBWFfeUXw2w==
X-Received: by 2002:a2e:9053:0:b0:2cf:4d88:1772 with SMTP id n19-20020a2e9053000000b002cf4d881772mr1596166ljg.29.1708015098883;
        Thu, 15 Feb 2024 08:38:18 -0800 (PST)
Message-ID: <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 15 Feb 2024 17:38:17 +0100
In-Reply-To: <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
	 <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-02-13 at 14:33 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/Kconfig
> > +++ b/xen/arch/riscv/Kconfig
> > @@ -45,6 +45,13 @@ config RISCV_ISA_C
> > =C2=A0
> > =C2=A0	=C2=A0 If unsure, say Y.
> > =C2=A0
> > +config TOOLCHAIN_HAS_ZIHINTPAUSE
> > +	bool
> > +	default y
>=20
> Shorter as "def_bool y".
>=20
> > +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -
> > march=3Drv64ima_zihintpause)
> > +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -
> > march=3Drv32ima_zihintpause)
>=20
> So for a reason I cannot really see -mabi=3D is indeed required here,
> or else the compiler sees an issue with the D extension. But enabling
> both M and A shouldn't really be needed in this check, as being
> unrelated?
Agree, that M and A could be dropped.

Regarding -mabi my guess is because D extension can be emulated by
compiler, doesn't matter if D is set in -march.  If it is set then
hardware instruction will be used, otherwise emulated instruction will
be used.
And if D extenstion is always present it is need to know which ABI
should be used. If D extenstion has h/w support then -mabi should be
also update to lp64d instead of lp64.

>=20
> > +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23600
>=20
> What's the linker dependency here? Depending on the answer I might
> further
> ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_ or
> HAS_AS_.
I missed to introduce {L}LLD_VERSION config. It should output from the
command:
  riscv64-linux-gnu-ld --version
>=20
> That said, you may or may not be aware that personally I'm against
> encoding such in Kconfig, and my repeated attempts to get the
> respective
> discussion unstuck have not led anywhere. Therefore if you keep this,
> I'll
> be in trouble whether to actually ack the change as a whole.
Could I ask what is wrong with introduction of such things on KConfig?

Would it be better to put everything in riscv/arch.mk?

~ Oleksii

