Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465512C0E30
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34581.65715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDGF-0003OU-Cc; Mon, 23 Nov 2020 14:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34581.65715; Mon, 23 Nov 2020 14:56:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDGF-0003O4-95; Mon, 23 Nov 2020 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 34581;
 Mon, 23 Nov 2020 14:56:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDGD-0003Nz-JV
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:56:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6bd6944-e9b3-43bb-9b57-535183e8b5e9;
 Mon, 23 Nov 2020 14:56:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97C36ACD5;
 Mon, 23 Nov 2020 14:56:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDGD-0003Nz-JV
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:56:09 +0000
X-Inumbo-ID: b6bd6944-e9b3-43bb-9b57-535183e8b5e9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b6bd6944-e9b3-43bb-9b57-535183e8b5e9;
	Mon, 23 Nov 2020 14:56:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606143366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaMDCDhPysB8w6KfnUoI0F/Qbt77/bl/GFHDOpG5NT0=;
	b=cym4jwAPdYLMevmYI1quJbbjv8pAClM58R1c+1Vc+ZNR2uJjITu1FVA5qjs1d30pIb3lnr
	tisbiKdiI2cQlcIKJ47d0zJTn0AnNnMUmjHqupihVBtoEge4yCNVoVmFXahrxkqtPAoEC6
	To9SbJi70FHcRnEWG8aaJKMiNiZY1QE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 97C36ACD5;
	Mon, 23 Nov 2020 14:56:06 +0000 (UTC)
Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
To: Oleksandr <olekstysh@gmail.com>, Paul Durrant <paul@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
 <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
 <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com>
 <04a81b7e-213a-968b-048c-dfa68b6e3b0d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96e6622c-08b3-ff85-75f1-14c8b7cd6d6e@suse.com>
Date: Mon, 23 Nov 2020 15:56:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <04a81b7e-213a-968b-048c-dfa68b6e3b0d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 15:39, Oleksandr wrote:
> As it was agreed, below the list of proposed renaming (naming) within 
> current series.

Thanks for compiling this. A couple of suggestions for consideration:

> 1. Global (existing):
> hvm_map_mem_type_to_ioreq_server     -> ioreq_server_map_mem_type
> hvm_select_ioreq_server              -> ioreq_server_select
> hvm_send_ioreq                       -> ioreq_send
> hvm_ioreq_init                       -> ioreq_init

ioreq_domain_init() (or, imo less desirable domain_ioreq_init())?

> hvm_destroy_all_ioreq_servers        -> ioreq_server_destroy_all
> hvm_all_ioreq_servers_add_vcpu       -> ioreq_server_add_vcpu_all
> hvm_all_ioreq_servers_remove_vcpu    -> ioreq_server_remove_vcpu_all
> hvm_broadcast_ioreq                  -> ioreq_broadcast
> hvm_create_ioreq_server              -> ioreq_server_create
> hvm_get_ioreq_server_info            -> ioreq_server_get_info
> hvm_map_io_range_to_ioreq_server     -> ioreq_server_map_io_range
> hvm_unmap_io_range_from_ioreq_server -> ioreq_server_unmap_io_range
> hvm_set_ioreq_server_state           -> ioreq_server_set_state
> hvm_destroy_ioreq_server             -> ioreq_server_destroy
> hvm_get_ioreq_server_frame           -> ioreq_server_get_frame
> hvm_ioreq_needs_completion           -> ioreq_needs_completion
> hvm_mmio_first_byte                  -> ioreq_mmio_first_byte
> hvm_mmio_last_byte                   -> ioreq_mmio_last_byte
> send_invalidate_req                  -> ioreq_signal_mapcache_invalidate
> 
> handle_hvm_io_completion             -> handle_io_completion

For this one I'm not sure what to suggest, but I'm not overly happy
with the name.

> hvm_io_pending                       -> io_pending

vcpu_ioreq_pending() or vcpu_any_ioreq_pending()?

> 2. Global (new):
> arch_io_completion
> arch_ioreq_server_map_pages
> arch_ioreq_server_unmap_pages
> arch_ioreq_server_enable
> arch_ioreq_server_disable
> arch_ioreq_server_destroy
> arch_ioreq_server_map_mem_type
> arch_ioreq_server_destroy_all
> arch_ioreq_server_get_type_addr
> arch_ioreq_init

Assuming this is the arch hook of the similarly named function
further up, a similar adjustment may then be wanted here.

> domain_has_ioreq_server
> 
> 
> 3. Local (existing) in common ioreq.c:
> hvm_alloc_ioreq_mfn               -> ioreq_alloc_mfn
> hvm_free_ioreq_mfn                -> ioreq_free_mfn

These two are server functions, so should imo be ioreq_server_...().

However, if they're static (as they're now), no distinguishing
prefix is strictly necessary, i.e. alloc_mfn() and free_mfn() may
be fine. The two names may be too short for Paul's taste, though.
Some similar shortening may be possible for some or all of the ones
below here.

Jan

> hvm_update_ioreq_evtchn           -> ioreq_update_evtchn
> hvm_ioreq_server_add_vcpu         -> ioreq_server_add_vcpu
> hvm_ioreq_server_remove_vcpu      -> ioreq_server_remove_vcpu
> hvm_ioreq_server_remove_all_vcpus -> ioreq_server_remove_all_vcpus
> hvm_ioreq_server_alloc_pages      -> ioreq_server_alloc_pages
> hvm_ioreq_server_free_pages       -> ioreq_server_free_pages
> hvm_ioreq_server_free_rangesets   -> ioreq_server_free_rangesets
> hvm_ioreq_server_alloc_rangesets  -> ioreq_server_alloc_rangesets
> hvm_ioreq_server_enable           -> ioreq_server_enable
> hvm_ioreq_server_disable          -> ioreq_server_disable
> hvm_ioreq_server_init             -> ioreq_server_init
> hvm_ioreq_server_deinit           -> ioreq_server_deinit
> hvm_send_buffered_ioreq           -> ioreq_send_buffered
> 
> hvm_wait_for_io                   -> wait_for_io
> 
> 4. Local (existing) in x86 ioreq.c:
> Everything related to legacy interface (hvm_alloc_legacy_ioreq_gfn, etc) 
> are going
> to remain as is.
> 
> 
> 


