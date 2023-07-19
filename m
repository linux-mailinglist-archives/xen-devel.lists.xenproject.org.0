Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239EC759B61
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565975.884641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAMH-0007OK-C8; Wed, 19 Jul 2023 16:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565975.884641; Wed, 19 Jul 2023 16:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAMH-0007L0-8r; Wed, 19 Jul 2023 16:49:01 +0000
Received: by outflank-mailman (input) for mailman id 565975;
 Wed, 19 Jul 2023 16:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sL7T=DF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qMAMG-0007Ku-Nl
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:49:00 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28be904f-2654-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:48:59 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so11845682e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 09:48:59 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 e5-20020ac25465000000b004fb75943ab3sm1020632lfn.258.2023.07.19.09.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 09:48:58 -0700 (PDT)
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
X-Inumbo-ID: 28be904f-2654-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689785339; x=1692377339;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bRkjt1pU47JG3qwaqftQ7p/9/ftpSKHb6yI229dMamg=;
        b=Z2+csoLj3v4/Jo6tKgtqr9gcDWzV0N3PTZA9ODCbn5fnWpJtOE0gdJaoE2W73MmC1f
         itT8fr3hT/UXzyX95Ra14N3F/GXsmG2/MxozjkkTEeFo6tVQxBNubi+2VnUrSXBU83yH
         BqIaA1ywLpvf985hp0sAb/E0LpPv9ZWN4JjXaedYT7B7Mn/5QnRY+y8z4WL58LF1uf+Y
         tIVWW3srscrtl/f2UCj0fyhwfR11hzYN749mpLF/GqsRy7/lO+uEFOrRHwbS5ittuwLw
         uUDKNvVrnuJTf7Z/LICc07dyQ3RJo79ZnW0sYTBFF8GW6eOK5l8X/EiMYYAkSYPy+5d6
         OzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785339; x=1692377339;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRkjt1pU47JG3qwaqftQ7p/9/ftpSKHb6yI229dMamg=;
        b=MfZtoj5dAwCmGDnlmWoSm+/fpdXu8rvC+mWS3xdSIPCcRbcEoP2sWt06vUew5hFNiB
         qhVlBxtmMwqI0IKiJ4iBLNBBAlj1Bj4Xvuuvh9A6tUHHZRwK0U0xqXMWV6g8o31cR6Yn
         WYaFu4yLJJjT5HtxWSLcmK3DDb2DagueRfoSE4X1haS9i3PLNaheKSTfaaMzfYnZEFkh
         TPbiAw/Cy3h09HIfGJh7AZgoO1U4SSnui/niA9Y0MhTEVSuA3gDhL9D85Mktw3zXLF+2
         bPrN1c9R8plWz5mhb+IDosc9BtG+udMDg8cU9jvoOUxITTFiAptfSocePE4k6kIuXeYG
         defA==
X-Gm-Message-State: ABy/qLb51w5Q8HsY14vLu1JWyBLkAWKMoCD8CUvaEN3gXh3rwo/l2rFJ
	kLYM+9cQbvwt+miuKhWprRg=
X-Google-Smtp-Source: APBJJlGfGcI5En2jxwGfaswlDpNhaGUZZzdpqFgJhulU+lAvUuL6vO1lpHYj1agQXj7WiI3gvalrcw==
X-Received: by 2002:a19:670b:0:b0:4fd:d6ba:73c2 with SMTP id b11-20020a19670b000000b004fdd6ba73c2mr248620lfc.54.1689785338955;
        Wed, 19 Jul 2023 09:48:58 -0700 (PDT)
Message-ID: <a361be821d946c24f76820e657c608b9313131ca.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Jul 2023 19:48:57 +0300
In-Reply-To: <5feef533-cfb7-bb17-9439-6efcb2fb9b2a@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
	 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
	 <dbb568a33691b1fed5cb7f8de801a87e4aebbe4d.camel@gmail.com>
	 <5feef533-cfb7-bb17-9439-6efcb2fb9b2a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-07-19 at 13:38 +0200, Jan Beulich wrote:
> On 19.07.2023 12:39, Oleksii wrote:
> > On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
> > > On 17.07.2023 16:40, Oleksii Kurochko wrote:
> > > > @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
> > > > =C2=A0 *
> > > > =C2=A0 * It might be needed one more page table in case when Xen
> > > > load
> > > > address
> > > > =C2=A0 * isn't 2 MB aligned.
> > > > + *
> > > > + * CONFIG_PAGING_LEVELS page tables are needed for identity
> > > > mapping.
> > > > =C2=A0 */
> > > > -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> > > > +#define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 2 + 1)
> > >=20
> > > Where did the "- 1" go?
> > My fault. Should be:
> > =C2=A0 #define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS * 2=C2=A0 - 1=
) + 1)
>=20
> Why? I'd have expected
>=20
> #define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>=20
I confused myself with definition of PGTBL_INITIAL_COUNT from another
branch so your option is correct.
Thanks.

~ Oleksii


