Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0009631E752
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 09:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86498.162449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCeSk-0004Gs-DV; Thu, 18 Feb 2021 08:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86498.162449; Thu, 18 Feb 2021 08:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCeSk-0004GT-A4; Thu, 18 Feb 2021 08:15:02 +0000
Received: by outflank-mailman (input) for mailman id 86498;
 Thu, 18 Feb 2021 08:15:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xBhj=HU=casper.srs.infradead.org=batv+b4c3bfe49cc01b414faa+6388+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lCeSg-0004GO-SC
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 08:15:00 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6e55f0e-243c-4773-aca3-8a47cb3c74fa;
 Thu, 18 Feb 2021 08:14:51 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lCeRs-001Pgy-9q; Thu, 18 Feb 2021 08:14:14 +0000
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
X-Inumbo-ID: a6e55f0e-243c-4773-aca3-8a47cb3c74fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rFuCEDruQM3ANvsFui7zHQhN7ske9Q4pPXaIkjwguxg=; b=wOct5ZUuVs84BfzGoHAtevMAst
	U+MwPU+FwceTFebaOa/YfxTXWAlE3yYBCUa2yclPtq7j9EiLnSuhfXTTIzaBsS4IG0tyY2bSG7OMf
	ONF1GFQSMM2z4xupwsset0+VV+KUGXMmBHkkqrDidEVwMIHh3VUDJtRHUTGsm/QwoVbPCK05OvnsK
	j5ZpZUanoMV81iB88ONksrXDTSwsSGxznYijhgkbNqo6kixSzXl4Zgbdwm/MzPkujYjFGpZHXkPgr
	e9HRu8ZxBSaI+o5BItL6q7b87RBFmj9T8aL/hCXUHqmrnB74Tk7YDGjFbhXjugRVAVmMCqaDjHI9w
	KeHlarkw==;
Date: Thu, 18 Feb 2021 08:14:08 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Nadav Amit <namit@vmware.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Sasha Levin <sashal@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH v5 4/8] x86/mm/tlb: Flush remote and local TLBs
 concurrently
Message-ID: <20210218081408.GB335524@infradead.org>
References: <20210209221653.614098-1-namit@vmware.com>
 <20210209221653.614098-5-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209221653.614098-5-namit@vmware.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Given that the last patch killed the last previously existing
user of on_each_cpu_cond_mask there are now the only users.

>  	if (info->freed_tables) {
> -		smp_call_function_many(cpumask, flush_tlb_func,
> -			       (void *)info, 1);
> +		on_each_cpu_cond_mask(NULL, flush_tlb_func, (void *)info, true,
> +				      cpumask);

.. 

> +		on_each_cpu_cond_mask(NULL, flush_tlb_func, (void *)info, true,
> +				      cpumask);

Which means the cond_func is unused, and thus on_each_cpu_cond_mask can
go away entirely in favor of on_each_cpu_cond.

