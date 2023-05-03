Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E755E6F570A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 13:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529124.823169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAUp-0000jw-NI; Wed, 03 May 2023 11:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529124.823169; Wed, 03 May 2023 11:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAUp-0000iF-KE; Wed, 03 May 2023 11:18:07 +0000
Received: by outflank-mailman (input) for mailman id 529124;
 Wed, 03 May 2023 11:18:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puAUo-0000i9-7U
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 11:18:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puAUn-00007V-Gv; Wed, 03 May 2023 11:18:05 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puAUn-0007XG-8n; Wed, 03 May 2023 11:18:05 +0000
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
	bh=LM+GbpkIg/ENzcdPKrIAU1+f7oH9sLXG/MVrC12j6Cs=; b=LlQVSYlyBgU1o3n5F7uai8ef/v
	VFQCFcZJxiP5Z3aaDKYXsFA4bLKPheX1k4/NRDQTa0/RGNR//jXsx2urJev4N5odebmF9lh9uFYvd
	J+8mM6EyMpiJfLfrI2uwo4xgsg3e4Er1AUp7K0wOhSjMpnTtFRA2BOTgaMav38vI393g=;
Message-ID: <935ea085-5a82-973a-00cf-b5f57b4e769b@xen.org>
Date: Wed, 3 May 2023 12:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 02/12] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230428175543.11902-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/04/2023 18:55, Ayan Kumar Halder wrote:
> The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
> currently accept or return 64-bit values.
> 
> In future when we support 32-bit physical address, these DT functions are
> expected to accept/return 32-bit or 64-bit values (depending on the width of
> physical address). Also, we wish to detect if any truncation has occurred
> (i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).
> 
> device_tree_get_reg() should now be able to return paddr_t. This is invoked by
> various callers to get DT address and size.
> 
> For fdt_get_mem_rsv(), we have introduced a wrapper named
> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
> uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
> has been imported from external source.
> 
> For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
> dt_read_paddr() to read physical addresses. We chose not to modify the original
> function as it is used in places where it needs to specifically read 64-bit
> values from dt (For e.g. dt_property_read_u64()).
> 
> Xen prints warning when it detects truncation in cases where it is not able to
> return error.
> 
> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
> by the code changes.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

