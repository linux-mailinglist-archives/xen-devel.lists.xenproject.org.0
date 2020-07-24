Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65522CB82
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:54:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0xn-0002du-Pm; Fri, 24 Jul 2020 16:54:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jz0xm-0002dp-6n
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:54:26 +0000
X-Inumbo-ID: 54864a3e-cdce-11ea-8858-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54864a3e-cdce-11ea-8858-bc764e2007e4;
 Fri, 24 Jul 2020 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WWtqmrMo2elkg9mLTxYQ8fXFFW+71EuNsD/v4f+ImLM=; b=VyM+LrCf6xUTgvvLwSHYGPYw3S
 juzI5inNvOG5poqTEMizJhrocLdGqlGHRAdmt4MvEuxWLdHHBpSb8Vh0HwyzD4s4I7cKICTkMobMU
 4ytI8+RkjFT2iRry8Lb1DcmyVyecjF3f1TLHXfhlp7yIe5mC/Nj0oD3JMelQ1/4y6yQc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jz0xj-0005ED-Ay; Fri, 24 Jul 2020 16:54:23 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jz0xj-00023s-0n; Fri, 24 Jul 2020 16:54:23 +0000
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
 <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
 <980fc583-edb6-b536-f211-f6b8ea6d21a7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3e15d186-e323-613f-05a2-ee02480d74cf@xen.org>
Date: Fri, 24 Jul 2020 17:54:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <980fc583-edb6-b536-f211-f6b8ea6d21a7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 24/07/2020 17:01, Jan Beulich wrote:
> On 24.07.2020 17:15, Julien Grall wrote:
>> On 24/07/2020 15:44, Roger Pau Monné wrote:
>>>> +
>>>> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
>>>> +
>>>> +    if ( unlikely(!bridge) )
>>>> +    {
>>>> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
>>>> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
>>>
>>> I had a patch to add a custom modifier to out printf format in
>>> order to handle pci_sbdf_t natively:
>>>
>>> https://patchew.org/Xen/20190822065132.48200-1-roger.pau@citrix.com/
>>>
>>> It missed maintainers Acks and was never committed. Since you are
>>> doing a bunch of work here, and likely adding a lot of SBDF related
>>> prints, feel free to import the modifier (%pp) and use in your code
>>> (do not attempt to switch existing users, or it's likely to get
>>> stuck again).
>>
>> I forgot about this patch :/. It would be good to revive it. Which acks
>> are you missing?
> 
> It wasn't so much missing acks, but a controversy. And that not so much
> about switching existing users, but whether to indeed derive this from
> %p (which I continue to consider inefficient).

Looking at the thread, I can see you (relunctantly) acked any components 
that you are the sole maintainers. Kevin gave his acked for the vtd code 
and I gave it mine for the common code.

I would suggest to not rehash the argument unless another maintainer 
agree with your position. It loosk like to me the next step is for Roger 
(or someone else) to resend the patch so we could collect the missing 
ack (I think there is only one missing from Andrew).

Cheers,

-- 
Julien Grall

