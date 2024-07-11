Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8E92E513
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 12:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757306.1166141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrNx-0003UY-Fp; Thu, 11 Jul 2024 10:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757306.1166141; Thu, 11 Jul 2024 10:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrNx-0003Q8-Cb; Thu, 11 Jul 2024 10:50:49 +0000
Received: by outflank-mailman (input) for mailman id 757306;
 Thu, 11 Jul 2024 10:50:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sRrNw-0003Pw-Cp
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 10:50:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRrNu-0007LT-Ji; Thu, 11 Jul 2024 10:50:46 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRrNu-0000pa-Cn; Thu, 11 Jul 2024 10:50:46 +0000
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
	bh=7VTSPuu60BNhuuXJ/4jzz0eTkvHWFK4E7NHMG8d/698=; b=b0JWoLN8voKhNi/Nb43JwtIkps
	uw+WRBDcGfI0GLMAay8dKYgA0i1IyBZkyzpLE3HoCL9Dceo3GxwrPHyxpSH7MLsaLK0O/ePllymi+
	saPdWK4NVpN5OrqoQ8QlWT2C3mUfZ+Iqgfxg4D9Ndtk1WNK3eDBP5f08/MfLh1lAgh2U=;
Message-ID: <5b97113d-12f7-4051-88da-f08bb9cb3a70@xen.org>
Date: Thu, 11 Jul 2024 11:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/07/2024 10:40, Oleksii wrote:
> On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
>> On 03.07.2024 12:42, Oleksii Kurochko wrote:
>>> Except mapping of FDT, it is also printing command line passed by
>>> a DTB and initialize bootinfo from a DTB.
>>
>> I'm glad the description isn't empty here. However, ...
>>
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -41,6 +41,9 @@ FUNC(start)
>>>   
>>>           jal     setup_initial_pagetables
>>>   
>>> +        mv      a0, s1
>>> +        jal     fdt_map
>>> +
>>>           /* Calculate proper VA after jump from 1:1 mapping */
>>>           la      a0, .L_primary_switched
>>>           sub     a0, a0, s2
>>
>> ... it could do with clarifying why this needs calling from assembly
>> code. Mapping the FDT clearly looks like something that wants doing
>> from start_xen(), i.e. from C code.
> fdt_map() expected to work while MMU is off as it is using
> setup_initial_mapping() which is working with physical address.

Somewhat related to what Jan is asking. You only seem to part the FDT in 
start_xen(). So why do you need to call fdt_map() that early?

Cheers,

-- 
Julien Grall

