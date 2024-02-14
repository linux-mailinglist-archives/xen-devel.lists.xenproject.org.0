Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB88544A9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680278.1058313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBGt-0008H9-6w; Wed, 14 Feb 2024 09:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680278.1058313; Wed, 14 Feb 2024 09:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBGt-0008FS-3S; Wed, 14 Feb 2024 09:09:39 +0000
Received: by outflank-mailman (input) for mailman id 680278;
 Wed, 14 Feb 2024 09:09:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBGr-0008Dg-MM
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:09:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c68fdf81-cb18-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 10:09:36 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so714674366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:09:36 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 hu18-20020a170907a09200b00a3d1cce7c6fsm1024204ejc.62.2024.02.14.01.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:09:35 -0800 (PST)
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
X-Inumbo-ID: c68fdf81-cb18-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707901776; x=1708506576; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sPUlJDhf2pZebErIfa7t3QKc2ftExv3cCl/QvvNC50o=;
        b=gISCj7BfF1c78he4gxssnNYmwwCzAr0ZRQelcUFMIA8thH1EcGwURvSaCXc+EZ8GCW
         kknLSzcg5kh7HRAbDUo4EfizupgTG6mK9RvIbUwRvYlHicrq1CG+94cZde+P3bgqCEBS
         PWt+XLcUvndn5LhcMVyPfW5LrxL39cKr2milQ26QVYJZU1Mn4eCJ9hqVW5r5Z4jx7G36
         c1JEGms/GzIkdBmYXn1Q3wh7W7vqcGXbTpPZn6CfF1VCP2GekgZ/Cw/85FZofp8unwzN
         icGdsgWTNap/aoukI5h0B/AOyfRkZkAr1A2CEDk8GI58TeAnCyXve/DGgD85uMa1KYBN
         vMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901776; x=1708506576;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPUlJDhf2pZebErIfa7t3QKc2ftExv3cCl/QvvNC50o=;
        b=YfRHcXpJG4DeoAnxxSjh2sDFvk6vqPfVgF1ipoFB/xOK3/ap8TP41kHE+4t76i+gN2
         ZEr1s8gWK7tlLLqafb7p180P9leDu2Omf5pw0MR1nKSXWZlYIISM43kLTcCamcKrD9pE
         +/i6Exdf94qo4IBYyITqYYC6XjOdwQ4XQfhtGbvzuFSn8wU4UGsfr8sNlGfW/4v1HrzU
         aYTHOMPtr+479vXB0irEBqGU14iMkJN0scrlY0D0LPpqsBQiml9ziM4R7SrnkJcl4Jel
         VucLnLuTD+H/WjzNPUFuODzVN8/Wt1p7TKFyRK7ekRklclR/nng0hMbS819o/3gqf+IA
         y2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVuxpSnYmPIVF7Z0+h6S5FnwLOQoDoQeX5JB6XMDrNh/shNa5COjFf5kW4g8GshcMUH+DfVQMdhByWJ+thZzRttTKvWCoBeRDmHBNEAW9s=
X-Gm-Message-State: AOJu0YwVKGrsgQvnOiWUQdqw5jG9brGsoQaoB+IuBzT8w9OYRqAE7yf/
	7AbFqP5snCUREn1PRsRPSIAXnvhELKUKYQWXyQYfX/V/ht7N/o6S
X-Google-Smtp-Source: AGHT+IESqlnjGRol16m9Vchh8ZbjQ+C5afhSr/N8b7cDb4rSA9Yhnp1Dun2mWKHC4K9iEQmM8gH4HA==
X-Received: by 2002:a17:906:3710:b0:a3d:50ee:e636 with SMTP id d16-20020a170906371000b00a3d50eee636mr649809ejc.27.1707901775866;
        Wed, 14 Feb 2024 01:09:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbjpdaGJg30YO0XsjCmow2nrWqrzzM3gnru8Cx6Ihw/0x9/FyiAysjnP1mSm1H72ywq1/82bJ36C8jCgWQ4Gv0kK5xsd4K9REQ72V2RFS0B1xtBkOv0B6z83IbmDxulRrv8YPN5ypXoF8Qr1UfjmED9jkJaEHxww8ptnbkqXUj40lqwY4+erLORrABVvXHzYYsM4HDBGquET/GKyn9Jy5u/QbmRn3kw/pq0rVQZNH+JBAUggFvnKQ1kjWlL8ABFhHmfqXE3GKappvhMEz2jRwE4kBXIzklb34t9xoGxU7iQzxLH9sJOlmaBNr75aHxCxRY7fUX2Ge81P7S1aAUxpdqbXTi4KXQe57U7qbEggnnHinvRq3TySgDS3kByA==
