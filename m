Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA331FB2A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86902.163449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD72v-0004CK-Vj; Fri, 19 Feb 2021 14:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86902.163449; Fri, 19 Feb 2021 14:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD72v-0004Bx-Ru; Fri, 19 Feb 2021 14:46:17 +0000
Received: by outflank-mailman (input) for mailman id 86902;
 Fri, 19 Feb 2021 14:46:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lD72u-0004Bs-7g
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:46:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lD72s-0002F3-Ob; Fri, 19 Feb 2021 14:46:14 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lD72s-0000h0-Gk; Fri, 19 Feb 2021 14:46:14 +0000
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
	bh=v2y+ymMSDQX82piVPwjU1Es9uWoU4rS0eoNMp1/EwQc=; b=J4AqVIV/pSle2KRvPPw/UG2KHK
	KbC3wfFxxrBhNIfbfww9q/u0KsjcqXikvlLJhK4iJ8NE6bkdxm8Aa9IwFl2m2IZLq9bBcsw1uco1l
	zqA9HjGurjczOVNEeY7iZebDPH4FoPcOSVv6MH/824qSWn+xrRwk0EDR1z+BJuKY9hE4=;
Subject: Re: [PATCH] xen/arm : smmuv3: Fix to handle multiple StreamIds per
 device.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, iwj@xenproject.org
References: <43de5b58df37d8b8de037cb23c47ab8454caf37c.1613492577.git.rahul.singh@arm.com>
 <5145C563-A8AA-41B1-8EBB-B32D1FFC2219@arm.com>
 <alpine.DEB.2.21.2102171522420.3234@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <32e14e21-86de-9c74-e94a-ff29bda56b3a@xen.org>
Date: Fri, 19 Feb 2021 14:46:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102171522420.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 17/02/2021 23:23, Stefano Stabellini wrote:
> +IanJ
> 
> On Wed, 17 Feb 2021, Bertrand Marquis wrote:
>> Hi Rahul,
>>
>>
>>> On 17 Feb 2021, at 10:05, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>>
>>> SMMUv3 driver does not handle multiple StreamId if the master device
>>> supports more than one StreamID.
>>>
>>> This bug was introduced when the driver was ported from Linux to XEN.
>>> dt_device_set_protected(..) should be called from add_device(..) not
>>> from the dt_xlate(..).
>>>
>>> Move dt_device_set_protected(..) from dt_xlate(..) to add_device().
>>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Thanks a lot, this is fixing issues with multiple stream ids for one device :-)
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>>> ---
>>> This patch is a candidate for 4.15 as without this patch it is not possible to
>>> assign multiple StreamIds to the same device when device is protected behind
>>> SMMUv3.
> 
> I agree especially considering that the impact is limited to smmu-v3.c.

SMMUv3 is in tech preview, so the risk is pretty low as we don't support 
it :).

But, a release ack from Ian is not necessary until tonight (19th 
February) for bug fixes. So I have committed the patch.

Cheers,

-- 
Julien Grall

