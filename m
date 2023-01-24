Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3A67A443
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 21:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483749.750106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKQDe-0000K2-3J; Tue, 24 Jan 2023 20:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483749.750106; Tue, 24 Jan 2023 20:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKQDe-0000H7-0g; Tue, 24 Jan 2023 20:48:38 +0000
Received: by outflank-mailman (input) for mailman id 483749;
 Tue, 24 Jan 2023 20:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wk+X=5V=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKQDc-0000Gr-4i
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 20:48:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76bfc8fc-9c28-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 21:48:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04BCEB816B7;
 Tue, 24 Jan 2023 20:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B6CC433D2;
 Tue, 24 Jan 2023 20:48:30 +0000 (UTC)
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
X-Inumbo-ID: 76bfc8fc-9c28-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674593311;
	bh=MxjMVgyKFUUOfQsy++5aBofv+dMz8sBE/NCuVELEzyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sq4tjHPi8vtTuCf6hxFBNgj7ghD3xAKsB4ucdcst2w3SbSjXhluz0UI7Bk2mRxpCR
	 nXbVCoU6ULgonQ9KPDdSweqfhiWSWvrkWcVINhw6kxmYIL+zUIUSDEEB1XnmX4ahhH
	 Bx7cKqBn4RwjPqntYKDzKnlqieO7EWXavgA8/5OfFRuab0maQQ3fiUN47ZLTlo0P8O
	 k5yE6lZzg3Mc4rnxyEyojF0N7H7bhyQ28WAr5A/Kf2IkpgsUtYdtOCmssebVIvbwjE
	 +WT9Qgg/aNiRqIZA0M9chrkbOo0xhJp/5ONfrYAM+mdTRFrWIc6+qJyeZk0u6xZUKn
	 jofdx9MbBEw6A==
Date: Tue, 24 Jan 2023 12:48:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
In-Reply-To: <8995c20f-7d0d-5138-b802-d70c116b84e7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301241244500.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-23-julien@xen.org> <alpine.DEB.2.22.394.2301231437170.1978264@ubuntu-linux-20-04-desktop> <92c4daa2-d841-3109-c1ec-4bdb088d6670@xen.org> <alpine.DEB.2.22.394.2301231605291.1978264@ubuntu-linux-20-04-desktop>
 <8995c20f-7d0d-5138-b802-d70c116b84e7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jan 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/01/2023 00:12, Stefano Stabellini wrote:
> > On Mon, 23 Jan 2023, Julien Grall wrote:
> > Ah yes! I see it now that we are relying on the same area
> > (alloc_xenheap_pages calls page_to_virt() then map_pages_to_xen()).
> > 
> > map_pages_to_xen() is able to create pagetable entries at every level,
> > but we need to make sure they are shared across per-cpu pagetables. To
> > make that happen, we are pre-creating the L0/L1 entries here so that
> > they become common across all per-cpu pagetables and then we let
> > map_pages_to_xen() do its job.
> > 
> > Did I understand it right?
> 
> Your understanding is correct.

Great!


> > > I can add summary in the commit message.
> > 
> > I would suggest to improve a bit the in-code comment on top of
> > setup_directmap_mappings. I might also be able to help with the text
> > once I am sure I understood what is going on :-)

How about this comment (feel free to edit/improve it as well, just a
suggestion):

In the !arch_has_directmap() case this function allocates empty L1
tables and creates the L0 entries for the direct map region.

When the direct map is disabled, alloc_xenheap_pages results in the page
being temporarily mapped in the usual xenheap address range via
map_pages_to_xen(). map_pages_to_xen() is able to create pagetable
entries at every level, but we need to make sure they are shared across
per-cpu pagetables. For this reason, here in this function we are
creating the L0 entries and empty L1 tables in advance, so that they
become common across all per-cpu pagetables.

