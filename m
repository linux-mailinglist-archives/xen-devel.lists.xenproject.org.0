Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032A554F339
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 10:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351142.577706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27XP-0002Fh-G6; Fri, 17 Jun 2022 08:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351142.577706; Fri, 17 Jun 2022 08:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27XP-0002DP-Cn; Fri, 17 Jun 2022 08:41:07 +0000
Received: by outflank-mailman (input) for mailman id 351142;
 Fri, 17 Jun 2022 08:41:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o27XO-0002DJ-9A
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 08:41:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27XO-0006eR-2U; Fri, 17 Jun 2022 08:41:06 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.0.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27XN-0006rx-QY; Fri, 17 Jun 2022 08:41:05 +0000
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
	bh=sB1mRVl4Rk1sygilJ5jg9sG+Sz6Ndm72XR3K4BeEsyQ=; b=mt2gdbCOjqg8eEJCm4tzaUxk7V
	zUGTnDlTadPZ9dr/UIKeZc7WcKZfTwRRaMjRLl6RsoU78+tcRDS+EU1XcE/KBIghRNFKgcWQy1bAz
	eD0c1zrf1kO72XECL5aJ6JbIilyynARlXvJ/WNJnGjwt2Hv4zcTiGUQJB1aP60Y3MQVA=;
Message-ID: <8c03895e-4134-53c5-2248-e8afe4be7b25@xen.org>
Date: Fri, 17 Jun 2022 09:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early
 uart
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-2-wei.chen@arm.com>
 <46f6a909-2f77-021c-a069-6a8f827e53fc@xen.org>
 <AS8PR08MB79912A6797514E583095CBFC92AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79912A6797514E583095CBFC92AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/06/2022 04:27, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Julien Grall
>>
>> Hi,
>>
>> I have committed this patch.
>>
>> Patch #3 looks to be suitably acked but I am not sure whether it can be
>> committed before #2. So I didn't commit it.
>>
>> Please let me know if it can be.
> 
> IIUC, the latest series (v6) [1] is properly acked and reviewed for the whole
> series, so I think v6 of this series is ready to be merged. Sending this as a
> gentle reminder :)

Thanks for the reminder. My comment above was specifically referring to 
patches in v3. If the patches are from a new version, can I suggest to 
ping on the exact version?

Cheers,

-- 
Julien Grall

