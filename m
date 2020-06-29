Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794F20CCE2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 09:02:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpnnL-0005mn-Kf; Mon, 29 Jun 2020 07:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jpnnJ-0005mi-Td
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 07:01:33 +0000
X-Inumbo-ID: 5cf7f66a-b9d6-11ea-8531-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf7f66a-b9d6-11ea-8531-12813bfff9fa;
 Mon, 29 Jun 2020 07:01:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C235FAE68;
 Mon, 29 Jun 2020 07:01:31 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v3] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200626153951.91301-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90d0e26c-ff34-9439-441b-32c68d0a1887@suse.com>
Date: Mon, 29 Jun 2020 09:01:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626153951.91301-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 17:39, Roger Pau Monne wrote:
> XENMEM_acquire_resource and it's related structure is currently inside
> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> hypervisor or the toolstack only. This is wrong as the hypercall is
> already being used by the Linux kernel at least, and as such needs to
> be public.
> 
> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> uint64_aligned_t is only to be used by the toolstack. Doing such
> change will reduce the size of the structure on 32bit x86 by 4bytes,
> since there will be no padding added after the frame_list handle.
> 
> This is fine, as users of the previous layout will allocate 4bytes of
> padding that won't be read by Xen, and users of the new layout won't
> allocate those, which is also fine since Xen won't try to access them.
> 
> Note that the structure already has compat handling, and such handling
> will take care of copying the right size (ie: minus the padding) when
> called from a 32bit x86 context. This is true for the compat code both
> before and after this patch, since the structures in the memory.h
> compat header are subject to a pragma pack(4), which already removed
> the trailing padding that would otherwise be introduced by the
> alignment of the frame field to 8 bytes.
> 
> Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

