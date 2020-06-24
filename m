Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB32073AE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:47:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4oM-00017H-8D; Wed, 24 Jun 2020 12:47:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ah2w=AF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jo4oK-00017B-I3
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:47:28 +0000
X-Inumbo-ID: dc0d548e-b618-11ea-80af-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc0d548e-b618-11ea-80af-12813bfff9fa;
 Wed, 24 Jun 2020 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFDHlQbWHatr6tvqmfH4BGGnAI8AYH7lG2s2IXhTm7c=; b=ztFA2DlhOmT/RWhd/hofe/8WbA
 W9Ry+CjWmYn6fknfNPwakDSt3HKsNiMjeL0vR3TiEgR+rI2Nv4022oZNkKgc3BtqEb6jOTYhn+fB7
 zCWy1jZe6hX44HNH3FjfWiHkI0NGjMzSK38kN0yDWKtVKKD0TfzXs+kDB7xiVGZTxjZE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo4oH-0001EH-UZ; Wed, 24 Jun 2020 12:47:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo4oH-0007Ro-NH; Wed, 24 Jun 2020 12:47:25 +0000
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <044c278b-e0df-e389-b21a-66c7307997c4@suse.com>
 <20200623173150.GV735@Air-de-Roger>
 <3ea0ff91-8e5c-701c-ee31-4140b247f3c9@suse.com>
 <4651b23b-ca82-a478-debd-c20cdcd3facd@xen.org>
 <ccd01544-04f7-8e34-dfdc-ccf373db3996@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6195142d-6fa3-474d-3070-f43105742e79@xen.org>
Date: Wed, 24 Jun 2020 13:47:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ccd01544-04f7-8e34-dfdc-ccf373db3996@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/06/2020 13:08, Jan Beulich wrote:
> On 24.06.2020 12:52, Julien Grall wrote:
>> Hi Jan,
>>
>> On 24/06/2020 11:05, Jan Beulich wrote:
>>> On 23.06.2020 19:32, Roger Pau Monné wrote:
>>>> On Tue, Jun 23, 2020 at 05:04:53PM +0200, Jan Beulich wrote:
>>>>> On 23.06.2020 15:52, Roger Pau Monne wrote:
>>>>>> XENMEM_acquire_resource and it's related structure is currently inside
>>>>>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
>>>>>> hypervisor or the toolstack only. This is wrong as the hypercall is
>>>>>> already being used by the Linux kernel at least, and as such needs to
>>>>>> be public.
>>>>>
>>>>> Actually - how does this work for the Linux kernel, seeing
>>>>>
>>>>>       rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>>>>>       if ( rc )
>>>>>           return rc;
>>>>>
>>>>>       rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
>>>>>       if ( rc )
>>>>>           goto out;
>>>>>
>>>>> in the function?
>>>>
>>>> It's my understanding (I haven't tried to use that hypercall yet on
>>>> FreeBSD, so I cannot say I've tested it), that xmar.domid is the
>>>> remote domain, which the functions locks and then uses
>>>> xsm_domain_resource_map to check whether the current domain has
>>>> permissions to do privileged operations against it.
>>>
>>> Yes, but that's a tool stack operation, not something the kernel
>>> would do all by itself. The kernel would only ever pass DOMID_SELF
>>> (or the actual local domain ID), I would think.
>>
>> You can't issue that hypercall directly from userspace because you need
>> to map the page in the physical address space of the toolstack domain.
>>
>> So the kernel has to act as the proxy for the hypercall. This is
>> implemented as mmap() in Linux.
> 
> Oh, and there's no generic wrapping available here, unlike for
> dmop. 

It is not clear to me the sort of generic wrapping you are referring to. 
Are you referring to a stable interface for an application?

> Makes me wonder whether, for this purpose, there should
> be (have been) a new dmop with identical functionality, to
> allow such funneling.

I am not sure how using DMOP will allow us to implement it fully in 
userspace. Do you mind expanding it?

Cheers,

-- 
Julien Grall

