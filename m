Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86109856F5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803794.1214606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOzR-0003cg-MX; Wed, 25 Sep 2024 10:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803794.1214606; Wed, 25 Sep 2024 10:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOzR-0003Zl-Ji; Wed, 25 Sep 2024 10:11:21 +0000
Received: by outflank-mailman (input) for mailman id 803794;
 Wed, 25 Sep 2024 10:11:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stOzP-0003Zf-SG
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:11:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8119bbf4-7b26-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 12:11:17 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso1073723066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:11:17 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f7889sm194883266b.179.2024.09.25.03.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 03:11:16 -0700 (PDT)
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
X-Inumbo-ID: 8119bbf4-7b26-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727259077; x=1727863877; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KSad5joZ9teFaVRXNihE94CwUPuzP8IMYJaOCBdu3hc=;
        b=iNu0wNaBUl/L3krsvYMg67nEpuao1rLQZHR3Cg5VAiceSGFch5pv0H0ocK0LKU8gTf
         mdgV5qiFTSRxxL/3wBSI7jynI+S9gZFIDAXcflSCeknwRRN4kYmc/qT9vi2+brZkboq8
         yPG35F44U81ze4N7h7MxdohGoJrHxSAVVI/fO2F6mTmPfP2tesflf08nm/HmzblOymXV
         YMiWIOLBPV4U0muXkO87cmFDItjHEUksT+9XU7FUGa851JaL/LGDqa4xoniKv7ORN//X
         CSdA4M/SR7guZxYRppvqyH8dtuogNiXxEvRPJZ90XMXzdlgAW9SstW8/4DXss6sEZRWe
         6JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259077; x=1727863877;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KSad5joZ9teFaVRXNihE94CwUPuzP8IMYJaOCBdu3hc=;
        b=nuyKzsXe01s07Bz9MPmRcNBNMtb23nsHWo5pUgFdCDySf7hGj7xts2rn8SH7A838dH
         gYZ+xbte/2Rc42bXCs0ueOPwyosMlUJ9eSGCRlCsP3UYFWfmkmnV4XI+p9xLLlR+Bale
         UAEU+YJr+n0R/Z6qfm8QSh+EWXneD9U57ZAev/17+VerDe1hO5WDrO8ocbRAo2rf4C7C
         amM+VZEmCXqXgE3J01Pev0wzt3yPDLjMeq0aBEODfLKsL1d2oJPvQWLjrXGh8JUacGzl
         jNX+yF5nm45Gc3Lxgosvqtx2OXJ5aM82XLaPXb62B/ewz86Pbg7vSzrqZztMFMN+1WFz
         fuZw==
X-Forwarded-Encrypted: i=1; AJvYcCXUW0XCIJ0we+YN/BAanIAn9R6NHXBYbQaQpLKkiYAM326lB6qpDnT6NImy+nK28A6FW6Z+wQWQK/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznIlWzcWqXdLwQ8ZmrwuWts+mPfrXU/z/B2/Q/dy/iTWwJURvC
	xufO60s0lv7gWaPw7MKWVEuXvTiakpMVvyni6HGWUyYbBYnhgfDW
X-Google-Smtp-Source: AGHT+IHhc+8W6f/y6XkIvYyfqeubWsh8+K2+Uit93zFDTsZ2HYdMDtbRMPRgS+YUEqyj5BV3XCVCfA==
X-Received: by 2002:a17:907:971d:b0:a86:7d62:4c28 with SMTP id a640c23a62f3a-a93a03ada18mr199928366b.30.1727259076847;
        Wed, 25 Sep 2024 03:11:16 -0700 (PDT)
Message-ID: <a606b47052572197aed3b1a601a1ff2599a19116.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] xen: introduce common macros for per-CPU
 sections defintion
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Julien Grall
 <jgrall@amazon.com>
Date: Wed, 25 Sep 2024 12:11:15 +0200
In-Reply-To: <53c4054f-2e20-4120-87a0-2d2a9da83025@citrix.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
	 <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
	 <7857cbd9-c26d-4d31-97c6-8a1f34dd4559@citrix.com>
	 <2b6624d147c0e86bdd3839e113953c282e742d17.camel@gmail.com>
	 <53c4054f-2e20-4120-87a0-2d2a9da83025@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 10:58 +0100, Andrew Cooper wrote:
> On 25/09/2024 10:23 am, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-09-24 at 18:01 +0100, Andrew Cooper wrote:
> > > On 24/09/2024 5:42 pm, Oleksii Kurochko wrote:
> > > > Introduce PERCPU_BSS macro which manages:
> > > > =C2=A0* Alignment of the section start
> > > > =C2=A0* Insertion of per-CPU data sections
> > > > =C2=A0* Alignment and start/end markers for per-CPU data
> > > > This change simplifies the linker script maintenance and
> > > > ensures a
> > > > unified
> > > > approach for per-CPU sections across different architectures.
> > > >=20
> > > > Refactor the linker scripts for Arm, PPC, and x86 architectures
> > > > by
> > > > using
> > > > the common macro PERCPU_BSS defined in xen/xen.lds.h to handle
> > > > per-
> > > > CPU
> > > > data sections.
> > > >=20
> > > > No functional changes.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > Acked-by: Julien Grall <jgrall@amazon.com>
> > > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > ---
> > > > Changes in V2:
> > > > =C2=A0- rename PERCPU_SECTION to PERCPU_BSS
> > > > =C2=A0- update the commit message
> > > > =C2=A0- add Acked-by: Julien Grall <jgrall@amazon.com>
> > > > =C2=A0- add Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > ---
> > > >=20
> > > > =C2=A0xen/arch/arm/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +--------
> > > > =C2=A0xen/arch/ppc/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +--------
> > > > =C2=A0xen/arch/x86/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +--------
> > > > =C2=A0xen/include/xen/xen.lds.h | 10 ++++++++++
> > > > =C2=A04 files changed, 13 insertions(+), 24 deletions(-)
> > > Aren't you missing a hunk in riscv/xen.lds.S ?
> > I thought it would be better to add a hunk in riscv when
> > percpu_init_areas() will be called in RISC-V's start_xen().
>=20
> If you didn't have the old form already, I'd agree.=C2=A0 But right now
> this
> leaves RISC-V being the odd-architecture-out.
Oh, I just missed that I had them already. I am just confused with my
another patch series connected to DT device tree info section.

>=20
> I can fix it on commit, to save another posting, if you're happy?
I would be happy with that. Thanks.


~ Oleksii

