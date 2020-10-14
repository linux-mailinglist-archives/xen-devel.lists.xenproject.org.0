Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770028DF75
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 12:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6533.17455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeSL-0005Ki-PF; Wed, 14 Oct 2020 10:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6533.17455; Wed, 14 Oct 2020 10:56:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeSL-0005KJ-M2; Wed, 14 Oct 2020 10:56:29 +0000
Received: by outflank-mailman (input) for mailman id 6533;
 Wed, 14 Oct 2020 10:56:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSeSK-0005KE-9J
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:56:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a18d7f8-da38-4861-aea8-0cc5e2225579;
 Wed, 14 Oct 2020 10:56:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSeSH-00027S-Ba; Wed, 14 Oct 2020 10:56:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSeSH-0002lO-4f; Wed, 14 Oct 2020 10:56:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSeSK-0005KE-9J
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:56:28 +0000
X-Inumbo-ID: 1a18d7f8-da38-4861-aea8-0cc5e2225579
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1a18d7f8-da38-4861-aea8-0cc5e2225579;
	Wed, 14 Oct 2020 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=2Dsgn39aK/yisZSu3Xxi2WVSf/DHiqv93FX4cI6nkgM=; b=LFMN9vcYLvQBa8jVAPYyc8U039
	Giac1BaU1Y3UioKEsVA+Su9IK13UGCtDLt8OoCZgy01XJifGB7Cu9ZxxUseC8CQ/88JL4TpWPrZj6
	Q7PuEpIrDZMe7yZPP4JNmshCv9j/UDB5cThq6BrKS6VKEW+tKZtYr8jM2mieYJn0M4kQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSeSH-00027S-Ba; Wed, 14 Oct 2020 10:56:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSeSH-0002lO-4f; Wed, 14 Oct 2020 10:56:25 +0000
Subject: Re: [PATCH] xen/arm: Document the erratum #853709 related to Cortex
 A72
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20201014100541.11687-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ef5fc4c3-5de3-0ec1-fed9-afdb8dd1bfc1@xen.org>
Date: Wed, 14 Oct 2020 11:56:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201014100541.11687-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 14/10/2020 11:05, Michal Orzel wrote:
> Workaround for Cortex-A57 erratum #852523 is already
> in Xen but Cortex-A72 erratum #853709 is not although
> it applies to the same issue.

This commit message is a bit confusing because it implies that Xen 
doesn't workaround #852523. However, we do workaround it (there is no 
runtime check) but not document it.

So how about the following commit message?

"The Cortex-A72 erratum #853709 is the same as the Cortex-A57 erratum 
#852523. As the latter is already workaround, we only need to update the 
documentation."

> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Other than the commit message, I have cross-checked with the 
documentation ([1]):

Reviewed-by: Julien Grall <jgrall@amazon.com>

I can update the commit message on commit.

Cheers,

> ---
>   docs/misc/arm/silicon-errata.txt | 1 +
>   xen/arch/arm/domain.c            | 6 ++++--
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> index e15d0923e9..1f18a9df58 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -50,6 +50,7 @@ stable hypervisors.
>   | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_834220    |
>   | ARM            | Cortex-A57      | #1319537        | N/A                     |
>   | ARM            | Cortex-A72      | #1319367        | N/A                     |
> +| ARM            | Cortex-A72      | #853709         | N/A                     |
>   | ARM            | Cortex-A76      | #1165522        | N/A                     |
>   | ARM            | Neoverse-N1     | #1165522        | N/A
>   | ARM            | MMU-500         | #842869         | N/A                     |
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 3b37f899b9..18cafcdda7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -216,7 +216,8 @@ static void ctxt_switch_to(struct vcpu *n)
>       WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
>   
>       /*
> -     * Erratum #852523: DACR32_EL2 must be restored before one of the
> +     * Erratum #852523 (Cortex-A57) or erratum #853709 (Cortex-A72):
> +     * DACR32_EL2 must be restored before one of the
>        * following sysregs: SCTLR_EL1, TCR_EL1, TTBR0_EL1, TTBR1_EL1 or
>        * CONTEXTIDR_EL1.
>        */
> @@ -245,7 +246,8 @@ static void ctxt_switch_to(struct vcpu *n)
>   
>       /*
>        * This write to sysreg CONTEXTIDR_EL1 ensures we don't hit erratum
> -     * #852523. I.e DACR32_EL2 is not correctly synchronized.
> +     * #852523 (Cortex-A57) or #853709 (Cortex-A72).
> +     * I.e DACR32_EL2 is not correctly synchronized.
>        */
>       WRITE_SYSREG(n->arch.contextidr, CONTEXTIDR_EL1);
>       WRITE_SYSREG(n->arch.tpidr_el0, TPIDR_EL0);
> 

[1] https://developer.arm.com/documentation/epm012079/11/

-- 
Julien Grall

