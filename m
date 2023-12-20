Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1B819D68
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 11:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657626.1026604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuFF-0002bi-TD; Wed, 20 Dec 2023 10:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657626.1026604; Wed, 20 Dec 2023 10:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuFF-0002ZW-QF; Wed, 20 Dec 2023 10:56:09 +0000
Received: by outflank-mailman (input) for mailman id 657626;
 Wed, 20 Dec 2023 10:56:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFuFE-0002ZQ-7T
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 10:56:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFuFD-0002KQ-69; Wed, 20 Dec 2023 10:56:07 +0000
Received: from [15.248.2.232] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFuFC-0007kx-VR; Wed, 20 Dec 2023 10:56:07 +0000
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
	bh=R1Td4gWLf0+H+wX7JRjsHV9k/DYi2k+ZphId3/XqEo8=; b=T8Vf/wDJjP2VFp3ZY+XbwXuJgW
	tncpqDjQEbXcM5o/YltAeorVbtJahQ5Te5FROdgmE9SK5mGhJXLdSN2O8a5MwcJrADwa1rUxi1LNg
	VECBkNqMXuBi0LLsQCtvqmE7EInDVAjHLLfES3/bFgjuDTLA1aKwMxY9okZhVOkaqRGU=;
Message-ID: <82d3c6d1-62a4-45c1-8f57-ecec6bb97e90@xen.org>
Date: Wed, 20 Dec 2023 10:56:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <cacbff18-f37d-42dc-ab8c-79409aa1d237@epam.com>
 <13b218b5-2d37-48de-9baa-cf2b99211bde@xen.org>
 <alpine.DEB.2.22.394.2312191641140.3175268@ubuntu-linux-20-04-desktop>
 <3a5df135-1bcf-41d7-b489-c5fd938b10d6@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3a5df135-1bcf-41d7-b489-c5fd938b10d6@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2023 09:13, Mykyta Poturai wrote:
> 
> Hi,
> 
> On 20.12.23 02:42, Stefano Stabellini wrote:
>> On Tue, 19 Dec 2023, Julien Grall wrote:
>>>
>>> But QEMU should really not need to implement a full ITS. What it needs is a
>>> way to forward the MSI to Xen. That's it.
>>
>> I fully agree with Julien
>>
>>
>>> Stefano, do you have any suggestion how to do this in QEMU?
>>
>> Yes, we just need something like hw/i386/xen/xen_apic.c but for ARM
> 
> It is exactly like xen_apic.c. All this implementation does is getting
> the MSI messages and forwarding them to Xen using the DM op from this patch.

If this implementation is only getting the MSI messages and forwarding 
them, then why is it built on top of the vGICv3 ITS structure?

Shouldn't instead be something that is agnostic to the interrupt 
controller (and even possibly arch agnostic)?

The point here is in Xen context, QEMU doesn't know which interrupt 
controller will be exposed to the guest. QEMU is just used for emulating 
devices and none of this should really be architecture specific. 
Instead, it should be a Xen specific way to inject MSI/IRQ.

Cheers,

-- 
Julien Grall

