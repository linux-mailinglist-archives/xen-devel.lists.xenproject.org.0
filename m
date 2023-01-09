Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BE66211A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473436.734039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoCL-0005zU-A9; Mon, 09 Jan 2023 09:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473436.734039; Mon, 09 Jan 2023 09:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoCL-0005wj-6r; Mon, 09 Jan 2023 09:12:05 +0000
Received: by outflank-mailman (input) for mailman id 473436;
 Mon, 09 Jan 2023 09:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEoCJ-0005wZ-4Y
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:12:03 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad01c3e8-8ffd-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:12:01 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id bu8so11961102lfb.4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:12:01 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 bp22-20020a056512159600b004cc800b1f2csm742680lfb.238.2023.01.09.01.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:11:59 -0800 (PST)
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
X-Inumbo-ID: ad01c3e8-8ffd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F6yvyptlUCAsacDdikFfhnC9npXRFDLTNFsf28a75Wg=;
        b=FxZ4jcCi8mZ8rEMAPmd0IXgws7BmViiQsT+Kv0oqrS/UTm07Ov1DPGZ236zidT89DA
         mlKSkKreSrR3gPEHZq9dMyyF3RkT/90gQ9cb/WSw2OZTiGSe6sn5FjFDM9arH/LgDLBN
         4bGI7MOh3GGr4BYi+vGG+/MLUxbwDVFWPu7pfmDcH774EehRkmcGtGuMcMJ0Njia4NZl
         UGWjQbJZXNrT5aKooEnOe1fSeum54MAtk630WyGAwhV8GVVrSwgUrP7h0/5FHAieTZpG
         qxfOQEnotjelP/2GoQcH16+27bTHMfuFmDRC8hVMdWI5PwnvuJFeMzXnsGc0FJjDAiKb
         kqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6yvyptlUCAsacDdikFfhnC9npXRFDLTNFsf28a75Wg=;
        b=iNAAYa5wYWGFJAF70q8MAtMBluC3h5zGGsY6zMwvke0l13KGqVFylf5JqQXa6AxUgY
         D3y1QlUQwTBldLPwhMZ7zp73HfdUwq0lQ7WHw5s3xq75dnBovFqtZKNkQCDwHD4maZyu
         818w8vRKPwxg+nvNSTNXCuUZsTgH3DNXvCqudludEi5ff5tF2MPnLD3G4Mhij80msyM0
         M3UQsJfXw0IHFCwtXJ2Mq1XDUpypEK6Cw/ZuCd3Anv7EETwVHVZSdnwEHjgrU+XGF2/q
         qhiWLZboFPr8LIct07+W8ubcbOBdCW5yr5xrprAUg/EXoi6cEyCIeP/jgTExLto79dS9
         N1Rw==
X-Gm-Message-State: AFqh2krx28ftZ3ZtRRsaQ+zzI4OKfQxmrQeq2Wr0+wUTOKUzrrX1uMZ0
	KIJYFNjjh5V9ckowwRPkzzrDEM/fmiThNLFJ
X-Google-Smtp-Source: AMrXdXt2V3ufGnlWIbDre7Yx0eC6+4r8m61TMSXXthy6fhu+7nWEYEC0UgA/8vxJm8C4cuuMyW/xeg==
X-Received: by 2002:a05:6512:4014:b0:4b6:f22c:8001 with SMTP id br20-20020a056512401400b004b6f22c8001mr27849177lfb.56.1673255520584;
        Mon, 09 Jan 2023 01:12:00 -0800 (PST)
Message-ID: <2904df5d2d0882dc53ffb1da74072cb3956911ff.camel@gmail.com>
Subject: Re: [PATCH v1 8/8] automation: add RISC-V smoke test
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Mon, 09 Jan 2023 11:11:58 +0200
In-Reply-To: <c55a0743-5433-205c-f40c-cd296576c0f4@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <90078a83982b37846e9845c8ffc50c92f3be1f47.1673009740.git.oleksii.kurochko@gmail.com>
	 <c55a0743-5433-205c-f40c-cd296576c0f4@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-06 at 15:05 +0000, Andrew Cooper wrote:
> On 06/01/2023 1:14 pm, Oleksii Kurochko wrote:
> > Add check if there is a message 'Hello from C env' presents
> > in log file to be sure that stack is set and C part of early printk
> > is working.
> >=20
> > Also qemu-system-riscv was added to riscv64.dockerfile as it is
> > required for RISC-V smoke test.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0automation/build/archlinux/riscv64.dockerfile |=C2=A0 3 ++-
> > =C2=A0automation/scripts/qemu-smoke-riscv64.sh=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 20
> > +++++++++++++++++++
> > =C2=A02 files changed, 22 insertions(+), 1 deletion(-)
> > =C2=A0create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
>=20
> Looking through the entire series, aren't we missing a hunk to
> test.yml
> to wire up the smoke test?
>=20
Missed that. Will update test.yml in the next patch series.
> It wants to live in this patch along with the introduction of
> qemu-smoke-riscv64.sh
>=20
> However, the modification to the dockerfile want breaking out and
> submitted separately.=C2=A0 It will involve rebuilding and redeploying th=
e
> container, which is a) fine to do separately, and b) a necessary
> prerequisite for anyone else to take this series and test it.
>=20
I am going to send a patch with the dockerfle modification today.
Thanks.

> ~Andrew
~ Oleksii

