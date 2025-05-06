Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F2AAC4BC
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 14:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977182.1364236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHpl-0001Tz-O0; Tue, 06 May 2025 12:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977182.1364236; Tue, 06 May 2025 12:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHpl-0001RR-K7; Tue, 06 May 2025 12:55:41 +0000
Received: by outflank-mailman (input) for mailman id 977182;
 Tue, 06 May 2025 12:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCHpk-0001RL-Jp
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 12:55:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f1038d-2a79-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 14:55:39 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so31614515e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 05:55:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b89d1548sm168976535e9.11.2025.05.06.05.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 05:55:38 -0700 (PDT)
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
X-Inumbo-ID: 68f1038d-2a79-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746536138; x=1747140938; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZgfbALzoCABAruC+RRlWEJ1PqVq8vCQOVyzADj5mcA=;
        b=Yz56ATrhYY3SMqFAEiiGnEnDuX+2rrX8vT2xCUa2Xi1CGsUy3PWFv8Emc7dvLu9F7d
         L7E9aE0DTXIY9/b644CpyOr779Tm4n8RJJOW92Dqc6pYlBnMAwc9X15uqYOsq3fZsoHH
         mG4azmtxxpRvtSCuaa1KxEYPKQF7QsyZachQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536138; x=1747140938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZgfbALzoCABAruC+RRlWEJ1PqVq8vCQOVyzADj5mcA=;
        b=eWJ3ak/eZVmexnqN44d7oD0WJzIcg1IuOjBhe6bihyRlvFF3oPH9j/7qlurL71wbrs
         oElz2qb7DImAaxRnUmy6Gg7VKzdzjVivoZ7SO9IfudD6BOVHpyNeAt56R3y/cOlFeK4a
         tZl38TNFylWa2bWS52FS9MiKKo9b2D70cJS7DCKoEBklMgv/HHfuct61ObtDQd/Tt+15
         tfIBhLMQScSR6g8NXyyZwJ7TJLkTf+BLevEBckiJXYCf4Bk7DQuAIFw+WpQAvMZdjp7g
         KBLg3A8rhMrCNQkvuMl34er35MuDhzLECm9aVjUDj+tf8RDc5gLXlDMkWhMRJuH/GjYW
         fMsQ==
X-Gm-Message-State: AOJu0YySTGLpbVfcatCnnULBSD8w+uVt/zsnHOl9NS/n8IRkEag8fXBX
	yemTLr+L7CNj4nsiXSwO0KPx6mxqy1G6K0wb2N7o/OQsivIXOMRGfUQvUgYfP+A=
X-Gm-Gg: ASbGncuDgzmzftUypeeAlU4CI5F7uf8h9n2NB1EalU9WybEHRzPywwiFTF0PIPLwtPh
	Oto9G4MY1F5hr9hgm4A9o73icdWeeXFvlZYUDpK1Hdp2ATCBxPmE/5GD7azKpDFOSP2wNDaiedt
	u0VU8BqJ5+iNqr/UzRQx5H9WQMwBCgN/Ushv1OQFbmhBMW03OfcI1XkuMWWyCtipVJuBpP9SPg5
	p6CGMGi4tIJSrx6ipwBhPsxB+bWn8KrCRlB/KtsgCWmVqpiw6egCTu4VjpyCraG11P7XXPR0lIV
	vwIC/NNk9q3WqtCbSwnMURqgqH2dl4oy/Id95mb8DWGhYr/hWDi1IxVF
X-Google-Smtp-Source: AGHT+IEHuQT7b/1JKUk3ckbw6gxlOBT7qbg7rYqRunu7rBMk/AzuGF4pJrv/kx0O/JkbQ/huF2Iw3A==
X-Received: by 2002:a05:600c:3e17:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-441d0530c30mr26177135e9.23.1746536138335;
        Tue, 06 May 2025 05:55:38 -0700 (PDT)
Date: Tue, 6 May 2025 14:55:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
Message-ID: <aBoGyekf9KZeZCrK@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-10-roger.pau@citrix.com>
 <cecf40ed-9cf2-4e86-aa82-e0c33643868d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cecf40ed-9cf2-4e86-aa82-e0c33643868d@citrix.com>

On Tue, May 06, 2025 at 12:16:00PM +0100, Andrew Cooper wrote:
> On 06/05/2025 9:31 am, Roger Pau Monne wrote:
> > When a guest is allowed access to cache control operations such tracking
> > prevents having to issue a system-wide cache flush, and rather just flush
> > the pCPUs where the vCPU has been scheduled since the last flush.
> >
> > Note that domain-wide flushes accumulate the dirty caches from all the
> > vCPUs, but clearing the vCPU masks will require pausing all vCPUs, which
> > seems overkill.  Instead leave the vCPU dirty masks as-is, worse case it
> > will result in redundant flushes in further calls.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm afraid this doesn't work.
> 
> Unlike TLBs, dirty cacheline can move sideways, e.g. by foreign or grant
> mapping, but also naturally because of how cache coherency works.

Does such sideway moving also imply that local WB{NO,}INVD on native
could be equally bogus?

According to the SDM, cache lines can indeed move between processor
caches, but the memory controller must always snoop such moves and
flush the data to memory:

"Here, the processor with the valid data may pass the data to the
other processors without actually writing it to system memory;
however, it is the responsibility of the memory controller to snoop
this operation and update memory."

So a cache line moving sideways will always be propagated to memory as
part of the move, and hence the data in the previous pCPU cache will
always hit memory.

grants/foreign maps are indeed complex, but sharing non-coherent
across domains seems like a recipe for disaster.  It's maybe mitigated
by doing host-wide cache flushes, but how does the mapping domain know
whether  source domain has possibly dirty caches that need flushing?
IMO it's the source that would need to first flush any cache contents,
and then share the memory.

FWIW, (and not saying this is correct), but KVM uses the same model of
tracking dirty caches, see wbinvd_dirty_mask field in struct
kvm_vcpu_arch.

> We need to use the guarantees given to us by the architecture to simply
> nop out cache flushes when safe to do so.

We already do this when possible AFAICT.

> Everything else is either a shootdown (clflush/opt/clwb, and doesn't
> even trap to Xen), or needs to be a global WB{NO,}INVD.  Partial WBINVDs
> are of no value.

What about on Intel when there's no capability to trap WBINVD?  Xen is
currently flushing the cache of the previous pCPU in case the vCPU has
moved around, see vmx_do_resume().

Thanks, Roger.