Message-ID: <ea20431452c5e7ec7efc02b1d2832bb29d33a769.camel@gmail.com>
Subject: Re: [PATCH v8 3/7] xen/asm-generic: introduce stub header monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>, Jan Beulich <jbeulich@suse.com>
Date: Wed, 14 Feb 2024 10:09:34 +0100
In-Reply-To: <4cc1eb90-e3ef-4225-aa98-441c11c3fc8a@xen.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <84568b0c24a5ec96244f3f34537e9a148367facf.1707499278.git.oleksii.kurochko@gmail.com>
	 <e12914b8-5c6a-4085-b5e8-03c5bdcc2c27@xen.org>
	 <4cc1eb90-e3ef-4225-aa98-441c11c3fc8a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0


Hi Julien,

> On 13/02/2024 17:40, Julien Grall wrote:
> > Hi Oleksii,
> >=20
> > On 09/02/2024 18:00, Oleksii Kurochko wrote:
> > > The header is shared between several archs so it is
> > > moved to asm-generic.
> > >=20
> > > Switch partly Arm and PPC to asm-generic/monitor.h and only
> > > arch_monitor_get_capabilities() left in arch-specific/monitor.h.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> > > ---
> > > Changes in V8:
> > > =C2=A0 - Add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> > > ---
> > > Changes in V7:
> > > =C2=A0 - Drop definition of arch_monitor_domctl_event for PPC.
> > > =C2=A0 - define arch_monitor_domctl_event in asm-generic/monitor.h.
> > > =C2=A0 - add "define HAS_ARCH_MONITOR_DOMCTL_EVENT" in
> > > arm/.../monitor.h as=20
> > > it has arch specific implementation.
> > > ---
> > > Changes in V6:
> > > =C2=A0 - Rebase only.
> > > ---
> > > Changes in V5:
> > > =C2=A0=C2=A0 - Switched partly Arm and PPC to asm-generic monitor.h o=
nly
> > > =C2=A0=C2=A0=C2=A0=C2=A0 arch_monitor_get_capabilities() left in arch=
-
> > > specific/monitor.h.
> > > =C2=A0=C2=A0 - Updated the commit message.
> > > ---
> > > Changes in V4:
> > > =C2=A0 - Removed the double blank line.
> > > =C2=A0 - Added Acked-by: Jan Beulich <jbeulich@suse.com>.
> > > =C2=A0 - Update the commit message
> > > ---
> > > Changes in V3:
> > > =C2=A0 - Use forward-declaration of struct domain instead of "
> > > #include=20
> > > <xen/sched.h> ".
> > > =C2=A0 - Add ' include <xen/errno.h> '
> > > =C2=A0 - Drop PPC's monitor.h.
> > > ---
> > > Changes in V2:
> > > =C2=A0=C2=A0=C2=A0=C2=A0- remove inclusion of "+#include <public/domc=
tl.h>"
> > > =C2=A0=C2=A0=C2=A0=C2=A0- add "struct xen_domctl_monitor_op;"
> > > =C2=A0=C2=A0=C2=A0=C2=A0- remove one of SPDX tags.
> > > ---
> > > =C2=A0 xen/arch/arm/include/asm/monitor.h | 25 +-----------
> > > =C2=A0 xen/arch/ppc/include/asm/monitor.h | 28 +------------
> >=20
> > Looking at MAINTAINERS, monitor.h was covered by "VM EVENT, MEM
> > ACCESS=20
> > and MONITOR". As you move to ...
> >=20
> > > =C2=A0 xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ----
> > > =C2=A0 xen/include/asm-generic/monitor.h=C2=A0 | 64
> > > ++++++++++++++++++++++++++++++
> >=20
> > ... asm-generic/, I believe it will now fall under "THE REST". So I
> > think MAINTAINERS needs to be updated to also cover asm-
> > generic/monitor.h.
> >=20
> > Looking at what was already committed, I think asm-
> > generic/vm_event.h=20
> > should also be added in MAINTAINERS. Can you send a separate patch
> > for=20
> > that?
>=20
> Oh, I just noticed that we have the following entry:
>=20
> xen/include/*/monitor.h
>=20
> So the header is already covered. Sorry for the noise.
>=20
> As the code is falling under the "VM EVENT..." subsystem, then
> Tamas's=20
> acked is technically sufficient for this patch (even for the PPC
> change).
>=20
> But just in case you need one for Arm:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks.

~ Oleksii

