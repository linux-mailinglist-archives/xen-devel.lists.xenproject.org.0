Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82396207187
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 12:53:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo31U-0006W5-4F; Wed, 24 Jun 2020 10:52:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ah2w=AF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jo31S-0006W0-MP
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 10:52:54 +0000
X-Inumbo-ID: d95d8750-b608-11ea-8098-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d95d8750-b608-11ea-8098-12813bfff9fa;
 Wed, 24 Jun 2020 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nATr8y40Hr5eNgzGNrrvnInLUyN2fGGQvbWdU1iGVTo=; b=OpeEbhwESls5JjtKoJr2Ggzg9O
 BRlnbV9wFG1q4Cbu/6BvKZQjpPsQGf3FkSR9e9rYOYPV/dnuyWf781XQL+WTl9nko9nZIG0vsDZsF
 qPYP6onQKFTxWfNq24JA1DUGJTDfVtRXApW7e6tqx+clNPB7ICKh0DjaiYSey3SuR05s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo31N-0007UU-Hs; Wed, 24 Jun 2020 10:52:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jo31N-0001P8-B2; Wed, 24 Jun 2020 10:52:49 +0000
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <044c278b-e0df-e389-b21a-66c7307997c4@suse.com>
 <20200623173150.GV735@Air-de-Roger>
 <3ea0ff91-8e5c-701c-ee31-4140b247f3c9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4651b23b-ca82-a478-debd-c20cdcd3facd@xen.org>
Date: Wed, 24 Jun 2020 11:52:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3ea0ff91-8e5c-701c-ee31-4140b247f3c9@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 24/06/2020 11:05, Jan Beulich wrote:
> On 23.06.2020 19:32, Roger Pau Monné wrote:
>> On Tue, Jun 23, 2020 at 05:04:53PM +0200, Jan Beulich wrote:
>>> On 23.06.2020 15:52, Roger Pau Monne wrote:
>>>> XENMEM_acquire_resource and it's related structure is currently inside
>>>> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
>>>> hypervisor or the toolstack only. This is wrong as the hypercall is
>>>> already being used by the Linux kernel at least, and as such needs to
>>>> be public.
>>>
>>> Actually - how does this work for the Linux kernel, seeing
>>>
>>>      rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>>>      if ( rc )
>>>          return rc;
>>>
>>>      rc = xsm_domain_resource_map(XSM_DM_PRIV, d);
>>>      if ( rc )
>>>          goto out;
>>>
>>> in the function?
>>
>> It's my understanding (I haven't tried to use that hypercall yet on
>> FreeBSD, so I cannot say I've tested it), that xmar.domid is the
>> remote domain, which the functions locks and then uses
>> xsm_domain_resource_map to check whether the current domain has
>> permissions to do privileged operations against it.
> 
> Yes, but that's a tool stack operation, not something the kernel
> would do all by itself. The kernel would only ever pass DOMID_SELF
> (or the actual local domain ID), I would think.

You can't issue that hypercall directly from userspace because you need 
to map the page in the physical address space of the toolstack domain.

So the kernel has to act as the proxy for the hypercall. This is 
implemented as mmap() in Linux.

Cheers,

-- 
Julien Grall

