Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EA2736C51
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551817.861542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBap5-00085b-7z; Tue, 20 Jun 2023 12:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551817.861542; Tue, 20 Jun 2023 12:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBap5-00083g-3M; Tue, 20 Jun 2023 12:51:03 +0000
Received: by outflank-mailman (input) for mailman id 551817;
 Tue, 20 Jun 2023 12:51:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBap3-00083a-Q8
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:51:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaoy-00061d-HQ; Tue, 20 Jun 2023 12:50:56 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBaoy-0007IV-8p; Tue, 20 Jun 2023 12:50:56 +0000
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
	bh=2gn8dk+Qs2WZ26ptO0KEbmu9ELwGFxdQJPKPG/e2ky0=; b=ZFB/BaEdZ0Vu1ycmQ5vNXMltRI
	k32/Rq2llEV41NPCQNxzJTLXZCIKI7VkqxfPWXXPCH9YC3Q1DJKXkfoV16IJOts9CVbsre91kDga+
	wINOiyCJiFUQ3t9G5lACTq+8NGOp5XV/jM7jZo6td/emEGeYsH0EKiyCNHRHQr62hWVU=;
Message-ID: <9ce66128-5906-af48-e930-1da00610c1fa@xen.org>
Date: Tue, 20 Jun 2023 13:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 05/13] xen/common: fixed violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <8aff4bc56b29372345e828462766d803b8c9b710.1687250177.git.gianluca.luparini@bugseng.com>
 <e737bdd5-e00d-ccfa-8d40-2e6cf846ed84@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e737bdd5-e00d-ccfa-8d40-2e6cf846ed84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2023 13:43, Jan Beulich wrote:
> On 20.06.2023 12:34, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
>> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
>>
>> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> ---
>>   xen/common/device_tree.c        | 4 ++--
>>   xen/include/xen/libfdt/fdt.h    | 2 +-
>>   xen/include/xen/libfdt/libfdt.h | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> I think me and a few other people being on Cc here is attributed to the
> (misleading) title. The set of touched files fully maps to "DEVICE TREE"
> in ./MAINTAINERS afaict, which the prefix in the title would then also
> be nice to express.
> 
> That said I'm not sure whether libfdt code actually wants touching this
> way.

It doesn't want to be touched because this is code we imported as-is 
from an external project. In fact this is already part of the excluded list.

Simone, please have a look at docs/misra/exclude-list.json to check if a 
file is in-scope for MISRA.

Cheers,

-- 
Julien Grall

