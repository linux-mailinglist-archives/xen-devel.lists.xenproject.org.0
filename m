Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0864C7C87FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 16:42:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616592.958727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJMQ-0005Rk-GE; Fri, 13 Oct 2023 14:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616592.958727; Fri, 13 Oct 2023 14:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJMQ-0005PW-De; Fri, 13 Oct 2023 14:41:54 +0000
Received: by outflank-mailman (input) for mailman id 616592;
 Fri, 13 Oct 2023 14:41:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrJMO-0005PQ-ET
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 14:41:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrJMN-00035l-9k; Fri, 13 Oct 2023 14:41:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrJMN-0002Ux-1x; Fri, 13 Oct 2023 14:41:51 +0000
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
	bh=mbJFrt1Pz/vTc4M/fkhaUGTqdP4+e9AIrpzssAF0ctw=; b=SvkGvjvJOC+i+eJXc8r/udGCvq
	fwsz3Z9zaCgIM11hrqEr3+x9WbKsKiTZecHwhB1OyOfwZg72yEgoL6qd+TOx/DYYuY6XDQEqD9I97
	J8mOwTZoxCTIkoHGBjYfreWhyXnV1gvtGLoxkaihNHH5kEHOoaXF5XMmK6wpqF8ZOVq8=;
Message-ID: <68ca37b9-54af-4d73-8ebd-8f567b9e7969@xen.org>
Date: Fri, 13 Oct 2023 15:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18][PATCH v2] x86/amd: Address AMD erratum #1485
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
 <42d8ac8d-522e-424a-b002-9a0508f318da@citrix.com>
 <65295541.170a0220.81347.68b5@mx.google.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65295541.170a0220.81347.68b5@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

The original e-mail didn't yet reach my inbox. So answering here as 
there are enough context.

On 13/10/2023 15:33, Alejandro Vallejo wrote:
> On Fri, Oct 13, 2023 at 09:40:52PM +0800, Andrew Cooper wrote:
>> On 13/10/2023 9:18 pm, Alejandro Vallejo wrote:
>>> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
>>> index 4f27187f92..085c4772d7 100644
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -1167,6 +1167,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>>>   	if (c->x86 == 0x10)
>>>   		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
>>>   
>>> +	/* Fix for AMD erratum #1485 */
>>> +	if (!cpu_has_hypervisor && c->x86 == 0x19 && is_zen4_uarch()) {
>>> +		rdmsrl(MSR_AMD64_BP_CFG, value);
>>> +		#define ZEN4_BP_CFG_SHARED_BTB_FIX (1ull << 5)

You are introducing a violation to MISRA Rule 7.3 [1] which was accepted 
recently. You want to use 1ULL rather than the lower case version.

[1] 
https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_03.c

Cheers,

-- 
Julien Grall

