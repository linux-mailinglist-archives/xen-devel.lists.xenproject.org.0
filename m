Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411929CFB8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 12:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13565.34233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXjh0-0001E3-Hu; Wed, 28 Oct 2020 11:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13565.34233; Wed, 28 Oct 2020 11:32:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXjh0-0001De-EG; Wed, 28 Oct 2020 11:32:38 +0000
Received: by outflank-mailman (input) for mailman id 13565;
 Wed, 28 Oct 2020 11:32:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXjgz-0001DW-9G
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:32:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17b7a1e1-20c6-44a1-a28a-fbe40cd03ace;
 Wed, 28 Oct 2020 11:32:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXjgw-0008CQ-TW; Wed, 28 Oct 2020 11:32:34 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXjgw-0004J2-JB; Wed, 28 Oct 2020 11:32:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXjgz-0001DW-9G
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:32:37 +0000
X-Inumbo-ID: 17b7a1e1-20c6-44a1-a28a-fbe40cd03ace
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 17b7a1e1-20c6-44a1-a28a-fbe40cd03ace;
	Wed, 28 Oct 2020 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8TqnBbQSf5YysIeqnRqr4I+OKNKS396o2cuIBGvRYDE=; b=NEs9lfuTSDF+tZmdfW4KfpAhX9
	qMC7rv7HKT0CuS1XPgYOMkP2DWQuvbTt6i/9dwNjG5zN5SwSDw4eY/l1305Ump5VEjZzNsR+FR19Y
	xUPx0Dqc2ZKBSbI3m6l+HgqMaP2JiqpoZsLASK3Og+8gUVx7GYSUoOZqAsspqYzbtWoA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXjgw-0008CQ-TW; Wed, 28 Oct 2020 11:32:34 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXjgw-0004J2-JB; Wed, 28 Oct 2020 11:32:34 +0000
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
To: Rahul Singh <Rahul.Singh@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
 <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
 <53C69BD9-716C-4ECF-8287-75C435C561CE@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <749813e0-0b04-0ecf-5dc6-96cfe53c786b@xen.org>
Date: Wed, 28 Oct 2020 11:32:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <53C69BD9-716C-4ECF-8287-75C435C561CE@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/10/2020 10:41, Rahul Singh wrote:
>> On 28 Oct 2020, at 7:18 am, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.10.2020 00:32, Stefano Stabellini wrote:
>>> On Mon, 26 Oct 2020, Rahul Singh wrote:
>>>> --- a/xen/drivers/char/Kconfig
>>>> +++ b/xen/drivers/char/Kconfig
>>>> @@ -4,6 +4,13 @@ config HAS_NS16550
>>>> 	help
>>>> 	  This selects the 16550-series UART support. For most systems, say Y.
>>>>
>>>> +config HAS_NS16550_PCI
>>>> +	bool "NS16550 UART PCI support" if X86
>>>> +	default y
>>>> +	depends on X86 && HAS_NS16550 && HAS_PCI
>>>> +	help
>>>> +	  This selects the 16550-series UART PCI support. For most systems, say Y.
>>>
>>> I think that this should be a silent option:
>>> if HAS_NS16550 && HAS_PCI && X86 -> automatically enable
>>> otherwise -> automatically disable
>>>
>>> No need to show it to the user.
>>
>> I agree in principle, but I don't see why an X86 dependency gets
>> added here. HAS_PCI really should be all that's needed.
>>
> 
> Yes you are right . I will remove the X86 and make HAS_NS16550_PCI depend on "HAS_NS16550 && HAS_PCI"

There are quite a bit of work to make the PCI part of the implementation 
build on Arm because the code refer to x86 functions.

While in theory, an NS16550 PCI card could be used on Arm, there is only 
a slim chance for an actual users. So I am not convinced the effort is 
worth it here.

Cheers,

-- 
Julien Grall

