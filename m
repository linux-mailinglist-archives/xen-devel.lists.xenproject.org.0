Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C186EC7B9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525201.816246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrKl-0001M5-DD; Mon, 24 Apr 2023 08:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525201.816246; Mon, 24 Apr 2023 08:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrKl-0001J6-8x; Mon, 24 Apr 2023 08:14:03 +0000
Received: by outflank-mailman (input) for mailman id 525201;
 Mon, 24 Apr 2023 08:14:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pqrKk-0001Iw-64
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:14:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqrKj-00050e-PM; Mon, 24 Apr 2023 08:14:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqrKj-0006jF-Jy; Mon, 24 Apr 2023 08:14:01 +0000
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
	bh=kEq/jg49Uhuq/7+FNqe+k6jASHTbFCtNKGJnVJlIW38=; b=MwPSRSaH1ODDp+/zCzqErRbxqh
	xzXmXBKHbkJmaQBghQTMtfF+Qiy69mZwdzPTchWb8SwtFn1juPWZ80IovfNMCGmBzegNtYSEWcO34
	jXZC2o7YDtQvFhd24Lx12YaWWEEpMXtxoCC+NmaBr9Jf55vb5YpXAAuthM0KYcYF1R4Y=;
Message-ID: <879d527e-16b7-4e19-4864-ddace80597c8@xen.org>
Date: Mon, 24 Apr 2023 09:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 07/10] xen/arm: Restrict zeroeth_table_offset for ARM_64
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-8-ayan.kumar.halder@amd.com>
 <cc29fe9f-5df6-816f-aeee-b8a1933cf3e8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cc29fe9f-5df6-816f-aeee-b8a1933cf3e8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/04/2023 09:03, Michal Orzel wrote:
> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>
>>
>> When 32 bit physical addresses are used (ie PHYS_ADDR_T_32=y),
>> "va >> ZEROETH_SHIFT" causes an overflow.
>> Also, there is no zeroeth level page table on Arm32.
>>
>> Also took the opportunity to clean up dump_pt_walk(). One could use
>> DECLARE_OFFSETS() macro instead of declaring the declaring an array
> s/declaring the declaring/declaring/
> 
>> of page table offsets.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

