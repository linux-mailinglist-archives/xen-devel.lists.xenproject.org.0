Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F806A5E86
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 19:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503654.775991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4Hq-0004pZ-I7; Tue, 28 Feb 2023 18:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503654.775991; Tue, 28 Feb 2023 18:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4Hq-0004ng-FF; Tue, 28 Feb 2023 18:01:14 +0000
Received: by outflank-mailman (input) for mailman id 503654;
 Tue, 28 Feb 2023 18:01:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pX4Ho-0004nY-M1
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 18:01:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pX4Hn-00006T-P6; Tue, 28 Feb 2023 18:01:11 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.216]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pX4Hn-0006B3-IZ; Tue, 28 Feb 2023 18:01:11 +0000
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
	bh=3UgDBcuYZzBJsRE5VwJpCU+X0WiKQph0t+dGM52vbbk=; b=pwqV0+KFzbrTCloKPnayJdqm7Q
	MtsiBb4ZPTWkdpjRypuVPtwhXWHoeg2PLQbH1I5hfyFOADQfNZK/P9HTQc6jLot+CZv7T6JRVRTxX
	ZFcfpmfQSbloq7sbthN5XhMFhywQpVzFoV2V++lNMp6FIspPvNy8wRejFLe6kcexWw/0=;
Message-ID: <e4ccf8fc-12d5-686b-5ffd-cf0c2107e9cf@xen.org>
Date: Tue, 28 Feb 2023 18:01:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
 <8734edd9-70eb-b2bd-8763-b7468d7caba3@xen.org>
 <bf97a55d3e6635666090d06e3affa38c7c45b6d6.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bf97a55d3e6635666090d06e3affa38c7c45b6d6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/02/2023 17:21, Oleksii wrote:
> Hi Julien,

Hi Oleksii,
>>> +
>>> +            for ( i = 0, b = region->frame[id].bugs;
>>> +                  i < region->frame[id].n_bugs; b++, i++ )
>>> +            {
>>> +                if ( bug_loc(b) == pc )
>>> +                {
>>> +                    bug = b;
>>> +                    goto found;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> + found:
>>> +    if ( !bug )
>>> +        return -EINVAL;
>>> +
>>> +    if ( id == BUGFRAME_run_fn )
>>> +    {
>>> +#ifdef BUG_FN_REG
>>> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs-
>>>> BUG_FN_REG;
>>
>> AFAIU, this is necessary so Arm can use the generic do_bug_frame().
>>
>> I was under the impression that RISC-V and Arm had the similar issue
>> with %c. It seems like you managed to resolve it on RISC-V, so can we
>> fully switch Arm to the generic implementation of bug?
> I tried to switch ARM to generic implementation.
> 
> Here is the patch: [1]

I have replied on the other thread.
>>> +#ifndef BUG_ASM_CONST
>>> +#define BUG_ASM_CONST ""
>>> +#endif
>>
>> This line is a bit misterious to me. Would you be able to outline why
>> an
>> architecture would override this?
> It is needed in case if compiler for an architecture doesn't have
> proper support of '%c' ( it is so for ARM & RISC-V )

Hmmm.... Why can't x86 use the same version? IOW what's the benefits to 
differ on x86?

Anyway, documentation is always good to have because it helps the 
reader/reviewer to understand how such decision was made.

Cheers,

-- 
Julien Grall

