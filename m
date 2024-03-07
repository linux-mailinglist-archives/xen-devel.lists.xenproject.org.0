Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4574874F90
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689891.1075336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDQ0-0006uh-Ej; Thu, 07 Mar 2024 13:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689891.1075336; Thu, 07 Mar 2024 13:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDQ0-0006ro-Bz; Thu, 07 Mar 2024 13:04:16 +0000
Received: by outflank-mailman (input) for mailman id 689891;
 Thu, 07 Mar 2024 13:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wkY=KN=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1riDPy-0006rg-8K
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:04:14 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e7f194-dc83-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 14:04:12 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-29ae4c7da02so523993a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 05:04:12 -0800 (PST)
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
X-Inumbo-ID: 30e7f194-dc83-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709816651; x=1710421451; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8KoaNI1LMVC8yIyXhS5P9xvcqQjNdkTXiETLJzEH24=;
        b=sI4mt2rcv+FLiRO/LyCnirgVg1V/U2PQkTq8ZECujlIBaU5HUbF2ZAJUWghiR9BbqF
         iQvzHWcGBSXVC1oQ6FF/bRcZ29eh9NruQwQuYJ/6j+YI2kCwJ3LP7c95Xyi44OhdgTzK
         +m6qBfKaOVFfxZ/KhGPkZ1xS6SPwMJzAkeoQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709816651; x=1710421451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8KoaNI1LMVC8yIyXhS5P9xvcqQjNdkTXiETLJzEH24=;
        b=A8gQY5Dy0vnawUCaY2Rj7XCaXKQQJbHEGNizOqtgnibUZaggb3S6HQ/ci2sO/6QteU
         Qh+kyNoVcfR55XaTk2R/TN9lr+v3Qlf/LzoSA6idStA9DfhplI0LCEWlKLeZ+wXTz+yw
         uO+8NlqBbUvxsJ+P9ly5c2rvyl9c5czj98pBI9RnfMn330E3nJCR3xOA1ye7JHxlOAnF
         ZrEwwKxxTQRLwScMz9fOg585KUSm2co3DwSP4bEBm3fUj+5wmM3di9lvNx1XQvN2ypJb
         /ulYaBsEn2lDYEpY5AfMqCgVKzUn6C5Csb5FPndEx1hCBafxYA+McIdvOjAZfjkmPxmm
         bPTw==
X-Forwarded-Encrypted: i=1; AJvYcCXNuilteRBilNS7AAETSsBkLpewngTaCS+XSqjDciT3glHyXEwP1EmzChi/zBttlTU3nCcbmCJTenfgzT5ii6XGdp1+p5YukNLUN+2H+b4=
X-Gm-Message-State: AOJu0YzacrymtCfLetFHr+TdyCvBabQZKdfQlVbHeXbP4RaySSEiqCwH
	DbF1G9Nr1pyHYVFBSryAKzyGs2f+x+6M29VXxbT01/10lKJiUKAPHjmmHOYcsINSz2XNDxWg1o/
	GreopHPpHl0KPpcpa0xYJbV0xXN740PBfVhCc
X-Google-Smtp-Source: AGHT+IHTzmzrNV39VVqUwCjVMBqXjqhLlCwObB+zNLHSNIPP6JFCsXE95Wdry7ezSqDUwY+jsaDP5IhghpAJEliInRs=
X-Received: by 2002:a17:90b:78a:b0:299:3efe:8209 with SMTP id
 l10-20020a17090b078a00b002993efe8209mr14005945pjz.4.1709816650717; Thu, 07
 Mar 2024 05:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com> <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
 <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
 <82126c3a-0cde-452f-86aa-2571482f42aa@citrix.com> <76ce9dcf-8cac-44b3-9550-f516024bad6e@suse.com>
 <9e827057-9306-4a2a-8816-410661bf8892@citrix.com> <818ac202-5473-4638-b140-45272b1041ed@suse.com>
 <e8b5ef98-900b-42b7-a688-a379168ef396@citrix.com>
In-Reply-To: <e8b5ef98-900b-42b7-a688-a379168ef396@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 7 Mar 2024 13:03:58 +0000
Message-ID: <CAG7k0EqNn006WVBG+hNxGCjMSMFsuevSMda0R1BQgi_H5ibrCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 12:16=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 07/03/2024 11:58 am, Jan Beulich wrote:
> > On 07.03.2024 12:31, Andrew Cooper wrote:
> >>
> >> The thing called virtual_region already describes 6 ranges, and I'm
> >> adding a 7th.
> > Hmm, yes, in a way you're right.
> >
> >> It has been a module-ish description right from the very outset.  I
> >> don't think it is fair to describe this as an abuse at all.
> >>
> >> Is this going to satisfy the outstanding concerns?
> > Yes. And thank you for bearing with me.
>
> No problem.  I'm glad that we've come to an agreement.
>
> Ross?
>

Yes, I think that is fine with the additional description clarifying it.

With that,

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

>
> >
> > Jan
> >
> >> diff --git a/xen/include/xen/virtual_region.h
> >> b/xen/include/xen/virtual_region.h
> >> index d05362071135..9d150beb8a87 100644
> >> --- a/xen/include/xen/virtual_region.h
> >> +++ b/xen/include/xen/virtual_region.h
> >> @@ -9,6 +9,12 @@
> >>  #include <xen/list.h>
> >>  #include <xen/symbols.h>
> >>
> >> +/*
> >> + * Despite it's name, this is module(ish) description.
> >> + *
> >> + * There's one region for .text/etc, one region for .init during boot=
 only,
> >> + * and one region per livepatch.
> >> + */
> >>  struct virtual_region
> >>  {
> >>      struct list_head list;
> >>
> >> ~Andrew
>

