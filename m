Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B0803052
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:34:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646791.1009335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6HQ-0005Cq-4U; Mon, 04 Dec 2023 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646791.1009335; Mon, 04 Dec 2023 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6HQ-0005AF-18; Mon, 04 Dec 2023 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 646791;
 Mon, 04 Dec 2023 10:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlsO=HP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rA6HP-0005A9-1c
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:34:23 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af578677-9290-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 11:34:21 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9ea37ac87so27415681fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 02:34:21 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a2e9f08000000b002c9f1436d86sm707961ljk.92.2023.12.04.02.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 02:34:20 -0800 (PST)
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
X-Inumbo-ID: af578677-9290-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701686060; x=1702290860; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u7UnMKSTsi/xXvfklw13ALh7LQxeSVsIqCMSBCnuWds=;
        b=UFtvloJhnrPQRCX8vRMOXaT3qNZ9qD0ug1/WuIM+KILryTyw4eYJ4pInjjqiqDMg6N
         IB47M7ZaSG8pBC08bsvhPtBOcGQPCrmzVxpI/WYtF+OfEJcmQOHOYkeigsWA9btRvobl
         YK333IeanMKmS0Yrkrw9NJmr/kb8pUwmgmA0FNl9JArTxgnWHXtwsuUi7zckwg0+4Bwz
         kbDuB5/LCGoJVHi2g4rCyityljS9roBbbg4LRP8IVAUls4p87bsQGg5OkLiuFgXs5Yo7
         5p7m8dkd/mCWoK6dI4CgA+DGCyDb1v0xz9Ddw8d8rW0IegUYI7deIsW0gHVjUX8TvpUE
         So4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701686060; x=1702290860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u7UnMKSTsi/xXvfklw13ALh7LQxeSVsIqCMSBCnuWds=;
        b=MJTWJkwyfD/bltUmAHHip9sSQLWPR0xb8l6HJTBBEAnuf/USavcENTZH3XEoQIjiDi
         KasuOpfIgIjggCmHDYSx/r0xmgynL9hRT81WkzVT4oMI1lbXzVd5L7QrvG1yjffLImPE
         Oezx2Q6na/8aAIBGd9D6KqQJCPUu6GpSaR1OexUL805SrCpB+JZcUrdVevdrRO73ueZh
         p5D/06XnyYmVJ7myOPl6345OltxXmEetAk+nM8Xr3w4Xy2tjl8T2VycnzVT0LfEthCFB
         NoDwo1Lan6mzYexqgwmjdwdn24nra3bvHaIXc6kGJq8ZCN4WP1QP8jnnuuRUAhcMIEnw
         KNZg==
X-Gm-Message-State: AOJu0YxOedFJxPOhuHt7Yo75pxtEp3Eai1ufBH6FawABlSQaMl1IJB+w
	7XfvFrfNWw2tBlS7c95nmkY=
X-Google-Smtp-Source: AGHT+IHSsYrRywfXRIeNZ1niAtEiUKVSGK1p6N5KGz6+s9WyDU7CMbsP8AHOtJmSDkMTK2O8f0r0PQ==
X-Received: by 2002:a2e:9d17:0:b0:2c9:fa32:4263 with SMTP id t23-20020a2e9d17000000b002c9fa324263mr784946lji.15.1701686060386;
        Mon, 04 Dec 2023 02:34:20 -0800 (PST)
Message-ID: <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
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
Date: Mon, 04 Dec 2023 12:34:19 +0200
In-Reply-To: <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
	 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
	 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
	 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
	 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-04 at 10:46 +0100, Jan Beulich wrote:
> On 04.12.2023 10:39, Oleksii wrote:
> > On Mon, 2023-12-04 at 09:41 +0100, Jan Beulich wrote:
> > > On 01.12.2023 21:48, Oleksii Kurochko wrote:
> > > > Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> > > > generation of empty <asm/grant_table.h> for cases when
> > > > CONFIG_GRANT_TABLE is not enabled.
> > > >=20
> > > > The following changes were done for Arm:
> > > > <asm/grant_table.h> should be included directly because it
> > > > contains
> > > > gnttab_dom0_frames() macros which is unique for Arm and is used
> > > > in
> > > > arch/arm/domain_build.c.
> > > > <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> > > > <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE
> > > > gnttab_dom0_frames
> > > > won't be available for use in arch/arm/domain_build.c.
> > > >=20
> > > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > >=20
> > > Not really, no: In particular ...
If it is comment was addressed to Suggested-by. Then it was added when
we didn't have a discussion about config GRANT_TABLE and depends on
things.
Probably I had to remove it after I started to update Kconfig things.

I am really sorry if I had to remove that before send this patch
version.

> > >=20
> > > > --- a/xen/common/Kconfig
> > > > +++ b/xen/common/Kconfig
> > > > @@ -15,6 +15,7 @@ config CORE_PARKING
> > > > =C2=A0config GRANT_TABLE
> > > > =C2=A0	bool "Grant table support" if EXPERT
> > > > =C2=A0	default y
> > > > +	depends on ARM || X86
> > >=20
> > > ... this I explicitly said I consider wrong to add.
> > Then I misunderstood you.
> >=20
> > What about to do the same as with MEM_ACCESS config and introduce
> > HAS_GRANT_TABLE?
>=20
> That's an option, provided (and I put that under question before)
> there
> realistically can be ports which don't mean to support grant tables.
> You mentioned that things are fine for the dom0less setup you're
> testing,
> but I don't think a fully-functional Xen port makes sense to only
> support
> dom0less. But of course I'm willing to hear arguments to the
> contrary.
Unfortunately, I am not experienced in the depths of Xen, but I used
grant tables in Arm to share frames between dom0 and guest in PV
drivers. It should be another usage of grant tables.

I assume it is possible not to use grant tables and come up with
another solution, but it isn't the best idea, and I don't have any
reason not to use what already exists and works. Are there any cases
where something else, instead of grant tables, is used?

Therefore, I agree that a fully functional Xen port will support only
dom0less, but it can live for a long time only with dom0less. And in
non-dom0less grant tables will be used somewhere sooner or later.

>=20
> > Or would it be better just update "depends on" to !RISCV && !PPC?
>=20
> Definitely not.
So we have a "weird" situation.

Considering the message above, grant tables are likely to be used
anyway. From this point of view, there is not a lot of sense in
introducing "temporary" HAS_GRANT_TABLE as, at some point, every
architecture will use grant tables ( the same is with "depends on
!RISCV && &!PPC or any other combination ), and HAS_GRANT_TABLE won't
be needed any more except the time when support for new architecture
will be started and it will live without grant tables for some time.

But an introduction of HAS_GRANT_TABLE makes sense ( at least, when the
work on support for new architectures will be started ) for me.

If you ( or anyone else ) don't mind, I'll update the patch with an
introduction of HAS_GRANT_TABLE.

~ Oleksii

