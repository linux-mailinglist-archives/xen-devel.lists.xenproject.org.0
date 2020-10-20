Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D287E293F87
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9699.25526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtWf-0000rR-Ms; Tue, 20 Oct 2020 15:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9699.25526; Tue, 20 Oct 2020 15:26:13 +0000
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
	id 1kUtWf-0000r4-Je; Tue, 20 Oct 2020 15:26:13 +0000
Received: by outflank-mailman (input) for mailman id 9699;
 Tue, 20 Oct 2020 15:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUtWe-0000qz-Hs
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:26:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c0f42e5-9e30-464b-a217-29fe4522ad1b;
 Tue, 20 Oct 2020 15:26:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUtWY-0005t2-V5; Tue, 20 Oct 2020 15:26:06 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUtWY-0002ok-N0; Tue, 20 Oct 2020 15:26:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUtWe-0000qz-Hs
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:26:12 +0000
X-Inumbo-ID: 4c0f42e5-9e30-464b-a217-29fe4522ad1b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4c0f42e5-9e30-464b-a217-29fe4522ad1b;
	Tue, 20 Oct 2020 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=F9G/pbmQAh/X7hBMDJhhroZkSRlVG49Ud+NSH7WAp/k=; b=lBAEOn7EB87TB72dviHxeU7kdQ
	RbOoLoC26/PI4QDynGf/vzpySh/gPZSpEg5EZ4f8ke9EDH2giM86VM2PX1oby553zuc//oyNcqhDQ
	ACjDnGJuBmZR5D0kKBF1p+a+VzzJZEH302DcrSuLqhQ0CMsZdOMLEzfABSpXXzKE2sy0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUtWY-0005t2-V5; Tue, 20 Oct 2020 15:26:06 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUtWY-0002ok-N0; Tue, 20 Oct 2020 15:26:06 +0000
Subject: Re: [PATCH] IOMMU: avoid double flushing in shared page table case
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Paul Durrant <paul@xen.org>
References: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
 <01a5840e-3250-246c-8d38-29a65d4937ea@xen.org>
 <91fc14a3-6bc0-5929-2087-e4f57901fe14@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <147ab40f-9ee7-a43e-e40f-7620fd9c26ac@xen.org>
Date: Tue, 20 Oct 2020 16:26:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <91fc14a3-6bc0-5929-2087-e4f57901fe14@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/10/2020 16:05, Jan Beulich wrote:
> On 20.10.2020 17:00, Julien Grall wrote:
>> On 20/10/2020 14:52, Jan Beulich wrote:
>>> While the flush coalescing optimization has been helping the non-shared
>>> case, it has actually lead to double flushes in the shared case (which
>>> ought to be the more common one nowadays at least): Once from
>>> *_set_entry() and a second time up the call tree from wherever the
>>> overriding flag gets played with. In alignment with XSA-346 suppress
>>> flushing in this case.
>>>
>>> Similarly avoid excessive setting of IOMMU_FLUSHF_added on the batched
>>> flushes: "idx" hasn't been added a new mapping for.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> TBD: The Arm part really is just for completeness (and hence could also
>>>        be dropped) - the affected mapping spaces aren't currently
>>>        supported there.
>>
>> As I may I have pointed out in the past, there are many ways to screw
>> things up when using iommu_dont_flush_iotlb.
>>
>> So I would rather not introduce any usage on Arm until we see a use-case.
> 
> "Usage" to me would mean a path actually setting the flag.
> What I'm adding here, basically as a precautionary measure,
> is a check of the flag.

The code would always be safe without checking the safe (albeit doing 
pointless flush). I wouldn't say the same if we check the flag because 
it is not correct to set it everywhere.

> Does your use of "usage" imply you
> don't want that either? Just to be sure; I'm okay to drop
> the Arm part.
That's correct, I don't want this check to be present until there is a 
user. Only then, we can assess whether this is the right approach for Arm.

Cheers,

-- 
Julien Grall

