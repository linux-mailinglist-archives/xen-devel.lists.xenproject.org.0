Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78632682CC0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 13:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487628.755314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpvQ-0007tK-JZ; Tue, 31 Jan 2023 12:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487628.755314; Tue, 31 Jan 2023 12:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpvQ-0007rI-Fy; Tue, 31 Jan 2023 12:39:48 +0000
Received: by outflank-mailman (input) for mailman id 487628;
 Tue, 31 Jan 2023 12:39:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMpvP-0007rC-6E
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 12:39:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMpvO-0001zI-Fh; Tue, 31 Jan 2023 12:39:46 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMpvO-0002YK-8L; Tue, 31 Jan 2023 12:39:46 +0000
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
	bh=48mc04cykZf2e/+LVCMxoruKGZxhi/uPVfjPXSFXYT8=; b=lok78Vl/4V+u2clTmwd2PukJLZ
	hlaJSGztJZ1hi4OPO2PCqcOBsYAGVhp9wfDm65q94AtlB0DXkcctqEOMPRPUp7fBChiIb5mUHhryI
	4SC3AV0vC8Rdccbt2sujKEmw2ag8lR41BYU016ZJw7VyL/WRt6nQyGBr7PmlBekXgYC0=;
Message-ID: <a3e2a1d3-0e64-82af-53d0-8b25cd1b7580@xen.org>
Date: Tue, 31 Jan 2023 12:39:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
 <a8219b2d-a22d-63ac-5088-c33610310d6e@xen.org>
 <27469e861d4777af42b84fb637b24ed47a187647.camel@gmail.com>
 <8c0bce0b-05bd-5f4b-7b66-f6668ad34899@xen.org>
 <72a7bdfc72161144df741e3a39f628874d88debd.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72a7bdfc72161144df741e3a39f628874d88debd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31/01/2023 12:24, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> On Mon, 2023-01-30 at 22:11 +0000, Julien Grall wrote:
>> Hi,
>>
>> On 30/01/2023 11:40, Oleksii wrote:
>>> On Fri, 2023-01-27 at 14:54 +0000, Julien Grall wrote:
>>>> Hi Oleksii,
>>>>
>>>> On 27/01/2023 13:59, Oleksii Kurochko wrote:
>>>>> +static inline void wfi(void)
>>>>> +{
>>>>> +    __asm__ __volatile__ ("wfi");
>>>>
>>>> I have starred at this line for a while and I am not quite too
>>>> sure
>>>> to
>>>> understand why we don't need to clobber the memory like we do on
>>>> Arm.
>>>>
>>> I don't have an answer. The code was based on Linux so...
>>
>> Hmmm ok. It would probably wise to understand how code imported from
>> Linux work so we don't end up introducing bug when calling such
>> function.
>>
>>   From your current use in this patch, I don't expect any issue. That
>> may
>> chance for the others use.
>>
> Could you please share with me a link or explain what kind of problems
> may occur in case when we don't clobber the memory in the others use
> case during usage of "wfi" ?

I don't have a link and that's why I was asking the question here.

The concern I have is the following:

1)
    wfi();
    val = *addr;

2)
    *addr = val;
    wfi();


Is the compiler allowed to re-order the sequence so '*addr' will be read 
before 'wfi' or (for the second case) write after 'wfi'?

At the moment, I believe this is why we have the 'memory' clobber on 
Arm. But then I couldn't find any documentation implying that the 
compiler cannot do the re-ordering.

> 
> As I understand the reason for clobber the memory is to cause GCC to
> not keep memory values cached in registers across the
> assembler	instruction and not optimize stores/load to the memory.
> But current one instruction isn't expected to work with the memory so
> it should be safe enough to stall current hart ( CPU ) until an
> interrupt might need servicing.
> 
> Anyway we can change the code to:
>      __asm__ __volatile__ ("wfi" ::: "memory")
> In order to be sure that no problems will arise in the future.

As I wrote earlier, so far, I didn't suggest to change any code. I am 
simply trying to understand how this is meant to work.

One action may be that we can remove the memory clobber on Arm.

Cheers,

-- 
Julien Grall

