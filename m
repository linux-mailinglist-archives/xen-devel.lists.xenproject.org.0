Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9A38C2B9F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 23:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720068.1123036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Xbx-0000Za-Ez; Fri, 10 May 2024 21:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720068.1123036; Fri, 10 May 2024 21:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Xbx-0000XH-Bi; Fri, 10 May 2024 21:17:01 +0000
Received: by outflank-mailman (input) for mailman id 720068;
 Fri, 10 May 2024 21:17:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5Xbw-0000XB-CD
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 21:17:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5Xbw-00071S-6T; Fri, 10 May 2024 21:17:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5Xbw-0000ho-08; Fri, 10 May 2024 21:17:00 +0000
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
	bh=7y6JqEcIu4UOJtCE5pOaee4TRfCG53EmNkxLng7PBZk=; b=TjqUKmN5VduPmwEIuXb0GOz6g5
	LZ8urIjDliGYcA3KVtXHVvoeKbvEr4INiAQlSTXX4vYITEi+756c349AcIxziOKMRyT35K72XHd6Y
	rMw89woAYAVmGfgHAZC4PkFz33OMfjY97myCNMQ8PuWAZ/piS6hnKvTONIg/H6ErKV8A=;
Message-ID: <83f234f2-d43e-4141-b447-bc53a368d81f@xen.org>
Date: Fri, 10 May 2024 22:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen: allow up to 16383 cpus
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240510141636.20543-1-jgross@suse.com>
 <9650300c-9947-4d1d-87d5-aaa6102bfabf@xen.org>
 <78fcd0d2-00fc-41ea-a531-7edbb8201dfc@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <78fcd0d2-00fc-41ea-a531-7edbb8201dfc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/2024 22:11, Andrew Cooper wrote:
> On 10/05/2024 10:08 pm, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 10/05/2024 15:16, Juergen Gross wrote:
>>> With lock handling now allowing up to 16384 cpus (spinlocks can handle
>>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
>>> the number of cpus to be configured to 16383.
>>>
>>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>>> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
>>>
>>> Add a support limit of physical CPUs to SUPPORT.md (4096 on x86, 128
>>> on ARM).
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I am a bit surprised that this is kept given you added SUPPORT.md. I'd
>> like Jan (or other x86 maintainers) to confirm they are happy with the
>> proposed x86 security supported limit the SUPPORT.md.
>>
>> For Arm (only):
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> XenServer is currently at 2k and we're waiting on this series to move to 4k.
> 
> I'm happy with this being the security statement for now.

Thanks for confirming :). Committed.

Cheers,

-- 
Julien Grall

