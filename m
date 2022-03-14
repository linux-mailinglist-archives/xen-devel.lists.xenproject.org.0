Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F24D9008
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 00:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290501.492683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTtmA-00072L-De; Mon, 14 Mar 2022 23:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290501.492683; Mon, 14 Mar 2022 23:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTtmA-0006zL-AX; Mon, 14 Mar 2022 23:06:54 +0000
Received: by outflank-mailman (input) for mailman id 290501;
 Mon, 14 Mar 2022 23:06:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTtm8-0006zF-9v
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 23:06:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTtm7-00075P-Kn; Mon, 14 Mar 2022 23:06:51 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTtm7-0003aZ-EH; Mon, 14 Mar 2022 23:06:51 +0000
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
	bh=rTZpWIrKVeO9IgxrNOBvjhdBktnXBBXe/eHKVytrGEM=; b=glMJSxYQJAylPAOE8f43YbdgIh
	eK4TmyEoq0DGvICbAYNhaVVvgwtcRRzaOwJyx4eNYwbarE21bqpdaEMs2PXzCUGv3Nl4BLiw72BBa
	uvGHZFiGxcpV37yamgLnSOs7R3bk74Q2QN0AMqOWZAT4jHRs2+eIolSX/Zd6JuKxBRng=;
Message-ID: <1cc71b20-ef2b-dd46-3a84-466e114eb32b@xen.org>
Date: Mon, 14 Mar 2022 23:06:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN v10 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
 <20220310174501.62040-3-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310174501.62040-3-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/03/2022 17:44, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index 9c9790a6d1..159e3cef8b 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -18,9 +18,11 @@
>   
>   #include <xen/lib.h>
>   #include <xen/kernel.h>
> +#include <xen/sched.h>
>   
>   #include <public/xen.h>
>   
> +#include <asm/mmio.h>
>   #include <asm/processor.h>
>   #include <asm/traps.h>
>   
> @@ -82,6 +84,15 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>           do_unexpected_trap("Data Abort", regs);
>   }
>   
> +void post_increment_register(const struct instr_details *instr)
> +{
> +    /*
> +     * We have not implemented decoding of post indexing instructions for 32 bit.
> +     * Thus, this should be unreachable.
> +     */
> +    domain_crash(current->domain);

Osstest [1] is reporting a crash here. This is because 
post_increment_register() is called unconditionally.

I think you need to add:

if ( instr->state != INSTR_LDR_STR_POSTINDEXING )

Also, given this is called unconditionally, I think the function needs 
to be renamed to some more generic. Maybe finalize_instr_emulation() or 
similar.

I have decided to revert this patch and patch #3 for now. Please test it 
on arm32 and respin it.

While you are at it, please make sure the title is no longer than
80 characters.

Cheers,


> +}
> +


[1] 
http://logs.test-lab.xenproject.org/osstest/logs/168589/test-armhf-armhf-xl/info.html

-- 
Julien Grall

