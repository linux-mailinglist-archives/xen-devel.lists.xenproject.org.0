Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6171267A
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 14:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540108.841603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WRJ-0004D2-4p; Fri, 26 May 2023 12:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540108.841603; Fri, 26 May 2023 12:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WRJ-0004Ak-23; Fri, 26 May 2023 12:21:01 +0000
Received: by outflank-mailman (input) for mailman id 540108;
 Fri, 26 May 2023 12:20:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q2WRH-0004Ab-IT
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 12:20:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q2WRG-0008NE-Sj; Fri, 26 May 2023 12:20:58 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.95.96.139])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q2WRG-0003Ex-M2; Fri, 26 May 2023 12:20:58 +0000
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
	bh=NNz7FVICZkmfqoG0QWZ3+XFh21dEf6szpZS9+lKViOw=; b=61shpGDvN3JjXrV54fTWweHvie
	O+MsOUPey+5Hm7aePZVYazL5Mcg08BjSioxbR6PVGZfRVzBdmnTlhkvllotB2y5xEzAHu8E46Tr7v
	bq1TAAJvydRYWFcQ1UxWwtEeua92VbeZ9lSAofH+TVUE+ZDXdq3MAqbrAcdQpE+UeGU0=;
Message-ID: <fce78524-f6a0-1906-ae33-b2c8d469a678@xen.org>
Date: Fri, 26 May 2023 13:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [XEN v7 00/11] Add support for 32-bit physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com, michal.orzel@amd.com
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/05/2023 15:39, Ayan Kumar Halder wrote:
> Ayan Kumar Halder (11):
>    xen/arm: domain_build: Track unallocated pages using the frame number
>    xen/arm: Typecast the DT values into paddr_t
>    xen/arm: Introduce a wrapper for dt_device_get_address() to handle
>      paddr_t
>    xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
>      SMMU_CBn_TTBR0
>    xen/arm: domain_build: Check if the address fits the range of physical
>      address
>    xen: dt: Replace u64 with uint64_t as the callback function parameters
>      for dt_for_each_range()

I have committed the patches up to here.

>    xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
>    xen/arm: Introduce choice to enable 64/32 bit physical addressing
>    xen/arm: guest_walk: LPAE specific bits should be enclosed within
>      "ifndef CONFIG_PHYS_ADDR_T_32"
>    xen/arm: Restrict zeroeth_table_offset for ARM_64
>    xen/arm: p2m: Enable support for 32bit IPA for ARM_32

Cheers,

-- 
Julien Grall

