Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E83F2BC0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 14:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169501.309633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Lq-0003cs-08; Fri, 20 Aug 2021 12:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169501.309633; Fri, 20 Aug 2021 12:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3Lp-0003Zo-TL; Fri, 20 Aug 2021 12:10:21 +0000
Received: by outflank-mailman (input) for mailman id 169501;
 Fri, 20 Aug 2021 12:10:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH3Lo-0003Zi-GQ
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 12:10:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH3Ln-0001Tx-Fp; Fri, 20 Aug 2021 12:10:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH3Ln-0003dY-8v; Fri, 20 Aug 2021 12:10:19 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8Iz2i3yGNdKpmozgAmLtOqeEF1Bv45SaN//uecaTvoY=; b=wNZRpjS/QFtMTNtvtQf0p2T2qp
	x3UdWf7P9osMo9Irlaz/xeg3R7H3BnvuFnqJA70o5F1gWHN6sOCKCsoC60EodpQamw+jw0cYgeCZ1
	/iRRZkd4AuStlT9Ln7XZyPpn/gDiPHHlXvbFCSzxPAhzdrpHwRn+FbSUBCs4JnYGeCgg=;
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
 <a0d06e37-ec02-9968-01d7-907176c7c9b3@xen.org>
 <7F8FC9A8-5580-4517-BF8C-640BCE778D02@arm.com>
 <1abfb3cb-993d-3389-c627-6b8cf40457a4@xen.org>
 <09db7641-5cc8-13dd-f19b-558f7676a5a6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3957b8b7-21a6-8e70-d5ce-069eaf1ee991@xen.org>
Date: Fri, 20 Aug 2021 13:10:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <09db7641-5cc8-13dd-f19b-558f7676a5a6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/08/2021 12:55, Jan Beulich wrote:
> On 20.08.2021 13:37, Julien Grall wrote:
>> On 20/08/2021 11:30, Rahul Singh wrote:
>>>> Please add a comment explaining why this just returns 0.
>>>
>>> Here is the comment that I will add in next version.
>>> /*
>>>    * Return 0 as on ARM there is no pci physical irqs that required cleanup.
>>>    */
>>
>> In this context, PIRQ means an interrupts that was routed to the guest
>> and could be mapped to an event channel. We have no such concept on Arm
>> (see allocate_pirq_struct()).
>>
>> So I would write "PIRQ event channels are not supported on Arm, so
>> nothing to do".
> 
> Does this mean ASSERT_UNREACHABLE() might be appropriate here?

Unfortunately no. This is call unconditionally from pci_release_devices().

Cheers,

-- 
Julien Grall

