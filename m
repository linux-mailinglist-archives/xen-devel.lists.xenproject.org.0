Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B298C79EC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723501.1128413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dUu-0005IM-QQ; Thu, 16 May 2024 15:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723501.1128413; Thu, 16 May 2024 15:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dUu-0005Fz-Mw; Thu, 16 May 2024 15:58:24 +0000
Received: by outflank-mailman (input) for mailman id 723501;
 Thu, 16 May 2024 15:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7dUt-0005Bz-AS
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:58:23 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e6b1b5e-139d-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 17:58:21 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51f74fa2a82so1242533e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:58:21 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2b8esm3036181e87.247.2024.05.16.08.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 08:58:20 -0700 (PDT)
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
X-Inumbo-ID: 1e6b1b5e-139d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715875101; x=1716479901; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vSBBP6nHUw5/EgYTvPXK355r/xid6w2q4FGOgBFquYA=;
        b=D7Ntz+FR1ou+dAUaAmCXpJHtRZRUZt9yU838wtjIu81w4YxiTHa4tfCc9iEl7auWPc
         TVFxw1kpkJWzA81xKsx6hwVxGBHPmsETRAsdodCyAIgEiy+MaWnkU/gh8RzWVEY8oxqM
         mpbG2CmvSThRBBsOL1WNtYiPikEkY1BHtUfQOg9usQ+dbA7jTKKulFn+MRiF8wzWLNhS
         z9RZXhPXww6PEZvRVaPHx7OUeRNAmjTXII9+5waSepJN3zvXzbs7QPN5U9R+faD7d8i3
         C2DmEe0srKQvdzESfepbScYZyCS1ZhbduGAlftPW1nlDkyke1v6CBis5E+ej7X0PVV7J
         wsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875101; x=1716479901;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSBBP6nHUw5/EgYTvPXK355r/xid6w2q4FGOgBFquYA=;
        b=Y4VvfqxRZYadxVL2Gsyi6Cjj/DNjvXVFTwMMANWwZac0boaLhdvWQDI94W7HxhuWsy
         bo9ymp2ffyWiCEHrA94pUalRChx5oW3MhgOfR0NMrlpo7wxJMsBsAzZFnFm+YD9bRx0K
         f0RpPVhBh0ocHFZ+F9jmG8YUzNPU5iO7lCLK2gagSZP9sw85ErpGL9X/RXXrQdVUXVkM
         ONZRPZtJuol20OJcvqMnS2dJsxgf3+pQ9Qlknx50rhm5emzxUcGhXVhYO3kF5WZDqY0j
         UOrmN6GtSfAX4hWLzhu5ZqwQ9AyBhTrAogavjWKciqPoLacayRrsTzZyJaRmEwuTdP5I
         RIQg==
X-Forwarded-Encrypted: i=1; AJvYcCVQC0H/MeSxpFXgyV0w16ALmaxDJD8sJ2jDZr+COXt1Sg9SlHRhOXc0cf6Ccx/s8e0td6l8ydrETQbwq4HMJlfR6YuFs+f1AFTubyMzlRQ=
X-Gm-Message-State: AOJu0YyIc+Rh4nkKDh7qMGGzeX5p437arkrMLH91rjKsHLMl9UgMeC7H
	BNF+G/yl9eS/zCu+flhJ1plnuI8BRklrM+nRxcsdBCwumePBiCVQ
X-Google-Smtp-Source: AGHT+IGfM2yyADC8EM6rYOxXvEdM1veVmRerjEDPwE6B9fCMi5vdWm6DdHQZX+WI5aErhPqeZp93Pg==
X-Received: by 2002:ac2:4108:0:b0:51d:1d42:3eef with SMTP id 2adb3069b0e04-5220fd7b8b9mr16766553e87.29.1715875100564;
        Thu, 16 May 2024 08:58:20 -0700 (PDT)
Message-ID: <7f8ef88d0a8bd3e40b213d19dfc80cd3fd2db298.camel@gmail.com>
Subject: Re: [XEN PATCH 0/4] address violations of MISRA C Rule 20.7
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com, 
	ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
	 <andrew.cooper3@citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 16 May 2024 17:58:19 +0200
In-Reply-To: <c67c1b8b-e14b-4c30-a381-1b89aedcddb9@suse.com>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
	 <c67c1b8b-e14b-4c30-a381-1b89aedcddb9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 09:48 +0200, Jan Beulich wrote:
> Oleksii,
>=20
> On 15.05.2024 09:34, Nicola Vetrini wrote:
> > Hi all,
> >=20
> > this series aims to refactor some macros that cause violations of
> > MISRA C Rule
> > 20.7 ("Expressions resulting from the expansion of macro parameters
> > shall be
> > enclosed in parentheses"). All the macros touched by these patches
> > are in some
> > way involved in violations, and the strategy adopted to bring them
> > into
> > compliance is to add parentheses around macro arguments where
> > needed.
> >=20
> > Nicola Vetrini (4):
> > =C2=A0 x86/vpmu: address violations of MISRA C Rule 20.7
> > =C2=A0 x86/hvm: address violations of MISRA C Rule 20.7
> > =C2=A0 x86_64/uaccess: address violations of MISRA C Rule 20.7
> > =C2=A0 x86_64/cpu_idle: address violations of MISRA C Rule 20.7
>=20
> for 4.18 we took a relaxed approach towards (simple) changes for
> Misra purposes.
> I wonder whether you mean to permit the same for 4.19, or whether
> series like
> this one rather want/need delaying until after branching.
Lets follow the same approach for 4.19.

Sorry for delayed answer.

~ Oleksii

>=20
> Jan
>=20
> > =C2=A0xen/arch/x86/cpu/vpmu_amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> > =C2=A0xen/arch/x86/hvm/mtrr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0xen/arch/x86/hvm/rtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-
> > =C2=A0xen/arch/x86/include/asm/hvm/save.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> > =C2=A0xen/arch/x86/include/asm/x86_64/uaccess.h | 7 ++++---
> > =C2=A0xen/arch/x86/x86_64/cpu_idle.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A06 files changed, 10 insertions(+), 9 deletions(-)
> >=20
>=20


