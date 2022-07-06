Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2EC568083
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361920.591694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zr9-0005aa-B3; Wed, 06 Jul 2022 07:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361920.591694; Wed, 06 Jul 2022 07:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zr9-0005YZ-83; Wed, 06 Jul 2022 07:53:55 +0000
Received: by outflank-mailman (input) for mailman id 361920;
 Wed, 06 Jul 2022 07:53:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8zr7-0005YT-T5
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:53:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8zr5-0003cZ-Tz; Wed, 06 Jul 2022 07:53:51 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8zr5-00064q-Oq; Wed, 06 Jul 2022 07:53:51 +0000
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
	bh=L6X3hOBY+bm+trshrQtoH0uqR+/T9n8UlILZkO8ZTP0=; b=2gSgaUCN3A/ZZUWWKGJdyCJ44i
	VPwzqx8Qr3gfb6XjXVIOenuXFun9i7mBeaRpUVVwPsohXGwAhCYXLz/zlgAJVpgY6/Q1kvnDN2KgV
	gi9A2j9ENb6x7hN7TMVccipP2ifeJkeUQegJoxPn01KzUFlxQtrC0mdqWtJftcQl3xfc=;
Message-ID: <14334329-baf8-5b71-5a48-421e2b6652b5@xen.org>
Date: Wed, 6 Jul 2022 08:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <osstest-171511-mainreport@xen.org>
 <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 06/07/2022 07:44, Jan Beulich wrote:
> On 06.07.2022 05:39, osstest service owner wrote:
>> flight 171511 xen-unstable-smoke real [real]
>> flight 171517 xen-unstable-smoke real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/171511/
>> http://logs.test-lab.xenproject.org/osstest/logs/171517/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 171486
> 
> Looking at what's under test, I guess ...
> 
>> commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
>> Author: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Date:   Tue Jul 5 13:10:46 2022 +0200
>>
>>      EFI: preserve the System Resource Table for dom0
>>      
>>      The EFI System Resource Table (ESRT) is necessary for fwupd to identify
>>      firmware updates to install.  According to the UEFI specification §23.4,
>>      the ESRT shall be stored in memory of type EfiBootServicesData.  However,
>>      memory of type EfiBootServicesData is considered general-purpose memory
>>      by Xen, so the ESRT needs to be moved somewhere where Xen will not
>>      overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
>>      which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
>>      in memory of type EfiRuntimeServicesData.
>>      
>>      Earlier versions of this patch reserved the memory in which the ESRT was
>>      located.  This created awkward alignment problems, and required either
>>      splitting the E820 table or wasting memory.  It also would have required
>>      a new platform op for dom0 to use to indicate if the ESRT is reserved.
>>      By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
>>      does not need to be modified, and dom0 can just check the type of the
>>      memory region containing the ESRT.  The copy is only done if the ESRT is
>>      not already in EfiRuntimeServicesData memory, avoiding memory leaks on
>>      repeated kexec.
>>      
>>      See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
>>      for details.
>>      
>>      Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>      Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> ... this is the most likely candidate, considering in the log all we
> see is:
> 
> Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-dirty) EFI loader
> Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
> Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
> Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
> Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
> Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.
> 
> But I guess we'll want to wait for the bi-sector to give us a more
> solid indication ...

I have tested a Xen with and without this patch this morning and can 
EFI. I haven't looked into details yet why.

Can we consider to revert it?

Cheers,

-- 
Julien Grall

