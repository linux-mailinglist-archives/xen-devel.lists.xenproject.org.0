Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3849A68C4A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920427.1324599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus7s-0006sY-Dv; Wed, 19 Mar 2025 12:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920427.1324599; Wed, 19 Mar 2025 12:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus7s-0006qL-9c; Wed, 19 Mar 2025 12:02:24 +0000
Received: by outflank-mailman (input) for mailman id 920427;
 Wed, 19 Mar 2025 12:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFby=WG=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tus7r-0004x6-4g
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:02:23 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02c82838-04ba-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:02:20 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so11467579a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:02:20 -0700 (PDT)
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
X-Inumbo-ID: 02c82838-04ba-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742385740; x=1742990540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aLktUL8XH1NtG5p0p9N1SM0eGtBNzkMXPm5gqw9Wnc=;
        b=WMUU/Wn/6r2A4nRD/ksXhaFtnBoxeCSVIiqK5KFqh7N7Aqe00SPhUVBgo2OzuLM/3t
         KTi9axAXTBT57zUPOn6kDJ8F+YVXajcbr/Qxd7R4jRSaVfY8+tANYs90lz6P87kPfMWu
         U2lwa/rjwRhJHJ+u2kHWEUul+n2u9jIigCyTPj8OO6fi5Jbpn1JCqdhFxWyxPe7U6CVh
         tOxQM5duG9jc69EKxV9XjwXloaiEyj2QjSC63IwHQjMpZV/8ocT85z5/UddRq4UHuywi
         sxpvlsaNQ4YfXqYg/QagmAvJy3z8Je4+ecMpGiPhMaEjff/oVz2wjovVDWFQAZXqTdTG
         qiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385740; x=1742990540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aLktUL8XH1NtG5p0p9N1SM0eGtBNzkMXPm5gqw9Wnc=;
        b=Y81nLQ1ZE4MsOzx0WS85KjdK3B9vqzD757aV1tDONHHzN0OPGxPWASB79P5nHLnn/W
         eOb/xu3osa5RR+yjrkwSsEhdo3Ur/1J3l82PD8N5h+ZOS3TjSZnQBc+ZzC2DfzYhztnZ
         nLG0ZuDlHuzQ06/ZGk96fh79KG2a82VinsS5u8AXy/W9HAWdKYOK0cKV/ISVWr90mHlI
         82VTelRPaWgsbie3T6PCKciFgMiwbMnq+gscN7vEGS/jYRHxnokuX7bl5P0PA6mRHrB6
         BE7smLpAx1FbycEmnr0JvIGGTjjysiBqKiTcHY2mVE7MD/ubXI74ObxN3rdvFyIcF8TO
         sRhQ==
X-Gm-Message-State: AOJu0YzYZj5UQyPZ1qetH0fdqjMjuQIltAumkBHvicJXjrFi7L6m+Hiq
	sPw6gnZPC6UolEiQmniw6clfcR/2H77mSeU1bSW5xUIEQlYmcuE0RjibEUEo+D60rYvAOT0vBTU
	/7wQq5mkffjlAMOMwqf5H2iw12qcLEg==
X-Gm-Gg: ASbGncsUrltsG3xuYlfSGQymfkHNrI+FIU3umZYIDUQj7nDIEtWj7++xkNYq0Cosw4v
	pfPw4msodTMyvVvZSUvKbQl0M37Vd1kTVqvf3v3rYQc1JqbyH3ivllMngEgTuQgQ2hjRU7drN/m
	jTjT2B2uciWMAjvc0Y0wK5d27d
X-Google-Smtp-Source: AGHT+IFv+XZxKMbkrmHovlREgxwI58/GdI/jym8EA6M8ee6l3+qG5YTs89cfy1lpmF5KgxkbW13EO9ayiBo03OEhAdw=
X-Received: by 2002:a05:6402:84c:b0:5e6:17df:118 with SMTP id
 4fb4d7f45d1cf-5eb80fcea7dmr1873351a12.31.1742385739691; Wed, 19 Mar 2025
 05:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
 <27398a82-ecc9-4b4c-b140-2d68de666675@xen.org>
In-Reply-To: <27398a82-ecc9-4b4c-b140-2d68de666675@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Mar 2025 14:02:06 +0200
X-Gm-Features: AQ5f1JpsGW7khTf2UtzNoES6Ws0KSXYXIgIw9NqVPZb_PQbl8kK3zu-nxx9aA10
Message-ID: <CAGeoDV-mM6VK0HCLcwX+-WMf2rVjRBKjZ4iz-puEcZeJZ-59MQ@mail.gmail.com>
Subject: Re: [PATCH 01/16] iommu: Add checks before calling iommu suspend/resume
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 11, 2025 at 10:28=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi,
>
> On 05/03/2025 09:11, Mykola Kvach wrote:
> > From: Mykyta Poturai <mykyta_poturai@epam.com>
> >
> > These functions may be unimplemented, so check that they exist before
> > calling to prevent crashes.
>
> Looking at the cover letter, I see you wrote the following:
>
> "Add suspend/resume handlers to IOMMU drivers (there aren=E2=80=99t any
> problems with the current implementation because the domains used for
> test are thin, and this patch series implements only the very basic
> logic)"
>
> which I read as this patch is a temporary hack until we implement IOMMU.
> Is that correct? If so, can you tag it as HACK and move to the end to
> end up to merge it?

Yes, you're right=E2=80=94if we have handlers for suspend/resume in the IOM=
MU driver,
we don't need this patch at all. However, if we drop the iommu_suspend/resu=
me
calls from the system suspend, this commit becomes unnecessary, even within
this patch series.

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

