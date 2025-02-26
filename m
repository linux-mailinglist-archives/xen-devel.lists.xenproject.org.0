Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E41A46235
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896700.1305459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIEs-0001Ip-QY; Wed, 26 Feb 2025 14:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896700.1305459; Wed, 26 Feb 2025 14:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIEs-0001G0-NE; Wed, 26 Feb 2025 14:18:18 +0000
Received: by outflank-mailman (input) for mailman id 896700;
 Wed, 26 Feb 2025 14:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnIEr-0001Fu-3q
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:18:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85153ab2-f44c-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:18:16 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e4b410e48bso637829a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:18:16 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e45a8b8c33sm2793015a12.17.2025.02.26.06.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 06:18:14 -0800 (PST)
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
X-Inumbo-ID: 85153ab2-f44c-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740579495; x=1741184295; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0mab7l9zbpo0K/BiddF5ni+O7DDT53waVeuZpFv6rI=;
        b=P/rQ2O2Dh+4fmnhG36sAd7y1UU+YQbPpMEt42mEYRhwZY+haIFivzIcnDJXuJrebTG
         mkw1pnFfLqfKLqqdIrvDCHZtQp021j0KK9vj7GvHt5stJvZLc+AdfTxsw/2fthgoe0c0
         4IqMeEJKYYXiqG9wwU0zVF0sz+iQgiEIGccvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579495; x=1741184295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0mab7l9zbpo0K/BiddF5ni+O7DDT53waVeuZpFv6rI=;
        b=NrDQFxqQXcLvfUuKmx2IUqE2OF29ZANhI7D9aNkPv4Oi4vK/dnduBhL5laDkOdZTyt
         YR1Q9L4QSHzawU9vxSgfgGyXbFidDqcAVyn8FCuXm6YeEHrGfSUIQvm0fwJPeNTcNZCz
         Vi1WGyJGc1MgTjJ5z+ZgVYAH0ZsC120A/wnFqvUFSf8OTA6nyNEn5VoHdwM+zADNEctM
         2V27fDhXyqOCJhzjsgpvWRRAZSTW/Seobo1OKu1B+aBztOC0xqyRgvmzhSrXjQb7NF9m
         qUn91s73Lto5ZeHuL18rG4baa1DRfrgAQ2AGnE6IK4JTSyROOelepwZYfVa2aNYLF29V
         jqqg==
X-Gm-Message-State: AOJu0YyQN/Ahwf5K2jkjubUnmgxu9YND6Z8gEx43H3yY2DaMRJSOX731
	f7pJoNwA+vRsfouxKU+0DPN8Kv9Sp1oLAgMLInCL9lRIxghmbJCf56qL1B0JQLQ=
X-Gm-Gg: ASbGnctCe6mvrRKzSlZgaqSmh2Y2SMjny80UrW2DdIuNqvkThSBrK2K4GKBZvWP/DpQ
	1E+fIzhbpuUpUI07aMhfQkTez5z5908sZnBu3lnppHw3n4cirAigAJfGiv0AvagvmJTT51dNx3w
	bRadIKanKAUtMOsSSj63iIPqrbMgl/YcJMbyra/01fhPV1dPA8uL2dl0mV67ZRKQimEAjAVqAQP
	+HCrrjc04NPE8nM4JIgmDdn3VOZufKoo8nrvEcYFHxR3W5ykM+xq4eiGjP9Gl6MNcNVGitQ4j9T
	bUWSpJs5wffUrS7QQM5lZdPIHFBX9hQ=
X-Google-Smtp-Source: AGHT+IEysSnJCgQmOE91TCPkUIaajyrEPumhgrGYVqzbfUYgGE8OhWH4NOTHRjxUt/7RTuv1gSzEiA==
X-Received: by 2002:a05:6402:40c6:b0:5df:a651:32ef with SMTP id 4fb4d7f45d1cf-5e0b7231cadmr22334143a12.27.1740579495425;
        Wed, 26 Feb 2025 06:18:15 -0800 (PST)
Date: Wed, 26 Feb 2025 15:18:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z78ipRmgQk67_A2q@macbook.local>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>

On Mon, Feb 24, 2025 at 02:49:48PM +0000, Alejandro Vallejo wrote:
> Open question to whoever reviews this...
> 
> On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
> >      spin_lock(&heap_lock);
> > -    /* adjust domain outstanding pages; may not go negative */
> > -    dom_before = d->outstanding_pages;
> > -    dom_after = dom_before - pages;
> > -    BUG_ON(dom_before < 0);
> > -    dom_claimed = dom_after < 0 ? 0 : dom_after;
> > -    d->outstanding_pages = dom_claimed;
> > -    /* flag accounting bug if system outstanding_claims would go negative */
> > -    sys_before = outstanding_claims;
> > -    sys_after = sys_before - (dom_before - dom_claimed);
> > -    BUG_ON(sys_after < 0);
> > -    outstanding_claims = sys_after;
> > +    BUG_ON(outstanding_claims < d->outstanding_pages);
> > +    if ( pages > 0 && d->outstanding_pages < pages )
> > +    {
> > +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> > +        outstanding_claims -= d->outstanding_pages;
> > +        d->outstanding_pages = 0;
> 
> While this matches the previous behaviour, do we _really_ want it? It's weird,
> quirky, and it hard to extend to NUMA-aware claims (which is something in
> midway through).
> 
> Wouldn't it make sense to fail the allocation (earlier) if the claim has run
> out? Do we even expect this to ever happen this late in the allocation call
> chain?

I'm unsure.  This is the case where more memory than initially claimed
has been allocated, but by the time domain_adjust_tot_pages() gets
called the memory has already been allocated, so it's kind of
unhelpful to fail by then.

I think any caller that requests more memory than what has been
initially claimed for the domain should be prepared to deal with such
allocation failing.  This quirky handling is very likely a workaround
for the miscellaneous differences between the memory accounted by the
toolstack for a guest vs the memory really used by such guest.  I bet
if you limit a guest to strictly only allocate up to
d->outstanding_pages domain creation will fail.

In general the toolstack memory calculations are not fully accurate,
see for example how vmx_alloc_vlapic_mapping() allocates a domheap
page which very likely the toolstack won't have accounted for.  There
are likely other examples that would possibly break the accounting
done by the toolstack.

Thanks, Roger.

