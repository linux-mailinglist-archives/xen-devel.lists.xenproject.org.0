Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742C640812
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452002.709816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16ay-0003ls-Aw; Fri, 02 Dec 2022 14:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452002.709816; Fri, 02 Dec 2022 14:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p16ay-0003jo-7S; Fri, 02 Dec 2022 14:00:52 +0000
Received: by outflank-mailman (input) for mailman id 452002;
 Fri, 02 Dec 2022 14:00:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p16ax-0003jX-A4
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:00:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p16am-0003hY-PU; Fri, 02 Dec 2022 14:00:40 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.0.82])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p16am-0003uA-Io; Fri, 02 Dec 2022 14:00:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=OQ4+GWBOgYfct5/JY5QlPQyjvuh5C3c5/50Dh7il69o=; b=Sa8jAgQFjRTKMG/OasBoUQYSkK
	48DycrZpuPMPIVhLZkcllK1ZEv64Pyspjrn2EoksknvIGXMGlNyeCa3FPrB5FX2ZpaVoF5KmEq2Q/
	74qH7rY5D4FYT5UH2fM8svf0e6Gvn90SQcffgEOFUKrwrYdoW8iSuEOVBvqJiQsudZd4=;
Message-ID: <5218ddcf-0c07-1fbf-2b4d-26060d997233@xen.org>
Date: Fri, 2 Dec 2022 14:00:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as a
 rhs operand of shift operator
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, bobbyeshleman@gmail.com, alistair.francis@wdc.com,
 connojdavis@gmail.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
 <19777ed9-c73d-7098-e660-d8babacbcacc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <19777ed9-c73d-7098-e660-d8babacbcacc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/12/2022 13:43, Jan Beulich wrote:
> On 02.12.2022 13:35, Ayan Kumar Halder wrote:
>> We want to ensure that "xenheap_bits - PAGE_SHIFT" is strictly less than
>> the number of bits to represent unsigned long as it is used a rhs operand
>> to shift mfn.
>> It is also important to note that the "xenheap_bits - PAGE_SHIFT" is never
>> used to shift an address (rather than a frame number), and going forward
>> then also shouldn't be (perhaps unless further precautions are taken).
> 
> Hmm, now you've lost why you are making the change in the first place:
> The way things are before the patch is quite fine for the described
> purpose. (This then also extends to the title. I should have noticed
> this in v2 already, but didn't because I still had the v1 title in mind.)
> 
> Furthermore in the 2nd paragraph instead of 'the "xenheap_bits -
> PAGE_SHIFT"' you mean '"xenheap_bits" alone'.

Let me propose a commit message:

"
xen/page_alloc: Relax the BUILD_BUG_ON() in xenheap_max_mfn()

In the near future, we are considering to use a common xen/domain heap 
for Arm 32-bit V8-R. In this setup, both PADDR_BITS and BITS_PER_LONG 
will be 32. Therefore, the condition PADDR_BITS >= BITS_PER_LONG will 
become true.

Looking at the commit that introduce the BUILD_BUG_ON (88e3ed61642b 
"x86/NUMA: make init_node_heap() respect Xen heap limit") and the 
current use, it seems this check was mainly to ensure that the shift of 
xenheap_bits is not going to be undefined (>> N for a N-bit type is 
undefined).

So far, all the shifts are using "xenheap_bits - PAGE_SHIFT". Therefore, 
the existing code should work for 32-bit architecture as long as the 
result of the substraction is below 32.

Therefore relax the BUILD_BUG_ON() to check that (PADDR_BITS - 
PAGE_SHIFT) is not equal of above BITS_PER_LONG.

Note that we would need further precaution if we ended up to use 
'xenheap_bits' alone in shifts.
"

If you end up to take my commit message, then please add my signed-off-by.

Cheers,

-- 
Julien Grall

