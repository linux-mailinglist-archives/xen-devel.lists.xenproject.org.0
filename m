Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21B9E18DC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847804.1262861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPpY-0001xx-LV; Tue, 03 Dec 2024 10:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847804.1262861; Tue, 03 Dec 2024 10:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPpY-0001vs-IB; Tue, 03 Dec 2024 10:08:32 +0000
Received: by outflank-mailman (input) for mailman id 847804;
 Tue, 03 Dec 2024 10:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6RU2=S4=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tIPpW-0001vm-CJ
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:08:30 +0000
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [2607:f8b0:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ab0c1eb-b15e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 11:08:29 +0100 (CET)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a7e104e500so13079325ab.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:08:29 -0800 (PST)
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
X-Inumbo-ID: 8ab0c1eb-b15e-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733220508; x=1733825308; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+0kTlN11UW/7L1+9Pcc5O9w7zSu0yOYTwdiDBdyX/g=;
        b=ZWaLWNJqTOCUoUgxCJPGArRWYDQ2QbIAnrjZsC2pXmJgF06xlJ9a5Yhwdjcug3s+QR
         eCHdRtmPUUd57QuGi4BF/IbG+E9ic8HBQXH56+eFn84e3RuOnFhZwBfRiwdtyojDZu2R
         /B4CYJMTwTWBc6VlJxC+nm0c+zJeBYQXZfqK8g0nOswc1LSbwhXA/1iQVOoQhhxjmwjQ
         chGNAH5nzybaZqSJqXvcQzgsIQg4S0RCOLhsepEs10Bb2Dv7yRyWcJgvaXd/S2UejbqN
         fHOhWDMJM5oaJYJQGgfzhdeKfJ1fe9AEBB5jqZN9xj0aqYQbPUuCCmPWTbfBeZQ9tYWf
         pMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733220508; x=1733825308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+0kTlN11UW/7L1+9Pcc5O9w7zSu0yOYTwdiDBdyX/g=;
        b=puhYbjNIA0ViItVMyhr4Fx0jpU3WjvOP2tvvpwbCIs9QmCH77tBplulCkWeHNWsgNe
         7XAtGhB7z++q3dv/re5wdvCYElwnPZG9pt47snqA4M7HnZ4Yn3lsTc7pG61W71KNndLZ
         CPpoOhKNXT2tICrkUZvjD1AvHL8lvZHKdPbHSYINmnZOQDUO0dKh4ISqJMXVE90LjS/h
         4JONmA2mON523TNnQopIfau2LKpsU9QuOw5rh7/yHTNYuavBJY4WlnwqlZjA8qPpSDrv
         XjiHhNAqqvalAoNhxiliNjYXfA/B+2Xbf7rPm7ZPjEWXlJWWlSmMLKoSZt0fra1WOFy1
         YwsQ==
X-Gm-Message-State: AOJu0YyDSWBUxHnwwNt6Rw/iWI8/FNiEV5K9xUYgABYzDDqzpiNRiv13
	oBBTMUuzTfClRf29Q5s8aCeDTG7fRTXmRy450kYkAaUR0VMp01pB9v4ucvxHXdHvBaX2ZT/L7zF
	0GZCWNDIntAgZZZJYC0Pzbv82UJi89Q6LfPlosg==
X-Gm-Gg: ASbGnctOr79mepp1EYpCmRPUBTDdYyHByXs6DFmLkaTUsIYpjphtAFlKnKn6bMbIz0e
	3rH9DoOd8d+l1ixO213Cht0xcCGogG0Dz
X-Google-Smtp-Source: AGHT+IFkJxDkrXMhanZvMzc/uppOczk89bn50k2YGZSyoSPbIWKeIy/zqCv3hurng8tTe+gUGS5R9L2FkaOB75yYCKo=
X-Received: by 2002:a05:6602:2d81:b0:835:4d27:edf6 with SMTP id
 ca18e2360f4ac-8445b577027mr237018739f.7.1733220507812; Tue, 03 Dec 2024
 02:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-13-carlo.nonato@minervasys.tech> <800b0b49-e6c5-4a83-8ee6-d89d51613b0c@xen.org>
In-Reply-To: <800b0b49-e6c5-4a83-8ee6-d89d51613b0c@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 3 Dec 2024 11:08:17 +0100
Message-ID: <CAG+AhRXM=u33jq2yY4F4tJHUXBzDJ8jOHcM53ejmPtfPweQLQg@mail.gmail.com>
Subject: Re: [PATCH v11 12/12] xen/arm: add cache coloring support for Xen image
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Dec 2, 2024 at 10:44=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Carlo,

[...]

> > diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> > index 671eaadbc1..3732d5897e 100644
> > --- a/xen/arch/arm/arm64/mmu/mm.c
> > +++ b/xen/arch/arm/arm64/mmu/mm.c
> > @@ -1,6 +1,7 @@
> >   /* SPDX-License-Identifier: GPL-2.0-only */
> >
> >   #include <xen/init.h>
> > +#include <xen/llc-coloring.h>
> >   #include <xen/mm.h>
> >   #include <xen/pfn.h>
> >
> > @@ -138,27 +139,46 @@ void update_boot_mapping(bool enable)
> >   }
> >
> >   extern void switch_ttbr_id(uint64_t ttbr);
> > +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t l=
en);
> >
> >   typedef void (switch_ttbr_fn)(uint64_t ttbr);
> > +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, si=
ze_t len);
> >
> >   void __init switch_ttbr(uint64_t ttbr)
>
> Given the change below, I think this function needs to be renamed.
> Possibly to relocate_and_jump() with a comment explaning that the
> relocation only happen for cache-coloring.

Changing the name of switch_ttbr() to relocate_and_jump() seems a bit
misleading to me. First I need to change the name also for arm32 where ther=
e's
no relocation at all. Second, relocation is something that happens
conditionally so I don't think it's a good name for the function.

[...]

> Cheers,
>
> --
> Julien Grall

Thanks.
- Carlo

