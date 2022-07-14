Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F9574B7C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367546.598609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBweR-0003Ck-Qi; Thu, 14 Jul 2022 11:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367546.598609; Thu, 14 Jul 2022 11:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBweR-0003AB-NW; Thu, 14 Jul 2022 11:04:59 +0000
Received: by outflank-mailman (input) for mailman id 367546;
 Thu, 14 Jul 2022 11:04:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBweQ-0003A5-FP
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:04:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBweQ-00026v-6A; Thu, 14 Jul 2022 11:04:58 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.7.239.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBweP-00079W-VZ; Thu, 14 Jul 2022 11:04:58 +0000
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
	bh=k+C4Rb4cxBkM7+iec7DRe88W2zTuy1OgOYLFKsmSElw=; b=HC6/TV5GXjy0COhkgq+CiY02WJ
	UtXAK3V2xHhnnghc6bmqvEpYP3Td16qxao1Oh2Zfb3vDTdFDi3Tzv4JdUSRBXu8wKNGf9YD28a5XI
	J37RAwm6j4jhrQcutH8OpO784V/qWvwOLBArpG2WGjIstDa2YcSPsfTjEfwMudz+0nkw=;
Message-ID: <cfe0e31c-8551-a0c0-ff37-1f0860c19f02@xen.org>
Date: Thu, 14 Jul 2022 12:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4] xen/arm: avoid overflow when setting vtimer in context
 switch
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20220706082558.1116811-1-jiamei.xie@arm.com>
 <cfb037a8-ac32-90a8-b527-d259f013e30c@xen.org>
 <0847A13D-967B-450D-85D4-3D644E821905@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0847A13D-967B-450D-85D4-3D644E821905@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 07/07/2022 16:35, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 7 Jul 2022, at 16:33, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jiamei,
>>
>> On 06/07/2022 09:25, Jiamei Xie wrote:
>>> virt_vtimer_save() will calculate the next deadline when the vCPU is
>>> scheduled out. At the moment, Xen will use the following equation:
>>> virt_timer.cval + virt_time_base.offset - boot_count
>>> The three values are 64-bit and one (cval) is controlled by domain. In
>>> theory, it would be possible that the domain has started a long time
>>> after the system boot. So virt_time_base.offset - boot_count may be a
>>> large numbers.
>>> This means a domain may inadvertently set a cval so the result would
>>> overflow. Consequently, the deadline would be set very far in the
>>> future. This could result to loss of timer interrupts or the vCPU
>>> getting block "forever".
>>> One way to solve the problem, would be to separately
>>> 1) compute when the domain was created in ns
>>> 2) convert cval to ns
>>> 3) Add 1 and 2 together
>>> The first part of the equation never change (the value is set/known at
>>> domain creation). So take the opportunity to store it in domain structure.
>>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> The commit message is my own, I would like to Bertrand or Stefano to confirm they are happy with it :).
> 
> I am ok with it so:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks. I have committed the patch.

Cheers,

-- 
Julien Grall

