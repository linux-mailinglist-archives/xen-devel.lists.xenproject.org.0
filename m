Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B1E20F502
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:49:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFgU-0001IS-GL; Tue, 30 Jun 2020 12:48:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2JSP=AL=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jqFgT-0001IN-3S
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:48:21 +0000
X-Inumbo-ID: fa225742-bacf-11ea-8615-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa225742-bacf-11ea-8615-12813bfff9fa;
 Tue, 30 Jun 2020 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z7jc5NzfTkp8y5Cz8EXxkRyo5Q5w5XhhJH6y+Igibds=; b=33apq4HhaQC2e4pLznWqAg3tP/
 1P0V6U+FC/fTBGn7I/RBkoxe5tcYa2oFwsAmz6X7+4tRapC/7L+kJFqXDgZt+cUclYd+jUap4aWrN
 paDcuhqPDpZG9criQcUBEqQzqny4AziomBprLg91Tl6xFijmh9i1/jJz6ieMoeU2NfPY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqFgN-00007W-V4; Tue, 30 Jun 2020 12:48:15 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqFgN-0005z1-Mk; Tue, 30 Jun 2020 12:48:15 +0000
Subject: Re: [PATCH for-4.14 v4] x86/tlb: fix assisted flush usage
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200626155723.91558-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c7557e6f-2dd3-e9b4-07d9-51f16fe8baee@xen.org>
Date: Tue, 30 Jun 2020 13:48:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626155723.91558-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 26/06/2020 16:57, Roger Pau Monne wrote:
> Commit e9aca9470ed86 introduced a regression when avoiding sending
> IPIs for certain flush operations. Xen page fault handler
> (spurious_page_fault) relies on blocking interrupts in order to
> prevent handling TLB flush IPIs and thus preventing other CPUs from
> removing page tables pages. Switching to assisted flushing avoided such
> IPIs, and thus can result in pages belonging to the page tables being
> removed (and possibly re-used) while __page_fault_type is being
> executed.
> 
> Force some of the TLB flushes to use IPIs, thus avoiding the assisted
> TLB flush. Those selected flushes are the page type change (when
> switching from a page table type to a different one, ie: a page that
> has been removed as a page table) and page allocation. This sadly has
> a negative performance impact on the pvshim, as less assisted flushes
> can be used. Note the flush in grant-table code is also switched to
> use an IPI even when not strictly needed. This is done so that a
> common arch_flush_tlb_mask can be introduced and always used in common
> code.
> 
> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
> using an IPI (flush_tlb_mask_sync, x86 only). Note that the flag is
> only meaningfully defined when the hypervisor supports PV or shadow
> paging mode, as otherwise hardware assisted paging domains are in
> charge of their page tables and won't share page tables with Xen, thus
> not influencing the result of page walks performed by the spurious
> fault handler.
> 
> Just passing this new flag when calling flush_area_mask prevents the
> usage of the assisted flush without any other side effects.
> 
> Note the flag is not defined on Arm.
> 
> Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

