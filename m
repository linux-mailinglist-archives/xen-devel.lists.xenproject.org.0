Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE9205714
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 18:19:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnldR-00035R-Fe; Tue, 23 Jun 2020 16:18:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O2Jt=AE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnldP-00035J-Hc
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 16:18:55 +0000
X-Inumbo-ID: 3b3a84ce-b56d-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b3a84ce-b56d-11ea-b7bb-bc764e2007e4;
 Tue, 23 Jun 2020 16:18:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04F64AE54;
 Tue, 23 Jun 2020 16:18:53 +0000 (UTC)
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
Date: Tue, 23 Jun 2020 18:18:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623155609.GS735@Air-de-Roger>
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

On 23.06.2020 17:56, Roger Pau Monné wrote:
> On Tue, Jun 23, 2020 at 05:02:04PM +0200, Jan Beulich wrote:
>> On 23.06.2020 15:52, Roger Pau Monne wrote:
>>> XENMEM_acquire_resource and it's related structure is currently inside
>>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
>>> hypervisor or the toolstack only. This is wrong as the hypercall is
>>> already being used by the Linux kernel at least, and as such needs to
>>> be public.
>>>
>>> Also switch the usage of uint64_aligned_t to plain uint64_t, as
>>> uint64_aligned_t is only to be used by the toolstack. Note that the
>>> layout of the structure will be the same, as the field is already
>>> naturally aligned to a 8 byte boundary.
>>
>> I'm afraid it's more complicated, and hence ...
>>
>>> No functional change expected.
>>
>> ... this doesn't hold: As I notice only now the struct also wrongly
>> (if it was meant to be a tools-only interface) failed to use
>> XEN_GUEST_HANDLE_64(), which would in principle have been a problem
>> for 32-bit callers (passing garbage in the upper half of a handle).
>> It's not an actual problem because, unlike would typically be the
>> case for tools-only interfaces, there is compat translation for this
>> struct.
> 
> Yes, there's already compat translation for the frame_list array.
> 
>> With this, however, the problem of your change becomes noticeable:
>> The structure's alignment for 32-bit x86, and with it the structure's
>> sizeof(), both change. You should be able to see this by comparing
>> xen/common/compat/memory.c's disassembly before and after your
>> change - the number of bytes to copy by the respective
>> copy_from_guest() ought to have changed.
> 
> Right, this is the layout with frame aligned to 8 bytes:
> 
> struct xen_mem_acquire_resource {
> 	uint16_t                   domid;                /*     0     2 */
> 	uint16_t                   type;                 /*     2     2 */
> 	uint32_t                   id;                   /*     4     4 */
> 	uint32_t                   nr_frames;            /*     8     4 */
> 	uint32_t                   pad;                  /*    12     4 */
> 	uint64_t                   frame;                /*    16     8 */
> 	long unsigned int *        frame_list;           /*    24     4 */
> 
> 	/* size: 32, cachelines: 1, members: 7 */
> 	/* padding: 4 */
> 	/* last cacheline: 32 bytes */
> };
> 
> And this is without:
> 
> struct xen_mem_acquire_resource {
> 	uint16_t                   domid;                /*     0     2 */
> 	uint16_t                   type;                 /*     2     2 */
> 	uint32_t                   id;                   /*     4     4 */
> 	uint32_t                   nr_frames;            /*     8     4 */
> 	uint32_t                   pad;                  /*    12     4 */
> 	uint64_t                   frame;                /*    16     8 */
> 	long unsigned int *        frame_list;           /*    24     4 */
> 
> 	/* size: 28, cachelines: 1, members: 7 */
> 	/* last cacheline: 28 bytes */
> };
> 
> Note Xen has already been copying those extra 4 padding bytes from
> 32bit Linux kernels AFAICT, as the struct declaration in Linux has
> dropped the aligned attribute.
> 
>> The question now is whether we're willing to accept such a (marginal)
>> incompatibility. The chance of a 32-bit guest actually running into
>> it shouldn't be very high, but with the right placement of an
>> instance of the struct at the end of a page it would be possible to
>> observe afaict.
>>
>> Or whether we go the alternative route and pad the struct suitably
>> for 32-bit.
> 
> I guess we are trapped with what Linux has on it's headers now, so we
> should handle the struct size difference in Xen?

How do you mean to notice the difference in Xen? You don't know
what the caller's environment's sizeof() would yield.

> I'm very tempted to just say switch the XEN_GUEST_HANDLE to
> XEN_GUEST_HANDLE_64, but I guess it's risky.

Plus, like uint64_aligned_t, iirc it's a construct exposed through
tool-stack-only interfaces, but not generally.

>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -607,6 +607,8 @@ struct xen_reserved_device_memory_map {
>>>  typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
>>>  DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
>>>  
>>> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
>>> +
>>>  /*
>>>   * Get the pages for a particular guest resource, so that they can be
>>>   * mapped directly by a tools domain.
>>
>> This comment is now stale.
> 
> Hm, I'm not so sure. This is indeed used by Xen related tools (or
> emulators) and then those domains running such tools would also be
> tools domains?
> 
> Anyway, I don't mind removing it, but I also don't think it's so
> off.

Well - if this isn't a tool stack interface (see also my 2nd reply
to your original patch), then the comment shouldn't suggest it is.

Jan

