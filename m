Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730851FF088
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 13:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlsmg-0001is-BD; Thu, 18 Jun 2020 11:32:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlsmf-0001in-4W
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 11:32:41 +0000
X-Inumbo-ID: 69d7018c-b157-11ea-ba74-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69d7018c-b157-11ea-ba74-12813bfff9fa;
 Thu, 18 Jun 2020 11:32:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13478ACA7;
 Thu, 18 Jun 2020 11:32:37 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <20200618094014.GH735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd04414d-a08e-d3a9-8bab-076a578f8329@suse.com>
Date: Thu, 18 Jun 2020 13:32:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618094014.GH735@Air-de-Roger>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 11:40, Roger Pau Monné wrote:
> On Thu, Jun 18, 2020 at 08:30:08AM +0200, Jan Beulich wrote:
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
> Well, I guess Tamas avoids this because of the get_gfn call in
> hap_update_paging_modes will have already populated the entry, so it's
> never going to hit the p2m_is_hole check in __get_gfn_type_access.
> 
>> The change is an improvement, so I'd be fine with it going in this
>> way, but only as long as the description mentions that there's still
>> an open issue here (which may be non-trivial to address). Or perhaps
>> combining with your v1 change is the way to go (for now or even
>> permanently)?
> 
> If vmx_load_pdptrs only requires P2M_ALLOC then this is already
> covered by the call to get_gfn performed in hap_update_paging_modes,
> so I don't think there's much point in merging with v1, as forcing
> hap_update_paging_modes to unshare the entry won't affect
> vmx_load_pdptrs anymore.

Oh, I simply mis-remembered what v1 did; for some reason I thought
it added a call rather than modifying the query type from alloc to
unshare.

Jan

