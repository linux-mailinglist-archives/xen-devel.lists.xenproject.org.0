Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629297EE5E6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 18:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634585.990072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3g9G-0008PH-Om; Thu, 16 Nov 2023 17:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634585.990072; Thu, 16 Nov 2023 17:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3g9G-0008Mk-Kc; Thu, 16 Nov 2023 17:27:26 +0000
Received: by outflank-mailman (input) for mailman id 634585;
 Thu, 16 Nov 2023 17:27:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3g9F-0008Me-4X
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 17:27:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3g9D-0002Xi-El; Thu, 16 Nov 2023 17:27:23 +0000
Received: from [15.248.3.7] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3g9D-0007vt-7W; Thu, 16 Nov 2023 17:27:23 +0000
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
	bh=MsREr8kph98aUvbZTEhxyBS9807xIYEADCWufjcKnek=; b=khpNfLbmg++Wdz8ocayuHfrdUl
	bwbA3KI00RWhx5FhXKnCsoxOrNjnfy+rhNpn+XYTNj06WUIks65hy2xFoz3KEnk5juNfJB//M5r63
	cfoi5aikDRLK5ogU0PJw4tkc18Y0gXKau8Ehwswi++s05FdDOEVagglqUZkkp2yJ3KmU=;
Message-ID: <a2ca2931-7851-4dfb-a5c5-a91bcf5dd739@xen.org>
Date: Thu, 16 Nov 2023 17:27:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <875y2168ki.fsf@epam.com> <0999dc30-05ed-4afd-bb10-0128e2ca1d97@xen.org>
 <7964c688-c4b5-4688-9f53-88679bb931b3@amd.com>
 <7c5f7a8d-a30c-455d-a44b-384c0f242741@xen.org> <87v8a14p2c.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87v8a14p2c.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 16/11/2023 16:53, Volodymyr Babchuk wrote:
> Julien Grall <julien@xen.org> writes:
>> On 16/11/2023 15:26, Stewart Hildebrand wrote:
>>> On 11/16/23 10:12, Julien Grall wrote:
>>>> Hi Volodymyr,
>>>>
>>>> On 16/11/2023 15:07, Volodymyr Babchuk wrote:
>>>>> With my vPCI patch series in place, hypervisor itself assigns BDFs for
>>>>> passed-through devices. Toolstack needs to get this information to know
>>>>> which BDFs are free and can be used by virtio-pci.
>>>>
>>>> It sounds a bit odd to let the hypervisor to assign the BDFs. At
>>>> least because there might be case where you want to specific vBDF
>>>> (for instance this is the case with some intel graphic cards). This
>>>> should be the toolstack job to say "I want to assign the pBDF to
>>>> this vBDF".
>>> Keep in mind we are also supporting dom0less PCI passthrough.
>> Right, but even with that in mind, I expect the Device-Tree to provide
>> the details where a given PCI is assigned.
>>
>> You could have logic for assigning the BDF automagically. But that
>> should be part of dom0less, not deep into the vPCI code.
> 
> As far as I know, right now toolstack does not allow you to assign BDF
> in any form. For x86 there are two options, and they are controlled by
> "passthrough" option of xen-pciback driver in Linux:

Are you talking about HVM or PV? I am not very familiar for the latter 
but for the former, QEMU is today responsible to find a free slot.

You can also specify which virtual slot you want to use in XL:

=item B<vslot>=I<NUMBER>

=over 4

=item Description

Specifies the virtual slot (device) number where the guest will see this
device. For example, running L<lspci(1)> in a Linux guest where B<vslot>
was specified as C<8> would identify the device as C<00:08.0>. Virtual 
domain
and bus numbers are always 0.

> 
>    "Option to specify how to export PCI topology to guest:"
>    " 0 - (default) Hide the true PCI topology and makes the frontend"
>    "   there is a single PCI bus with only the exported devices on it."
>    "   For example, a device at 03:05.0 will be re-assigned to 00:00.0"
>    "   while second device at 02:1a.1 will be re-assigned to 00:01.1."
>    " 1 - Passthrough provides a real view of the PCI topology to the"
>    "   frontend (for example, a device at 06:01.b will still appear at"
>    "   06:01.b to the frontend). This is similar to how Xen 2.0.x"
>    "   exposed PCI devices to its driver domains. This may be required"
>    "   for drivers which depend on finding their hardward in certain"
>    "   bus/slot locations.");
> 
> Also, isn't strict dependency on BDF breaks the PCI specification? I
> mean, of course, you can assign Function on random, but what about Bus
> and Device parts?

I am not well-versed with the PCI specification. However, what the specs 
says and what users do tend to be different :).

I know a few cases where you need to specify the slot. I have mentioned 
one earlier with the Intel Graphic cards.

> I mean, we can make toolstack responsible of assigning BDFs, but this
> might break existing x86 setups...

It is not clear to me how letting the toolstack selecting the vslot 
would be a problem for HVM (see above). However, it is clear that you 
may break some x86 setup if always allocate a "random" slot.

Cheers,

-- 
Julien Grall

