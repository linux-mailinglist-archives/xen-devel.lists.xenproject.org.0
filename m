Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AAD78EE74
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593889.927017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhbn-00007f-PE; Thu, 31 Aug 2023 13:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593889.927017; Thu, 31 Aug 2023 13:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhbn-0008WM-MJ; Thu, 31 Aug 2023 13:21:15 +0000
Received: by outflank-mailman (input) for mailman id 593889;
 Thu, 31 Aug 2023 13:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zVM6=EQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qbhbm-0008WF-Ip
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:21:14 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f85ac1-4801-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 15:21:13 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5007616b756so1553357e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 06:21:13 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a19ae03000000b004fb757bd429sm260937lfc.96.2023.08.31.06.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:21:12 -0700 (PDT)
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
X-Inumbo-ID: 41f85ac1-4801-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693488073; x=1694092873; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3XgpYJHcGnzlUEBWjeK0vR3ELIAbK/jeC7TCweU58f8=;
        b=Y6/QSz+kGdnttBWIFnjQ2vqT7GNajRJaVP9AO6MfYfhACV46vWZ8rrnGhp7XW0pVZX
         Dqvz5LafzjsUQ4nufIsN0fA+wHs7PaPZ2YI+YWN28a3D8UiUMX71ZRRoFr15YqnWsqaD
         2dfwfJvYwK4fa6Oq5Cvew9tH6IV9Ussj6JPrB7cYzFQQoBbWLB6cq/i49EH1zFGbKbLs
         hXq/Sy0ae7Ps/Yp+P/yahziHch0WJAxTb2VsVS1a5OhiLPjuAce3aa0USwr+ltk6v3Aj
         uHNDF8awB+dxCfNkGfzvhHnxuAfiIIqQmPLrUasRXRdXRVqs4AkrEUEw3hK2U5TBCd8T
         AlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693488073; x=1694092873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XgpYJHcGnzlUEBWjeK0vR3ELIAbK/jeC7TCweU58f8=;
        b=eB4rodQQSEoZozLzSVBeqw0oIi7U2AcNlMDlOif2vuUlKdlv8pyJIN9ZsM5W2QNlpK
         YW91rBHL2PLvUAgQewBNGGedntrUKgoyD2IPwYbCeANvBnDtLmbmFi2g0CBhjpM6Yvmc
         BEZ0QUiR4EKgsEiTR7gdZTVjFWNGv/75g7nlNfiOM+em+IE53uS/fBcwJzvGELyQTtsy
         stkt7ie2nQvSgOAQs7cqkPiqf0P5ugmfkxGJIOrGE02j9vOQTyZqcZfswiaCBgLQFxUe
         RDCM27gplhRF/JVAL2ruzhgEdgxCQFLH6+VEdq2ciG6oxd0dWxmYmYTyVtBxAJsPF09g
         HQmA==
X-Gm-Message-State: AOJu0YwrWa0tqUkDuBNGqbW+cQG5IQpx2MAY+XSDa3g/gfYILs6zM8DY
	yyPswhUSTvtmM3nUsrDqckc=
X-Google-Smtp-Source: AGHT+IHduG7ofy+shCTxbQh0B5/rYWtxpRbiPIaGL61wu+10KNlT81LhXREXSqq2MIrSzfqDV0dwGg==
X-Received: by 2002:a05:6512:1194:b0:500:9d4a:89ff with SMTP id g20-20020a056512119400b005009d4a89ffmr4754313lfr.62.1693488072605;
        Thu, 31 Aug 2023 06:21:12 -0700 (PDT)
Message-ID: <0d7f826c11301bf0505c9939ff43ad88ff9d3433.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 31 Aug 2023 16:21:11 +0300
In-Reply-To: <3a165375-0dd2-9a3b-403d-2306acd60b92@suse.com>
References: <cover.1693414172.git.oleksii.kurochko@gmail.com>
	 <ee7c3aa566dadd9350f39f5aedbfce3ae72ba663.1693414172.git.oleksii.kurochko@gmail.com>
	 <3a165375-0dd2-9a3b-403d-2306acd60b92@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-08-31 at 11:46 +0200, Jan Beulich wrote:
> On 30.08.2023 18:57, Oleksii Kurochko wrote:
> > asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> > asm-generic dir.
> >=20
> > Original asm/vm_event.h from ARM was updated:
> > =C2=A0* use SPDX-License-Identifier.
> > =C2=A0* update comment messages of stubs.
> > =C2=A0* update #ifdef.
> > =C2=A0* change public/domctl.h to public/vm_event.h.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in V3:
> > =C2=A0- add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for
> > "xen: move arm/include/asm/vm_event.h to asm-generic"
> > =C2=A0- update SPDX tag.
> > =C2=A0- move asm/vm_event.h to asm-generic.
> > ---
> > Changes in V2:
> > =C2=A0- change public/domctl.h to public/vm_event.h.
> > =C2=A0- update commit message of [PATCH v2 2/2] xen: move
> > arm/include/asm/vm_event.h to stubs
> > ---
> > =C2=A0xen/arch/arm/include/asm/vm_event.h=C2=A0=C2=A0=C2=A0 | 66 ------=
----------------
> > ----
> > =C2=A0xen/include/asm-generic/asm/vm_event.h | 55 +++++++++++++++++++++
> > =C2=A02 files changed, 55 insertions(+), 66 deletions(-)
> > =C2=A0delete mode 100644 xen/arch/arm/include/asm/vm_event.h
> > =C2=A0create mode 100644 xen/include/asm-generic/asm/vm_event.h
>=20
> While it's a comment on the first patch, it's really better making
> here:
> Did you look at Linux? They don't put an intermediate asm/ here.
> Instead
> see their scripts/Makefile.asm-generic. That way an arch still has
> control which generic headers it gets access to, without duplicating
> any
> of them.
Thanks. I'll look at the script.

~ Oleksii


