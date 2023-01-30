Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6F680A5B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 11:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486765.754209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR1c-0007Gi-0w; Mon, 30 Jan 2023 10:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486765.754209; Mon, 30 Jan 2023 10:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMR1b-0007EL-UP; Mon, 30 Jan 2023 10:04:31 +0000
Received: by outflank-mailman (input) for mailman id 486765;
 Mon, 30 Jan 2023 10:04:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMR1a-0007EF-28
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 10:04:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMR1W-00058N-6P; Mon, 30 Jan 2023 10:04:26 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMR1V-0001zd-WF; Mon, 30 Jan 2023 10:04:26 +0000
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
	bh=fHldoKu4fx42q8hpsPXR2zEIKhwDzVrtvicQqDQdKyY=; b=qsABEo5H6RSSdqW7taPfH5FauE
	y2EekoZJ+9GVR04hYNK7dSuD5neqWPUJvhMZ6hQ02S4I9N/5hKEILHjuvzfcGRz3JMYLtn7Pir29o
	vSTWhzY6mOCZiGmFDA6ZrHNlI/K1TLKgcbI0EPxZAxdiPxQ3vlMmJu+7kfakaLSP420k=;
Message-ID: <ead5b716-24d8-6fa1-77bc-cc0b3e81a493@xen.org>
Date: Mon, 30 Jan 2023 10:04:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/common: Constify the parameter of _spin_is_locked()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230127190516.52994-1-julien@xen.org>
 <eddf2879-1914-9401-d715-b711aaa7ed6c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eddf2879-1914-9401-d715-b711aaa7ed6c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/2023 08:11, Jan Beulich wrote:
> On 27.01.2023 20:05, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The lock is not meant to be modified by _spin_is_locked(). So constify
>> it.
>>
>> This is helpful to be able to assert the locked is taken when the
>> underlying structure is const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> But: Could I talk you into doing the same for _rw_is{,_write}_locked() for
> consistency?

Sure. Although, I would prefer to do it in a separate patch.

Cheers,

-- 
Julien Grall

