Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01F75BA3A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:01:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566748.885999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbhZ-0005O3-Uh; Thu, 20 Jul 2023 22:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566748.885999; Thu, 20 Jul 2023 22:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbhZ-0005LA-Rj; Thu, 20 Jul 2023 22:00:49 +0000
Received: by outflank-mailman (input) for mailman id 566748;
 Thu, 20 Jul 2023 22:00:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMbhY-0005L4-Or
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:00:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMbhX-00014r-A1; Thu, 20 Jul 2023 22:00:47 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMbhX-0000xP-3O; Thu, 20 Jul 2023 22:00:47 +0000
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
	bh=ei7UL5AwLAUDYJsz5uKVjU7P0SgMoXbKScbQzPP/lXI=; b=mTDSyHVWVM0yjMNnIaSUX+3hhZ
	4P9XEFYnOJyZAa5hr9CojSHwqxxMdR+mVgFoKY2fQnWR976yJKm2PtroQhHSBLIXrVAoG/CHPQKmI
	OD4Y8Q29O5ozV3Kk0O+JkH0u/EDdtvlh9mNp7hJivw9pKwe/V2wQGTjc/9FV+ewfuBIU=;
Message-ID: <f962d1ce-4cde-e1b5-59b3-5e71d2e83109@xen.org>
Date: Thu, 20 Jul 2023 23:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] Make PDX compression optional
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

Great work!

On 17/07/2023 17:03, Alejandro Vallejo wrote:
> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
> disable it because the whole codebase performs unconditional
> compression/decompression operations on addresses. This has the
> unfortunate side effect that systems without a need for compression still
> have to pay the performance impact of juggling bits on every pfn<->pdx
> conversion (this requires reading several global variables). This series
> attempts to:
Just as a datapoint. I applied this to a tree with Live-Update support. 
 From the basic test I did, this is reducing the downtime by 10% :).

Cheers,

-- 
Julien Grall

