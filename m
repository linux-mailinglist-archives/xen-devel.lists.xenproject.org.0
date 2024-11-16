Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2A9CFE2D
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838728.1254708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCG5U-0002og-28; Sat, 16 Nov 2024 10:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838728.1254708; Sat, 16 Nov 2024 10:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCG5T-0002lm-Uz; Sat, 16 Nov 2024 10:31:31 +0000
Received: by outflank-mailman (input) for mailman id 838728;
 Sat, 16 Nov 2024 10:31:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCG5S-0002lW-E8
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:31:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCG5R-008004-2h;
 Sat, 16 Nov 2024 10:31:30 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCG5R-007vcD-38;
 Sat, 16 Nov 2024 10:31:30 +0000
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
	bh=/GMzt6e8LiVQl6JJgGzZTJ37RCZIxzHN6a8FvPZ57uI=; b=N1f2KQh5vvsAQCkKxvN0kB/k9+
	QlcXeRc7/WKyC/9Qi5viBiJ/f2A42IBdY3PpvXVVYwe8lsmpZmO/CUMAqkRET8RAmilMAfzPR1EzV
	fLLnzeCsKSf2q6hRmv9AW+SQBxeuCjZsNZQF7Y8ESd66qGFoXFFeYehwDcxgYmKNDwNQ=;
Message-ID: <d0a3c297-9603-4436-a955-37a868b13d16@xen.org>
Date: Sat, 16 Nov 2024 10:31:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
 <20241107150330.181143-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241107150330.181143-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 07/11/2024 15:03, Ayan Kumar Halder wrote:
> Secondary cpus initialization is not yet supported. Thus, we print an
> appropriate message and put the secondary cpus in WFE state.
> And we introduce to BUILD_BUG_ON to prevent users using from building Xen
> on multiprocessor based MPU systems.
> 
> In Arm, there is no clean way to disable SMP. As of now, we wish to support
> MPU on UNP only. So, we have defined the default range of NR_CPUs to be 1 for
> MPU.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

