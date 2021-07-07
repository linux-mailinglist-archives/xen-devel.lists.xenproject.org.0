Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0761A3BE999
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152301.281387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Qk-00036m-73; Wed, 07 Jul 2021 14:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152301.281387; Wed, 07 Jul 2021 14:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Qk-00033g-3X; Wed, 07 Jul 2021 14:21:38 +0000
Received: by outflank-mailman (input) for mailman id 152301;
 Wed, 07 Jul 2021 14:21:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m18Qi-00033a-AF
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:21:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m18Qh-0005PU-3d; Wed, 07 Jul 2021 14:21:35 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m18Qg-00051T-St; Wed, 07 Jul 2021 14:21:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=wTdyAJvYv2+xc/mwYzFHTq96XtBfQKbObw0iODDx354=; b=TAab1yO0oqaxSVvgNaUMxXBb/O
	+vb+gblS50YmY4Y/86QAhKbGDNG2VwkBz5HfHb6fLZbr223+0yAhq2/QKoRWYjUBKTQz6BngLkkhA
	E2BGkVu0L4Irv4lQpRJIAkPGQd4YBbU07d0CbHZJZyTONEv/9cZIqVnhREhN6r3uLG/M=;
Subject: Re: [PATCH v5 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-2-julien@xen.org>
 <8c0100ab-dfd7-9c64-c89d-338db62cf20b@suse.com>
 <3bb6ff6a-a4e8-daaf-daaf-a6efe07819d4@xen.org>
 <58669e8e-8397-a5ee-5c54-cd18bbb2718c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5c20c433-34c1-6c2f-e6ee-f5551921263c@xen.org>
Date: Wed, 7 Jul 2021 15:21:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <58669e8e-8397-a5ee-5c54-cd18bbb2718c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/07/2021 15:06, Jan Beulich wrote:
> On 07.07.2021 15:39, Julien Grall wrote:
>> On 05/07/2021 09:41, Jan Beulich wrote:
>>> On 03.07.2021 19:11, Julien Grall wrote:
>>>> Changes in v5:
>>>>       - Removed the #ifdef CONFIG_X86 as they are not necessary anymore
>>>>       - Used paging_mode_translate() rather than is_pv_domain()
>>>
>>> Is there a particular reason you use this in favor of steal_page()'s
>>> paging_mode_external()?
>>
>> This is what you suggested in v4 [1]. I can switch to
>> paging_mode_external() if this is what you now prefer.
> 
> Well, I did say this would be better than is_pv_*(). I probably didn't
> pay enough attention to you already pointing out paging_mode_external()
> in the description; I'm sorry. On x86 both are in sync anyway, and I
> have to admit I don't see clearly enough which of the two would be the
> right one to use here, partly because I'm afraid I also don't see why
> steal_page() has such a restriction in the first place (which you now
> build upon).

 From a quick git blame, I have found this:

commit fae7d5be8bb8b7a5b7005c4f3b812a47661a721e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jun 20 14:29:51 2017 +0200

     x86/mm: disallow page stealing from HVM domains

     The operation's success can't be controlled by the guest, as the device
     model may have an active mapping of the page. If we nevertheless
     permitted this operation, we'd have to add further TLB flushing to
     prevent scenarios like

     "Domains A (HVM), B (PV), C (PV); B->target==A
      Steps:
      1. B maps page X from A as writable
      2. B unmaps page X without a TLB flush
      3. A sends page X to C via GNTTABOP_transfer
      4. C maps page X as pagetable (potentially causing a TLB flush in C,
      but not in B)

      At this point, X would be mapped as a pagetable in C while being
      writable through a stale TLB entry in B."

     A similar scenario could be constructed for A using XENMEM_exchange and
     some arbitrary PV domain C then having this page allocated.

     This is XSA-217.

     Reported-by: Jann Horn <jannh@google.com>
     Signed-off-by: Jan Beulich <jbeulich@suse.com>
     Acked-by: George Dunlap <george.dunlap@citrix.com>
     Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

> 
>>>> @@ -815,6 +812,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>>        if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>>>>            rc = -EFAULT;
>>>
>>> I'm afraid that for correctness of the interface you need to keep
>>> this part even in the !PV case.
>>
>> Xen never initializes the field nr_exchanged. Instead, it expects the
>> guest to set to 0. So I am not quite to sure why we would need to keep
>> this line.
> 
> Hmm, the public header is wrong then, as it documents the field as
> [OUT] only _despite_ the shouting warning in point 5 of the comment.
That's confusing... I will look to update the doc.

> I guess I never really understood why this sub-op differs from
> others in where the continuation indicator lives.

I am guessing the continuation was added after the fact without 
coordination?

> 
> Never mind then, indeed no code adjustment needed:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

Cheers,

-- 
Julien Grall

