Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB7F1A1FA1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8eF-0002g5-3P; Wed, 08 Apr 2020 11:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LAz7=5Y=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jM8eD-0002g0-91
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:13:33 +0000
X-Inumbo-ID: f79952fa-7989-11ea-b58d-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f79952fa-7989-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=owW3+5nk1emkhI4cOviK2xmpja0Eslb3d5NnNfm4ABY=; b=oteVl0qlOAfP5bhgb67Zr9x8Uc
 bRuCew67l9BV+/JRZuTjgTOAHnBFS5SKoNK/HOyOWZ59WupxVuibCY5+05oGbheDiG5HWHmy8S4cY
 +f2xrfMQsZOvUZYjTabyUzPGHWusJiCu9h6qxdvvNWt8LZz5G6NWmIgJo/wOSFsGaPB/EH1LWEyba
 Uxs0oqH+RwuSDxacMYmzB3oEW+Nr+dQgn9MZPS9f+gEO3+8AdQmbcC07SK3Pp7nDys4oWPuoeuDtv
 ySERjY/R8FKfZKJ7RXVPmUhhFomNX8N+JCj4eARuV9FGrPbDsyi2jNOaJLHBEZLyhuKvECYTaU5Ar
 fS+QjguQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8e4-0005mx-Gs; Wed, 08 Apr 2020 11:13:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E0E2E300130;
 Wed,  8 Apr 2020 13:13:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 944032BA90A62; Wed,  8 Apr 2020 13:13:22 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:13:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 15/26] x86/alternatives: Non-emulated text poking
Message-ID: <20200408111322.GU20713@hirez.programming.kicks-ass.net>
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
> +static void __maybe_unused sync_one(void)
> +{
> +	/*
> +	 * We might be executing in NMI context, and so cannot use
> +	 * IRET as a synchronizing instruction.
> +	 *
> +	 * We could use native_write_cr2() but that is not guaranteed
> +	 * to work on Xen-PV -- it is emulated by Xen and might not
> +	 * execute an iret (or similar synchronizing instruction)
> +	 * internally.
> +	 *
> +	 * cpuid() would trap as well. Unclear if that's a solution
> +	 * either.
> +	 */
> +	if (in_nmi())
> +		cpuid_eax(1);
> +	else
> +		sync_core();
> +}

That's not thinking staight; what do you think the INT3 does when it
happens inside an NMI ?

