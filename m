Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F804CD290
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 11:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284168.483354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5Li-00083t-3P; Fri, 04 Mar 2022 10:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284168.483354; Fri, 04 Mar 2022 10:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5Lh-00081e-W7; Fri, 04 Mar 2022 10:39:49 +0000
Received: by outflank-mailman (input) for mailman id 284168;
 Fri, 04 Mar 2022 10:39:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQ5Lf-00081Y-Rt
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 10:39:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5Lf-0007w4-5e; Fri, 04 Mar 2022 10:39:47 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5Le-0005Ur-V2; Fri, 04 Mar 2022 10:39:47 +0000
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
	bh=52ED2Zgibtugkn66f/nC0LVaMz+d1vBT5FeAuEWvZ4s=; b=DZ1f82zHs/merF7SVoqwQZvJ8o
	LurK46YF/F3S8VEC2M2CSKNlXkNCSGEk4oVzkuBTqRcW0i9kMR/NYxJQPJfxhwEmDJn/mi7OqXYcl
	bDjIYSFaszN0J29aEAnsHUw7fhZXshvYVehtga9C9eTeR/kRMirEwoE1jkbJ0159U77U=;
Message-ID: <68acfbf0-f2c1-c52e-93a3-632f1286d90f@xen.org>
Date: Fri, 4 Mar 2022 10:39:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-4-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220301124022.10168-4-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 01/03/2022 12:40, Ayan Kumar Halder wrote:
> If the abort was caused due to access to stage1 translation table, Xen
> will assume that the stage1 translation table is in the non MMIO region.
> It will try to resolve the translation fault. If it succeeds, it will
> return to the guest to retry the instruction. If not, then it means
> that the table is in MMIO region which is not expected by Xen. Thus,
> Xen will forward the abort to the guest.
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
>   xen/arch/arm/io.c    | 11 +++++++++++
>   xen/arch/arm/traps.c | 12 +++++++++++-
>   2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index bea69ffb08..ebcb8ed548 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>           return;
>       }
>   
> +    /*
> +     * At this point, we know that the stage1 translation table is in the MMIO
> +     * region. This is not expected by Xen and thus it forwards the abort to the

We don't know that. We only know that there are no corresponding valid 
mapping in the P2M. So the address may be part of an emulated MMIO 
region or invalid.

For both cases, we will want to send an abort.

Furthermore, I would say "emulated MMIO region" rather than MMIO region 
because the P2M can also contain MMIO mapping (we usually call then 
"direct MMIO").

Cheers,

-- 
Julien Grall

