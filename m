Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0313A7507A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 19:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931109.1333571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEcd-00038Y-3e; Fri, 28 Mar 2025 18:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931109.1333571; Fri, 28 Mar 2025 18:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEcd-00033d-0e; Fri, 28 Mar 2025 18:40:03 +0000
Received: by outflank-mailman (input) for mailman id 931109;
 Fri, 28 Mar 2025 18:40:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyEcb-0002re-L4
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 18:40:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEcb-00Dz2W-0Q;
 Fri, 28 Mar 2025 18:40:01 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEca-004suz-31;
 Fri, 28 Mar 2025 18:40:01 +0000
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
	bh=K8133s5PqlbPsfSFFKrwQMACdFoc8hvmQjWg8+o6Udg=; b=k7nfocitoU+9jy4jF6NWjMV+jz
	9o2e2IMUXPb7gcfrgPX537ScblekvAAQZRm3rpw8sD3j6MviBg68iadZmfHz8iE6M8qBU7a8KyRma
	/1Nx0VArGkrGsgnMQe8ap+N5XSn70uqcJaYRcgEEXZ/Pm3BulKQRUDbv0sNw014T/vfs=;
Message-ID: <dad70c39-c398-4641-8775-ffb1b896367e@xen.org>
Date: Fri, 28 Mar 2025 18:39:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 2/6] Arm32: use new-style entry annotations for
 MMU code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <1287edd8-188f-4b1a-b087-0beb3eea5ed4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1287edd8-188f-4b1a-b087-0beb3eea5ed4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/03/2025 08:07, Jan Beulich wrote:
> Locally override SYM_PUSH_SECTION() to retain the intended section
> association.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
> ---
> v7: New.
> 
> --- a/xen/arch/arm/arm32/mmu/head.S
> +++ b/xen/arch/arm/arm32/mmu/head.S
> @@ -160,6 +160,13 @@
>   .endm
>   
>   .section .text.idmap, "ax", %progbits
> +/*
> + * Code below wants to all live in the section established above.  Annotations
> + * from xen/linkage.h therefore may not switch sections (honoring
> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
> + */
> +#undef SYM_PUSH_SECTION
> +#define SYM_PUSH_SECTION(name, attr)

AFAICT, SYM_PUSH_SECTION doesn't exist yet. It is introduced by patch 
#6. Should this be moved to the last patch?

The rest of the patch LGTM to me. So with this addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


