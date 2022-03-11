Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BF4D6872
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 19:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289209.490688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSk2r-0005FO-QC; Fri, 11 Mar 2022 18:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289209.490688; Fri, 11 Mar 2022 18:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSk2r-0005CL-Mt; Fri, 11 Mar 2022 18:31:21 +0000
Received: by outflank-mailman (input) for mailman id 289209;
 Fri, 11 Mar 2022 18:31:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSk2p-0005CD-Lk
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 18:31:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSk2p-0006sV-7N; Fri, 11 Mar 2022 18:31:19 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSk2p-0006uG-1M; Fri, 11 Mar 2022 18:31:19 +0000
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
	bh=dzh/apuglEO0xtnBTiRbrwOR5q1vhdtLUmg/+d7xgYo=; b=KJo7EJ8KPiXHBxQoUVdXB/BdAh
	dICBq5GNC3wQzBvje4Rg8osONGaB+R6RMMBjyiF/+4uR6Jop7m8j0pLhYaVyjNpfUAmkuekBlTCMb
	9hkoYNaSY5aslioaceM7mPWnlCrHAUARfz7W8bCKssvkhkx1bQaJvsFQUgYNv28AHfvM=;
Message-ID: <0d8657ef-2449-be1f-6e91-67a520835512@xen.org>
Date: Fri, 11 Mar 2022 18:31:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN v10 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-4-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310174501.62040-4-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/03/2022 17:45, Ayan Kumar Halder wrote:
> If the abort was caused due to access to stage1 translation table, Xen
> will try to set the p2m entry (assuming that the Stage 1 translation
> table is in the non MMIO region).
> If there is no such entry found, then Xen will try to map the address as
> a MMIO region (assuming that the Stage 1 translation table is in the
> direct MMIO region).
> 
> If that fails as well, then there are the two following scenarios:-
> 1. Stage 1 translation table being in the emulated MMIO region - Xen

We have multiple emulated MMIO regions. So I would s/the/an/

> can read the region, but it has no way to return the value read to the
> CPU page table walker (which tries to go through the stage1 tables to
> resolve the translation fault).
> 
> 2. Stage 1 translation table address is invalid.
> 
> In both the above scenarios, Xen will forward the abort to the guest.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> 
> Changelog :-
> 
> v1..v8 - NA
> 
> v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
> instructions (for which ISS is not..." into a separate patch of its own.
> The reason being this is an existing bug in the codebase.
> 
> v10 - 1. Enabled checking for stage1 translation table address in the
> MMIO region. The reason being Arm Arm does not have any restrictions.
> 2. Updated the commit message to explain all the possible scenarios.
> 
>   xen/arch/arm/io.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index fd903b7b03..e6c77e16bf 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>           return;
>       }
>   
> +    /*
> +     * At this point, we know that the stage1 translation table is either in the

Same here.

> +     * emulated MMIO region or its address is invalid . This is not expected by

s/ . /. /

All of these can be fixed on commit. So:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

