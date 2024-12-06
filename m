Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5AF9E7889
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850399.1264806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdd0-0003fg-Nf; Fri, 06 Dec 2024 19:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850399.1264806; Fri, 06 Dec 2024 19:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdd0-0003dM-Ky; Fri, 06 Dec 2024 19:04:38 +0000
Received: by outflank-mailman (input) for mailman id 850399;
 Fri, 06 Dec 2024 19:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJdcy-0003dG-Rz
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:04:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdcy-0079lH-09;
 Fri, 06 Dec 2024 19:04:36 +0000
Received: from [2a02:8012:3a1:0:9908:37eb:1c5c:6583]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdcy-0030kM-0H;
 Fri, 06 Dec 2024 19:04:36 +0000
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
	bh=jTmZubeF2xjm2jdqIE65r+jIoXT5bKUZf5xv+Zv9Ivw=; b=wBX/yFUkv3VPEUYgNrEdKkWDfQ
	rk1z0Vqn1C0XS1N+irDb6DEsi6e33u2zECJQQeoU6pODuP1Z9MA2OKYEToh4ZvUK6gYHSsVUygWbF
	ZUUdqVZpF7ncYNixVodn9fQ7bGeEUTB8p2cCwe6/e2LmQVRyycBqpzUoGLgW4kAh/ZDw=;
Message-ID: <d051e1eb-c8cb-43fb-88f5-f7845067ae0a@xen.org>
Date: Fri, 6 Dec 2024 19:04:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/mpu: Map early uart when earlyprintk on
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
 <20241204172243.1229942-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241204172243.1229942-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 04/12/2024 17:22, Ayan Kumar Halder wrote:
> CONFIG_EARLY_UART_SIZE is introduced to let user provide physical size of
> early UART. Unlike MMU where we map a page in the virtual address space,
> here we need to know the exact physical size to be mapped.
> As VA == PA in case of MPU, the memory layout follows exactly the hardware
> configuration. As a consequence, we set  EARLY_UART_VIRTUAL_ADDRESS as physical
> address.
> 
> EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to the minimum
> size of MPU region (ie 64 bits) as per the hardware restrictions. Refer ARM
> DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 bytes.".
> 
> UART is mapped as nGnRE region (as specified by ATTR=100 , refer G1.3.13,
> MAIR_EL2, "---0100 Device memory nGnRE"). Also, it is mapped as outer shareable,
> RW at EL2 only and execution of instructions from the region is not permitted.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


