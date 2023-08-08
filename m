Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8B773907
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579416.907378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTI44-0005eo-O9; Tue, 08 Aug 2023 08:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579416.907378; Tue, 08 Aug 2023 08:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTI44-0005cX-LQ; Tue, 08 Aug 2023 08:27:40 +0000
Received: by outflank-mailman (input) for mailman id 579416;
 Tue, 08 Aug 2023 08:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVOA=DZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qTI43-0005cM-Gq
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:27:39 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ea41b1b-35c5-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 10:27:37 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso82737911fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 01:27:37 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a2e2c05000000b002b9f9cb8e08sm2183839ljs.21.2023.08.08.01.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 01:27:36 -0700 (PDT)
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
X-Inumbo-ID: 6ea41b1b-35c5-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691483257; x=1692088057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y/kBOFCMeqWNBXymWnPLRcTDvKoIuo7naaa88L56UZ8=;
        b=bcr4F3DHfpaWrGKfIkX9kS2cAmjudL1x1b5dbnJlH4Jwgot4LELk74fKj0zevEa0d3
         r/cVAcatnwuYFG62dlOLgKfDXMDv734gWZsiBXm0/eSwAbr4YoXlUkT7ym1xR7ggdcxK
         0Aol3nEW/Y8Tvludkgr0kkgj8tqa2VnUws/K51Hw//3SGvLe+E2uycwOaRix8C2jL/ii
         LzO7JZN5GNyn4nq+RsIno1kesDV6cGaCRRdw16C4k27JJ+5wlV2RWEXEIum3KpfwmjXN
         Uno5cCTHDbGrNdFwC6kl8MVnF9VwpqAixEr/Xl/zSNuHFvw7Dzi47dqO0vcTHiGiyYqR
         D1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691483257; x=1692088057;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/kBOFCMeqWNBXymWnPLRcTDvKoIuo7naaa88L56UZ8=;
        b=V1WQZkMnbctACTmCLeOMMDcQZ3TH5q3OI8OsGHfNSLxEz7Y+ycfiWx3aQZ5UjGHbU9
         prnzUHwT0zc/11RIFUr+0c1XzXUpSrLYlpnM24sa0E2duJBKSQ86rD3LD+rkBED6Pe2h
         C6qhSk5eTv3hRyVlqMPGRTb/VdxzDNOwTn4evat/giFH01DtXNyP10BpaB44c3XR6oGu
         Yhl0siBxWpnzJobRFG9JVz8Olx1+beLUyeDbGJdk98DjcwZbNzfF8GXqtWD8iAkQRVPw
         LgJuuJmk6V7fus5mkfBW8e558kWwbzNcONQ8K0SJKQATXBGcNUQjg6zCsjPJ71ME6nFM
         aMvA==
X-Gm-Message-State: AOJu0YyuxgDbV/igReSIjgqy1ki3KsJrnc4XTgGM3okinsW5I3VFiTer
	T0+Z3eBIdQGmxBDhkqE9yHEbeE4JErQ=
X-Google-Smtp-Source: AGHT+IFIeGr12llUtgighl0vxr/xBnuyySw1/BAN/iigulBgV5rgr6OrUd02pPdwZRJxC7Kq0VlsSQ==
X-Received: by 2002:a2e:90d4:0:b0:2b9:cd79:8f94 with SMTP id o20-20020a2e90d4000000b002b9cd798f94mr8177618ljg.39.1691483256896;
        Tue, 08 Aug 2023 01:27:36 -0700 (PDT)
Message-ID: <c061cacec1e9079695ffc9df9a65044ae1020aeb.camel@gmail.com>
Subject: Re: [PATCH v7 2/6] xen/riscv: introduce dummy <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 08 Aug 2023 11:27:36 +0300
In-Reply-To: <b2d4db80-6719-1e8b-94ef-d839e4d6486e@suse.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
	 <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
	 <b2d4db80-6719-1e8b-94ef-d839e4d6486e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-08-07 at 11:01 +0200, Jan Beulich wrote:
> On 03.08.2023 14:05, Oleksii Kurochko wrote:
> > <xen/lib.h> will be used in the patch "xen/riscv: introduce
> > decode_cause() stuff" and requires <asm/bug.h>
>=20
> While as it stands the description is accurate, I don't think that
> later
> patch has a need to include xen/lib.h anymore. xen/macros.h will do,
> I
> think.
>=20
> Also please don't write descriptions in terms of "patches" or more
> generally future "commits". Their titles may change, they may
> disappear
> altogether, etc. Finding such a description later will end up
> confusing.
Thanks for recommendations. I'll take them into account.

~ Oleksii

