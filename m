Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117FF205568
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 17:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnkR6-00044O-5g; Tue, 23 Jun 2020 15:02:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O2Jt=AE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnkR5-00044J-B3
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 15:02:07 +0000
X-Inumbo-ID: 80a41418-b562-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80a41418-b562-11ea-bca7-bc764e2007e4;
 Tue, 23 Jun 2020 15:02:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05B5AAC12;
 Tue, 23 Jun 2020 15:02:05 +0000 (UTC)
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
Date: Tue, 23 Jun 2020 17:02:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623135246.66170-1-roger.pau@citrix.com>
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

On 23.06.2020 15:52, Roger Pau Monne wrote:
> XENMEM_acquire_resource and it's related structure is currently inside
> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> hypervisor or the toolstack only. This is wrong as the hypercall is
> already being used by the Linux kernel at least, and as such needs to
> be public.
> 
> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> uint64_aligned_t is only to be used by the toolstack. Note that the
> layout of the structure will be the same, as the field is already
> naturally aligned to a 8 byte boundary.

I'm afraid it's more complicated, and hence ...

> No functional change expected.

... this doesn't hold: As I notice only now the struct also wrongly
(if it was meant to be a tools-only interface) failed to use
XEN_GUEST_HANDLE_64(), which would in principle have been a problem
for 32-bit callers (passing garbage in the upper half of a handle).
It's not an actual problem because, unlike would typically be the
case for tools-only interfaces, there is compat translation for this
struct.

With this, however, the problem of your change becomes noticeable:
The structure's alignment for 32-bit x86, and with it the structure's
sizeof(), both change. You should be able to see this by comparing
xen/common/compat/memory.c's disassembly before and after your
change - the number of bytes to copy by the respective
copy_from_guest() ought to have changed.

The question now is whether we're willing to accept such a (marginal)
incompatibility. The chance of a 32-bit guest actually running into
it shouldn't be very high, but with the right placement of an
instance of the struct at the end of a page it would be possible to
observe afaict.

Or whether we go the alternative route and pad the struct suitably
for 32-bit.

> Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Would be good to get this fixed before the release in order to avoid
> shipping bogus headers. Should also be backported.

This was already part of 4.13, as you imply by requesting a backport.
Hence the bogus header had already been shipped.

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -607,6 +607,8 @@ struct xen_reserved_device_memory_map {
>  typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
>  
> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> +
>  /*
>   * Get the pages for a particular guest resource, so that they can be
>   * mapped directly by a tools domain.

This comment is now stale.

Jan

