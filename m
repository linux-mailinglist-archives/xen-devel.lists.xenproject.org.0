Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7F322D71
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 16:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88827.167171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZYe-0000KD-EG; Tue, 23 Feb 2021 15:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88827.167171; Tue, 23 Feb 2021 15:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEZYe-0000Jo-Au; Tue, 23 Feb 2021 15:25:04 +0000
Received: by outflank-mailman (input) for mailman id 88827;
 Tue, 23 Feb 2021 15:25:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEZYc-0000Jj-20
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 15:25:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab752354-589e-4a4e-a9f4-311f26672c21;
 Tue, 23 Feb 2021 15:25:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55E06AD57;
 Tue, 23 Feb 2021 15:25:00 +0000 (UTC)
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
X-Inumbo-ID: ab752354-589e-4a4e-a9f4-311f26672c21
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614093900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw6AzAsZH+6lNjHhY0dDF8PbEU4hQdZguOfaumbBcLY=;
	b=hjByv/ZFEhM+RNo5QnjhzBFdsG4xw9zElnK8Njq4yWpCWQ/pzmae3gRFF6sdxPpjuddS7q
	OaZKKMWJPEAOt8sqJMmI09HTA/ko+y//9HykLEzeskmL5BA/fRBbOjooadezH17DyzMuHI
	eocQD8M7k7p5e38QLPLu9SdJqgx3kZ8=
Subject: Re: [PATCH v2 8/8] x86/PV: use get_unsafe() instead of
 copy_from_unsafe()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
 <YDTuGn8YWRrWlbS9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76207250-1372-e7ab-2d03-b46020a7906b@suse.com>
Date: Tue, 23 Feb 2021 16:25:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDTuGn8YWRrWlbS9@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.02.2021 12:59, Roger Pau Monné wrote:
> On Wed, Feb 17, 2021 at 09:23:33AM +0100, Jan Beulich wrote:
>> The former expands to a single (memory accessing) insn, which the latter
>> does not guarantee. Yet we'd prefer to read consistent PTEs rather than
>> risking a split read racing with an update done elsewhere.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Albeit I wonder why the __builtin_constant_p check done in
> copy_from_unsafe is not enough to take the get_unsafe_size branch in
> there. Doesn't sizeof(l{1,2}_pgentry_t) qualify as a built time
> constant?
> 
> Or the fact that n it's a parameter to an inline function hides this,
> in which case the __builtin_constant_p is pointless?

Without (enough) optimization, __builtin_constant_p() may indeed
yield false in such cases. But that wasn't actually what I had
in mind when making this change (and the original similar on in
shadow code). Instead, at the time I made the shadow side change,
I had removed this optimization from the new function flavors.
With that removal, things are supposed to still be correct - it's
an optimization only, after all. Meanwhile the optimizations are
back, so there's no immediate problem as long as the optimizer
doesn't decide to out-of-line the function invocations (we
shouldn't forget that even always_inline is not a guarantee for
inlining to actually occur).

Jan

