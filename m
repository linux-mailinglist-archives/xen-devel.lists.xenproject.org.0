Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6F64C036
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 00:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461463.719553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ELT-0003nR-HF; Tue, 13 Dec 2022 23:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461463.719553; Tue, 13 Dec 2022 23:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ELT-0003lL-EV; Tue, 13 Dec 2022 23:05:55 +0000
Received: by outflank-mailman (input) for mailman id 461463;
 Tue, 13 Dec 2022 23:05:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5ELS-0003lF-K6
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 23:05:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5ELQ-00066D-8M; Tue, 13 Dec 2022 23:05:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5ELQ-0004bH-2W; Tue, 13 Dec 2022 23:05:52 +0000
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
	bh=0QsfKQ+pjRM5GbdxX0yFfXBfTml6diznF3ClEYq9GmU=; b=mqgPc0Za90mqOTtcBGr1DBdMHX
	lqBwS1/hpfgf/vXRRpHtBBfQvxrdjlJ1LkQi4/ef/oRZ4LcIu3YrSasW06cYjvzeOl0QnltLdsFIZ
	zkyXlR1cxN2FvPqLNZsZJasCyz/SCktO3XEdcBE0Prz9LP7FOWn2HLjbYm9AE1/sCc0Q=;
Message-ID: <901d2088-49e7-634f-f55b-e4ea2e706fed@xen.org>
Date: Tue, 13 Dec 2022 23:05:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 "Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org> <Y5j7KQ9g5Yb/ufn+@itl-email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y5j7KQ9g5Yb/ufn+@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Demi,

On 13/12/2022 22:22, Demi Marie Obenour wrote:
> On Tue, Dec 13, 2022 at 08:55:28PM +0000, Julien Grall wrote:
>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>> Hi Xen Developers,
>>
>> Hi Jackson,
>>
>> Thanks for sharing the prototype with the community. Some questions/remarks
>> below.
> 
> [snip]
> 
>>> With this technique, we protect the integrity and confidentiality of
>>> guest memory. However, a compromised hypervisor can still read/write
>>> register state during traps, or refuse to schedule a guest, denying
>>> service. We also recognize that because this technique precludes
>>> modifying Xen's page tables after startup, it may not be compatible
>>> with all of Xen's potential use cases. On the other hand, there are
>>> some uses cases (in particular statically defined embedded systems)
>>> where our technique could be adopted with minimal friction.
>>
>>  From what you wrote, this sounds very much like the project Citrix and
>> Amazon worked on called "Secret-free hypervisor" with a twist. In your case,
>> you want to prevent the hypervisor to map/unmap the guest memory.
>>
>> You can find some details in [1]. The code is x86 only, but I don't see any
>> major blocker to port it on arm64.
> 
> Is there any way the secret-free hypervisor code could be upstreamed?
This has been in my todo list for more than year but didn't yet find 
anyone to finish the work.

I need to have a look how much left the original work it is left to do. 
Would you be interested to contribute?

> My understanding is that it would enable guests to use SMT without
> risking the host, which would be amazing.
> 
>>> 	Virtualized MMIO on arm needs to decode certain load/store
>>> 	instructions
>>
>> On Arm, this can be avoided of the guest OS is not using such instruction.
>> In fact they were only added to cater "broken" guest OS.
>>
>> Also, this will probably be a lot more difficult on x86 as, AFAIK, there is
>> no instruction syndrome. So you will need to decode the instruction in order
>> to emulate the access.
> 
> Is requiring the guest to emulate such instructions itself an option?
> μXen, SEV-SNP, and TDX all do this.


I am not very familiar with this. So a few questions:
  * Does this mean the OS needs to be modified?
  * What happen for emulated device?

Cheers,

-- 
Julien Grall

