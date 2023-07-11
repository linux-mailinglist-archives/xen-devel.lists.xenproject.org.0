Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE074F44C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 18:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561805.878346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFqn-0005Tm-F6; Tue, 11 Jul 2023 16:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561805.878346; Tue, 11 Jul 2023 16:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFqn-0005Qu-Bg; Tue, 11 Jul 2023 16:04:29 +0000
Received: by outflank-mailman (input) for mailman id 561805;
 Tue, 11 Jul 2023 16:04:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJFql-0005Qn-T0
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 16:04:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJFql-0003oE-Ba; Tue, 11 Jul 2023 16:04:27 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.8.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJFql-0002UA-4P; Tue, 11 Jul 2023 16:04:27 +0000
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
	bh=mTMzeUH/vjDkXQ3rq5/RXgpxVovuxvloKnoFCrbT9ig=; b=EacNWT/s2sO39WjjJ4PfDyhByP
	2aE4rrjSPQcXjimotM0lAwJyUjnW1OGgKdBQiX8NxUr7w8jrFYxbXlmSe9F5ozlEuswPNgK+ju1rE
	bARFBm8CbY23ZAZv6X6YgbuVCjZ1HdnJza8tK5WeHHQ+HGWRJz0jStjlxryr/3s4kWg0=;
Message-ID: <3636dbc0-cb9f-69c5-3252-33997943d356@xen.org>
Date: Tue, 11 Jul 2023 17:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] xen/arm: Fix domain_handle_dtb_bootmodule() error
 path
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-2-michal.orzel@amd.com>
 <5B7AB94D-613C-4B78-938F-81F843A7101F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5B7AB94D-613C-4B78-938F-81F843A7101F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/07/2023 10:15, Luca Fancellu wrote:
> 
> 
>> On 11 Jul 2023, at 09:29, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Fix the error path in domain_handle_dtb_bootmodule(), so that the memory
>> previously mapped is unmapped before returning the error code. This is
>> because the function shall not make assumptions on the way of handling
>> its error code in the callers. Today we call panic in case of domU
>> creation failure, so having memory not unmapped is not a bug, but it can
>> change.
>>
>> Similarly, fix prepare_dtb_domU() so that the memory allocated is freed
>> before returning the error code from domain_handle_dtb_bootmodule().
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

