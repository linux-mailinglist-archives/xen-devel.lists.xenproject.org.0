Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CC74ADB0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560308.876130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhaV-0005Vj-Kg; Fri, 07 Jul 2023 09:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560308.876130; Fri, 07 Jul 2023 09:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhaV-0005TH-Hz; Fri, 07 Jul 2023 09:17:15 +0000
Received: by outflank-mailman (input) for mailman id 560308;
 Fri, 07 Jul 2023 09:17:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHhaT-0005TA-9w
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:17:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHhaP-0005GC-Gi; Fri, 07 Jul 2023 09:17:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHhaP-0005b0-BF; Fri, 07 Jul 2023 09:17:09 +0000
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
	bh=k5AzDJVMp4OMlcz81MhKeLLr7xa4A6nQoz6IDL90oP4=; b=s+X+dbDNJPPw2hqNlpF2xwtk7r
	I5lm3J4SUfLJ1IPzDK/p8KGtZGSsTqGOkXOjCQnZAYQKYIyXMdPAdaUX66mOn1zxMwOp00Vj2IhtJ
	aF9rkKymBDMDq/70CJDk+e08PA5oZE6jazY74tFSWe6JV6nSU9tM44hnLJrRVmhLfe64=;
Message-ID: <b4cdc12c-19e8-cc5a-a981-052800970d38@xen.org>
Date: Fri, 7 Jul 2023 10:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/6] xen/riscv: introduce function for physical offset
 calculation
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
 <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
 <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/07/2023 10:12, Oleksii wrote:
> On Thu, 2023-07-06 at 13:18 +0200, Jan Beulich wrote:
>> On 19.06.2023 15:34, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/riscv64/head.S
>>> +++ b/xen/arch/riscv/riscv64/head.S
>>> @@ -29,6 +29,8 @@ ENTRY(start)
>>>   
>>>           jal     reset_stack
>>>   
>>> +        jal     calc_phys_offset
>>> +
>>>           tail    start_xen
>>>   
>>>           .section .text, "ax", %progbits
>>
>> Since you call a C function, the code to save/restore a0/a1 needs to
>> move here (from patch 4).
> Thanks. It makes sense.
> It would be better to move save/restore a0/a1 ( from patch 4 )code
> here.
> 
> The only one reason I didn't do that before that calc_phys_offset
> doesn't touch that and it is guaranteed that it will not ( as it
> doesn't have arguments )

IIUC, the calling convention requires a0/a1 to be caller saved. So even 
if they are not used for arguments, such callee is still free to use 
them for internal purpose.

Cheers,

-- 
Julien Grall

