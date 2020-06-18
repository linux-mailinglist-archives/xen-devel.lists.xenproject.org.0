Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192241FF236
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 14:46:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jltw2-00082P-OB; Thu, 18 Jun 2020 12:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jltw1-00082K-0x
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:46:25 +0000
X-Inumbo-ID: b7977bc2-b161-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7977bc2-b161-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 12:46:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B206ACA7;
 Thu, 18 Jun 2020 12:46:22 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <CABfawhngJT0cFJfNxoa9H6qvPEF1nNO9m9PrrbRgQsA5Z0Jc6g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9288d56-297d-dc1f-0e99-6537d82b393c@suse.com>
Date: Thu, 18 Jun 2020 14:46:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhngJT0cFJfNxoa9H6qvPEF1nNO9m9PrrbRgQsA5Z0Jc6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 14:39, Tamas K Lengyel wrote:
> On Thu, Jun 18, 2020 at 12:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 17.06.2020 18:19, Tamas K Lengyel wrote:
>>> While forking VMs running a small RTOS system (Zephyr) a Xen crash has been
>>> observed due to a mm-lock order violation while copying the HVM CPU context
>>> from the parent. This issue has been identified to be due to
>>> hap_update_paging_modes first getting a lock on the gfn using get_gfn. This
>>> call also creates a shared entry in the fork's memory map for the cr3 gfn. The
>>> function later calls hap_update_cr3 while holding the paging_lock, which
>>> results in the lock-order violation in vmx_load_pdptrs when it tries to unshare
>>> the above entry when it grabs the page with the P2M_UNSHARE flag set.
>>>
>>> Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE was
>>> unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ensure
>>> the p2m is properly populated and to avoid the lock-order violation we
>>> observed.
>>
>> Using P2M_ALLOC is not going to address the original problem though
>> afaict: You may hit the mem_sharing_fork_page() path that way, and
>> via nominate_page() => __grab_shared_page() => mem_sharing_page_lock()
>> you'd run into a lock order violation again.
> 
> Note that the nominate_page you see in that path is for the parent VM.
> The paging lock is not taken for the parent VM thus nominate_page
> succeeds without any issues any time fork_page is called. There is no
> nominate_page called for the client domain as there is nothing to
> nominate when plugging a hole.

But that's still a lock order issue then, isn't it? Just one that
the machinery can't detect / assert upon.

Jan

