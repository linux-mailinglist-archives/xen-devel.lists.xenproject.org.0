Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451F1519E83
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 13:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320625.541455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDVh-00035t-Ao; Wed, 04 May 2022 11:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320625.541455; Wed, 04 May 2022 11:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDVh-00033n-7J; Wed, 04 May 2022 11:49:37 +0000
Received: by outflank-mailman (input) for mailman id 320625;
 Wed, 04 May 2022 11:49:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmDVf-00033N-MJ
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 11:49:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmDVf-0003nG-Eo; Wed, 04 May 2022 11:49:35 +0000
Received: from [54.239.6.185] (helo=[192.168.21.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmDVf-0007pP-8W; Wed, 04 May 2022 11:49:35 +0000
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
	bh=iHuLg9uKVa1aHZ/vij6AprBhnuR8wdbdvE5Mk+L2ESk=; b=NO6LmjNmHV8grwa5+zqcqki+Gv
	bDjlw89Bnxa6Q4sN/3jIzhtVKSddRtLaYGmrlUCNLl7OjGx5mOJtink8mTRU2JjU8Widc05yRFZlA
	vw1gjWIOYB/f7Qieuj7aqMDQiQl3Bcz06e43/bag3+hqIe1w1dwQUra64NL8xeCsKYhE=;
Message-ID: <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
Date: Wed, 4 May 2022 12:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
 <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 04/05/2022 10:49, Bertrand Marquis wrote:
>> On 4 May 2022, at 09:20, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 04/05/2022 08:39, Bertrand Marquis wrote:
>>> Hi Julien,
>> Hi,
>>
>>>> On 3 May 2022, at 19:08, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> On 03/05/2022 10:38, Bertrand Marquis wrote:
>>>>> Sync arm64 sysreg bit shift definitions with status of Linux kernel as
>>>>> of 5.18-rc3 version (linux commit b2d229d4ddb1).
>>>>> Sync ID registers sanitization with the status of Linux 5.18-rc3 and add
>>>>> sanitization of ISAR2 registers.
>>>> Please outline which specific commits you are actually backported. This would help to know what changed, why and also keep track of the autorships.
>>>>
>>>> When possible, the changes should be separated to match each Linux commit we backport.
>>> As those are exactly identical to the linux tree, one can easily use git blame on the linux source tree to find those information if it is needed
>>
>> Well... that's possible at the cost of everyone going through Linux to understand why the changes were made. This is not very scalable.
>>
>>> I checked a bit and this is not something that was required before (for example when the cpufeature was introduced).
>>
>> If we import the full file, then we will generally don't log all the commits. However, for smaller changes, we will always mention the commit backported. There are several examples on the ML:
>>
>> - 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR allocation")
>> - 9c432b876bf5 ("x86/mwait-idle: add SPR support")
>>
>> We also recently introduced a tag "Origin:" to keep track of which commit was backported. If you want to understand the rationale, you can read this long thread:
>>
>> https://lore.kernel.org/xen-devel/0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com/
> 
> Do I understand right that it is ok for you if I push one patch mentioning all the commits done in Linux corresponding to the changes (instead of one patch per commit) ?

For this case yes.

Cheers,

-- 
Julien Grall

