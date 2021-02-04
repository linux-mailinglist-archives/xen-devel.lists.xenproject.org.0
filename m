Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C830F4F7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81331.150123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7fem-0000W9-63; Thu, 04 Feb 2021 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81331.150123; Thu, 04 Feb 2021 14:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7fem-0000Vk-2s; Thu, 04 Feb 2021 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 81331;
 Thu, 04 Feb 2021 14:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7fel-0000Ve-1F
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 14:30:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e915f188-bac6-4672-b7a6-22f6da1f7903;
 Thu, 04 Feb 2021 14:30:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B874ACB0;
 Thu,  4 Feb 2021 14:30:48 +0000 (UTC)
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
X-Inumbo-ID: e915f188-bac6-4672-b7a6-22f6da1f7903
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612449048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOxBn3hSn6RTj0rJ+e3/g1iq2jJqW/voWgV4nrmWcwE=;
	b=RLdvGoUOka7zwIbdyDhSkvPO0UwiMg9jAiOGE8qZHsZKhIxVsuWvfEdRcJQc+lXazJZoVl
	vlWiWJgv3CUSE2WvhRCmrat4H5lHWkmpfHoUiMtfwwrzqFkz9FDU579SVQd94FW3ZzR7Hv
	roZjZFVT9mB8RASewEZj4zQULxvJM6o=
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant
 bugs
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 community.manager@xenproject.org, committers@xenproject.org,
 xen-devel@lists.xenproject.org
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
 <24603.58528.901884.980466@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86412e13-ed57-8625-18be-38dd7022669e@suse.com>
Date: Thu, 4 Feb 2021 15:30:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24603.58528.901884.980466@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 13:12, Ian Jackson wrote:
> OPEN ISSUES
> -----------
> 
> A. HPET/PIT issue on newer Intel systems
> [...]
> 
> B. "scheduler broken" bugs.
> 
> Information from
>   Andrew Cooper <andrew.cooper3@citrix.com>
>   Dario Faggioli <dfaggioli@suse.com>
> 
> Quoting Andrew Cooper
> | We've had 4 or 5 reports of Xen not working, and very little
> | investigation on whats going on.  Suspicion is that there might be
> | two bugs, one with smt=0 on recent AMD hardware, and one more
> | general "some workloads cause negative credit" and might or might
> | not be specific to credit2 (debugging feedback differs - also might
> | be 3 underlying issue).
> 
> I reviewed a thread about this and it is not clear to me where we are
> with this.

I'm not sure Marek's "Xen crash after S3 suspend - Xen 4.13 and newer"
falls in either of the two buckets.

> C. Fallout from MSR handling behavioral change.
> 
> Information from
>   Jan Beulich <jbeulich@suse.com>
> 
> I am lacking an extended desxcription of this.  What are the bug(s),
> and what is the situation ?
> 
> 
> D. Use-after-free in the IOMMU code
> 
> Information from
>   Julien Grall <julien@xen.org>
> References
>  [PATCH for-4.15 0/4] xen/iommu: Collection of bug fixes for IOMMU teadorwn
>  <20201222154338.9459-1-julien@xen.org>
> 
> Quoting the 0/:
> | This series is a collection of bug fixes for the IOMMU teardown code.
> | All of them are candidate for 4.15 as they can either leak memory or
> | lead to host crash/host corruption.
> 
> AFAIT these patches are not yet in-tree.

(since you're continuing with E. further down)

F. The almost-XSA "x86/PV: avoid speculation abuse through guest
accessors" - the first 4 patches are needed to address the actual
issue. The next 3 patches are needed to get the tree into
consistent state again, identifier-wise. The remaining patches
can probably wait.

> CLOSED ISSUES
> =============
> 
> E. zstd support
> 
> Information from
>   Andrew Cooper <andrew.cooper3@citrix.com>
>   Jan Beulich <jbeulich@suse.com>
>   git
> 
> Needed to unbreak Fedora.  Needs support for both dom0 and domU.
> 
> AFAICT this seems to be in-tree as of 8169f82049ef
> "libxenguest: support zstd compressed kernels"

Indeed.

Jan

