Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC8322E7A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 17:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88885.167284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaJQ-0006Ys-Ok; Tue, 23 Feb 2021 16:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88885.167284; Tue, 23 Feb 2021 16:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaJQ-0006YW-LC; Tue, 23 Feb 2021 16:13:24 +0000
Received: by outflank-mailman (input) for mailman id 88885;
 Tue, 23 Feb 2021 16:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEaJP-0006YR-3M
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 16:13:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4632d9a5-f33d-417d-bfff-3da4782474cc;
 Tue, 23 Feb 2021 16:13:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F5ABAB95;
 Tue, 23 Feb 2021 16:13:21 +0000 (UTC)
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
X-Inumbo-ID: 4632d9a5-f33d-417d-bfff-3da4782474cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614096801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1DLj/+4Nqge5qsuEp8WvxJqf7aK5Y4qbufSexgLYQE=;
	b=AXdNyMaVqxaiRkJ5YzPlYElPK9J5ze8OfJNMRgvqLNput3TLiD2zzbl5RgWq6oFGtkzHyl
	kd/6Lfo7UqXbeaVLHaYEo8cQyf6h2srlaPxC4DaGLr92F8DO2iSMBSSm1BhCQ8QuevoQg5
	8s3bkkGhpIHXXOJUYq1xCXf+5KxKtgY=
Subject: Re: [PATCH v2 8/8] x86/PV: use get_unsafe() instead of
 copy_from_unsafe()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
 <YDTuGn8YWRrWlbS9@Air-de-Roger>
 <76207250-1372-e7ab-2d03-b46020a7906b@suse.com>
 <YDUhKw+19ITgVmml@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fdb5952-6196-3a79-1306-e65d75e495d2@suse.com>
Date: Tue, 23 Feb 2021 17:13:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDUhKw+19ITgVmml@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.02.2021 16:37, Roger Pau Monné wrote:
> On Tue, Feb 23, 2021 at 04:25:00PM +0100, Jan Beulich wrote:
>> On 23.02.2021 12:59, Roger Pau Monné wrote:
>>> On Wed, Feb 17, 2021 at 09:23:33AM +0100, Jan Beulich wrote:
>>>> The former expands to a single (memory accessing) insn, which the latter
>>>> does not guarantee. Yet we'd prefer to read consistent PTEs rather than
>>>> risking a split read racing with an update done elsewhere.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Albeit I wonder why the __builtin_constant_p check done in
>>> copy_from_unsafe is not enough to take the get_unsafe_size branch in
>>> there. Doesn't sizeof(l{1,2}_pgentry_t) qualify as a built time
>>> constant?
>>>
>>> Or the fact that n it's a parameter to an inline function hides this,
>>> in which case the __builtin_constant_p is pointless?
>>
>> Without (enough) optimization, __builtin_constant_p() may indeed
>> yield false in such cases. But that wasn't actually what I had
>> in mind when making this change (and the original similar on in
>> shadow code). Instead, at the time I made the shadow side change,
>> I had removed this optimization from the new function flavors.
>> With that removal, things are supposed to still be correct - it's
>> an optimization only, after all. Meanwhile the optimizations are
>> back, so there's no immediate problem as long as the optimizer
>> doesn't decide to out-of-line the function invocations (we
>> shouldn't forget that even always_inline is not a guarantee for
>> inlining to actually occur).
> 
> I'm fine with you switching those use cases to get_unsafe, but I think
> the commit message should be slightly adjusted to notice that
> copy_from_unsafe will likely do the right thing, but that it's simply
> clearer to call get_unsafe directly, also in case copy_from_unsafe
> gets changed in the future to drop the get_unsafe paths.

How about this then?

"The former expands to a single (memory accessing) insn, which the latter
 does not guarantee (the __builtin_constant_p() based switch() statement
 there is just an optimization). Yet we'd prefer to read consistent PTEs
 rather than risking a split read racing with an update done elsewhere."

Jan

