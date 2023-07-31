Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC747699D4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573117.897510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQU5r-00063O-AK; Mon, 31 Jul 2023 14:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573117.897510; Mon, 31 Jul 2023 14:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQU5r-00060q-7Y; Mon, 31 Jul 2023 14:41:55 +0000
Received: by outflank-mailman (input) for mailman id 573117;
 Mon, 31 Jul 2023 14:41:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQU5q-00060k-55
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:41:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQU5p-00028Y-6k; Mon, 31 Jul 2023 14:41:53 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.23.92]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQU5o-0003EZ-W8; Mon, 31 Jul 2023 14:41:53 +0000
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
	bh=lna8YsVuLUxyqSQZgnoloZa/ZR80uey4Xv3wHeLWMio=; b=PgeWr7WK2N+VZ4jtKIHwr5teTN
	L8NE8zRX5vc6gE9H4vEwdssNdOw2ffxlVASj8ZnYYpjPintq2W/qE7n9vCra/VOnZLDMWX3W5zeFf
	526/YXqQnmoCmtOOdktSt2PSQgnCXpU0UndAwwXyjzw3cpdDGXpiX0FqroQaktKpSrPQ=;
Message-ID: <e7ccf9f2-e903-70f6-9975-897f890cb808@xen.org>
Date: Mon, 31 Jul 2023 15:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: mechanical renaming to address MISRA C:2012
 Rule 5.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <164303a2b19336a0e5f934a995d2a9c104035fab.1689952914.git.nicola.vetrini@bugseng.com>
 <ae4beda6-bb2d-b494-bc06-ce6475bf3624@xen.org>
 <1313523656e1573a189e73bf4d6a0fc0@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1313523656e1573a189e73bf4d6a0fc0@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/07/2023 13:14, Nicola Vetrini wrote:
> On 21/07/2023 17:54, Julien Grall wrote:
>> Hi,
>>
>> On 21/07/2023 16:22, Nicola Vetrini wrote:
>>> Rule 5.3 has the following headline:
>>> "An identifier declared in an inner scope shall not hide an
>>> identifier declared in an outer scope"
>>>
>>> The function parameters renamed in this patch are hiding a variable 
>>> defined
>>> in an enclosing scope or a function identifier.
>>>
>>> The following renames have been made:
>>> - s/guest_mode/guest_mode_on/ to distinguish from function 'guest_mode'
>>> - s/struct module_name/struct module_info to distinguish from the 
>>> homonymous
>>
>> Typo: Missing '/' after 'module_info'.
>>
>>> parameters, since the structure contains more information than just 
>>> the name.
>>> - s/file_name/file_info in 'xen/arch/arm/efi/efi-boot.h' for 
>>> consistency with
>>
>> Same here.
>>
>>> the previous renaming.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Assuming there is no other comments, I would be Ok to fix it on 
>> commit. So:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>> Cheers,
> 
> I don't see any further comments on this. Are you ok with committing it?

Yes. This was committed by Stefano on Friday evening.

Cheers,

-- 
Julien Grall

