Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21F66B21AD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 11:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508222.782660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paDfM-0007rI-DZ; Thu, 09 Mar 2023 10:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508222.782660; Thu, 09 Mar 2023 10:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paDfM-0007oP-B0; Thu, 09 Mar 2023 10:38:32 +0000
Received: by outflank-mailman (input) for mailman id 508222;
 Thu, 09 Mar 2023 10:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnZm=7B=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1paDfK-0007oJ-NX
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 10:38:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8780463f-be66-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 11:38:29 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so3222188wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 02:38:28 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c354300b003ebff290a52sm1914035wmq.28.2023.03.09.02.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 02:38:27 -0800 (PST)
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
X-Inumbo-ID: 8780463f-be66-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678358308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NhEU7xbEOUUSufeP5ilaGhAhkaYmEyNCDTT5uYn8LI=;
        b=YbHIumDNdISTfr6L8fQdBFpVs7Y3HlW9RAZ1QM5pEeS6jm3hnCm6EaZdYOqJPSpH8m
         pJxuDpGgYXG69qsCXApqjM85a1qG0gMUy0gc0/7NrlreCryT3U3VtKaOGZOMgJTEDkml
         nMcR/Q4Dztg2v7/KHMZKDQGM51VRYC0sSVXhld75KF4G4Qs7RJNapkSH0jnpBBjkAk3p
         j7ddYli3rstZi0IS8bD1uD5jfCx92azsPwoVJu7ayISVTj8bH8eYK5CUjpGcqBGmtiFC
         L80nZaFIRSutC1f5+pkh+iBJBF4MlK26/bbi5U2ziFunamjC0ES+LMc9Zaeg7Ptjeeic
         Nnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NhEU7xbEOUUSufeP5ilaGhAhkaYmEyNCDTT5uYn8LI=;
        b=0qQyfYj+2V/z8sVpU29ImM8V9DzwxrUH/PE6jtTWBi+zCbOz3JnXt5vh6zJtQcSnyY
         /wbYBSusM5ogoAQ5bzSt4t7E84YD7W336WzKzGP4bluKLUqRx6eYFDc5ccX5oAyskHnD
         M8jVhaJX2RD79lpRb0lwQuQ9BHOZRXhq2H8yi6KdNrmzI3PpVMlRWZ4TZIF7MryxKaLI
         nIqkUEuGf3znJZ6gK6Sg44aShCAGRPVP5alVVzS5JfERtkv6Niq/njDqSXhmCGuIqiCY
         6d2hcO/aMYdXSl2kUfKVufp6NiqT2alo2suVryTZX1FQgTA3S2wFzAMWUYn5jBkV4M+o
         I5Ig==
X-Gm-Message-State: AO0yUKUqx6i8RT+tZmNpDA9xB6N4QVWgw/NqlzM3GlxzY87yCo4AwAju
	3R3isHOEDIYuZHMvaidtHcE=
X-Google-Smtp-Source: AK7set8c2oqmYJujEMOYskeCAgSwvDfGtDo4gIdOYc7nWH9y0FqZa7BCado+ln35Wb3QMwjFzuQl8A==
X-Received: by 2002:a05:600c:4fc4:b0:3eb:2de8:b732 with SMTP id o4-20020a05600c4fc400b003eb2de8b732mr19060630wmq.0.1678358308212;
        Thu, 09 Mar 2023 02:38:28 -0800 (PST)
Date: Thu, 9 Mar 2023 11:38:25 +0100
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
Message-ID: <20230309103825.GA1221165@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
 <20230308115410.GA1108824@horizon>
 <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>

On Wed, Mar 08, 2023 at 03:16:05PM +0100, Jan Beulich wrote:
> On 08.03.2023 12:54, Matias Ezequiel Vara Larsen wrote:
> > On Tue, Mar 07, 2023 at 11:12:00AM +0100, Jan Beulich wrote:
> >> On 06.03.2023 15:23, Matias Ezequiel Vara Larsen wrote:
> >>> - Xen shall use the "stats_active" field to indicate what it is producing. In
> >>>   this field, reserved bits shall be 0. This shall allow us to agree on the
> >>> layout even when producer and consumer are compiled with different headers.
> >>
> >> I wonder how well such a bitfield is going to scale. It provides for
> >> only 32 (maybe 64) counters. Of course this may seem a lot right now,
> >> but you never know how quickly something like this can grow. Plus
> >> with ...
> >>
> > 
> > Would it make sense to define it like this?:
> > 
> > struct vcpu_shmem_stats {
> > #define STATS_A (1u << 0)
> > ...
> > #define VCPU_STATS_MAGIC 0xaabbccdd
> >      uint32_t magic;
> >      uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats) + sizeof(uint32_t) * nr_stats, cacheline_size)
> >      uint32_t size;    // sizeof(vcpu_stats)
> >      uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
> >      uint32_t nr_stats; // size of stats_active in uint32_t
> >      uint32_t stats_active[XEN_FLEX_ARRAY_DIM];
> >      ...
> > };
> 

The use of stats_active[] is meant to have a bitmap that could scale thus not
limiting the number of counters in the vcpu_stat structure to 32 or 64. I can't
see other way to have an unlimited number of counters though.

> Possibly, but this would make it harder to use the interface. An alternative
> might be to specify that an actual stats value set to ~0 marks an inactive
> element. Since these are 64-bit counters, with today's and tomorrow's
> computers we won't be at risk of a counter reaching a value of 2^^64-1, I
> guess. And even if there was one where such a risk could not be excluded
> (e.g. because of using pretty large increments), one would merely need to
> make sure to saturate at 2^^64-2. Plus at such a point one would need to
> consider anyway to switch to 128-bit fields, as neither saturated nor
> wrapped values are of much use to consumers.
> 

If I understand well, this use-case is in case an element in the stats_active
bitmap becomes inactive, i.e., it is set to "0" in stats_active[]. You are
proposing to set to ~0 the actual stats value to mark an inactive element. I
may be missing something here but would not be enough to set to "0" the
corresponding stats_active[] bit? 

> >>> - In the vcpu_stats structure, new fields can only ever be appended.
> >>
> >> ... this rule the only ambiguity that could arise to consumers when
> >> no active flags existed would be that they can't tell "event never
> >> occurred" from "hypervisor doesn't know about this anymore".
> > 
> > Do you mean how the consumer can figure out if either 1) Xen does not know yet
> > about some flag or 2) the flag has been deprecated? I think 2) is the case that
> > Andrew mention in which the magic number could be used as an ABI version to
> > break backwards compatibility.
> 
> No, an inactive field wouldn't break the ABI. An ABI change would be if
> such an inactive field was actually removed from the array. Or if e.g.,
> as per above, we needed to switch to 128-bit counters.

Got it, Thanks.

Matias

