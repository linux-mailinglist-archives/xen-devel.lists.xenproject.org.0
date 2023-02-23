Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673916A0C92
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500506.771924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDC0-0000IH-M9; Thu, 23 Feb 2023 15:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500506.771924; Thu, 23 Feb 2023 15:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDC0-0000Fq-Ic; Thu, 23 Feb 2023 15:07:32 +0000
Received: by outflank-mailman (input) for mailman id 500506;
 Thu, 23 Feb 2023 15:07:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVDBz-0000Fk-Ja
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:07:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVDBz-0007fz-6c; Thu, 23 Feb 2023 15:07:31 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.22.85]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVDBy-00021w-W0; Thu, 23 Feb 2023 15:07:31 +0000
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
	bh=HsQBZA2AxTL1MiF2Gt1D+f2SqbdImPQvzzQV6AQHqUY=; b=wpguZ+tzqd9Bn8p35DE5bz21qV
	AbHCSJd/COEWWVYuVd93JLr2Zqw4TcYMkcFrUgdcm7yWi1vLrwYUHtkDTDHli+n3furlUpnZDyhiP
	egDOpN3VF2PsoIZiwc0nBdbQdbcEKo4kJpK4oLhJLlqk4lZwBliXsqGIo2EpJpeBhGes=;
Message-ID: <0da01cfe-e156-a5f8-6d64-8351f36a4541@xen.org>
Date: Thu, 23 Feb 2023 15:07:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v7 02/20] xen/arm: tee: add a primitive FF-A mediator
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
 <FE444C86-FD27-4FAB-A24A-C6B16887787B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FE444C86-FD27-4FAB-A24A-C6B16887787B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/02/2023 14:46, Bertrand Marquis wrote:
>> diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/asm/tee/ffa.h
>> new file mode 100644
>> index 000000000000..94960100718e
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/tee/ffa.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
> 
> Why is this file in MIT license ?
> 
> Any chance to set it as BSD-2 or maybe no license at all (most private headers do not have one) ?
When the header has no license boilerplate, then it will be using the 
default Xen license (i.e. GPLv2).

Now that we are starting to use SPDX, I think it would be better if we 
add it in every file (even if it is GPLv2.0).
Cheers,

-- 
Julien Grall

