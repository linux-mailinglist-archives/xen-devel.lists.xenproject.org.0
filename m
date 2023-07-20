Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCA75B12A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 16:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566632.885721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUZs-00045M-5E; Thu, 20 Jul 2023 14:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566632.885721; Thu, 20 Jul 2023 14:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUZs-000421-2G; Thu, 20 Jul 2023 14:24:24 +0000
Received: by outflank-mailman (input) for mailman id 566632;
 Thu, 20 Jul 2023 14:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1Sz=DG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qMUZq-0003ag-99
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 14:24:22 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df49159-2709-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 16:24:20 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b700e85950so12031741fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 07:24:20 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004fcdea129b1sm225725lfp.279.2023.07.20.07.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 07:24:19 -0700 (PDT)
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
X-Inumbo-ID: 1df49159-2709-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689863060; x=1690467860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=odecI3IRpadtzx+K3kfy4fT9+MoU+kILBnhF4nxnHQk=;
        b=CLJGXa8ElFcU8K6FPJQsvUA0J/8yGiyCCuT+oh6xl/1TxmHbWW3bISs2/FsKIBvwPS
         2LSWn3fPUcL3sKnWAUxY3O4luokj5OIiNEDQJIcM5/fjigbFOWINO+fK6ysgbn57ajnV
         P67IFnbpZ9BBDOdGg8Fo1VNmmcnVAVsJDcA0vrbPTB83oBhmd1dMxdwZ2UDzb27PXFTi
         hmOgFGxMy1YTrFrjL1fPV293WudQrPH2d6hP+eKqGy3Rv/QP8Y/XfDzcVIJMgJBfKbIU
         tvh+V/D7GZuxPHCN67WOlwm0jLUvxAQXQMVAkoHPMcplC1AxDmsWhoah3ONjm3UBIk/o
         EmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689863060; x=1690467860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odecI3IRpadtzx+K3kfy4fT9+MoU+kILBnhF4nxnHQk=;
        b=DgNqtm7sTlBMHWjHCLSlMaG+lNorVBnW4F4LI1skLXMlUk8gqmQksa7ZlP1+SXJZnV
         I5TlzYGCzuQhbqZGDpufNWLzefy5KnqF6aD6noCkEoegSGzJXFAB3KeTBhVu+nQFhN0m
         AuITOV5o1Glxlccn54QIoIXc/IeJQ886Mr7ow7gCJ8pPJ+wEXqQnFkVjrQ0+HK75qJ58
         KabXSBs2iQ0XfG9ieV6bqP1gBFMCBTd2yWplhm/QmdDa2r7TIrJ5bLStT9slputxtrcc
         GBSU0eB8Al/eiO3+WUtVWSob9qndw4nxH5FtRtElNMHnjoBj2QvwT7DulngeKRCe29Ju
         bmCg==
X-Gm-Message-State: ABy/qLbbtjE3pin1KVj/pEma/MvYzetIDqcjJIJZYhaDAf9N2NUJxFkv
	kOIhg0hVWgO4iIF6M4gn6Co=
X-Google-Smtp-Source: APBJJlHAC4zdKg5KzTMSbjzyybunUxS/rH/FSGkzh9OOrg4Oy1QIyAkORb2OqYDdpImOs7XkBNYOhw==
X-Received: by 2002:ac2:51bb:0:b0:4f8:770f:1b08 with SMTP id f27-20020ac251bb000000b004f8770f1b08mr2540154lfk.13.1689863059776;
        Thu, 20 Jul 2023 07:24:19 -0700 (PDT)
Message-ID: <214e7f5185c08af9e5475cd360b5ca5943c0f806.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 20 Jul 2023 17:24:18 +0300
In-Reply-To: <5fd13b50-5e9f-162f-0148-0697c6194a4e@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
	 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
	 <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
	 <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
	 <0cbf6a69e8ae08f6b85edcc4f8d53a84e0103d8b.camel@gmail.com>
	 <ad72e892-2ec0-5188-f3bc-6d33544c775a@suse.com>
	 <fce99ab86730de77a82e60efc2c550a3f52a2443.camel@gmail.com>
	 <5fd13b50-5e9f-162f-0148-0697c6194a4e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-20 at 16:06 +0200, Jan Beulich wrote:
> On 20.07.2023 15:34, Oleksii wrote:
> > On Thu, 2023-07-20 at 12:29 +0200, Jan Beulich wrote:
> > > On 20.07.2023 10:28, Oleksii wrote:
> > > > On Thu, 2023-07-20 at 07:58 +0200, Jan Beulich wrote:
> > > > > On 19.07.2023 18:35, Oleksii wrote:
> > > > > > Then we will have completely different L0 tables for
> > > > > > identity
> > > > > > mapping
> > > > > > and not identity and the code above will be correct.
> > > > >=20
> > > > > As long as Xen won't grow beyond 2Mb total. Considering that
> > > > > at
> > > > > some point you may want to use large page mappings for .text,
> > > > > .data, and .rodata, that alone would grow Xen to 6 Mb (or
> > > > > really
> > > > > 8,
> > > > > assuming .init goes separate as well). That's leaving aside
> > > > > the
> > > > > realistic option of the mere sum of all sections being larger
> > > > > than
> > > > > 2. That said, even Arm64 with ACPI is still quite a bit below
> > > > > 2Mb.
> > > > > x86 is nearing 2.5 though in even a somewhat limited config;
> > > > > allyesconfig may well be beyond that already.
> > > > I am missing something about Xen size. Lets assume that Xen
> > > > will be
> > > > mapped using only 4k pagees ( like it is done now ). Then if
> > > > Xen
> > > > will
> > > > be more then 2Mb then only what will be changed is a number of
> > > > page
> > > > tables so it is only question of changing of
> > > > PGTBL_INITIAL_COUNT (
> > > > in
> > > > case of RISC-V).
> > >=20
> > > And the way you do the tearing down of the transient 1:1 mapping.
> > It looks like removing=C2=A01:1 mapping will be the same.
> >=20
> > Let's assume that the size of Xen is 4 MB and that load and linker
> > ranges don't overlap ( load and linker start address are 2Mb
> > aligned ),
> > and the=C2=A0difference between them isn't bigger than 1 GB. Then one L=
2
> > page table, one L1 page table and two L0 page tables for identity
> > mapping, and two L0 page tables for non-identity mapping are
> > needed.
> > Then at L1, we will have different indexes for load_start and
> > linker_start. So what will be needed is to clean two L1 page table
> > entries started from some index.
> >=20
> > The only issue I see now is that it won't work in case if identity
> > mapping crosses a 1 Gb boundary. Then for identity mapping, it will
> > be
> > needed two L1 page tables, and only one of them identity mapping
> > will
> > be removed.
> >=20
> > Do I miss anything else?
>=20
> Looks correct to me.
>=20
> > Wouldn't it be better to take into account that now?
>=20
> Sure, it's generally better to avoid leaving traps for someone to
> fall into later.

Thanks a lot. Then it make sense to update the removing identity
mapping algo.

~ Oleksii


