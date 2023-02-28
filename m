Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4456A5E6A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503642.775970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX463-0001BL-4i; Tue, 28 Feb 2023 17:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503642.775970; Tue, 28 Feb 2023 17:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX463-00017t-1U; Tue, 28 Feb 2023 17:49:03 +0000
Received: by outflank-mailman (input) for mailman id 503642;
 Tue, 28 Feb 2023 17:49:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pX460-00017j-QJ
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:49:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pX460-0008DV-1U; Tue, 28 Feb 2023 17:49:00 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.216]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pX45z-0005WB-PJ; Tue, 28 Feb 2023 17:48:59 +0000
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
	bh=D0aPMIK7eB1gZTgJIWG/ri37Z8vUj9fxtEepC5SrDpM=; b=YupIBKniiEveDAG95KIuItm9rL
	64b8SXeWSJDwDxXDhGAfDXPPg09W2xwo5uIXm5bkU5zJQL6fvJRE4BWiEwRpJmhDLbnyJHbZJksTW
	6XTN5Qpa59UC8CU3FfiTBC3OGju16l6jgiM7DVpeOiujfXeoBu53PbndIF4E4d6C4at8=;
Message-ID: <46e96dd9-bcb4-4569-b282-05c019cabcc3@xen.org>
Date: Tue, 28 Feb 2023 17:48:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
 <c0e628d744f03c70d2e7b66540ea27aa31d90043.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c0e628d744f03c70d2e7b66540ea27aa31d90043.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 28/02/2023 15:09, Oleksii wrote:
> On Sat, 2023-02-25 at 16:49 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>>> The following changes were made:
>>> * make GENERIC_BUG_FRAME mandatory for ARM
>>
>> I have asked in patch #1 but will ask it again because I think this
>> should be recorded in the commit message. Can you outline why it is
>> not
>> possible to completely switch to the generic version?
> I haven't tried to switch ARM too because of comment regarding 'i' in
> <asm/bug.h>:
> /*
>   * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set
> the
>   * flag but instead rely on the default value from the compiler). So
> the
>   * easiest way to implement run_in_exception_handler() is to pass the
> to
>   * be called function in a fixed register.
>   */

I would expect this comment to be valid for any arch. So if there is a 
need to deal with PIE, then we would not be able to use "i" in the BUG 
frame.

Note that we are now explicitly compiling Xen without PIE (see Config.mk).

Cheers,

-- 
Julien Grall

