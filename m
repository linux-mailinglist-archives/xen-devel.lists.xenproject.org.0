Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC67295C9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545782.852348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YhQ-0001Lc-1j; Fri, 09 Jun 2023 09:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545782.852348; Fri, 09 Jun 2023 09:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YhP-0001Jr-Uy; Fri, 09 Jun 2023 09:46:27 +0000
Received: by outflank-mailman (input) for mailman id 545782;
 Fri, 09 Jun 2023 09:46:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7YhO-0001Jl-PJ
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:46:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7YhM-0007k4-Gz; Fri, 09 Jun 2023 09:46:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7YhM-0001S2-Ab; Fri, 09 Jun 2023 09:46:24 +0000
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
	bh=GaXD/WNuFNC1Tope1mNHZbDOEHLNTi1eV9ZwIPv3J3U=; b=bZd6waMiu/GPI+l+dHzrX6V9nq
	5ZTkc2Y2KPjOSfcaB5WvTStG2wz1CXHZtnBH1aESyn9pUmSFDRqRVMJgyifYSpV4KIZb15y5z3GT2
	AcqxMK1yFh/jyIKUR+3XzCjuae7zLcfcalP2H6dZiszo7XTGNpxa9GGz2z/Be67RO1sE=;
Message-ID: <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
Date: Fri, 9 Jun 2023 10:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Shawn Anastasio <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 09/06/2023 10:43, Andrew Cooper wrote:
> On 09/06/2023 10:38 am, Jan Beulich wrote:
>> On 09.06.2023 11:29, Andrew Cooper wrote:
>>> On 09/06/2023 10:22 am, Jan Beulich wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/ppc/boot_of.c
>>>>> @@ -0,0 +1,122 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> By default we mean to use ...
>>>>
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/ppc/early_printk.c
>>>>> @@ -0,0 +1,36 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> ... the more modern form of this (GPL-2.0-only). Anything deviating from
>>>> that may want justifying in the description.
>>> GPL-2.0-or-later is fine.
>> Hmm, I was merely following
>> https://lists.xen.org/archives/html/xen-devel/2023-06/msg00415.html.
>> The text at the top of ./COPYING looks to suggest -only, and I'm
>> unaware of any other place where our default is actually written down.
> 
> The license is chosen by the submitter/copyright holder, based on their
> preferences/wishes.
> 
> It's fine for Xen to say "if you've got no vested interest, we recommend
> GPL-2.0-only", but that is strictly a recommendation and no more.
> 
> If the submitter chooses GPL-2.0-or-later, that is their prerogative.
> We have plenty of GPL-2.0-or-later code in Xen.

 From my past experience, the submitters tend to just copy the license 
from an existing file in Xen rather than explicitly choosing it. So I 
think it is fair to ask the question because our original and default 
license is GPLv2 nor GPLv2+.

Cheers,

-- 
Julien Grall

