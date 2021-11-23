Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15A45A9CF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 18:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229850.397443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZO5-0004LU-CO; Tue, 23 Nov 2021 17:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229850.397443; Tue, 23 Nov 2021 17:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZO5-0004J7-95; Tue, 23 Nov 2021 17:15:21 +0000
Received: by outflank-mailman (input) for mailman id 229850;
 Tue, 23 Nov 2021 17:15:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpZO4-0004Gw-5e
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:15:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZO3-0008WA-LT; Tue, 23 Nov 2021 17:15:19 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZO3-0005iM-Ej; Tue, 23 Nov 2021 17:15:19 +0000
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
	bh=aCmJPDOay+dWe6SAPUu21G4TJUIxyLHk9AWXSFPDk5s=; b=JaEqhrjs/Wvpj09k2001eoWf60
	1zwfhS+pcPKyBI8zg98sWWmVH5MSIjcwrEpuRqZC6PbF4rkFuF+uA/8EyX15cAIoeDI3u5put139R
	bCzLke5pNJLRk6ewGlyd+wyf1Q3CT9KyNZM2teGvRxlI/LJ2fDjWEK8SmzTf9XYKSwOY=;
Message-ID: <7192e606-eae2-e11f-9746-ec88afd1dd25@xen.org>
Date: Tue, 23 Nov 2021 17:15:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
 <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
 <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
 <9f8e424d-ad1c-2d32-a470-68b275adf22c@xen.org>
 <0aff1bbb-eaf8-4deb-0808-d7db5f1ba8f5@epam.com>
 <ab73f2e5-11d1-7cb4-89ab-74ef5eb1d32d@xen.org>
 <bfd5d305-b315-2f6d-455d-dd3ba071d0b2@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bfd5d305-b315-2f6d-455d-dd3ba071d0b2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/11/2021 16:44, Oleksandr Andrushchenko wrote:
> On 23.11.21 18:05, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 23/11/2021 06:31, Oleksandr Andrushchenko wrote:
>>>
>>>
>>> On 22.11.21 19:17, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 22/11/2021 16:23, Oleksandr Andrushchenko wrote:
>>>>> On 22.11.21 17:29, Julien Grall wrote:
>>>>>> I would prefer to go with my way. This can be refined in the future if we find Device-Tree that matches what you wrote.
>>>>> Ok, so just to make it clear:
>>>>>     >a PCI device would always be described as a child of the hostbridges. So I would rework the 'if' to also check if the parent type is not "pci"
>>>>
>>>> That's correct. Thank you!
>>> Ok, so how about
>>>        if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") )
>>>        {
>>>            bool skip = false;
>>>
>>>            /*
>>>             * If the parent is also a "pci" device, then "linux,pci-domain"
>>>             * should already be there, so nothing to do then.
>>>             */
>>
>> This comment is a bit confusing.
> Do you have something on your mind?

Yes, explain that we only want to cover hostbridge (see my reply on the 
previous answer).

>> I think what matter if the parent is a "pci" device, then the current node must not be a hostbridge. So we can skip it.
> By skipping you only mean we do not need to add/assign "linux,pci-domain", right?

Yes.

>> However...
>>
>>>            if ( node->parent && dt_device_type_is_equal(node->parent, "pci") )
>>>                skip = true;
>>>
>>>            if ( !skip && !dt_find_property(node, "linux,pci-domain", NULL) )
>>>            {
>>> I played with a single if and it looks scary...
>>
>> ... how about introducing an helper that will return true if this node is likely an hostbridge?
> This is yet a single use of such a check: why would we need a helper and what would that
> helper do?

I like splitting code in multiple functions even if they are only called 
once because this:
   1) keeps the functions line count small
   2) easier to understand what is the purpose of the check

In fact, I would actually move the handling for "linux,pci-domain" in a 
separate helper. Something like:

/*
  * When PCI passthrough is available we want to keep the
  * "linux,pci-domain" in sync for every hostbridge.
  *
  * Xen may not have a driver for all the hostbridges. So we have
  * to write an heuristic to detect whether a device node describes
  * an hostbridge.
  *
  * The current heuristic assumes that a device is an hostbridge
  * if the type is "pci" and then parent type is not "pci".
  */
static int handle_linux_pci_domain(struct dt_device *node)
{
         if ( !is_pci_passthrough_enabled() )
           return 0;

	if ( !dt_device_type_is_equal(node, "pci") )
           return 0;

         if ( node->parent && dt_device_type_is_equal(node->parent) )
           return 0;

         if ( dt_find_property(node, "linux,pci-domain", NULL )
           return 0;

         /* Allocate and create the linux,pci-domain */
}

Cheers,

-- 
Julien Grall

