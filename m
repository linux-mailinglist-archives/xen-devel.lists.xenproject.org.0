Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FD2074C1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 15:42:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo5em-0006wA-5p; Wed, 24 Jun 2020 13:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ah2w=AF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jo5ek-0006w5-QS
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 13:41:38 +0000
X-Inumbo-ID: 6d3abba2-b620-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d3abba2-b620-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PEabN3Vy57eNWCN+D2V2wK79SV2PBPWtL3087PnVobQ=; b=ZaEMY09WqTJvGtsiFlf5PerDnr
 NXvd1PFX4E423wjKaeNq9pDvVD8BLkY0hyy9ZZGB8xfBk/yMN/UbUDdQnkV57UmVwzan3I2itWMcq
 Tqy8oNKlTh6HqLjHqiXCjemIXEAg+xmcAqwv6uR48wjYir1xbasJpJghOtbZLBUIo4+Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo5ei-0002EX-CF; Wed, 24 Jun 2020 13:41:36 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo5ei-0001Yy-0y; Wed, 24 Jun 2020 13:41:36 +0000
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
 <20200623172652.GU735@Air-de-Roger>
 <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
Date: Wed, 24 Jun 2020 14:41:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 24/06/2020 11:12, Jan Beulich wrote:
> On 23.06.2020 19:26, Roger Pau Monné wrote:
>> On Tue, Jun 23, 2020 at 06:18:52PM +0200, Jan Beulich wrote:
>>> On 23.06.2020 17:56, Roger Pau Monné wrote:
>>>> On Tue, Jun 23, 2020 at 05:02:04PM +0200, Jan Beulich wrote:
>>>>> On 23.06.2020 15:52, Roger Pau Monne wrote:
>>>>>> XENMEM_acquire_resource and it's related structure is currently inside
>>>>>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
>>>>>> hypervisor or the toolstack only. This is wrong as the hypercall is
>>>>>> already being used by the Linux kernel at least, and as such needs to
>>>>>> be public.
>>>>>>
>>>>>> Also switch the usage of uint64_aligned_t to plain uint64_t, as
>>>>>> uint64_aligned_t is only to be used by the toolstack. Note that the
>>>>>> layout of the structure will be the same, as the field is already
>>>>>> naturally aligned to a 8 byte boundary.
>>>>>
>>>>> I'm afraid it's more complicated, and hence ...
>>>>>
>>>>>> No functional change expected.
>>>>>
>>>>> ... this doesn't hold: As I notice only now the struct also wrongly
>>>>> (if it was meant to be a tools-only interface) failed to use
>>>>> XEN_GUEST_HANDLE_64(), which would in principle have been a problem
>>>>> for 32-bit callers (passing garbage in the upper half of a handle).
>>>>> It's not an actual problem because, unlike would typically be the
>>>>> case for tools-only interfaces, there is compat translation for this
>>>>> struct.
>>>>
>>>> Yes, there's already compat translation for the frame_list array.
>>>>
>>>>> With this, however, the problem of your change becomes noticeable:
>>>>> The structure's alignment for 32-bit x86, and with it the structure's
>>>>> sizeof(), both change. You should be able to see this by comparing
>>>>> xen/common/compat/memory.c's disassembly before and after your
>>>>> change - the number of bytes to copy by the respective
>>>>> copy_from_guest() ought to have changed.
>>>>
>>>> Right, this is the layout with frame aligned to 8 bytes:
>>>>
>>>> struct xen_mem_acquire_resource {
>>>> 	uint16_t                   domid;                /*     0     2 */
>>>> 	uint16_t                   type;                 /*     2     2 */
>>>> 	uint32_t                   id;                   /*     4     4 */
>>>> 	uint32_t                   nr_frames;            /*     8     4 */
>>>> 	uint32_t                   pad;                  /*    12     4 */
>>>> 	uint64_t                   frame;                /*    16     8 */
>>>> 	long unsigned int *        frame_list;           /*    24     4 */
>>>>
>>>> 	/* size: 32, cachelines: 1, members: 7 */
>>>> 	/* padding: 4 */
>>>> 	/* last cacheline: 32 bytes */
>>>> };
>>>>
>>>> And this is without:
>>>>
>>>> struct xen_mem_acquire_resource {
>>>> 	uint16_t                   domid;                /*     0     2 */
>>>> 	uint16_t                   type;                 /*     2     2 */
>>>> 	uint32_t                   id;                   /*     4     4 */
>>>> 	uint32_t                   nr_frames;            /*     8     4 */
>>>> 	uint32_t                   pad;                  /*    12     4 */
>>>> 	uint64_t                   frame;                /*    16     8 */
>>>> 	long unsigned int *        frame_list;           /*    24     4 */
>>>>
>>>> 	/* size: 28, cachelines: 1, members: 7 */
>>>> 	/* last cacheline: 28 bytes */
>>>> };
>>>>
>>>> Note Xen has already been copying those extra 4 padding bytes from
>>>> 32bit Linux kernels AFAICT, as the struct declaration in Linux has
>>>> dropped the aligned attribute.
>>>>
>>>>> The question now is whether we're willing to accept such a (marginal)
>>>>> incompatibility. The chance of a 32-bit guest actually running into
>>>>> it shouldn't be very high, but with the right placement of an
>>>>> instance of the struct at the end of a page it would be possible to
>>>>> observe afaict.
>>>>>
>>>>> Or whether we go the alternative route and pad the struct suitably
>>>>> for 32-bit.
>>>>
>>>> I guess we are trapped with what Linux has on it's headers now, so we
>>>> should handle the struct size difference in Xen?
>>>
>>> How do you mean to notice the difference in Xen? You don't know
>>> what the caller's environment's sizeof() would yield.
>>
>> I'm confused. Couldn't we switch from uint64_aligned_t to plain
>> uint64_t (like it's currently on the Linux headers), and then use the
>> compat layer in Xen to handle the size difference when called from
>> 32bit environments?
> 
> And which size would we use there? The old or the new one (breaking
> future or existing callers respectively)? Meanwhile I think that if
> this indeed needs to not be tools-only (which I still question),

I think we now agreed on a subthread that the kernel needs to know the 
layout of the hypercall.

> then our only possible route is to add explicit padding for the
> 32-bit case alongside the change you're already making.

AFAICT Linux 32-bit doesn't have this padding. So wouldn't it make 
incompatible the two incompatible?

Cheers,

-- 
Julien Grall

