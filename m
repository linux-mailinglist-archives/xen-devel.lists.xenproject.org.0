Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F49EA332E9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886870.1296460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLbb-0003GM-V0; Wed, 12 Feb 2025 22:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886870.1296460; Wed, 12 Feb 2025 22:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLbb-0003Ej-Re; Wed, 12 Feb 2025 22:53:19 +0000
Received: by outflank-mailman (input) for mailman id 886870;
 Wed, 12 Feb 2025 22:53:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tiLba-0003EZ-Lx
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:53:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiLba-00FBAU-1E;
 Wed, 12 Feb 2025 22:53:18 +0000
Received: from [2a02:8012:3a1:0:4060:8ed:ba21:1efd]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiLbZ-009Bu3-2y;
 Wed, 12 Feb 2025 22:53:18 +0000
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
	bh=giQsAQWFVmlDxHazbay+ICjIxJrtfN4PRgpgvanddX4=; b=TqwAHlMHVys5UigFYfPtD/FQEK
	h1tpk0bTotu6V94E8S+a+vIxHJofqMI2ihLFwLZOjXHesWz/Oj09Tts5Gtu1brRYo3/4KVcPwmdkC
	LfqjrbWs5v88nvzKRdVgvJ/B9jVrwD7ptgoXKRg2pOiKisqzWoKIxlkA4MP+WRIyVB58=;
Message-ID: <0023f310-909b-4374-b5e6-f4695c4818c1@xen.org>
Date: Wed, 12 Feb 2025 22:53:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2] ARM32/traps: Fix
 do_trap_undefined_instruction()'s detection of kernel text
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250211125445.451805-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250211125445.451805-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/02/2025 12:54, Andrew Cooper wrote:
> While fixing some common/arch boundaries for UBSAN support on other
> architectures, the following debugging patch:
> 
>    diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>    index c1f2d1b89d43..58d1d048d339 100644
>    --- a/xen/arch/arm/setup.c
>    +++ b/xen/arch/arm/setup.c
>    @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
> 
>         system_state = SYS_STATE_active;
> 
>    +    dump_execution_state();
>    +
>         for_each_domain( d )
>             domain_unpause_by_systemcontroller(d);
> 
> failed with:
> 
>    (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>    (XEN) CPU0: Unexpected Trap: Undefined Instruction
>    (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
>    (XEN) CPU:    0
>    <snip>
>    (XEN)
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) CPU0: Unexpected Trap: Undefined Instruction
>    (XEN) ****************************************
> 
> This is because the condition for init text is wrong.  While there's nothing
> interesting from that point onwards in start_xen(), it's also wrong for
> livepatches too.
> 
> Use is_active_kernel_text() which is the correct test for this purpose, and is
> aware of init and livepatch regions as well as their lifetimes.
> 
> Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


