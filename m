Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F731556B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83370.154985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XC6-0007PD-CU; Tue, 09 Feb 2021 17:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83370.154985; Tue, 09 Feb 2021 17:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XC6-0007Oo-9P; Tue, 09 Feb 2021 17:52:58 +0000
Received: by outflank-mailman (input) for mailman id 83370;
 Tue, 09 Feb 2021 17:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9XC4-0007Oj-2M
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:52:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9XC2-0003sg-I3; Tue, 09 Feb 2021 17:52:54 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9XC2-0004AY-9h; Tue, 09 Feb 2021 17:52:54 +0000
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
	bh=38P2yPqgo7rLVaWL+FEyQMD/wtAxWX5vZrErR3z3Osw=; b=KiA1ENq8+cX/leulPwwuIxEQ2n
	uSbN3oH+dUNnzJXz4qoB7ZgKgfnF009tw5lh81PN87bNP0Fk5m+2LW3L4SSfUeJFE5lCdRc3dFift
	OWawtRDLhGSM9DCtac7T+rsBTrX9g/xIlIXQ1jGX87Fn7CIEJZKHXmSylrIBJYsA1s+g=;
Subject: Re: [PATCH] xen: workaround missing device_type property in pci/pcie
 nodes
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "ehem+xen@m5p.com" <ehem+xen@m5p.com>
References: <alpine.DEB.2.21.2102081544230.8948@sstabellini-ThinkPad-T480s>
 <22372A39-83F4-41AB-8FCC-B3A9C8551604@arm.com>
 <alpine.DEB.2.21.2102090944240.8948@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9a97ecc3-f35f-44e4-68b8-1c801b326c40@xen.org>
Date: Tue, 9 Feb 2021 17:52:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102090944240.8948@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 09/02/2021 17:47, Stefano Stabellini wrote:
> On Tue, 9 Feb 2021, Bertrand Marquis wrote:
>> Hi Stefano,
>>
>>> On 8 Feb 2021, at 23:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> PCI buses differ from default buses in a few important ways, so it is
>>> important to detect them properly. Normally, PCI buses are expected to
>>> have the following property:
>>>
>>>     device_type = "pci"
>>>
>>> In reality, it is not always the case. To handle PCI bus nodes that
>>> don't have the device_type property, also consider the node name: if the
>>> node name is "pcie" or "pci" then consider the bus as a PCI bus.
>>>
>>> This commit is based on the Linux kernel commit
>>> d1ac0002dd29 "of: address: Work around missing device_type property in
>>> pcie nodes".
>>>
>>> This fixes Xen boot on RPi4.
I am a bit confused with this sentence... How did you manage to boot Xen 
on RPi4 before hand?

>>
>> We are really handling here a wrong device-tree bug that could easily be fixed
>> by the user.
>> We should at least mention in the commit message that this is a workaround
>> to solve RPi4 buggy device tree.
> 
> Not sure if it can be "easily" fixed by the user -- it took me a few
> hours to figure out what the problem was, and I know Xen and device tree
> pretty well :-)
> 
> Yes it would be good to have a link to the discussion in the commit
> message, using the Link tag. It could be done on commit, or I can add it
> to the next version.

A summary of the discussion would be useful in the commit message so a 
reader can easily make the connection between the Linux commit and the 
Xen one.

> 
> Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.com/
> 
> 
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>> index 18825e333e..f1a96a3b90 100644
>>> --- a/xen/common/device_tree.c
>>> +++ b/xen/common/device_tree.c
>>> @@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
>>>   * PCI bus specific translator
>>>   */
>>>
>>> +static bool_t dt_node_is_pci(const struct dt_device_node *np)
>>> +{
>>> +    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
>>
>> The Linux commit is a bit more restrictive and only does that for “pcie”.
>> Any reason why you also want to have this workaround done also for “pci” ?
> 
> Yes, that's because in our case the offending node is named "pci" not
> "pcie" so the original Linux commit wouldn't cover it.
> 
> 
>>> +
>>> +    if (is_pci)
>>> +        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_name);
>>> +
>>> +    return is_pci;
>>> +}
>>> +
>>> static bool_t dt_bus_pci_match(const struct dt_device_node *np)
>>> {
>>>      /*
>>>       * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen PCI
>>>       * powermacs "ht" is hypertransport
>>> +     *
>>> +     * If none of the device_type match, and that the node name is
>>> +     * "pcie" or "pci", accept the device as PCI (with a warning).
>>>       */
>>>      return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
>>> -        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
>>> +        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
>>> +        dt_node_is_pci(np);
>>> }
>>>
>>> static void dt_bus_pci_count_cells(const struct dt_device_node *np,
>>>
>>

-- 
Julien Grall

