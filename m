Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0C850FDD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679430.1056875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSp9-0003Uq-Cz; Mon, 12 Feb 2024 09:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679430.1056875; Mon, 12 Feb 2024 09:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSp9-0003S4-AG; Mon, 12 Feb 2024 09:42:03 +0000
Received: by outflank-mailman (input) for mailman id 679430;
 Mon, 12 Feb 2024 09:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hp+9=JV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rZSp8-0003Rw-En
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:42:02 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f87053d4-c98a-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 10:42:00 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d0ce22b5f3so34869121fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:42:00 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t11-20020ac2548b000000b005116aed81a6sm819654lfk.294.2024.02.12.01.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 01:41:59 -0800 (PST)
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
X-Inumbo-ID: f87053d4-c98a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707730920; x=1708335720; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Aw416LoobCcO1ExpuJjj5JbWkkcVqBczmGfK13E16y0=;
        b=V4ZeBI/UvjNKYV/HCbm9ubPfkii6CpdTGHJQdK+I/jGWiPR/hICy10++t5GwJJ+Ufl
         uBGxoiY9Ux4p91sNT/uMqXHKgQndKML0/Ll8AT9WD8yV9AIvjqUXzYYpt2briBABwtSd
         NzHoHPtgjA+xSNNRetxy3lpl/t/KcG3eNyCqrGrZHJjwZsBeianVlg3OneXFuIWvEN8j
         tMGhsUQtL5MZHi8fgJRhWhkHwwaaW9DATWRZ257sHgh3loqVC27h0ltfliCFnUSJEq6Q
         fv+uI9GGKo3WFSMgyWrVNzt9/cWvsNZ1Fq7/wUCn+JpP/y9pvYOKH1/zcBHgsDNWI9Bx
         37Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707730920; x=1708335720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aw416LoobCcO1ExpuJjj5JbWkkcVqBczmGfK13E16y0=;
        b=bPGsj22PpIcXZe724MYWvAFEksRbJ1GTlC3JBcDd2TR6dtwh775nhnEs/9osUn2RhW
         eRp9Z//600e8um+0ONwyPi9gBVyifZYZx4sdzrg3koeJI3sInSuK3nlD7tQre8ozqkBr
         TdsC3vcPJwAj5mQ2q8HSM/y3bhRufcXEAiNK3NN3x0rzNSP9WDrjgeSD9Lz7GPkyClzn
         bY9gRUSBjbMuU8GUbKVrRzKgl7qWFSct1w+x8/gPG1XUsHyJgRwUv/AP7N4LlhCm4BMT
         cczf/Uu+oWOrLX/en0cfV+ywyIFSyWyhHxP8+JmyXjEZF1+lPNiZHaZOtk3X3OrMiwuH
         2hNw==
X-Forwarded-Encrypted: i=1; AJvYcCVXtu8sqTcZ955vlnPm/sLzJ5AaOBb2OF3cE6IT8bwImad9GPyQAQKCU6eYAepmPSoyv0SspxixxtJiJ3HDB9q7xVh4sBTzY76Sd8xIS4o=
X-Gm-Message-State: AOJu0YyUdd0IIx8bXWsZXlTLzUE/dnfDKtfm67Ntwl3K9EsQm5uu5gmP
	YbyhNuOd40fjLFNXIGo3YFWlcXgV5AE999JvHsqokywzXv+Zl0H2
X-Google-Smtp-Source: AGHT+IHdvS4gEegSgL/6+sDf8IPuXOIXwVa7hhQ2WPFrsnL4oP/M4fIhSqzL12lFXpUb14wOGMWgaw==
X-Received: by 2002:a05:6512:78c:b0:511:93c1:a142 with SMTP id x12-20020a056512078c00b0051193c1a142mr223687lfr.25.1707730919758;
        Mon, 12 Feb 2024 01:41:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlsQECgiRKcEVDbVxVyMgTCLNeFijmv3TkWqikOz+6Yewei+xXC9QUBzY4x6zDZKhg/QPXnftShGsvLrnWoJE4+k/Iz/E7j5CSc3ePNKVMS1wLGh8w+qc0ZanAiNtMg1j0+2O6jic=
Message-ID: <a75199e3e66c76ae48af2bde80ee913a9c39fa75.camel@gmail.com>
Subject: Re: [PATCH v8 1/7] automation: ensure values in
 EXTRA_FIXED_RANDCONFIG are separated by new line
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Mon, 12 Feb 2024 10:41:58 +0100
In-Reply-To: <c516259d-46f1-4bef-b4d0-4cfe18a3cb8a@amd.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <8b6f208f0b4327392cfddbfa6809117cc7686750.1707499278.git.oleksii.kurochko@gmail.com>
	 <c516259d-46f1-4bef-b4d0-4cfe18a3cb8a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 09:12 +0100, Michal Orzel wrote:
> Hi Oleksii,
Hi Michal,

>=20
> On 09/02/2024 19:00, Oleksii Kurochko wrote:
> >=20
> >=20
> > Kconfig tool expects each configuration to be on a new line.
> >=20
> > The current version of the build script puts all of
> > ${EXTRA_FIXED_RANDCONFIG}
> > in a single line and configs are seperated by spaces.
> >=20
> > As a result, only the first configuration in
> > ${EXTRA_FIXED_RANDCONFIG} will
> > be used.
> There is no need for this patch. If you want the variables to be
> separated by new lines,
> just use a '|' symbol after EXTRA_FIXED_RANDCONFIG (see all
> definitions of EXTRA_XEN_CONFIG).

Thanks a lot. I'll drop this path then.

~ Oleksii

