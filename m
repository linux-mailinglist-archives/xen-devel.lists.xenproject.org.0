Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9076B3D0B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 11:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508466.783136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paaRq-0000LR-UR; Fri, 10 Mar 2023 10:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508466.783136; Fri, 10 Mar 2023 10:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paaRq-0000JW-R7; Fri, 10 Mar 2023 10:58:06 +0000
Received: by outflank-mailman (input) for mailman id 508466;
 Fri, 10 Mar 2023 10:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KOTX=7C=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1paaRq-0000JP-5g
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 10:58:06 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e2a4be7-bf32-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 11:58:03 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3127191wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Mar 2023 02:58:03 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a1c5416000000b003dc49e0132asm2705480wmb.1.2023.03.10.02.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:58:02 -0800 (PST)
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
X-Inumbo-ID: 6e2a4be7-bf32-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678445883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpcjl2hoHMP9cG/XHbZNkap5Y1mQ3PDL3dEarn6gP0Q=;
        b=jnV9X3+5n4yPxENZ7IV80rb//F8TgQ65lDLi8+NSTS7QFdfaaj05+bwjAvhwM4mFlM
         kKqZVByt4lTvvntvHNph/xjVsmSv+bp9YuTaSaM5HwGP8/xwvlmPu5S0SH7d/b7KQ/kH
         bYZkfMBwmDAj+uEcXxhr7qUh3RWPAWRy/3npIW/wWxA/Bkq6DYjyj4hg/h59Tdw/n8gS
         011Gh/dTq9MqS8bA7Qm5CpMT/3NOd/ytu3Pgclo2np8oRIix8gWr+YS/+JWdipKxESRm
         IJL1Tcw7m2Nk5QHrs3YajYEKntX5WfSMrNkm5fmpkNiNh+L/8DmUcpok+pmpkrKa0m2y
         7/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678445883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpcjl2hoHMP9cG/XHbZNkap5Y1mQ3PDL3dEarn6gP0Q=;
        b=NBCWgjmQcDo7MY2Ml4hkI59Y6jLtFKOKRZ3k8CMhC5eyfpkDIPy82K01V1snlAKi40
         A0/+2Wl+ZDmu9pVap1wQSxeynHeaEuFroqihuWlG6MbOXC1aZSiP8OXfSCYWQieU+UCp
         B3i4LSNj35niTagZouNQEONXIg9OCtSMiKE/Lcpjrj8pgR9Gg+60RPLHlAP2I6EILx+V
         +iSJfSnXQ35fQA0GpFLLauQ2mRpt1sFLkTgNCB2RkHqEiNsWNnEqm/W3gCag99cUGu9A
         IVbV1jZH3qg86PIjL0udNAQa9GQkkJzzGA8BscAf+IDsUx0F80kwIQpkkW5kIVoCWTJ5
         0P9g==
X-Gm-Message-State: AO0yUKXINyDPd5jbaNuubDA2eEWZ298Dg3uR0Ca8GTho2EWU/p+ycCGB
	lUmELvNLDItMbuG4YK/BpKtXui2pAcYZXQ==
X-Google-Smtp-Source: AK7set/F4d6EWWSFODz1aoQ0rMNTFfW/gbj4O9MYD2mAw8t08ht/CP8CCavZDGnWRLz41MHW4I7wGg==
X-Received: by 2002:a05:600c:35c9:b0:3ea:d601:976f with SMTP id r9-20020a05600c35c900b003ead601976fmr2221669wmq.23.1678445883023;
        Fri, 10 Mar 2023 02:58:03 -0800 (PST)
Date: Fri, 10 Mar 2023 11:58:00 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Message-ID: <20230310105800.GA1285481@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
 <20230308115410.GA1108824@horizon>
 <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
 <20230309103825.GA1221165@horizon>
 <645fcd9a-755a-e2a2-f332-93c5e571b9e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <645fcd9a-755a-e2a2-f332-93c5e571b9e5@suse.com>

On Thu, Mar 09, 2023 at 12:50:18PM +0100, Jan Beulich wrote:
> On 09.03.2023 11:38, Matias Ezequiel Vara Larsen wrote:
> > On Wed, Mar 08, 2023 at 03:16:05PM +0100, Jan Beulich wrote:
> >> On 08.03.2023 12:54, Matias Ezequiel Vara Larsen wrote:
> >>> On Tue, Mar 07, 2023 at 11:12:00AM +0100, Jan Beulich wrote:
> >>>> On 06.03.2023 15:23, Matias Ezequiel Vara Larsen wrote:
> >>>>> - Xen shall use the "stats_active" field to indicate what it is producing. In
> >>>>>   this field, reserved bits shall be 0. This shall allow us to agree on the
> >>>>> layout even when producer and consumer are compiled with different headers.
> >>>>
> >>>> I wonder how well such a bitfield is going to scale. It provides for
> >>>> only 32 (maybe 64) counters. Of course this may seem a lot right now,
> >>>> but you never know how quickly something like this can grow. Plus
> >>>> with ...
> >>>>
> >>>
> >>> Would it make sense to define it like this?:
> >>>
> >>> struct vcpu_shmem_stats {
> >>> #define STATS_A (1u << 0)
> >>> ...
> >>> #define VCPU_STATS_MAGIC 0xaabbccdd
> >>>      uint32_t magic;
> >>>      uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats) + sizeof(uint32_t) * nr_stats, cacheline_size)
> >>>      uint32_t size;    // sizeof(vcpu_stats)
> >>>      uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
> >>>      uint32_t nr_stats; // size of stats_active in uint32_t
> >>>      uint32_t stats_active[XEN_FLEX_ARRAY_DIM];
> >>>      ...
> >>> };
> >>
> > 
> > The use of stats_active[] is meant to have a bitmap that could scale thus not
> > limiting the number of counters in the vcpu_stat structure to 32 or 64. I can't
> > see other way to have an unlimited number of counters though.
> > 
> >> Possibly, but this would make it harder to use the interface. An alternative
> >> might be to specify that an actual stats value set to ~0 marks an inactive
> >> element. Since these are 64-bit counters, with today's and tomorrow's
> >> computers we won't be at risk of a counter reaching a value of 2^^64-1, I
> >> guess. And even if there was one where such a risk could not be excluded
> >> (e.g. because of using pretty large increments), one would merely need to
> >> make sure to saturate at 2^^64-2. Plus at such a point one would need to
> >> consider anyway to switch to 128-bit fields, as neither saturated nor
> >> wrapped values are of much use to consumers.
> >>
> > 
> > If I understand well, this use-case is in case an element in the stats_active
> > bitmap becomes inactive, i.e., it is set to "0" in stats_active[]. You are
> > proposing to set to ~0 the actual stats value to mark an inactive element. I
> > may be missing something here but would not be enough to set to "0" the
> > corresponding stats_active[] bit? 
> 
> The suggestion was to eliminate the need for stats_active[].
> 
Oh, I see, thanks for the clarification. To summarise, these are the current
options:
1. Use a "uint64_t" field thus limiting the number of counters to 64. The
current vcpu_runstate_info structure is limited to 4 counters though, one for
each RUNSTATE_*. 
2. Use a dynamic array but this makes harder to use the interface.
3. Eliminate stats_active and set to ~0 the actual stats value to mark inactive
counters. This requires adding a "nr_stats" field to know how many counters are.
Also, this requires to make sure to saturate at 2^^64-2.

I might miss some details here but these are the options to evaluate. 

I would go with a variation of 1) by using two uint64_t, i.e., up to 128 vcpu's
counters, which I think it would be enough. I may be wrong.

Thoughs?
 
Matias 

