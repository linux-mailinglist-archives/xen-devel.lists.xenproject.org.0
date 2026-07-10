Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ZXFEPsoUWrmAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 19:16:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888E73CFAC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 19:16:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=tG9ZqmYC;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359691.1613153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiEp8-0004g3-Gh; Fri, 10 Jul 2026 17:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359691.1613153; Fri, 10 Jul 2026 17:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiEp8-0004dL-Dz; Fri, 10 Jul 2026 17:15:38 +0000
Received: by outflank-mailman (input) for mailman id 1359691;
 Fri, 10 Jul 2026 17:15:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wiEp7-0004dF-SB
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:15:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wiEp7-00H0ob-21;
 Fri, 10 Jul 2026 17:15:37 +0000
Received: from [2a02:8012:3a1:0:d925:4a60:fbf0:3a64]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wiEp7-006kwj-0S;
 Fri, 10 Jul 2026 17:15:37 +0000
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
	bh=yzoslLGkPJ8W4L8uESe8DaAcrRybEia759dw6J+vFB8=; b=tG9ZqmYCgA2ssjMpm1WH/RBrGW
	vULFzD3FHSc6BXe6J8CBcYv5/zxfI17KeSIP3c/WwQpo6BrQeHwI/EhV4A9raCGvFkEZ3DNROL9Cp
	jaF1+3oWNoxYm/1EtVPbjZsqIiSTUx+cYd0aq5w1Uk062mkdLVE+Biu2QYMwzA3bL0ps=;
Message-ID: <83d9ba24-51ed-4138-add6-c38cf34327b1@xen.org>
Date: Fri, 10 Jul 2026 18:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm/mpu: Save/restore VTCR_EL2 on vCPU context switch
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-9-luca.fancellu@arm.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260420142524.1804073-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:from_mime,xen.org:dkim,xen.org:mid,arm.com:email];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1888E73CFAC

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:
> On AArch64 MPU systems, the VTCR register contains the MSA bit that determines
> if the guest is using MPU or MMU at EL1, which is required to be
> saved/restored on vCPU context switch.
> 
> On AArch64 MPU systems the VTCR_EL2 register configuration will be saved
> during setup_virt_paging and will be placed in a new member of
> 'struct arch_vcpu' named vtcr_el2, to be retrieved by context switch.
> 
> AArch32 MPU systems and MMU systems don't need to save/restore this
> register because they don't have any MSA bit and related functionality,
> so for these architecture a stub is provided.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/arm64/mpu/p2m.c                | 15 +++++++++++++++
>   xen/arch/arm/domain.c                       |  2 ++
>   xen/arch/arm/include/asm/domain.h           |  5 +++++
>   xen/arch/arm/include/asm/mmu/domain-build.h |  2 ++
>   xen/arch/arm/include/asm/mpu/domain-build.h |  6 ++++++
>   xen/arch/arm/include/asm/mpu/p2m.h          | 10 ++++++++++
>   xen/arch/arm/mpu/domain-build.c             | 17 +++++++++++++++++
>   xen/arch/arm/mpu/p2m.c                      |  4 ++++
>   8 files changed, 61 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index a1ec9fcd6195..350cbd7ae94c 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -3,8 +3,12 @@
>   #include <xen/bug.h>
>   #include <xen/init.h>
>   #include <xen/lib.h>
> +#include <xen/sched.h>
>   #include <asm/p2m.h>
>   
> +/* VTCR_EL2 value to be configured for the boot CPU. */
> +register_t __read_mostly vtcr;

You don't seem to use it. Is it necessary? But the name of the global 
variable is a bit too generic. If we want one, it ought to be 
"boot_vtcr". Also doesn't this need to be writeable after boot? If not, 
it should be called "boot_vtcr".

Cheers,

-- 
Julien Grall


