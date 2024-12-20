Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A7D9F8E24
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 09:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861709.1273776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYbN-0002WX-DM; Fri, 20 Dec 2024 08:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861709.1273776; Fri, 20 Dec 2024 08:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYbN-0002U6-9z; Fri, 20 Dec 2024 08:43:17 +0000
Received: by outflank-mailman (input) for mailman id 861709;
 Fri, 20 Dec 2024 08:43:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QN4B=TN=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tOYbM-0002U0-3A
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 08:43:16 +0000
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [2607:f8b0:4864:20::d35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 729f5915-beae-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 09:43:13 +0100 (CET)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-84435dbda4bso96000939f.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2024 00:43:13 -0800 (PST)
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
X-Inumbo-ID: 729f5915-beae-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734684192; x=1735288992; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ8Lj6sL9X1MkJsL21Fctkn6bIT0AaBSOcCMGB/RwrQ=;
        b=xL5TV3SGBPHg5f+S8fQOJGw/2uyxk5yoJKSDFAf0NDMFxBlIaX+GGA5qv4eMSo8ukd
         +6MLN5IZwHB53pgfklIfnVyAP6QwYDZ5plEPOnmYsDoVySjucF5DoiBNVR21fYi3na0X
         X4OYZv+eD+uUjXsMDKylWC0rYspb79iY3aUDbRapaYyrHTMF5v3FLItWVGTToWz6GKQl
         qpNYGzHQrjA8TiGGqQgvN7xho4JYocChNTSAcnMkIS6W3NTpguWmiCo4IVZ6wQ1y47DK
         OweijcoxnkifszO1zXaBpWqB+38SS1VQno/BiLJtrdZnQ0FR0xChUBAdC1PeApkLha4R
         kXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684192; x=1735288992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ8Lj6sL9X1MkJsL21Fctkn6bIT0AaBSOcCMGB/RwrQ=;
        b=SNUR1xgoWS+z0FGm6NbFimMkmCmcMStPuogn3MGJUMic8xZmJquLU/smkbrPIwIFRD
         tP2GcWe2fI6LzW6TvNBLgHC0XGmUZGvHnOh8Wc+FvRGmOn4yWi1DcvnpW/nDOReiDgeP
         eyLkccrZLwTJCM65/tqUv4KTJdo3pef/hlCK2/wIfSm+mgm7gKROkt8qXG6+GH/MZkN9
         gxrt0XJhLzPjpkMTOfgDviO538SY0K8JvNZtyXxIgutHvB//AyzHvCQhsCkH3NTekvr0
         XHx5S+xH4EOK0nXHR+DdhFWRy/Adn8ZZdZQS3lGpC1F9QwNF0VUj4MhNnEm2vM46tyMn
         ZKzw==
X-Gm-Message-State: AOJu0Yw72L9r/eQp3fAR3X5aMQ97N5TVRW/UQPnSJ4W0j1aP6qeUkWBn
	zNUjycaMJi68hYBOyAQYeNSz31ChfjZfzW4LJEYSwosADCzdZyXE6/tcAxgWfycWWv1bXip1PjH
	dGah1zHJiRwAY7RB+HueERXB9QuYgXxrJsSXw1Q==
X-Gm-Gg: ASbGncvCPCHa4fXCMbZIZaPYEBxzrPAeICDFbFM6HtI4A8zbURpXm+qHoCxpEtjYiBi
	bDSRc3ED3GPK9K6OTmIrwqYUZWjk2EcH0GJvH8A==
X-Google-Smtp-Source: AGHT+IGYhumv0jtFb1tOThICjXnTv5BJinzxcXGE+38KQo78+Ccc+/q1aSllvM9RF8DCpPkXcG9LoZKCEmjrknBv0OA=
X-Received: by 2002:a05:6e02:190a:b0:3a7:e786:afb4 with SMTP id
 e9e14a558f8ab-3c2fe53a57cmr13835145ab.2.1734684192227; Fri, 20 Dec 2024
 00:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech> <143392d7-220d-48e4-8565-8ecdba9111e9@amd.com>
In-Reply-To: <143392d7-220d-48e4-8565-8ecdba9111e9@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 20 Dec 2024 09:43:01 +0100
Message-ID: <CAG+AhRVXmcByWePKJn_rnVcRw53EGZriX7bqxZ106UOssu60jw@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] Arm cache coloring
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	George Dunlap <gwd@xenproject.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 8:34=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> On 17/12/2024 18:06, Carlo Nonato wrote:
> >
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
> > The solution has been tested in several scenarios, including Xilinx Zyn=
q
> > MPSoCs.
> >
> > Carlo Nonato (11):
> >   xen/common: add cache coloring common code
> >   xen/arm: add initial support for LLC coloring on arm64
> >   xen/arm: permit non direct-mapped Dom0 construction
> >   xen/arm: add Dom0 cache coloring support
> >   xen: extend domctl interface for cache coloring
> >   tools: add support for cache coloring configuration
> >   xen/arm: add support for cache coloring configuration via device-tree
> >   xen/page_alloc: introduce preserved page flags macro
> >   xen: add cache coloring allocator for domains
> >   xen/arm: make consider_modules() available for xen relocation
> >   xen/arm: add cache coloring support for Xen image
> >
> > Luca Miccio (1):
> >   xen/arm: add Xen cache colors command line parameter
> The series is now committed. Thanks.
>
> It's definitely a change that wants mentioning in CHANGELOG. I'll send a =
patch
> to add a note shortly.

Grazie (thanks in italian), to you and the other maintainers that helped.

- Carlo

