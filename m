Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A182B8060
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30044.59764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPLY-000372-Mj; Wed, 18 Nov 2020 15:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30044.59764; Wed, 18 Nov 2020 15:26:12 +0000
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
	id 1kfPLY-00036d-JS; Wed, 18 Nov 2020 15:26:12 +0000
Received: by outflank-mailman (input) for mailman id 30044;
 Wed, 18 Nov 2020 15:26:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfPLW-00036Y-Dk
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:26:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfPLV-0003lK-2l; Wed, 18 Nov 2020 15:26:09 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfPLU-00074o-SS; Wed, 18 Nov 2020 15:26:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPLW-00036Y-Dk
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=O7LyMIkIfQbqsa+O5wB6y8CzGAuhic2WtHR2zN0NROI=; b=GO4mFFHmkY2ldj1mS1hD7TM+8o
	TIh7p0VfEM4TAaTLAoU+NaNXchFMtUHRV8rDhwdoN0Pxj+d2AJVz3jZBuweESxq/zE9cQuFrksE8U
	nISw8VNETyjL2aCPrMFpHgMFiUfGlNZw05oJNFbpZiYEUsg9lx8PJphfGjilK21ds/nM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPLV-0003lK-2l; Wed, 18 Nov 2020 15:26:09 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPLU-00074o-SS; Wed, 18 Nov 2020 15:26:09 +0000
Subject: Re: [PATCH v2] xen/arm: Add workaround for Cortex-A76/Neoverse-N1
 erratum #1286807
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20201116121140.26763-1-michal.orzel@arm.com>
 <c7475d91-c956-3e2c-4445-ef5c005ff465@xen.org>
 <d6d632b2-eba7-1746-d398-2bd539a51caf@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1fe61e2f-a6fc-c1c8-2f29-0c62cc73cb3c@xen.org>
Date: Wed, 18 Nov 2020 15:26:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <d6d632b2-eba7-1746-d398-2bd539a51caf@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/11/2020 07:12, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 17.11.2020 18:30, Julien Grall wrote:
>> Hi Michal,
>>
>> On 16/11/2020 12:11, Michal Orzel wrote:
>>> On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
>>> if a virtual address for a cacheable mapping of a location is being
>>> accessed by a core while another core is remapping the virtual
>>> address to a new physical page using the recommended break-before-make
>>> sequence, then under very rare circumstances TLBI+DSB completes before
>>> a read using the translation being invalidated has been observed by
>>> other observers. The workaround repeats the TLBI+DSB operation
>>> for all the TLB flush operations on purpose.
>>
>> Sorry for nitpicking, the commit message should contain enough information for future reader to understand why this was done "on purpose".
>>
>> So how about:
>>
>> "The workaround repeats the TLBI+DSB operation for all the TLB flush operations. While this is stricly not necessary, we don't want to take any risk.".
>>
>> I can fix it on commit.
>>
> Ok I agree to add this extra clarification.
> Please go on and fix it on commit/etc.

Thanks. I have committed now with an extra small change (I hope that's 
fine). I decided to not add the extra-clarification in the Kconfig for 
two reasons:
  1) The description is already pretty long and I wanted to keep it 
short. A more user interested with the workaround would likely go and 
read the code.
  2) There are a risk the description will get desynchronized in the 
future. So better to keep the justification close to the implementation.

Cheers,

-- 
Julien Grall

