Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1977F1E9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 10:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585212.916261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWY9P-0004Zv-I1; Thu, 17 Aug 2023 08:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585212.916261; Thu, 17 Aug 2023 08:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWY9P-0004Xw-FM; Thu, 17 Aug 2023 08:14:39 +0000
Received: by outflank-mailman (input) for mailman id 585212;
 Thu, 17 Aug 2023 08:14:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWY9N-0004Xq-RT
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 08:14:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWY9N-00060H-C0; Thu, 17 Aug 2023 08:14:37 +0000
Received: from [54.239.6.180] (helo=[192.168.0.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWY9N-0002Ud-5V; Thu, 17 Aug 2023 08:14:37 +0000
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
	bh=6pXTCqWpBzO5bqXPNupDBkZB7Nlyca1tVjdjjq/IqZI=; b=FuxqDFNbBLxPUtni2rLq6ZiIAr
	QpQIThuy6EJfn02Q4Rrgev5757wfzTWSvVRxkImxz0jcFJveKou6fGRAAtgP2YHzxfhV3tIHCmH/Z
	EFS5pLMhUu0QptRGnrAd1XeSdrW5brAonCe9GznHps+8HqiwdFbpCSok9wq2c3i/W8MY=;
Message-ID: <1c0b49be-c024-4475-94f4-05e97dcbfce4@xen.org>
Date: Thu, 17 Aug 2023 09:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7 15/19] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 sstabellini@kernel.org, jbeulich@suse.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-16-vikram.garhwal@amd.com>
 <e1597b22-a756-5141-e7d9-5fd60a9a05ff@xen.org> <ZN1qaMn+5GONuzmS@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZN1qaMn+5GONuzmS@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/08/2023 01:31, Vikram Garhwal wrote:
> On Mon, Jun 05, 2023 at 10:07:48PM +0100, Julien Grall wrote:
>>> +{
>>> +    int rc = 0;
>>> +    struct domain *d = hardware_domain;
>>> +    domid_t domid;
>>> +    unsigned int naddr, len;
>>> +    unsigned int i, nirq;
>>> +
>>> +    domid = dt_device_used_by(device_node);
>>
>> Looking at the caller, it is not clear to me which lock is preventing the
>> device to be assigned whilst you remove it.
> So, this is on user to make sure the domain is not using the device.

It is not clear what you mean by user. Is it someone external to Xen? If 
not, which function is responsible? If yes, then we can't rely on an 
entity outside of Xen to do the right thing.

>>> +    if ( domid != 0 && domid != DOMID_IO )
>>> +    {
>>> +        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
>>> +               device_node->full_name, domid);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    dt_dprintk("Removing node: %s\n", device_node->full_name);
>>> +
>>> +    nirq = dt_number_of_irq(device_node); > +
>>> +    /* Remove IRQ permission */
>>> +    for ( i = 0; i < nirq; i++ )
>>> +    {
>>> +        rc = platform_get_irq(device_node, i);
>>
>> As I mentioned in [1], I think that parsing the Device-Tree again when
>> removing any interrupts/mappings is a bit odd as there are more possible
>> failures and is more complex than necessary. I have proposed a way to do it
>> with rangeset, but I can't find any reason why this wasn't done. Can you
>> explain?
> IIUC, range sets can work if we have only one level of node i.e. no children.
> I tried in previous version to use range but it's complicated to get info in
> correct order using rangeset. Example, we have three nodes, node A, B and C. A
> has three child A_a, A_b and A_c. While adding the nodes, we add A first then
> A_a, A_b, A_c and finally B and C. And rangeset is updated in same order but
> when we remove node, first A_c is removed followed by A_b and A_a and then A.
> So, this was the problem for me on how to keep track which interrupt belong to
> which node.

 From my understanding, all the nodes added together will have to be 
removed together. IOW, it is not possible to remove A_c in one hypercall 
by not A_b.

It is not clear to me why you need to know which interrupt belong to 
which node. On removal, it should be sufficient to revert all the 
permissions in one go and then all the nodes.

>>> +            return -EINVAL;
>>> +        }
>>> +        /*
>>> +         * TODO: We don't handle shared IRQs for now. So, it is assumed that
>>> +         * the IRQs was not shared with another devices.
>>> +         */
>>> +        rc = irq_deny_access(d, rc);
>>> +        if ( rc )
>>> +        {
>>> +            printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
>>> +                   i, device_node->full_name);
>>> +            return rc;
>>> +        }
>>
>> You don't reverse the change in the routing. What would happen if the next
>> overlay is updated to now pass the same device to a guest?
>>
>> I would be OK if this is not handled in this series. But it should be marked
>> as a TODO.
> So, i explained the reason behind this in v4:

I couldn't find the appropriate summary in this series. Can you point me 
to it?

Cheers,

-- 
Julien Grall

