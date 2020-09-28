Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44B27ADA3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:17:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMs5O-0005yG-9w; Mon, 28 Sep 2020 12:16:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMs5M-0005yB-PR
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:16:52 +0000
X-Inumbo-ID: 0741a675-e42c-490c-862e-036e7f89735c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0741a675-e42c-490c-862e-036e7f89735c;
 Mon, 28 Sep 2020 12:16:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601295410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+NWyA6qP+2I8QJ/A2fqSRHEitDF4L/YSagZeWY7Rt8=;
 b=h95YEShMC+L9ynPHxIfqGg1k16cLvD6qCG026Huk/yYw1nA8NBRSBA68CcoUotEl7rhtqX
 XU6QlljJ5vDQ8XKG6HrSYye/xs1agTpzkAOHSiNJECUcT3TLDuUiHfK8qQxKwAwdiUmTbr
 r3EPVFSpO5xL8uoeGl2hn5NR9cg/8PQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD3BAACD5;
 Mon, 28 Sep 2020 12:16:50 +0000 (UTC)
Subject: Re: [PATCH] x86/PV: make post-migration page state consistent
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
 <2e715145-e0b5-07b9-0090-6e1e9a849f33@citrix.com>
 <792f8867-55b5-3ce4-e609-c6f75c35a860@suse.com>
Message-ID: <da06fe42-6419-0138-e257-dae1c424149f@suse.com>
Date: Mon, 28 Sep 2020 14:16:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <792f8867-55b5-3ce4-e609-c6f75c35a860@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.2020 14:37, Jan Beulich wrote:
> On 11.09.2020 13:55, Andrew Cooper wrote:
>> On 11/09/2020 11:34, Jan Beulich wrote:
>>> When a page table page gets de-validated, its type reference count drops
>>> to zero (and PGT_validated gets cleared), but its type remains intact.
>>> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
>>> such pages. An intermediate write to such a page via e.g.
>>> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
>>> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
>>> return. In libxc the decision which pages to normalize / localize
>>> depends solely on the type returned from the domctl. As a result without
>>> further precautions the guest won't be able to tell whether such a page
>>> has had its (apparent) PTE entries transitioned to the new MFNs.
>>
>> I'm afraid I don't follow what the problem is.
>>
>> Yes - unvalidated pages probably ought to be consistently NOTAB, so this
>> is probably a good change, but I don't see how it impacts the migration
>> logic.
> 
> It's not the migration logic itself that's impacted, but the state
> of guest pages after migration. I'm afraid I can only try to expand
> on the original description.
> 
> Case 1: Once an Ln page has been unvalidated, due to the described
> behavior the migration code in libxc will normalize and then localize
> it. Therefore the guest could go and directly try to use it as a
> page table again. This should work as long as all of the entries in
> the page can still be successfully validated (i.e. unless the guest
> itself has made changes to the state of other pages).
> 
> Case 2: Once an Ln page has been unvalidated, the guest for whatever
> reason still writes to it through e.g. MMU_NORMAL_PT_UPDATE. Prior
> to migration, and provided the new entry can be validated (and no
> other reference page has changed state), the page can still be
> converted to a proper page table one again. If, however, migration
> occurs inbetween, the page now won't get normalized and then
> localized. The MFNs in it are unlikely to make sense anymore, and
> hence an attempt to make the page a page table again is likely to
> fail (or if it doesn't fail the result is unlikely to be what's
> intended).
> 
> Since there's no way to make case 2 "work", the only choice is to
> make case 1 behave like case 2, in order for the behavior to be
> predictable / consistent.
> 
>> We already have to cope with a page really changing types in parallel
>> with the normalise/localise logic (that was a "fun" one to debug), which
>> is why errors in that logic are specifically not fatal while the guest
>> is live - the frame gets re-marked as dirty, and deferred until the next
>> round.
>>
>> Errors encountered after the VM has been paused are fatal.
>>
>> However, at no point, even with an unvalidated pagetable type, can the
>> contents of the page be anything other than legal PTEs.  (I think)
> 
> Correct, because in order to write to the page one has to either
> make it a page table one again (and then write through hypercall
> or for L1 through PTWR) or the mmu-normal-pt-update would first
> convert the page to a writable one.

Besides wanting to ping this change / discussion, I'd also like
to correct myself on this last part of the reply: The above
applies to pages after having got de-validated. However, prior
to validation pages have their type changed early (type ref count
remains zero), but at this point it can't be told yet whether the
page consists of all legal PTEs.

Jan

