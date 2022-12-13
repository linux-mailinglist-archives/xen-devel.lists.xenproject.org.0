Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BA64BE4B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461174.719222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Ci1-00084d-S9; Tue, 13 Dec 2022 21:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461174.719222; Tue, 13 Dec 2022 21:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Ci1-00082q-PJ; Tue, 13 Dec 2022 21:21:05 +0000
Received: by outflank-mailman (input) for mailman id 461174;
 Tue, 13 Dec 2022 21:21:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Chz-00082k-L6
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:21:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Chz-0003iA-8m; Tue, 13 Dec 2022 21:21:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Chz-0000da-2B; Tue, 13 Dec 2022 21:21:03 +0000
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
	bh=cjRx5hXdxpXNGVbSLpSQnPjoQVg2yVEZzvnlkEbrIQI=; b=buYT0AQGnBWMuxlWJFe13P0QgT
	6d2XMaSb3Pi8wGXgxj+NM6qKC33klQZ23DpSzqCNtxZccoLrS/hZwDz34mAIXOJsHcyUG/aRkGf6L
	PWNpzYG7v9h9acCQoYJTWRxDAjTkRq+U2gYpxVdj5cWit61lZQBzJzXBESqWbEOSXzTU=;
Message-ID: <bde7c3ec-b9d1-b8c3-e276-b364abf8dc3f@xen.org>
Date: Tue, 13 Dec 2022 21:21:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v5 07/11] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
 <20221205132637.26775-8-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205132637.26775-8-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 05/12/2022 13:26, Ayan Kumar Halder wrote:
> Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers
> 
> AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
> mapped to AArch32 System register ICH_LR<n>[31:0].
> AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
> mapped to AArch32 System register ICH_LRC<n>[31:0].
> 
> Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for AArch32.
> For AArch32, the link register is stored as :-
> (((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2
> 
> Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
> AArch64.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

