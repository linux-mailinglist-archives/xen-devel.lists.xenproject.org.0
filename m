Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72F2FCD78
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 10:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71295.127567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29q3-0000Gj-T9; Wed, 20 Jan 2021 09:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71295.127567; Wed, 20 Jan 2021 09:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29q3-0000GK-Pj; Wed, 20 Jan 2021 09:31:43 +0000
Received: by outflank-mailman (input) for mailman id 71295;
 Wed, 20 Jan 2021 09:31:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l29q2-0000GD-3u
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:31:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l29q1-0005Mn-My; Wed, 20 Jan 2021 09:31:41 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l29q1-0002cW-E8; Wed, 20 Jan 2021 09:31:41 +0000
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
	bh=n977aq/FqRup/y4C3IjQa7BlMB0mbroFYAvCy2BguTE=; b=c2HjrrSqVJTKmguuPvkLFPQfCS
	KePfcnvmBlOh8wEtvzA7ZrZgffKcjmVIeo8jud3RrPAeFxUSyp5KYWdkvUNMO5D3HObIChT8ezSrX
	WMqPmApxeXzcXBSWVp9LnTf5udmbvly4+QJkkCoe5NVhwuNfBonV3QIIDPkAkO67biaM=;
Subject: Re: [PATCH V4 05/24] xen/ioreq: Make x86's
 hvm_ioreq_needs_completion() common
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-6-git-send-email-olekstysh@gmail.com>
 <87v9bst29r.fsf@linaro.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7c05fcd2-f85b-5f5a-1be9-237d8fdc715f@xen.org>
Date: Wed, 20 Jan 2021 09:31:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87v9bst29r.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Alex,

On 20/01/2021 08:48, Alex Bennée wrote:
> 
> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
> 
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and this helper will be used
>> on Arm as is. Move it to xen/ioreq.h and remove "hvm" prefix.
>>
>> Although PIO handling on Arm is not introduced with the current series
>> (it will be implemented when we add support for vPCI), technically
>> the PIOs exist on Arm (however they are accessed the same way as MMIO)
>> and it would be better not to diverge now.
> 
> I find this description a little confusing. When you say PIO do you mean
> using instructions like in/out on the x86? If so then AFAIK it's a
> legacy feature of x86 as everything I've come across since just does
> MMIO, including PCI.

Stefano and I had quite a long discussion about this a few months ago 
(see [1]).

 From my understanding, while Arm will access the PCI I/O BAR via MMIO, 
the BAR itself will be configured using an offset from a fixed I/O 
window base address. IOW, we don't configure the BAR with a full MMIO 
address.

In the case the hostbridge is emulated in Xen, I would like to re-use 
the TYPE_PIO for such access because it makes the device model 
arch-agnostic.

I believe this would behave the same way as a real PCI device card: you 
can plug it anywhere without having to understand the underlying 
architecture.

If we were going to use the MMIO type, then we would need:
   1) Inform each device model where is the I/O Window (necessary to be 
able to know we are accessing the I/O BAR)
   2) Have arch boiler plate in the device model

> 
> The code changes look fine to me though:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

Cheers,

[1] <4cbe37bd-abd2-3d02-535e-cca6f7497ef2@xen.org>


-- 
Julien Grall

