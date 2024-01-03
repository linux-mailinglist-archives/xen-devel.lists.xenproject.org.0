Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB87823048
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 16:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660968.1030672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL2xO-0007rZ-96; Wed, 03 Jan 2024 15:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660968.1030672; Wed, 03 Jan 2024 15:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL2xO-0007oj-5R; Wed, 03 Jan 2024 15:14:58 +0000
Received: by outflank-mailman (input) for mailman id 660968;
 Wed, 03 Jan 2024 15:14:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rL2xM-0007od-U6
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 15:14:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rL2xK-0001RO-Um; Wed, 03 Jan 2024 15:14:54 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.6.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rL2xK-0002ZD-Ow; Wed, 03 Jan 2024 15:14:54 +0000
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
	bh=ypHAj2wdIO5QnT/ET1099BP7ySScEeYhwpu3zBJ78rU=; b=3rzcynuTMEg9Rlr2lOFJrNE/IT
	dEioij6pj6aWAnO7Ht4Cbg6/au0NHcdsy8STzNr+1JY13ifFoZPrCWKuX3T+o3doNCJG48/WfdpO3
	0r6CrKRyUFkf/SRLztylSPWsBDWeUsaSIgrzOjCfoAeUKtUHvnUjQesSZwlon2p07wBY=;
Message-ID: <dcf4b52c-15a4-4a1b-85e0-1b95c653f0ce@xen.org>
Date: Wed, 3 Jan 2024 15:14:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/17] Device tree based NUMA support for Arm
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Community Manager <community.manager@xenproject.org>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 20/11/2023 02:54, Henry Wang wrote:
> The preparation work to support NUMA on Arm has been merged
> and can be found at [1] and [2]. The initial discussions of
> the Arm NUMA support can be found at [3].
> 
> - Background of this series:
> 
> Xen memory allocation and scheduler modules are NUMA aware.
> But actually, on x86 has implemented the architecture APIs
> to support NUMA. Arm was providing a set of fake architecture
> APIs to make it compatible with NUMA awared memory allocation
> and scheduler.
> 
> Arm system was working well as a single node NUMA system with
> these fake APIs, because we didn't have multiple nodes NUMA
> system on Arm. But in recent years, more and more Arm devices
> support multiple nodes NUMA system.
> 
> So now we have a new problem. When Xen is running on these Arm
> devices, Xen still treat them as single node SMP systems. The
> NUMA affinity capability of Xen memory allocation and scheduler
> becomes meaningless. Because they rely on input data that does
> not reflect real NUMA layout.
> 
> Xen still think the access time for all of the memory is the
> same for all CPUs. However, Xen may allocate memory to a VM
> from different NUMA nodes with different access speeds. This
> difference can be amplified in workloads inside VM, causing
> performance instability and timeouts.
> 
> So in this patch series, we implement a set of NUMA API to use
> device tree to describe the NUMA layout. We reuse most of the
> code of x86 NUMA to create and maintain the mapping between
> memory and CPU, create the matrix between any two NUMA nodes.
> Except ACPI and some x86 specified code, we have moved other
> code to common. In next stage, when we implement ACPI based
> NUMA for Arm64, we may move the ACPI NUMA code to common too,
> but in current stage, we keep it as x86 only.
> 
> This patch serires has been tested and booted well on FVP in
> Arm64 mode with NUMA configs in device tree and one HPE x86
> NUMA machine.

This series doesn't seem to apply cleanly to staging. Do you have a tree 
with the series applied? This would help to check some of the final 
behavior.

Cheers,

-- 
Julien Grall

