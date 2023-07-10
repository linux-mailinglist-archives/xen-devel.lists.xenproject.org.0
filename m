Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648874CF8E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561068.877353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlzf-0007uY-Mv; Mon, 10 Jul 2023 08:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561068.877353; Mon, 10 Jul 2023 08:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlzf-0007rw-K3; Mon, 10 Jul 2023 08:11:39 +0000
Received: by outflank-mailman (input) for mailman id 561068;
 Mon, 10 Jul 2023 08:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbMe=C4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qIlze-0007rk-7S
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:11:38 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 637ca87f-1ef9-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 10:11:36 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so6300694e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 01:11:36 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a2eb043000000b002b6da1b49c6sm1893155ljl.52.2023.07.10.01.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:11:35 -0700 (PDT)
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
X-Inumbo-ID: 637ca87f-1ef9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688976696; x=1691568696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sCvhrMfb/s4X4KvWNxZ3ivyanu/BY6rkZ7GVWUy41Kw=;
        b=JfBMDy5HC631wskRFnT/V0ZjmfdZC/NMttDVofgzXr98fp1Jgbud9kcLgvSyxOBhL0
         5FLlXFuqXWG4etNVhPm8rwvXbcsIQ1exgnBZgYj20zKMoCDXWug7e/B0bO5hGVzddlrw
         MU+ZiKokw8j0UeA5FJ4YY5tUi4b1V1DdrOjZUC8/YbchAR8tccBbbbdxUhdKA3SZxRoF
         FXx9UR7Vu/BVWk4YSR1VtQ8d/7N4ZnK7JLgz/+KfWHdNKft1SKPchAGh/giYQeM558rm
         nwZk1sc+cc7EeCZH7DvKw479Ifjsivko6rUEI16HmgYp4NjccjO8VoSIpCL1eZxf5PR1
         MKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976696; x=1691568696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCvhrMfb/s4X4KvWNxZ3ivyanu/BY6rkZ7GVWUy41Kw=;
        b=a0OkUveQ2SCY5xibXMrSKc3QERHfNPfWnJrfGgLFr027FwftaJYRS7FAWItw2SgNc9
         asorYLSTVMzUP7ODYMx314AR+DokcsglkF/eHOljxvA5oRQvhvJ7KwyVhAxg8hp+bfJz
         L1zblJFVNXR4ZFvE9zLqKC+qA09wmr/FBEpJkn2Hnbm6NVluvBVT3qUG6MzUro1U4uCp
         2k+ndpwy97Kf/HzqQo2/LgdX6XTGSEgDBewZCSNx05TPXJdN8Dx4EhXr8JNu1MnsDxhW
         TZ4ucWpQF2pjBCuuPTg2mCYuibdu/JlxPgI8r5E5Sk+1FnMBaDM/DJIbRRKkfIGMTFZ4
         nS8A==
X-Gm-Message-State: ABy/qLZnM7o7dCukxbq5BC8PLYDFtPFjGxQfvQsrvh2gOb5Cj2qkVdC4
	NFnlUfA3NYOMXmXS/nykHTM=
X-Google-Smtp-Source: APBJJlF9NPYGNY6I87LGk1UvZyawvpecsePdcnDbe6DuWm1MW3hsIyAj2XhcpUk5AX3Qzj7bNhiTRg==
X-Received: by 2002:a2e:9104:0:b0:2b6:e7c7:b039 with SMTP id m4-20020a2e9104000000b002b6e7c7b039mr9075385ljg.28.1688976695620;
        Mon, 10 Jul 2023 01:11:35 -0700 (PDT)
Message-ID: <57e367737e0ef40a584587d0f4dcc4bc23a70fbd.camel@gmail.com>
Subject: Re: [PATCH v2 3/6] xen/riscv: introduce function for physical
 offset calculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 10 Jul 2023 11:11:34 +0300
In-Reply-To: <b4cdc12c-19e8-cc5a-a981-052800970d38@xen.org>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
	 <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
	 <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
	 <b4cdc12c-19e8-cc5a-a981-052800970d38@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-07-07 at 10:17 +0100, Julien Grall wrote:
>=20
>=20
> On 07/07/2023 10:12, Oleksii wrote:
> > On Thu, 2023-07-06 at 13:18 +0200, Jan Beulich wrote:
> > > On 19.06.2023 15:34, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -29,6 +29,8 @@ ENTRY(start)
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=
=A0=C2=A0=C2=A0 reset_stack
> > > > =C2=A0=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 calc_phys_offset
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=
=C2=A0=C2=A0 start_xen
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .te=
xt, "ax", %progbits
> > >=20
> > > Since you call a C function, the code to save/restore a0/a1 needs
> > > to
> > > move here (from patch 4).
> > Thanks. It makes sense.
> > It would be better to move save/restore a0/a1 ( from patch 4 )code
> > here.
> >=20
> > The only one reason I didn't do that before that calc_phys_offset
> > doesn't touch that and it is guaranteed that it will not ( as it
> > doesn't have arguments )
>=20
> IIUC, the calling convention requires a0/a1 to be caller saved. So
> even=20
> if they are not used for arguments, such callee is still free to use=20
> them for internal purpose.
You are right.

I haven't seen that compiler use them if 'void' is passed to function
as an argument. But I agree that we have to follow the calling
convention to be sure that all is fine.

~ Oleksii

