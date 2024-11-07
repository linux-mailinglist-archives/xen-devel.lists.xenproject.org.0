Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C49C0BDB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 17:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832097.1247493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t95ZI-0001sw-48; Thu, 07 Nov 2024 16:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832097.1247493; Thu, 07 Nov 2024 16:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t95ZI-0001qR-1T; Thu, 07 Nov 2024 16:41:12 +0000
Received: by outflank-mailman (input) for mailman id 832097;
 Thu, 07 Nov 2024 16:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYad=SC=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t95ZG-0001qL-9d
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 16:41:10 +0000
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [2607:f8b0:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13872813-9d27-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 17:41:03 +0100 (CET)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a3b4663e40so4093115ab.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 08:41:03 -0800 (PST)
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
X-Inumbo-ID: 13872813-9d27-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1pbDEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEzODcyODEzLTlkMjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTk3NjYzLjY0NTkyMSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1730997662; x=1731602462; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMvM9pfaZHXSxg21BbBGZDS7D59ifQHvIVH8bWxb/CU=;
        b=ErSTUlfypN9JhmxpuktNlRMgq5TZr4BH/oCB9U80eBGm09iXBjW1ZZ/Dd++0/Wxfal
         53Vdl8SLrEyb2gxEBACNkZQ91T/+fEjA/CG7+VRVu+tZBnzGKKcTR/t4LluibHybd3cc
         PPEER/KN+V6+EVY5f3gmjCnXmLfvNDD3iTPQ2qygGukZCgIqMy8Hsb+xNPL3Ax89qBRA
         bVV1M2Xe4EHxNQYORSR68uxpCLHjdK8Fd3XM/1Al///12Fy7gLeni6Kr+GY/Z65DPWlH
         VdyKyep/QZw/nv1n0cQAvdUufs5rS4eOCAh4v+AvnJ2hGiH3U/0tILU3JP+qXUfsh02A
         RhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997662; x=1731602462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMvM9pfaZHXSxg21BbBGZDS7D59ifQHvIVH8bWxb/CU=;
        b=Ye77Y3SNUISUcXeM/eRMCx1Yess6faUe+w9xGGDFXve9tVMxQBDj7l6MiYU4+pAh6h
         EBpyfEcxvJhcSIOzlK1iSZrAAFb4R5u9Tx7WyhDKHbPs0aoyjnED0awdKCOOsGFU0Q19
         DuoMQxOhTGdUva9RFtCXd6qfL4w3IcxQUEbxi10EHJV/XJvXPQg3a+jNWNSfsxsVvcTY
         hMe9U9fTTgly2x+01LUmjXtwYrpIbxs2Mb+OYUBj6J3I5i8yJe7+NH86D2/NyOp0QMye
         wCyJFud5NS1qiZjMWRKExtIvO68oZH5M7ACpcKvN7eU0fiSYcWIBwmxZLgrI7kKev+YW
         wymQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz2j5LAPpzNx6NJ7NdGnZeIDgq42ASDEDab59SrAYJ3MW0ACA/uuC+dx/EysYgOlNQtdvGXxNngVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRnjTBz4iQPAvXlg84JXFS6AmhURxxeRCMxWnsQUn//scel2L1
	Nl/hMKaHDDvrlnyD/He/eEBLBPB1177eaSS/+2sHtMHcJ0rSdHAwFwD/5jYVMBYZsE91Cxez0I5
	SGH2rK+THyPJDrN4533vZ6Vkbaaz25K9G5D1G+A==
X-Google-Smtp-Source: AGHT+IFRY2af/mNfFVQ3SyQY4T2xl7yiB6Y0P+DQYT6R8Zk8yHCR/9usDZVcNQmecNlmZrWrPy3VPaOERsuoCTxXaO0=
X-Received: by 2002:a05:6e02:1a6c:b0:3a4:e377:d906 with SMTP id
 e9e14a558f8ab-3a6b021b260mr267343555ab.1.1730997662317; Thu, 07 Nov 2024
 08:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-9-carlo.nonato@minervasys.tech> <f86f611a-4f18-4847-8f21-c6ef20cd6b6c@suse.com>
In-Reply-To: <f86f611a-4f18-4847-8f21-c6ef20cd6b6c@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 7 Nov 2024 17:40:51 +0100
Message-ID: <CAG+AhRVu6O=2X9vO12R43=0oHmEjr4Zwus3tx+rDWCRUwE9R0g@mail.gmail.com>
Subject: Re: [PATCH v9 08/13] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Nov 5, 2024 at 4:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 25.10.2024 11:50, Carlo Nonato wrote:
> > PGC_static and PGC_extra needs to be preserved when assigning a page.
> > Define a new macro that groups those flags and use it instead of or'ing
> > every time.
> >
> > To make preserved flags even more meaningful, they are kept also when
> > switching state in mark_page_free().
> > Enforce the removal of PGC_extra before freeing new pages as this is
> > considered an error and can cause ASSERT violations.
>
> What does "new" here mean?

I believe it means "assigned to domains". So yes "new" it's definitely wron=
g.

> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > ---
> > v9:
> > - add PGC_broken to PGC_preserved
>
> Which then also wants reflecting in the description.

Yep.

> > @@ -2485,6 +2485,14 @@ struct page_info *alloc_domheap_pages(
> >          }
> >          if ( assign_page(pg, order, d, memflags) )
> >          {
> > +            if ( memflags & MEMF_no_refcount )
> > +            {
> > +                unsigned long i;
> > +
> > +                for ( i =3D 0; i < (1UL << order); i++ )
> > +                    pg[i].count_info &=3D ~PGC_extra;
> > +            }
>
> The description doesn't cover this, only ...

PGC_extra must be cleared before freeing pages. Since here we're going to f=
ree
pages, PGC_extra must be removed.

> > @@ -2539,6 +2547,7 @@ void free_domheap_pages(struct page_info *pg, uns=
igned int order)
> >                  {
> >                      ASSERT(d->extra_pages);
> >                      d->extra_pages--;
> > +                    pg[i].count_info &=3D ~PGC_extra;
> >                  }
> >              }
>
> ... this is mentioned there. And it's not clear to me why it would need d=
oing
> in both places.
>
> Jan

- Carlo

