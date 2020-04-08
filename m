Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611981A1FC3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8o5-0003t1-5f; Wed, 08 Apr 2020 11:23:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LAz7=5Y=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jM8o3-0003su-Lw
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:23:43 +0000
X-Inumbo-ID: 64c524b6-798b-11ea-b4f4-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64c524b6-798b-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4ZLX7MfSUqHHEvMTIVvOx5yn0LV+2MvDcxCOdLfIT5s=; b=nkszLrTMFN8ogtJBJVVDqDDkIX
 eSArLLy1rOFEHGcIv2pr37OPq3pKTdTYcNgnodxsyyLNWOD3DAjqhsiDqkAyH4oQ6l9V2pQn72kPD
 mILd26jF+lKPcN8g3yoW3x8kS4c26LjWz7lIqFKXpkhg3jfFTpiwXP0YUs0eTbaTntgpaIHbizTaA
 9TrGdyDOTCx/MILvvo54NNBGXTQ5n+B6MPfI6sgngiGeJc7xDpCcKRQpmsNEboGHcz6r5hsgA97Y6
 +tgOqOBPKlkwCWrUoph4w02SlhpL1VEdCekvbk2tenz9RfmrZBEfICuPRptBcDh4bWpIXzaNm5/sg
 1n6I1bdA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8ns-0000Iw-4E; Wed, 08 Apr 2020 11:23:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 302BA300478;
 Wed,  8 Apr 2020 13:23:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1C0332BA90A63; Wed,  8 Apr 2020 13:23:29 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:23:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 15/26] x86/alternatives: Non-emulated text poking
Message-ID: <20200408112329.GW20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-16-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-16-ankur.a.arora@oracle.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, hpa@zytor.com, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 10:03:12PM -0700, Ankur Arora wrote:
> +static int __maybe_unused text_poke_late(patch_worker_t worker, void *stage)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&text_mutex);
> +
> +	if (system_state != SYSTEM_RUNNING)
> +		return -EINVAL;
> +
> +	text_poke_state.stage = stage;
> +	text_poke_state.num_acks = cpumask_weight(cpu_online_mask);
> +	text_poke_state.head = &alt_modules;
> +
> +	text_poke_state.patch_worker = worker;
> +	text_poke_state.state = PATCH_SYNC_DONE; /* Start state */
> +	text_poke_state.primary_cpu = smp_processor_id();
> +
> +	/*
> +	 * Run the worker on all online CPUs. Don't need to do anything
> +	 * for offline CPUs as they come back online with a clean cache.
> +	 */
> +	ret = stop_machine(patch_worker, &text_poke_state, cpu_online_mask);

This.. that on its own is almost a reason to NAK the entire thing. We're
all working very hard to get rid of stop_machine() and you're adding
one.

Worse, stop_machine() is notoriously crap on over-committed virt, the
exact scenario where you want it.

> +
> +	return ret;
> +}

