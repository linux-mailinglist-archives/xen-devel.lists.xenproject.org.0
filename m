Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CBF973924
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795614.1205013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1LM-0004ZT-EL; Tue, 10 Sep 2024 13:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795614.1205013; Tue, 10 Sep 2024 13:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1LM-0004WJ-Bc; Tue, 10 Sep 2024 13:55:44 +0000
Received: by outflank-mailman (input) for mailman id 795614;
 Tue, 10 Sep 2024 13:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nZKp=QI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1so1LL-0004WD-MY
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:55:43 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e80503b-6f7c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 15:55:42 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f761461150so1372351fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 06:55:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bfe7efcsm11794181fa.9.2024.09.10.06.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 06:55:40 -0700 (PDT)
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
X-Inumbo-ID: 5e80503b-6f7c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725976542; x=1726581342; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rV9rGx0xSDBD9ZkrHzg4EKViXEnd+iGwAhvPbc1rNCo=;
        b=nCl94FVF50Cu/AHTrITtCsLlgL5hdjNa3fxSdZVwBPT+1D9k+dqZyZPG74qlzJUQVt
         CD1Tw/uaxwovmGS9VZp9OB/flTpVhO5mYQ/neg7vBYJgnBpPpV2uO17xN1dZO+KN1TNB
         8RPYTpY3H+lMm4gLt7TeLIU3z0cz3FtOYz7j+mE43BejvsivpvuW4jeYq+BBnYHM9ORm
         GjF96q6MOa14r7KxidbUMOCu+EdI6hDGvUuteViM3dpO5zyhx27AaxXAzSjKQbjKHpj8
         omhA5sUOs9VS0lwjqezqa1twEYWcSVl3HhXjRZ5wCnl0ifmflxvzsW4ZyrFODqbLE758
         VvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976542; x=1726581342;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rV9rGx0xSDBD9ZkrHzg4EKViXEnd+iGwAhvPbc1rNCo=;
        b=OqdixyDnvgxwrrw8tQ6UgUcRfuByWUG2LgmFiFE60ITxSV285KJgyuzwo/Bnj0GqNE
         JKsT/pvTYVzj0RURdZL+xYnAnOYP/9suureDGjXqANS1CvCL63E3+tyX7+ylF/rh82wF
         dV4pr4z77dqyaoJL5kj13UXx43uzmIIV6sf0NB5JGKQj7S14OBvSkyukJOWEbFryHpVG
         lxXEQyyNcKTptylWXGIIMz7I9Zp1FtUkhwNVcUY+8r7FqlJqslj6ApmJiJmrcB+49Jiv
         lOvJYqgyCvJjYQEdVj4r9tEHebEE0qHZBjPp/wNqPDyTLUSb2b7xJZjm5MHBR0gmiAEV
         T/jw==
X-Forwarded-Encrypted: i=1; AJvYcCXP2s0uwraqZR+lKAfrF9jL0rWNgzuOifhWNFMaXfr07Q4DFX6gQ/KEYj7apQzox9w4Bi3oYJckMoE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl6Hx0KSLvua+AeWymnMgF0FX+sUjH9sBz4Rny0OkE3rlTUZf1
	ovBKMfyEu7bPFcVTe5IkEqOwZ2vNTcyCxWJPXARx/YfKYXCBVkYO
X-Google-Smtp-Source: AGHT+IHbBQDh4DXydUao7UhmDfsHaMMl28MbV4FmK0TRuUzbxGIn/kw3annPG0F8DnFS7aBCoExX1A==
X-Received: by 2002:a05:651c:1a0a:b0:2f7:6869:3b55 with SMTP id 38308e7fff4ca-2f768693c5cmr45267661fa.21.1725976540798;
        Tue, 10 Sep 2024 06:55:40 -0700 (PDT)
Message-ID: <35e64bb6657ce339610e0fa58e30680aa67ca631.camel@gmail.com>
Subject: Re: [PATCH v6 1/9] xen/riscv: prevent recursion when ASSERT(),
 BUG*(), or panic() are called
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 10 Sep 2024 15:55:39 +0200
In-Reply-To: <dca99470-8f42-43fd-b690-50ba2ee3d01e@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
	 <dca99470-8f42-43fd-b690-50ba2ee3d01e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-10 at 11:42 +0200, Jan Beulich wrote:
> On 02.09.2024 19:01, Oleksii Kurochko wrote:
> > Implement machine_restart() using printk() to prevent recursion
> > that
> > occurs when ASSERT(), BUG*(), or panic() are invoked.
> > All these macros (except panic() which could be called directly)
> > eventually call panic(), which then calls machine_restart(),
> > leading to a recursive loop.
>=20
> Right, that pretty likely was an oversight. Yet then ...
>=20
> > --- a/xen/arch/riscv/stubs.c
> > +++ b/xen/arch/riscv/stubs.c
> > @@ -53,7 +53,7 @@ void domain_set_time_offset(struct domain *d,
> > int64_t time_offset_seconds)
> > =C2=A0
> > =C2=A0void machine_restart(unsigned int delay_millisecs)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +=C2=A0=C2=A0=C2=A0 printk("%s: unimplemented\n", __func__);
> > =C2=A0}
>=20
> ... you still want to halt execution here, by (re?)adding a for()
> loop
> of the kind you at least had in a few places earlier on. The function
> is declared noreturn after all, which you're now violating. I'm
> actually surprised the compiler didn't complain to you.
>=20
> The same is also going to be needed for machine_halt(), btw: As soon
> as you get far enough to parse the command line, "noreboot" on the
> command line would have crashes end up there, not here.

I will drop this patch in the next version as Andrew C. provides the
patch:
https://gitlab.com/xen-project/people/olkur/xen/-/commit/ea6d5a148970a7f806=
6e51e64fe67a9bd51e3084


~ Oleksii

