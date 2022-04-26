Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E31551008B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313970.531804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMFn-0001yD-GI; Tue, 26 Apr 2022 14:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313970.531804; Tue, 26 Apr 2022 14:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMFn-0001wM-DB; Tue, 26 Apr 2022 14:33:23 +0000
Received: by outflank-mailman (input) for mailman id 313970;
 Tue, 26 Apr 2022 14:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWqi=VE=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1njMFm-0001wG-1s
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:33:22 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c981fe-c56d-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 16:33:20 +0200 (CEST)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1njMFh-0003Fq-Cr; Tue, 26 Apr 2022 14:33:17 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1njMFf-0018Vq-4c; Tue, 26 Apr 2022 15:33:16 +0100
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
X-Inumbo-ID: d1c981fe-c56d-11ec-8fc2-03012f2f19d4
Message-ID: <0b7c4df3-e6f2-7791-4e8e-9655eb8c6f6f@cantab.net>
Date: Tue, 26 Apr 2022 15:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com>
 <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 26/04/2022 15:14, Julien Grall wrote:
> Hi,
> 
> On 26/04/2022 15:01, Jan Beulich wrote:
>> On 25.04.2022 15:28, David Vrabel wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -162,6 +162,13 @@
>>>   static char __initdata opt_badpage[100] = "";
>>>   string_param("badpage", opt_badpage);
>>> +/*
>>> + * Heap allocations may need TLB flushes which require IRQs to be
>>> + * enabled (except when only 1 PCPU is online).
>>> + */
>>> +#define ASSERT_ALLOC_CONTEXT() \
>>> +    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() 
>>> <= 1))
>>
>> At least one of these tightened assertions triggers on Arm, as per the
>> most recent smoke flight. I'm going to revert this for the time being.
> 
>  From the serial console [1]:
> 
> (XEN) Xen call trace:
> (XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
> (XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
> (XEN)    [<00236864>] __vmap+0x400/0x4a4
> (XEN)    [<0026aee8>] 
> arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
> (XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300

An allocation inside a stop_machine_run() action function. That is what 
the asserts were designed to catch.

I did try the run the GitLab CI pipelines but it is setup to use runners 
that are only available to the Xen Project group, so forking the repo 
doesn't work.

Can my (personal) GitLab be added as a Developer to the Xen Project 
group? I think this is the intended way for people to run the CI 
pipelines on their own branches.

David

