Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2C050832F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 10:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308985.524931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh5Si-0007Aq-Af; Wed, 20 Apr 2022 08:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308985.524931; Wed, 20 Apr 2022 08:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh5Si-00078x-7G; Wed, 20 Apr 2022 08:13:20 +0000
Received: by outflank-mailman (input) for mailman id 308985;
 Wed, 20 Apr 2022 08:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk4w=U6=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nh5Sh-00078r-97
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 08:13:19 +0000
Received: from smarthost01c.ixn.mail.zen.net.uk
 (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb32ffe-c081-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 10:13:18 +0200 (CEST)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01c.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nh5Sc-0003Ew-E9; Wed, 20 Apr 2022 08:13:14 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1nh5SS-000NMg-EF; Wed, 20 Apr 2022 09:13:13 +0100
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
X-Inumbo-ID: bbb32ffe-c081-11ec-a405-831a346695d4
Message-ID: <4c40abc3-10b4-a1c1-8bfe-5ac8539f1075@cantab.net>
Date: Wed, 20 Apr 2022 09:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220419150134.64704-1-dvrabel@cantab.net>
 <c65c58d3-e553-4247-680a-4d072b1c7c05@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <c65c58d3-e553-4247-680a-4d072b1c7c05@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: [PATCH v1] page_alloc: assert IRQs are enabled in heap alloc/free
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01c-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 20/04/2022 07:26, Jan Beulich wrote:
> On 19.04.2022 17:01, David Vrabel wrote:
>> From: David Vrabel <dvrabel@amazon.co.uk>
>>
>> Heap pages can only be safely allocated and freed with interuupts
>> enabled as they may require a TLB flush which will send IPIs.
>>
>> Enhance the assertions in alloc_xenheap_pages() and
>> alloc_domheap_pages() to check interrupts are enabled. For consistency
>> the same asserts are used when freeing heap pages.
>>
>> As an exception, during early boot when only 1 PCPU is online,
>> allocations are permitted with interrupts disabled.
> 
> This exception is tightly coupled with spin lock checking, i.e. the
> point in time when spin_debug_enable() is called. I think this wants
> making explicit at least in the code comment, but as a result I also
> wonder in how far the extended assertions are really worthwhile: Any
> violation would be detected in check_lock() anyway. Thoughts?

I was caught out by stop_machine_run() disabling both interrupts and 
spin lock debugging when running the action function, so check_lock() 
didn't help in this (admittedly) narrow use case.

> Furthermore I'm concerned of Arm not using either SYS_STATE_smp_boot
> or spin_debug_enable().

David

