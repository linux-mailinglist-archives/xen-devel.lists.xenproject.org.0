Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F02747846
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558610.872867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkio-0006UQ-JJ; Tue, 04 Jul 2023 18:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558610.872867; Tue, 04 Jul 2023 18:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkio-0006R8-Fw; Tue, 04 Jul 2023 18:25:54 +0000
Received: by outflank-mailman (input) for mailman id 558610;
 Tue, 04 Jul 2023 18:25:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGkin-0006R2-78
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:25:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkim-0007aX-W3; Tue, 04 Jul 2023 18:25:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkim-0007ls-Qh; Tue, 04 Jul 2023 18:25:52 +0000
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
	bh=ZAUI+0haJgBL3ttcEM4j8rCmFTuuZxol0NIwFnn3viY=; b=FI/xEPR3m/Fo/EBlEEmW/Th/Kh
	6wEt6io9Ko0HH47fTYfaWX5D+tXzt6iR0MsJuImTw24s06Z8gvAe1kRdFXTuFArizbkPttR5wBmeH
	qhlGdb4cA8FrDTxYPw8/L+04pH+iwAVSg5flF2vbHoiFxWf30wH9b+1TfhBaaO0/Ad2c=;
Message-ID: <091d93d2-62c0-fbc1-35c6-e414e4c178e9@xen.org>
Date: Tue, 4 Jul 2023 19:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-2-julien@xen.org>
 <ad88adc9-5b05-65f9-2071-c746748ec3df@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ad88adc9-5b05-65f9-2071-c746748ec3df@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 30/06/2023 07:50, Michal Orzel wrote:
> 
> 
> On 29/06/2023 22:11, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, we are mapping the size of the reserved area for Xen
>> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
>> after Xen, so it is not a good idea to map more than necessary for a
>> couple of reasons:
>>      * We would need to use break-before-make if the extra PTE needs to
>>        be updated to point to another region
>>      * The extra area mapped may be mapped again by Xen with different
>>        memory attribute. This would result to attribute mismatch.
>>
>> Therefore, rework the logic in create_page_tables() to map only what's
>> necessary. To simplify the logic, we also want to make sure _end
>> is page-aligned. So align the symbol in the linker and add an assert
>> to catch any change.
>>
>> Lastly, take the opportunity to confirm that _start is equal to
>> XEN_VIRT_START as the assembly is using both interchangeably.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> NIT: it looks like other maintainers are not CCed on this series.

Whoops. I forgot to call scripts/add_maintainers.pl. I see that Bertrand 
reviewed it. So I will not resend it.

> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

