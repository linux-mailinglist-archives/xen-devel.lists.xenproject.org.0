Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AAE31FD2E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86985.163788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8lY-0001HZ-Gx; Fri, 19 Feb 2021 16:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86985.163788; Fri, 19 Feb 2021 16:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8lY-0001HA-Cy; Fri, 19 Feb 2021 16:36:28 +0000
Received: by outflank-mailman (input) for mailman id 86985;
 Fri, 19 Feb 2021 16:36:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD8lW-0001H2-WE
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:36:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3726355-8d64-4e67-8d0c-c32f77c47b61;
 Fri, 19 Feb 2021 16:36:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74512ABAE;
 Fri, 19 Feb 2021 16:36:25 +0000 (UTC)
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
X-Inumbo-ID: f3726355-8d64-4e67-8d0c-c32f77c47b61
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613752585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgxil5tD+XZQAMhCseq/9FJubb3RX2X/+D4pVtsfG1k=;
	b=ghzL4CmdyUaWjZLXnhxczVX5P1693R0v1eZoTn5xsWLGeL+TMLJrNDkt0qXx0iSP43aeUW
	Jx9g8Pf6xgzYvpMCqkwOYS8uh7mPglaLwgvvXKiIdo8lxGqW3pPjxksLkq13iTitrNzMwF
	bf0Du45v9c6HuHHtkf0il0hvFKnm8No=
Subject: Re: How does shadow page table work during migration?
To: Kevin Negy <kevinnegy@gmail.com>
References: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d3a6f57-31e3-3709-4ed1-a39b5fe55347@suse.com>
Date: Fri, 19 Feb 2021 17:36:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 17:10, Kevin Negy wrote:
> I'm trying to understand how the shadow page table works in Xen,
> specifically during live migration. My understanding is that after shadow
> paging is enabled (sh_enable_log_dirty() in
> xen/arch/x86/mm/shadow/common.c), a shadow page table is created, which is
> a complete copy of the current guest page table. Then the CR3 register is
> switched to use this shadow page table as the active table while the guest
> page table is stored elsewhere. The guest page table itself (and not the
> individual entries in the page table) is marked as read only so that any
> guest memory access that requires the page table will result in a page
> fault. These page faults happen and are trapped to the Xen hypervisor. Xen
> will then update the shadow page table to match what the guest sees on its
> page tables.
> 
> Is this understanding correct?

Partly. For HVM, shadow mode (if so used) would be active already. For
PV, page tables would be read-only already. Log-dirty mode isn't after
page table modifications alone, but to notice _any_ page that gets
written to.

> If so, here is where I get confused. During the migration pre-copy phase,
> each pre-copy iteration reads the dirty bitmap (paging_log_dirty_op() in
> xen/arch/x86/mm/paging.c) and cleans it. This process seems to destroy all
> the shadow page tables of the domain with the call to shadow_blow_tables()
> in sh_clean_dirty_bitmap().
> 
> How is the dirty bitmap related to shadow page tables?

Shadow page tables are the mechanism to populate the dirty bitmap.

> Why destroy the
> entire shadow page table if it is the only legitimate page table in CR3 for
> the domain?

Page tables will get re-populated again as the guest touches memory.
Blowing the tables is not the same as turning off shadow mode.

Jan

