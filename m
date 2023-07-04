Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4D747848
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558614.872877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkkH-00072v-UK; Tue, 04 Jul 2023 18:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558614.872877; Tue, 04 Jul 2023 18:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkkH-00070C-PH; Tue, 04 Jul 2023 18:27:25 +0000
Received: by outflank-mailman (input) for mailman id 558614;
 Tue, 04 Jul 2023 18:27:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGkkG-000704-6V
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:27:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkkG-0007c6-09; Tue, 04 Jul 2023 18:27:24 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkkF-0007oC-Qy; Tue, 04 Jul 2023 18:27:23 +0000
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
	bh=2kGXoqJY5IwN/waduG9mep+PyvY/bATseQembqVcYCU=; b=0sbHGf7eV/KqLg5Ve5XhPGk1UM
	+yurDgcY6fcutry204AHxhl5ThYjyalL4CTmeSbNVuZBH1nd7wIz2Q39GYT6wF0xC3j8PLXQD7Fvy
	XyIUmD3LcHcpVOB5ERe0jpAmZxTm3ue4mreBLuB1p5W7NRQFTrMdLTEtz58V5HZcP9mU=;
Message-ID: <68580901-f61f-02d0-9ddf-c89b41e50bf7@xen.org>
Date: Tue, 4 Jul 2023 19:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-3-julien@xen.org>
 <CC83991E-F43E-441C-B13E-4EF976815F7A@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CC83991E-F43E-441C-B13E-4EF976815F7A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 04/07/2023 15:12, Bertrand Marquis wrote:
>> On 29 Jun 2023, at 22:11, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, we are mapping the size of the reserved area for Xen
>> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
>> after Xen, so it is not a good idea to map more than necessary for a
>> couple of reasons:
>>     * We would need to use break-before-make if the extra PTE needs to
>>       be updated to point to another region
>>     * The extra area mapped may be mapped again by Xen with different
>>       memory attribute. This would result to attribute mismatch.
>>
>> Therefore, rework the logic in create_page_tables() to map only what's
>> necessary. To simplify the logic, we also want to make sure _end
>> is page-aligned. So align the symbol in the linker and add an assert
>> to catch any change.
> 
> The last 2 sentences actually belongs to patch 1 and have been copied
> here. Please remove them on commit as alignment of _end is not in
> this patch.

Good point. I have removed them.

> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
> With commit message fixed on commit:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

