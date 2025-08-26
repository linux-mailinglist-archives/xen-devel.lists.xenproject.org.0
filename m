Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C407B3582D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094142.1449499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpgb-0003jk-SX; Tue, 26 Aug 2025 09:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094142.1449499; Tue, 26 Aug 2025 09:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpgb-0003hg-PK; Tue, 26 Aug 2025 09:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1094142;
 Tue, 26 Aug 2025 09:09:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqpga-0003S2-GW
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:09:48 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6986ed07-825c-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 11:09:46 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f3edab4c7so2700858e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 02:09:46 -0700 (PDT)
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
X-Inumbo-ID: 6986ed07-825c-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756199386; x=1756804186; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+sQwmfzJG+QKH2P0eioTtyOB0gxI0ZokrLq8RJV3mM=;
        b=PHpW7D22usSivWUqTDqLjcmWeN91Lo03XX0j6sLEkRVQqC0FFrySQVDE7gEt3iG9Vs
         j3NLkRDVpkWaYrOpYP0A3A3byzIJizgJcsm2JMGfd5r5BUv6BLJlFwvn55hfoBTp99Ja
         SVR6ly3IIjObEtgWEM2NMJhnQO/kfK8L1AFWHsqj9WF/ew4fPjHdgkNxZJQp0VJdPrgV
         zeCNZyE04Bm37NWT43YjSkZtrGsbB2fJNTgS7/ZylMF7AgIgY8GnvHYb45+LF2ZDvL6b
         7agtXmR5aKhmoc+N7MUa7O+4rAt/EUy8jq55feHMOmZ3eTvq8TWbVLExYaz9y0R2a15k
         2j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199386; x=1756804186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+sQwmfzJG+QKH2P0eioTtyOB0gxI0ZokrLq8RJV3mM=;
        b=p1m0KWPHzbPAnIKvC45ew4lcTPgcx8g4GcFPHgbPAbKwJkK6GzLsri3bNJVUtFaNQC
         v8bXk1dhmpYb0qhtUyNkMosngVsI2pxcfaeXKf3NmNjG0kGjTvNzXZgtC3Rk27/dcAz0
         nTfdqb+EilXw1Gf1dyG6TPghr7nKnBndAgD+BR6Vg9KqRr7X7LME2Q62/w0kNPFBEj/g
         aExiqUxPCJATQIbSIXXElDMGqicEWwCmz2E7JEKzqd2ShqRBi09BkpIiTKbaqTSYE9Q6
         CtG84P9p0CpBoaTDeXrVnBwhiK7CbnbViTwHwSRB2i3tTeFXCmRCPE0/g3cNIIN08gBk
         yqBg==
X-Gm-Message-State: AOJu0YwsUeJNR6Ydk1ZXcoTWW3gVi/Qqe8Mrah5inHeBKxCm3hesLwBm
	jZz1QyS7vn/sf0UffT7sA2oRKbM/7jCRtn78WDQUT4uupEi4czi4jEc7jWCWAKbHekSjRKptwjF
	hfb4ePsaqXLrHKXljAwMG3+O75TR/M84=
X-Gm-Gg: ASbGncuCjJBD/gCK4jPxwuJUGSUIDGgaxwH93DJWm1WYXjEy+TzN3qiQlQtjJgdnPRr
	hn5sbgik5qEazfd6Dwqn8LohnsSA5exFj8tWcn8FpZaZoBhY1FX5LbdeJHlatOVZE/CoBHTuP18
	NyAzMFFAiGjD/RQHw1w/SrSYu8vy/9+Og36JQUEzvKZHdpS/SJpfaGxKm2iVe0ZEAINgyBtaA/v
	e+OUY+FWlXlXax8
X-Google-Smtp-Source: AGHT+IHlgxoPmhUhqsyHOznfzHwNZabRSp6zgfFk8ZhRhZaQzyufi8nYKfmSh5C3NuZfNaPS5G5Js10OmmTU5WTPVn4=
X-Received: by 2002:a05:6512:404f:b0:55f:4ab0:79a7 with SMTP id
 2adb3069b0e04-55f4ab08b27mr1253084e87.7.1756199386066; Tue, 26 Aug 2025
 02:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755506449.git.mykola_kvach@epam.com> <433d74567cabf33c2a672afc0f96e58efec75c54.1755506449.git.mykola_kvach@epam.com>
 <d11c1224-99c0-4254-b593-c8a7f405b079@xen.org>
In-Reply-To: <d11c1224-99c0-4254-b593-c8a7f405b079@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 12:09:34 +0300
X-Gm-Features: Ac12FXwauAnkLbLlrzBbjwuDJPwweWHZ_zXGuzEj9ZaohZO9pCjZjCXx1jZD08M
Message-ID: <CAGeoDV8thPLmSWS7POJm8ni9CKVP+5b+W4yN5Sn93xdSUQUGFg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support
 for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sun, Aug 24, 2025 at 12:31=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Mykola,
>
> On 18/08/2025 09:49, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add a new entry under the "Virtual Hardware, QEMU" section documenting
> > support for the optional PSCI SYSTEM_SUSPEND function exposed to guests=
.
> >
> > This function is available via the virtual PSCI (vPSCI) interface and
> > allows guest domains (domUs) to initiate system suspend operations.
> >
> > The feature is currently marked as Experimental.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v6:
> > - Dropped the generic guest PSCI support entry (merged in a separate pa=
tch)
> > - This patch now documents only the SYSTEM_SUSPEND optional function
> > - Reworded commit message to match the final form after rebase
> >
> > Changes in v5:
> > - Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls=
,
> >    which is not relevant for SUPPORT.md
> > - Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic gu=
est
> >    PSCI info; guest PSCI support was documented in a separate patch
> > ---
> >   SUPPORT.md | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 6a82a92189..b5ab049b52 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We suppo=
rt all mandatory
> >   functions of PSCI 1.1. See below for the list of optional PSCI call
> >   implemented and their status.
> >
> > -   Status, Mandatory: Supported
> > -   Status, MIGRATE_INFO_TYPE: Supported
> > +    Status, Mandatory: Supported
> > +    Status, MIGRATE_INFO_TYPE: Supported
> > +    Status, SYSTEM_SUSPEND: Experimental
>
> Experimental implies the feature is not complete. But it is unclear to
> me what is missing (or I probably forgotten). Can this be clarified in
> the commit message?
>
> If there is nothing, then I think it can be a tech preview.

I initially thought that we would need to add a "xl suspend" command
in order to allow suspending another domain via the control/hardware
domain. However, after your question I reconsidered it and realized
that this functionality is not directly related to vPSCI, but rather
to Xen system suspend support.

So, I will change it to "Tech Preview" as you proposed. Thank you!

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

