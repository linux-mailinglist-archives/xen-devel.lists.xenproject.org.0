Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5450252143A
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325520.548121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOOJ-0004lH-C3; Tue, 10 May 2022 11:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325520.548121; Tue, 10 May 2022 11:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOOJ-0004ie-7r; Tue, 10 May 2022 11:50:59 +0000
Received: by outflank-mailman (input) for mailman id 325520;
 Tue, 10 May 2022 11:50:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noOOH-0004iY-9F
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:50:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noOOG-0004bt-S7; Tue, 10 May 2022 11:50:56 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noOOG-0006lM-M0; Tue, 10 May 2022 11:50:56 +0000
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
	bh=aIIYG68/syJ4xQkdjo/1h0cXzMZTlXJWfMrMZXSSCnY=; b=kpZV5yxjXnLtSjt8mdtBw4ssJR
	Ro+EiG7hyZkCHcgxuTt7cmNpMrMkK1OOgC6RcP9VTqatO9cS9gLdyfsvYZSCG/dlPpKWBHBzMHp7A
	fc+vK8ZBKxxXrY/zd1jmJf8JoVXWg4fOF1oT4c21L7Qrwv6EhnRcjQfTRqfyJp0IXnv0=;
Message-ID: <1086632c-daba-96cc-9b3c-ef918a47f71c@xen.org>
Date: Tue, 10 May 2022 12:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <Michal.Orzel@arm.com>
References: <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
 <dd0d090d-24fd-bab5-7a30-598710bc04e5@xen.org>
 <5CD3173A-77CB-46C0-81BA-38CDFC6DF5E9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5CD3173A-77CB-46C0-81BA-38CDFC6DF5E9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/2022 12:49, Bertrand Marquis wrote:
> Hi

Hi Bertrand,

> 
>> On 9 May 2022, at 19:22, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 26/04/2022 13:38, Bertrand Marquis wrote:
>>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
>>> index 852b5f3c24..ef37cfa16f 100644
>>> --- a/xen/arch/arm/include/asm/processor.h
>>> +++ b/xen/arch/arm/include/asm/processor.h
>>> @@ -219,9 +219,11 @@
>>>                            SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>>>                            SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>>>   +#ifndef CPPCHECK
>>
>> Can you add a comment explaining why you need this check?
> 
> Sure, would the following be ok ?
> Cppcheck preprocessor is wrongly throwing the error here so disable this check for cppcheck runs

That's fine with me. I think my ack is technically sufficient here and 
Stefano tested the patch.

So will do the modification and commit it in a bit.

Cheers,

-- 
Julien Grall

