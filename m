Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AF87C22D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 18:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693426.1081486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkp5l-0003bC-Q6; Thu, 14 Mar 2024 17:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693426.1081486; Thu, 14 Mar 2024 17:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkp5l-0003YM-N8; Thu, 14 Mar 2024 17:42:09 +0000
Received: by outflank-mailman (input) for mailman id 693426;
 Thu, 14 Mar 2024 17:42:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkp5k-0003YA-Ny
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 17:42:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkp5k-0005wC-I3; Thu, 14 Mar 2024 17:42:08 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkp5k-0004nv-Ck; Thu, 14 Mar 2024 17:42:08 +0000
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
	bh=c3AsWHz2USgxH1IKQ+QX4M/AebETs5dzS7i+IGBC/Ss=; b=C5mbov6kZMTAmu5UxT7OsYmQsU
	iFuUWUNBzqOukpyDekcml7np23zP0lVnVnbMCEQSmxa+kbjL6fIVdfu9hUxPHNPkXxqkxarp3cDtJ
	kR5Eg7Z0GtiTOgjozVRiQgmQEnNsu/lKjVuriKE3STULDEMcbwB01ahHZo3R0cWa196s=;
Message-ID: <a28855d9-69ba-4cea-849d-e3e99cd7ff18@xen.org>
Date: Thu, 14 Mar 2024 17:42:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.MD: Fix matrix generation after 43c416d0d819 and
 77c39a53cf5b
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, ayan.kumar.halder@amd.com,
 Julien Grall <jgrall@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240314173929.12040-1-julien@xen.org>
 <fdb6c565-b846-434d-8f4f-fd6cba4d17e3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fdb6c565-b846-434d-8f4f-fd6cba4d17e3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/03/2024 17:41, Andrew Cooper wrote:
> On 14/03/2024 5:39 pm, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The script docs/support-matrix-generate throw the following error on the
>> latest staging.
>>
>> MDCCSR_EL0
>> DBGDTR_EL0
>> DBGDTRTX_EL0
>> DBGDTRRX_EL0
>> DBGDSCRINT
>> DBGDTRTXINT
>> DBGDTRRXINT
>> ^ cannot parse status codeblock line:
>> MDCCSR_EL0
>>   ? at docs/parse-support-md line 172, <F> chunk 1.
>>
>> With the current indentation, it looks like the script thinks this is
>> a status code block.
>>
>> Solve the issue by switching to a bullet list.
>>
>> Fixes: 43c416d0d819 ("xen/arm: arm64: Add emulation of Debug Data Transfer Registers")
>> Fixes: 77c39a53cf5b ("xen/arm: arm32: Add emulation of Debug Data Transfer Registers")
>> ---
> 
> You need a SoB somewhere, but Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Whoops yes:

Signed-off-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

