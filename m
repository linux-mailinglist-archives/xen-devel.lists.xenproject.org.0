Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9E33D5C9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98309.186386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAk9-0008Lt-Bq; Tue, 16 Mar 2021 14:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98309.186386; Tue, 16 Mar 2021 14:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAk9-0008LU-8a; Tue, 16 Mar 2021 14:32:21 +0000
Received: by outflank-mailman (input) for mailman id 98309;
 Tue, 16 Mar 2021 14:32:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMAk7-0008LP-HL
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:32:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAk2-0004jR-7o; Tue, 16 Mar 2021 14:32:14 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAk1-00011s-Vm; Tue, 16 Mar 2021 14:32:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=P38jW0ZrUc4mgSmrD2bRZCVC/piTf3mnY1PCdJqr4yA=; b=VfXg7Cio5cfhlpUljWStQBUwUI
	2ChnFh+yjKCCi5slEyXqmU4bhS6pnAwJas/MQOdZwIeac1LDBy8bJp7C4fzDIWNvM47vkBRBAZGDi
	aJUKnRR3L1v+KaQfRSF6xsaVVD8fXV23zWTocNPeyWq8rp4GV96PZ3eMgreJrby3Xso8=;
Subject: Re: [PATCH for-4.15 v2] xen: Bump the minimum version of GCC
 supported to 4.9 for arm32 and 5.1 on arm64
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210313134158.24363-1-julien@xen.org>
 <24655.19838.973233.143341@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <56403f29-5ee3-97f3-1a74-34254669adb4@xen.org>
Date: Tue, 16 Mar 2021 14:32:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24655.19838.973233.143341@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 15/03/2021 12:05, Ian Jackson wrote:
> Julien Grall writes ("[PATCH for-4.15 v2] xen: Bump the minimum version of GCC supported to 4.9 for arm32 and 5.1 on arm64"):
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Compilers older than 4.8 have known codegen issues which can lead to
>> silent miscompilation:
>>
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
>>
>> Furthermore, pre-4.9 GCC have known bugs (including things like
>> internal compiler errors on Arm) which would require workaround (I
>> haven't checked if we have any in Xen).
>>
>> The minimum version of GCC to build the hypervisor on arm is now
>> raised to 4.9.
>>
>> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
>> shown to emit memory references beyond the stack pointer, resulting in
>> memory corruption if an interrupt is taken after the stack pointer has
>> been adjusted but before the reference has been executed.
>>
>> Therefore, the minimum for arm64 is raised to 5.1.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks! I have committed the patch with Bertrand and Stefano's reviewed-by.

Cheers,

-- 
Julien Grall

