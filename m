Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC776B0671
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 12:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508008.782261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZsN7-0006ev-DC; Wed, 08 Mar 2023 11:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508008.782261; Wed, 08 Mar 2023 11:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZsN7-0006cq-AP; Wed, 08 Mar 2023 11:54:17 +0000
Received: by outflank-mailman (input) for mailman id 508008;
 Wed, 08 Mar 2023 11:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gvK=7A=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pZsN6-0006ck-1U
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 11:54:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2456726-bda7-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 12:54:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso1102556wmq.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 03:54:14 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm15104169wru.75.2023.03.08.03.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 03:54:12 -0800 (PST)
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
X-Inumbo-ID: f2456726-bda7-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678276453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ6e5fdQwCe6r5vZxL9Pn/fUaTGXSBqOIBsZtcES840=;
        b=TFh8Dc7NylU3Hqdxf72vo359PMqUar9Cf7vfBdChPnd/wTMbzXWlKmuCEaDOb6crNG
         zab2D/QucpVcD8Z16nL5/mqXqrXgHWRmyR3HmVXvQtxgoig0wAt5ulyKnrqdHz18kp30
         Vhihr3Dsl7WSa5jFJorO3cTiPTPg+R85q2zKC4IZhtkyAg4ol8e0v2QEWL5wgxCXnnAU
         pQ86vtzJghNRTpeIz6JmKMIpDdkcQjzRI3yTPbrve11fWwhP+OeokVCPTzSKn2TrhuDO
         wcNOkvS2VJ3raVsltFfvQCG+J1DJGbJgW3tYE/NosC1uht6HJePCG+q4v3ENg47ham5J
         Y1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678276453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ6e5fdQwCe6r5vZxL9Pn/fUaTGXSBqOIBsZtcES840=;
        b=QP6KiymQi+w6+Ab7VSMHmam5sgxgaWELBNWJ5Gkf3DkFPomLIA7n4BF8qA5YHMwvmf
         0iGmJ0jOxxWzvN0fwuQbT7luMM87MmILMSdNt7+SZdeDbqIZ2zWu92YBfg8sKpqdA0FM
         cUk3IRYMgFDP4K3UaU1b+kKmt9LKhcmtEFhkImVeTeAxzj1X/Moret6Ori5YsIq8OotN
         H1QAKG7xMjFpVhydApIfnuAJWADq0YkKYGo2ZZNVBvjk7GxM+JqKkwrWm09kk8RC60aw
         Oyvufw+O7l7iL3+N5WI+M3Ou7ToXjGr6rAtf5FUAMHLizUAfXgZF5IchrRqpY9mxNJX1
         QvMQ==
X-Gm-Message-State: AO0yUKUpxERQTVkkURT0CVem8rIdcUMxGos/tBto8wdkt79fMPC8o0TU
	03hDMWkMnxgVbOEZuaaz4J/Dav/tP2icgw==
X-Google-Smtp-Source: AK7set+bgqNMxQjJlfxe3LxBDKk8Xhpsq6qy745TOqakForaWfZpdW0Q3Xax8dVPE/FxHInSL063oA==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr12911556wms.5.1678276453430;
        Wed, 08 Mar 2023 03:54:13 -0800 (PST)
Date: Wed, 8 Mar 2023 12:54:10 +0100
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
Message-ID: <20230308115410.GA1108824@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>

On Tue, Mar 07, 2023 at 11:12:00AM +0100, Jan Beulich wrote:
> On 06.03.2023 15:23, Matias Ezequiel Vara Larsen wrote:
> > Regarding your email, I have the following comments:
> > 
> > - I still do not know how to choose the value of cacheline_size. I understand
> > this value shall be between the actual cacheline_size and PAGE_SIZE. A value
> > that could match most architectures could be 256 bytes.
> 
> This isn't a concern anymore when offset and stride are stored in the
> header. It was a concern when trying to come up with a layout where
> these value were to be inferred (or known a priori).
> 

Oh, I see. Cacheline_size shall be decided at compilation time for a given
arch, e.g., SMP_CACHE_BYTES.

> > - Xen shall use the "stats_active" field to indicate what it is producing. In
> >   this field, reserved bits shall be 0. This shall allow us to agree on the
> > layout even when producer and consumer are compiled with different headers.
> 
> I wonder how well such a bitfield is going to scale. It provides for
> only 32 (maybe 64) counters. Of course this may seem a lot right now,
> but you never know how quickly something like this can grow. Plus
> with ...
> 

Would it make sense to define it like this?:

struct vcpu_shmem_stats {
#define STATS_A (1u << 0)
...
#define VCPU_STATS_MAGIC 0xaabbccdd
     uint32_t magic;
     uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats) + sizeof(uint32_t) * nr_stats, cacheline_size)
     uint32_t size;    // sizeof(vcpu_stats)
     uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
     uint32_t nr_stats; // size of stats_active in uint32_t
     uint32_t stats_active[XEN_FLEX_ARRAY_DIM];
     ...
};
 
> > - In the vcpu_stats structure, new fields can only ever be appended.
> 
> ... this rule the only ambiguity that could arise to consumers when
> no active flags existed would be that they can't tell "event never
> occurred" from "hypervisor doesn't know about this anymore".

Do you mean how the consumer can figure out if either 1) Xen does not know yet
about some flag or 2) the flag has been deprecated? I think 2) is the case that
Andrew mention in which the magic number could be used as an ABI version to
break backwards compatibility.

Thanks, Matias. 

