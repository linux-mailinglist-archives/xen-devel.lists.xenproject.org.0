Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE9678129
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:17:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483117.749068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzVi-0004St-4d; Mon, 23 Jan 2023 16:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483117.749068; Mon, 23 Jan 2023 16:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzVi-0004QO-1G; Mon, 23 Jan 2023 16:17:30 +0000
Received: by outflank-mailman (input) for mailman id 483117;
 Mon, 23 Jan 2023 16:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJzVg-0004QI-Qk
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:17:28 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd9d5b6-9b39-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 17:17:27 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id 18so15156412edw.7
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 08:17:27 -0800 (PST)
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
X-Inumbo-ID: 6dd9d5b6-9b39-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5aXHdzzDPuXLFVEL1sFvEJow+/Fp7fJ1dNSzNwHwdk=;
        b=ZXE/h8Xu1TVbwCYgSkF6Gs8je7w8Gt5iGoGvoQoNxLV+1ksqn3pSEfdGO6G49g/YTQ
         bi6hHIHV52ZJ3Qob0kZJ/DnBh3r9LDWV0e6s7tY7MjPnPCDklB62bGQPPOeGq5mw/ePG
         UsmCw9ClDmv2v65S111rKKG17q9GlJA58wQwH18q8XssfECojsEosoCDse9BjENNEFuT
         K5mcgy57IAer43ZH+Zf0Q8EjFJAhzi3S5JAWgD5MOEu1bUQfF91nNUH1kV7RKaYY5t6j
         9jFJLo+RIlpjSh9fmju0/9OwzlGEnyBlMXScpeOgPEFuVx/p85xy68Sj5DcHxXWKRLmE
         s/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5aXHdzzDPuXLFVEL1sFvEJow+/Fp7fJ1dNSzNwHwdk=;
        b=q2CjN7RVW+04r9K8wK21sehrehH5F0yezMsXHmNfIpW9SENo8//afnqxTnIo+7O85v
         6AUnqLY6xJMJmUXHnwf+SX77HL7a/W/OIPenrOCLwJDg+ihdcfnnDcgfB6d5zoe+BKtH
         JhBbEaJyF7sYGJ1Gi9uEqzG7x25Dnc86DI/M5X6EWk/E5DW6k2VfU/NbV7KyvvVAbJ7r
         OZhEz5cQGALRGvFn9fRQO45iKGF4D+aq0JgV7CN7vAM/2ZoHpGAzYGI06i1lvbt9DKS9
         ISGl1z4izuDCQXTQPAUPtCDMICpWlz0rZrblI6Zv4yCrBCw8Mm0Qs2QqLvrflID4AWlq
         C1MQ==
X-Gm-Message-State: AFqh2kr7JEyTNXZPDSv0+6Bl2lWyvsPns5a6/oIqwDbqRkNchs8epXhr
	jw7zOdaGGpYkKFU0dmDBy8oe4pyzO/sH52tDuM0+3A==
X-Google-Smtp-Source: AMrXdXvfDxe2sV2dQbJcjzSoBbAtXzjDXraAgIKfT9PCI/XIgmuBydwBkcpfLgt81/X5H+Wd4uW7zt+e17/eZTQKb9w=
X-Received: by 2002:a05:6402:b9d:b0:49b:67c3:39a1 with SMTP id
 cf29-20020a0564020b9d00b0049b67c339a1mr3138928edb.33.1674490647446; Mon, 23
 Jan 2023 08:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech> <8fc9366a-3a1b-6c40-499d-b16bce681c64@suse.com>
In-Reply-To: <8fc9366a-3a1b-6c40-499d-b16bce681c64@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 23 Jan 2023 17:17:16 +0100
Message-ID: <CAG+AhRVt660Gw_c7H1PHyKkxfuzGJzyXrx23HBvFGQMcHguzgQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Arm cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Mon, Jan 23, 2023 at 4:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 16:47, Carlo Nonato wrote:
> > Shared caches in multi-core CPU architectures represent a problem for
> > predictability of memory access latency. This jeopardizes applicability
> > of many Arm platform in real-time critical and mixed-criticality
> > scenarios. We introduce support for cache partitioning with page
> > coloring, a transparent software technique that enables isolation
> > between domains and Xen, and thus avoids cache interference.
> >
> > When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> > the user to define assignments of cache partitions ids, called colors,
> > where assigning different colors guarantees no mutual eviction on cache
> > will ever happen. This instructs the Xen memory allocator to provide
> > the i-th color assignee only with pages that maps to color i, i.e. that
> > are indexed in the i-th cache partition.
> >
> > The proposed implementation supports the dom0less feature.
> > The proposed implementation doesn't support the static-mem feature.
> > The solution has been tested in several scenarios, including Xilinx Zynq
> > MPSoCs.
> >
> > v4 global changes:
> > - added "llc" acronym (Last Level Cache) in multiple places in code
> >   (e.g. coloring.{c|h} -> llc_coloring.{c|h}) to better describe the
>
> Please can you use dashes in favor of underscores in the names of new
> files?

Yes, ok.

> Jan

I also forgot to mention that this patch series applies on top of the
most recent
version of Julien's series (https://marc.info/?l=xen-devel&m=167360469228247).

Thanks.

