Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514A498FE6C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810069.1222681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdGN-0002E0-6e; Fri, 04 Oct 2024 08:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810069.1222681; Fri, 04 Oct 2024 08:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdGN-0002B8-3W; Fri, 04 Oct 2024 08:02:11 +0000
Received: by outflank-mailman (input) for mailman id 810069;
 Fri, 04 Oct 2024 08:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdGM-0002B2-H1
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:02:10 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34d841c-8226-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 10:02:09 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-287b8443affso509661fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:02:09 -0700 (PDT)
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
X-Inumbo-ID: f34d841c-8226-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728028927; x=1728633727; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RWeNMUJVv18MSTM0HqMu2i4E6HxBtEjIeE9qe4C70k=;
        b=YLmQr60Z7Dzwff6UoaoXmhv7bw9E1FOKXM8F625ZGrW89BJkSA9zST7esR295bTPTD
         GtgkilEjJ395iPsyC+EuHp3nxgitXnadsejDhLQb2iQt6Uvdbs99TRYlW6b0/JevttRn
         2SNtolFzoIAOSZpd97uyskt+Mqe+XeNY0sTpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028927; x=1728633727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RWeNMUJVv18MSTM0HqMu2i4E6HxBtEjIeE9qe4C70k=;
        b=bkleu7lmO8uWFFlpOhmXOcMS5pYhJJjDLK0EC67KgQDmBem5mKCj7U22nzezVy6IBA
         G6w0cgeq2eyjj59+QEJjb18ItOY9qM0dcM3VqaW+NqvImf/ZIsOqT5TKhCOuWYYQsg2m
         FqZ7Xqp0zBzatMnPad38qRC1tyUVXMTkSALEPDQ/IYvzmAURBpLNOOBBE3Vumpr1gL9S
         8UlfuLqvcgQYagd53VXH3P6+Wr52I+J1cB9QsfCKz4nbWtuI3Zfs9ePT8XsryDe/Zms1
         zBvGvYQ2fK4xpSucoVhkgCMG72XFHQ8xGWeqrzfvS+MNnHng4rp+HhBEMTtiK7aAk75H
         8YFA==
X-Gm-Message-State: AOJu0Yxemrh6qroJlCe35JLhRwryzWkkOGjNtTwXxwYZ2Yp+D2vPRoI9
	f/hxDT3NEbwypdzjQxzNMVI/B4zQP2eAcEPgLyQMh3N6VX3Xp9eNo7WqDlFUGKJnQxmcAqYNziv
	JFanpk3/pTZAEqEHXTZdm4KAUoBsrZfwlttj2/BOPEFknUpRX
X-Google-Smtp-Source: AGHT+IHwJxMzPiy+LeTl6GLP75Lk9xTmUt6Q42wUyLgUvO0pfqN9jou49DJdyA48v9wweouplWj1sfFACjl6dixg9oE=
X-Received: by 2002:a05:6870:1491:b0:270:3139:59fe with SMTP id
 586e51a60fabf-287c1da9ea4mr1277553fac.12.1728028926849; Fri, 04 Oct 2024
 01:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241003175919.472774-1-frediano.ziglio@cloud.com> <b09f94e4-1a96-4de5-816e-362ba4131f5a@suse.com>
In-Reply-To: <b09f94e4-1a96-4de5-816e-362ba4131f5a@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 4 Oct 2024 09:01:56 +0100
Message-ID: <CACHz=ZjK4gnVYPrukok=ak6qDt-4fm9v5FsG3n8fVq49Tuy6SQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Update header guards bases on new coding style
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 7:23=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 03.10.2024 19:59, Frediano Ziglio wrote:
> > With the help of some scripts and manual checking I updated header guar=
ds.
> >
> > As the changes are pretty large patch was split based on maintainers
> > to reduce mail spamming.
> >
> > Excluded public headers from the update, they are API, software like
> > Qemu will fail to compile if changed.
>
> Interesting - the first patch I peeked at, ...
>
> > Changes since v1:
> > - make all commit compile;
> > - exclude public headers, their guard is not an API.
> >
> > Frediano Ziglio (19):
> >   xen: Update header guards - Generic
> >   xen: Update header guards - X86
> >   xen: Update header guards - ACPI
> >   xen: Update header guards - ARGO
>
> ... this one, adjusts a public header. And the diffstat ...
>
> >  xen/include/public/arch-arm.h                           | 6 +++---
> >  xen/include/public/arch-arm/hvm/save.h                  | 4 ++--
> >  xen/include/public/arch-arm/smccc.h                     | 6 +++---
> >  xen/include/public/arch-x86/cpufeatureset.h             | 6 +++---
> >  xen/include/public/arch-x86/cpuid.h                     | 6 +++---
> >  xen/include/public/arch-x86/guest-acpi.h                | 6 +++---
> >  xen/include/public/arch-x86/hvm/save.h                  | 6 +++---
> >  xen/include/public/arch-x86/hvm/start_info.h            | 6 +++---
> >  xen/include/public/arch-x86/pmu.h                       | 6 +++---
> >  xen/include/public/arch-x86/xen-mca.h                   | 6 +++---
> >  xen/include/public/arch-x86/xen-x86_32.h                | 6 +++---
> >  xen/include/public/arch-x86/xen-x86_64.h                | 6 +++---
> >  xen/include/public/arch-x86/xen.h                       | 6 +++---
> >  xen/include/public/argo.h                               | 4 ++--
> >  xen/include/public/vm_event.h                           | 6 +++---
>
> ... also contradicts that statement. Please clarify.
>
> Jan

Hi,
   I just missed these. Excluding, better to be safe for the first
round, we can consider guards in the public headers later.

Frediano

