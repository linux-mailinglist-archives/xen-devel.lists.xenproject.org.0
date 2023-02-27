Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5DE6A462B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502737.774665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfYZ-000135-0Z; Mon, 27 Feb 2023 15:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502737.774665; Mon, 27 Feb 2023 15:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfYY-00010e-Tb; Mon, 27 Feb 2023 15:36:50 +0000
Received: by outflank-mailman (input) for mailman id 502737;
 Mon, 27 Feb 2023 15:36:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWfYX-00010Y-C0
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:36:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWfYT-0003aE-9L; Mon, 27 Feb 2023 15:36:45 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWfYT-0002Yl-2s; Mon, 27 Feb 2023 15:36:45 +0000
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
	bh=7q/y7XlNtwRnQWHCQw8XE7k+5iwVeEnMHYGAdftZyP8=; b=Jwjmg7LfehTwEyanMrXVtyh2xr
	gmdTeziu2WAU00l0u1r+yDZ/mPY5RG5g4crlUSkjFZ/35f8HEPP8TK2dOL/KsUISXaRady/brAAa5
	qtWFkoQDytoTB6LIYAr9Ft9qrih95ihVZhvW38pSZHEWt8lfAecy3r50X03WTR+oVRyY=;
Message-ID: <368cc6d8-04b4-03a9-9f95-600b564c92d1@xen.org>
Date: Mon, 27 Feb 2023 15:36:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
 <d86507fb-f1b1-3d91-e1af-967e6b40d514@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d86507fb-f1b1-3d91-e1af-967e6b40d514@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/02/2023 15:17, Jan Beulich wrote:
> On 25.02.2023 19:05, Julien Grall wrote:
>> On 24/02/2023 15:06, Oleksii Kurochko wrote:
>>> @@ -43,6 +45,11 @@ static void __init disable_fpu(void)
>>>    
>>>    void __init noreturn start_xen(void)
>>>    {
>>> +    unsigned long load_start    = (unsigned long)start;
>>> +    unsigned long load_end      = load_start + (unsigned long)(_end - _start);
>>
>> I am a bit puzzled, on top of load_addr() and linker_addr(), you wrote
>> it can't use global variable/function. But here... you are using them.
>> So how is this different?
> 
> I guess "use" means "access" (i.e. call a function or read/write a
> variable). I suppose it does not mean "take the address of".

If so, then I don't understand why we need to pass linker_start, 
linker_end in parameters for setup_initial_pages().

Cheers,

-- 
Julien Grall

