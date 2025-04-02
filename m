Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8463A78C55
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935608.1336980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvKc-0003ER-Ni; Wed, 02 Apr 2025 10:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935608.1336980; Wed, 02 Apr 2025 10:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvKc-0003Bz-Kj; Wed, 02 Apr 2025 10:28:26 +0000
Received: by outflank-mailman (input) for mailman id 935608;
 Wed, 02 Apr 2025 10:28:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tzvKa-0003Bt-QJ
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:28:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzvKZ-007SMz-36;
 Wed, 02 Apr 2025 10:28:23 +0000
Received: from [2a02:8012:3a1:0:9928:c7aa:a3ed:1d45]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tzvKZ-003gIi-2H;
 Wed, 02 Apr 2025 10:28:23 +0000
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
	bh=PKowBXBcB7HtZS8R1FiKtj/7DXSJMRMUvRrU/YRv5SY=; b=U1IM/xGY2hoCliET9G9uGEgQyY
	vy5vYN0d1z47aBTO9p8s4vT5F3jfv4Zm0Y+BbP+M6jOZQCccahCDe4NZ/W71D3rL/AkwFQ7SGaOxQ
	Gxgp+tWQ3wT7JGbwsFKZ44WzDVghYGDTfheiPnNyFaMN9LOT8P307hYjwiXp5hExyx10=;
Message-ID: <72c9c91a-d536-42e1-9b7b-37375c2fb3e1@xen.org>
Date: Wed, 2 Apr 2025 11:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen: remove -N from the linker command line
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-6-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250401130840.72119-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 01/04/2025 14:08, Roger Pau Monne wrote:
> It's unclear why -N is being used in the first place.  It was added by
> commit 4676bbf96dc8 back in 2002 without any justification.
> 
> When building a PE image it's actually detrimental to forcefully set the
> .text section as writable.  The GNU LD man page contains the following
> warning regarding the -N option:
> 
>> Note: Although a writable text section is allowed for PE-COFF targets, it
>> does not conform to the format specification published by Microsoft.
> 
> Remove the usage of -N uniformly on all architectures, assuming that the
> addition was simply done as a copy and paste of the original x86 linking
> rune.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


