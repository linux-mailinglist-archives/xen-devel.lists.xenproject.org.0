Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E01DACAB4C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003055.1382491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1PQ-000268-IX; Mon, 02 Jun 2025 09:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003055.1382491; Mon, 02 Jun 2025 09:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1PQ-00024h-Fo; Mon, 02 Jun 2025 09:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1003055;
 Mon, 02 Jun 2025 09:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM1PP-00024b-Tr
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:24:43 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a137796-3f93-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:24:42 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-551fe46934eso4813108e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:24:42 -0700 (PDT)
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
X-Inumbo-ID: 6a137796-3f93-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748856281; x=1749461081; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzDXYs/TNa8CfSzGEAtyBDVTqaKRNSpTzDTdNGCr4zs=;
        b=SCsk2C60scW5cO2jsaMgg5l+HybJva6UHh/D5cRy8V4HDxD8u+BYA3Np2W4TVx/PBa
         RqcC8FUJcNeloEvhn3jRVXDtkiAhIh2eHgtx7lERTszC84NIqGNEBfaWx0mO6kSohQ8d
         2YGbrmxqi19FSyohkjSu8pn2cQQsb4S9Ogbh0+UEL33dr9ecWRsyDtSRCTrbKO4CnHFk
         0WvYEmNHMxoM0Pe7raYJay33pDrU/+3+g6gdUZf6mNyogvCqkWzlMKCqC3OegmPDmKG5
         qIekbjTSXnMkbarfVnuc0R2rmibz5Ac5PNRCPElmXphhzmdYZ7eOT7PfgYT1gCL5IfIo
         +N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748856281; x=1749461081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzDXYs/TNa8CfSzGEAtyBDVTqaKRNSpTzDTdNGCr4zs=;
        b=vF3igTLyQlg65ArZbA5Sqa35xRnbZUBDZXGYQ/XgXB3egjN8GbT6gBiH1sxTP86JJb
         zRWE0af5K588AfA5lu/cYFQK0N9awXipFXA3gp1YdXtHH819WFE55ePQL9YhtrT/RGTC
         YdwY+rKjSJWCraNE9rXYGHltRZ7WaS3XUp69q1CbpRmpq80Hv7c+foV7MCvWlK71mgqz
         eJlTC3JOKv1cAtVy9Oo+5T82x3qY/LbZUOD4AVfwu3aSYPotkPQ8Fcyox4tB4kePs+rK
         DQvZjBPXsvciLtyqYvxzAIiobUlPmkjQJrm+/KqI/GqJxNCaBn1YvEATBbipXKTkoATb
         dcnA==
X-Gm-Message-State: AOJu0YwMY5jVP0BdDquraIiv8C8MpBbrjcSRNCVvBh84PDzMnNsm7Sto
	jC4nxllVUg2tyKXOLK1+uTNySO+MBMwvRUPB9Y44m0UmlLLGTUvw9YsYaKulP5Jl9XXCel/Pbim
	9yxxOa5o5nIjzB/T3OwIvsRf783vgqak=
X-Gm-Gg: ASbGncvLQaKr5EJI5/WdcEHnETDMMiaQgt3qwpwGxWSy/qiKwITYWMOMEpmxslNt0PK
	sOmv/FQa31cNCLW72oSlUsO86/4ofVL64DIc2MsKQkmmrix8ni0XshSUdQ3KIra7yoXtZ99VO1C
	FXwm2OtUwEdtkwfshaTkrvEv6hg7BUyQvxRxLT/4JzGQ==
X-Google-Smtp-Source: AGHT+IFGp3hOtFmFrnmNQpGZXL8QndS/jOoMW61IiBKpSMXmCsucKddHh1Y0bHLeiZv2hO/+IJi+qTfya5jTC9MHXyM=
X-Received: by 2002:a05:6512:118d:b0:553:2bdf:8b87 with SMTP id
 2adb3069b0e04-55335b117ebmr4686574e87.10.1748856281394; Mon, 02 Jun 2025
 02:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <9b1f50a40e3634f859ad8e7446c24e43caaa38eb.1748637004.git.mykola_kvach@epam.com>
 <26d614da-3fb4-4209-8123-096512911897@amd.com>
In-Reply-To: <26d614da-3fb4-4209-8123-096512911897@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 2 Jun 2025 12:24:29 +0300
X-Gm-Features: AX0GCFtrFid9ZUNyeaH5UxXRhUqIPDgY2dSNowP9IBDHElpmBOujb6W1kMTWIdI
Message-ID: <CAGeoDV8KksNYqGeTZf5Muq1AkrTGJ=8nuta=T202_3MJtp4=qg@mail.gmail.com>
Subject: Re: [PATCH] xen/arm64: head: document missing input registers for MMU functions
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Michal Orzel

On Mon, Jun 2, 2025 at 10:10=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 30/05/2025 22:31, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add missing input register descriptions to enable_secondary_cpu_mm
> > and enable_boot_cpu_mm functions.
> >
> > Specifically:
> > - x19 is used in enable_boot_cpu_mm as physical start address.
> > - x20 is used in both functions for physical offset passed to load_padd=
r.
> I'm not sure if we need to document register usage that is part of a comm=
ent in
> so called "Common register usage". It's repeating information for me. Tha=
t said,
> I can see that Arm32 does that too so no objection.

I'll drop that sentence from the commit message.

>
> >
> > This update improves code clarity and consistency in comments.
> >
> > No functional changes are introduced by this patch.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/arm64/mmu/head.S | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/hea=
d.S
> > index 634156f83d..033b3a018a 100644
> > --- a/xen/arch/arm/arm64/mmu/head.S
> > +++ b/xen/arch/arm/arm64/mmu/head.S
> > @@ -313,6 +313,7 @@ END(enable_mmu)
> >   *
> >   * Inputs:
> >   *   lr : Virtual address to return to.
> > + *   x20: phys offset (used by load_paddr)
> >   *
> >   * Clobbers x0 - x6
> >   */
> > @@ -337,6 +338,8 @@ END(enable_secondary_cpu_mm)
> >   *
> >   * Inputs:
> >   *   lr : Virtual address to return to.
> > + *   x19: paddr(start) (used by remove_identity_mapping)
> AFAICT it's also used by create_page_tables. I don't see it beneficial to
> mention the places the register is used. It can easily go stale.

I'll remove the mention of usage locations.

>
> With the remark addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thank you for reviewing the patch.

>
> ~Michal
>

~Mykola

