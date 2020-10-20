Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BD293F39
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9689.25487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtD2-0007Br-A1; Tue, 20 Oct 2020 15:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9689.25487; Tue, 20 Oct 2020 15:05:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtD2-0007BS-6w; Tue, 20 Oct 2020 15:05:56 +0000
Received: by outflank-mailman (input) for mailman id 9689;
 Tue, 20 Oct 2020 15:05:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUtD1-0007BN-Ib
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:05:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 230a6fe0-aef5-4c56-a8ff-67cc8404a2cc;
 Tue, 20 Oct 2020 15:05:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCCA4AD52;
 Tue, 20 Oct 2020 15:05:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUtD1-0007BN-Ib
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:05:55 +0000
X-Inumbo-ID: 230a6fe0-aef5-4c56-a8ff-67cc8404a2cc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 230a6fe0-aef5-4c56-a8ff-67cc8404a2cc;
	Tue, 20 Oct 2020 15:05:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603206353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVqXOwluPVtwIxnZpXjiQN1OuEFTkA7XQpwqBQ4VJZY=;
	b=UkE3XIN0ss6kNgDzOf9CddCHiEv2CPCt6W1cigrUoh5pW2tWa8ttqjjyDPPlgWyDKA52Vb
	3tpsSe4plm1cMIvp5lfOABTG6S/xsCwYf0sXjXEij7VWxMEuHqFrfpFMZlmi+qhCq+WU6T
	SVX8OcVNafKlAk9hFVTTkfvUum5IsQE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CCCA4AD52;
	Tue, 20 Oct 2020 15:05:53 +0000 (UTC)
Subject: Re: [PATCH] IOMMU: avoid double flushing in shared page table case
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Paul Durrant <paul@xen.org>
References: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
 <01a5840e-3250-246c-8d38-29a65d4937ea@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91fc14a3-6bc0-5929-2087-e4f57901fe14@suse.com>
Date: Tue, 20 Oct 2020 17:05:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <01a5840e-3250-246c-8d38-29a65d4937ea@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 17:00, Julien Grall wrote:
> On 20/10/2020 14:52, Jan Beulich wrote:
>> While the flush coalescing optimization has been helping the non-shared
>> case, it has actually lead to double flushes in the shared case (which
>> ought to be the more common one nowadays at least): Once from
>> *_set_entry() and a second time up the call tree from wherever the
>> overriding flag gets played with. In alignment with XSA-346 suppress
>> flushing in this case.
>>
>> Similarly avoid excessive setting of IOMMU_FLUSHF_added on the batched
>> flushes: "idx" hasn't been added a new mapping for.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: The Arm part really is just for completeness (and hence could also
>>       be dropped) - the affected mapping spaces aren't currently
>>       supported there.
> 
> As I may I have pointed out in the past, there are many ways to screw 
> things up when using iommu_dont_flush_iotlb.
> 
> So I would rather not introduce any usage on Arm until we see a use-case.

"Usage" to me would mean a path actually setting the flag.
What I'm adding here, basically as a precautionary measure,
is a check of the flag. Does your use of "usage" imply you
don't want that either? Just to be sure; I'm okay to drop
the Arm part.

Jan

