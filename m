Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB68C6135B
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 12:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163219.1490406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKax6-0000eX-Kw; Sun, 16 Nov 2025 11:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163219.1490406; Sun, 16 Nov 2025 11:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKax6-0000bq-Hl; Sun, 16 Nov 2025 11:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1163219;
 Sun, 16 Nov 2025 11:29:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKax4-0000bk-UU
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 11:29:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKax3-00A6V9-1d;
 Sun, 16 Nov 2025 11:29:49 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKax3-000Zdi-0R;
 Sun, 16 Nov 2025 11:29:49 +0000
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
	bh=yhcIqG9cVUsiXIick2qdfYdQSqaQGNWIV70d4UnLmOY=; b=0Dra5JgdQevR8EjpZGst4OGv6X
	/090iUiaZ/BcCDvORbTUuvqkzfp4CY6xeWD3XDDQJPxDSxxaE6mxyyaAG+N8rh0DtJShtbYeCtxJS
	PMYlP9l49NAGYURf0RQ+3IO1JI/SFOPvrF7Bch55L+4Y66/EdYjYdy5DDQsNUHAKCq8U=;
Message-ID: <e079c615-9bb9-4a3c-ad42-90d7fc357855@xen.org>
Date: Sun, 16 Nov 2025 11:29:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] smp: Move cpu_up/down helpers to common code
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <e0fe3bb03af9c612605a2a5dd9b5670d0428fa1a.1762939773.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e0fe3bb03af9c612605a2a5dd9b5670d0428fa1a.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 10:51, Mykyta Poturai wrote:
> This will reduce code duplication for the upcoming cpu hotplug support
> on Arm64 patch.
> 
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v3->v4:
> * patch introduced
> ---
>   xen/arch/arm/smp.c             |  6 ++++++
>   xen/arch/ppc/stubs.c           |  4 ++++
>   xen/arch/riscv/stubs.c         |  5 +++++
>   xen/arch/x86/include/asm/smp.h |  3 ---
>   xen/arch/x86/smp.c             | 33 +++------------------------------
>   xen/common/smp.c               | 32 ++++++++++++++++++++++++++++++++
>   xen/include/xen/smp.h          |  4 ++++
>   7 files changed, 54 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
> index b372472188..85815aeda0 100644
> --- a/xen/arch/arm/smp.c
> +++ b/xen/arch/arm/smp.c
> @@ -44,6 +44,12 @@ void smp_send_call_function_mask(const cpumask_t *mask)
>       }
>   }
>   
> +/* ARM don't have SMT so we don't need any special logic for CPU disabling  */

Xen doesn't support SMT on Arm. But some of the cores may support SMT. 
So would reword this to:

"We currently don't support SMT"

Cheers,

-- 
Julien Grall


