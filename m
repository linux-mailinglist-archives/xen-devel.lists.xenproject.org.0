Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9AD67C9A2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 12:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484955.751869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL0HL-0000tv-VD; Thu, 26 Jan 2023 11:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484955.751869; Thu, 26 Jan 2023 11:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL0HL-0000rh-Ru; Thu, 26 Jan 2023 11:18:51 +0000
Received: by outflank-mailman (input) for mailman id 484955;
 Thu, 26 Jan 2023 11:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9FD=5X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pL0HK-0000rb-Ub
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 11:18:51 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 331c5a5f-9d6b-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 12:18:46 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id kt14so4195871ejc.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 03:18:48 -0800 (PST)
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
X-Inumbo-ID: 331c5a5f-9d6b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dqzFF7QucsnVSfBoepSCqTZ+X/O6fJVPSJ88AYHvMA4=;
        b=r116+izGoWqcUtXsMn2LBmc4VbAbsal1ABTZrJhpvuL5h+nV+XhPm1Bkkndl8h3+6j
         mGXL4EEZ+NaxpmiOaGqgzYS2QVyRa4gwLqog64iGKwTTo3dV09xh+BdzPCJagOKWiMUG
         5VtuxVc5jMULIr9fAtqaLqEsGRxlGVfFcrt6CmrYOL2yqYQFSLpQjqB/x9SsaWFa7AIS
         tvpZqbXYcrMycZ8dwE1bQWb0jrVnFx/x/6pUuudOLSCYbY2FfgSGc8A5JrAa4pnMPhp4
         QF2DiWGP93Qc8K69jXMLCZK0g6YHIzAz4ZqWvr1V5FwgRIgW4zBb5KhGo0YFDTO12BIY
         5hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqzFF7QucsnVSfBoepSCqTZ+X/O6fJVPSJ88AYHvMA4=;
        b=APiq5er3CX3wxh1rc67hb/uUHTWHbw2I5rfMrnAQphNpBwXa+qkDuxIoESezo0igmG
         lSZyW2slivvbwvk8JZ8qqWXdO6Q1kRN9Vm6kZMxA1b+4ikz6CA8jHP7Sfl37h46yuhq1
         27INPqvmhpFvHvwWTGEcrHqlNIelAn9+GLlEUQOC99o9GL24t6SRrIcUyjW7bLFLfXKa
         vi3ZsznFJTrRHuM1JCUmnzGEVFjQId8Et0b6/83fDUHk1gFesTu/T6LIlGpf7oBNrm5n
         JymVsZtCCFVNUK1mz8lItX3u9ePd7Mzq/ydcex4jVGDtbucVQEvqFWiVE+x0h9JXS9cs
         oV/Q==
X-Gm-Message-State: AO0yUKVkajajI/Umj7cQ2iIYUImc8EbKqb9Pi0f2WKHGRTltpOnRTe23
	YYbjBJkO4LGnKmtCsYLcffrNEWzA4Qp4jZATKIPdHQ==
X-Google-Smtp-Source: AK7set8czsAbe20kBZW4lC5tuIlUA5aqHtVaj/ZQ214iNi1aI0+eDHUGTcg541k/2KhunXj5uj84wEejI9fxbSmYzzQ=
X-Received: by 2002:a17:906:308b:b0:878:42af:c614 with SMTP id
 11-20020a170906308b00b0087842afc614mr925274ejv.149.1674731928050; Thu, 26 Jan
 2023 03:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-5-carlo.nonato@minervasys.tech> <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
 <4e723846-09c1-32c8-94ba-3755e6af0529@suse.com>
In-Reply-To: <4e723846-09c1-32c8-94ba-3755e6af0529@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 26 Jan 2023 12:18:37 +0100
Message-ID: <CAG+AhRULW9ZWUcKpFq6_grF-8GzdKm3CqOZpwjYz5gjTg_Uukw@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thu, Jan 26, 2023 at 8:25 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 24.01.2023 17:29, Jan Beulich wrote:
> > On 23.01.2023 16:47, Carlo Nonato wrote:
> >> @@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
> >>      /* CPU pool to use; specify 0 or a specific existing pool */
> >>      uint32_t cpupool_id;
> >>
> >> +    /* IN LLC coloring parameters */
> >> +    uint32_t num_llc_colors;
> >> +    XEN_GUEST_HANDLE(uint32) llc_colors;
> >
> > Despite your earlier replies I continue to be unconvinced that this
> > is information which needs to be available right at domain_create.
> > Without that you'd also get away without the sufficiently odd
> > domain_create_llc_colored(). (Odd because: Think of two or three
> > more extended features appearing, all of which want a special cased
> > domain_create().)
>
> And perhaps the real question is: Why do the two items need passing
> to a special variant of domain_create() in the first place? The
> necessary information already is passed to the normal function via
> struct xen_domctl_createdomain. All it would take is to read the
> array from guest space later, when struct domain was already
> allocated and is hence available for storing the pointer. (Passing
> the count separately is redundant in any event.)

This was our first approach. However, struct xen_domctl_createdomain is used
both by domctl (pointing to guest memory) and by Xen itself (using Xen memory)
and Julien wasn't happy with this approach because it required some
kind of hack.

See this message from him:

https://marc.info/?l=xen-devel&m=166637496520053

and my answer:

https://marc.info/?l=xen-devel&m=166782830201561

> Jan
>

