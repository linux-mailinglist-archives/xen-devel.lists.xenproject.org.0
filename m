Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6B360829
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111046.212255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX03M-0003ng-EF; Thu, 15 Apr 2021 11:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111046.212255; Thu, 15 Apr 2021 11:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX03M-0003nG-AX; Thu, 15 Apr 2021 11:20:56 +0000
Received: by outflank-mailman (input) for mailman id 111046;
 Thu, 15 Apr 2021 11:20:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX03K-0003nB-1K
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:20:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52b1f467-edde-4c3b-b15d-821d0e1f4e50;
 Thu, 15 Apr 2021 11:20:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B549ABED;
 Thu, 15 Apr 2021 11:20:52 +0000 (UTC)
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
X-Inumbo-ID: 52b1f467-edde-4c3b-b15d-821d0e1f4e50
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618485652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzWoeqZph8kYWDV1FOhOloCGqq61wyPO63k6a11U0no=;
	b=LlQiRsGdloWPSa90Olc439Dawmy/QspZqfFPIDPCd+Xi5FJLYvyeS/zK4DLrPV7HPo5erU
	F845cbk2/EAOkGPjvIVd4DMYs69AByg1bqSJ2gvw2PPY1W0fFBZmogn67Y60Q+FQhwh8nW
	Pbbwbl8cHHD1EVPE4waeeIJwcxGz9b0=
Subject: Re: [PATCH v2 1/2] x86: correct is_pv_domain() when !CONFIG_PV
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <3bc868c1-1003-2f80-1617-d64a1e7441bc@suse.com>
 <9667345e-835e-7c55-8d6d-2774008b0017@suse.com>
 <YHgbE8Vxb67nYkuC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab7923af-ee8c-18f7-c2da-f29cf85191d7@suse.com>
Date: Thu, 15 Apr 2021 13:20:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHgbE8Vxb67nYkuC@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 12:53, Roger Pau Monné wrote:
> On Thu, Apr 15, 2021 at 11:34:55AM +0200, Jan Beulich wrote:
>> On x86, idle and other system domains are implicitly PV. While I
>> couldn't spot any cases where this is actively a problem, some cases
>> required quite close inspection to be certain there couldn't e.g. be
>> some ASSERT_UNREACHABLE() that would trigger in this case. Let's be on
>> the safe side and make sure these always have is_pv_domain() returning
>> true.
>>
>> For the build to still work, this requires a few adjustments elsewhere.
>> In particular is_pv_64bit_domain() now gains a CONFIG_PV dependency,
>> which means that is_pv_32bit_domain() || is_pv_64bit_domain() is no
>> longer guaranteed to be the same as is_pv_domain().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Add comment.
> 
> Sorry for not replying earlier, I've been thinking about this because
> I don't really like this approach as I think it makes code harder to
> follow for two reasons, first is_pv_32bit_domain() ||
> is_pv_64bit_domain() != is_pv_domain(), which I could live with, and
> then also is_pv_64bit_domain() returning different values for system
> domains depending on whether CONFIG_PV is enabled.

Well, okay, I'll consider the patch rejected then, despite thinking
that it could save us from subtle issues down the road.

> Given that AFAICT this patch is not fixing any actively identified
> issue I would rather prefer to introduce is_system_domain and use it
> when appropriate?
> 
> I think that would be clearer long term, and avoid tying ourselves
> deeper into aliasing system domain with PV domains.

Of course, but it won't help until we've audited and (if needed)
amended all code using is_pv_*() or e.g. implying PV when !is_hvm_*().

Patch 2, while grouped with this one, is technically independent.
Therefore I'd still appreciate separate feedback there.

Jan

