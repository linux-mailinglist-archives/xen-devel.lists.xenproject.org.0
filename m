Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5263A4ADB
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jun 2021 00:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140661.259854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrpGW-0002Yi-5h; Fri, 11 Jun 2021 22:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140661.259854; Fri, 11 Jun 2021 22:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrpGW-0002WE-1n; Fri, 11 Jun 2021 22:04:36 +0000
Received: by outflank-mailman (input) for mailman id 140661;
 Fri, 11 Jun 2021 22:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C43g=LF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lrpGU-0002W8-KW
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 22:04:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1320e0e9-e480-4e6d-aab9-4af6bae76f4f;
 Fri, 11 Jun 2021 22:04:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0A04613CD;
 Fri, 11 Jun 2021 22:04:32 +0000 (UTC)
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
X-Inumbo-ID: 1320e0e9-e480-4e6d-aab9-4af6bae76f4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623449073;
	bh=RNA12J4X4dUJiKgQsnm7WAaTzCrQsGPkuYyFSojgvFs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=higscilJ00rt2hvrBQl6j2QfG3tYIDo3Ivqq77DsinLkXG9Ee4kDnNJp7dPANLn3A
	 sy4yBiQxBN8fT48krj+T4xnQ4DV0NIp3U/fZka2oYoiOBUxlmp8Wt3h+4INQlLcQ2j
	 MjRNJsV1c/YK5qUpr3EoxZ0MZz6kiZi8tR7q6SlCknd7Wtqn+hDJQDcCruYTA5G2jR
	 9ddZkJXaTSt7s+llOsXJc28eOeeZryir1+cZqg32uIRka1CLd492uc4RMPk6s8belx
	 UpsC+KiJALsZ1bX5dqOionqoWYGQA5kI62Q3KE4HERGN5f5FgRf4enJY57prd6dCEB
	 hGCfMwK+Z38pw==
Date: Fri, 11 Jun 2021 15:04:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] Arm32: MSR to SPSR needs qualification
In-Reply-To: <2d0ac238-bf23-51ed-9ccf-6fd65fc6eec4@suse.com>
Message-ID: <alpine.DEB.2.21.2106111500380.24906@sstabellini-ThinkPad-T480s>
References: <2d0ac238-bf23-51ed-9ccf-6fd65fc6eec4@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Jun 2021, Jan Beulich wrote:
> The Arm ARM's description of MSR (ARM DDI 0406C.d section B9.3.12)
> doesn't even allow for plain "SPSR" here, and while gas accepts this, it
> takes it to mean SPSR_cf. Yet surely all of SPSR wants updating on this
> path, not just the lowest and highest 8 bits.
> 
> Fixes: dfcffb128be4 ("xen/arm32: SPSR_hyp/SPSR")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks for the patch! I disassembled the instruction in the bad Xen
binary and confirmed that 2 of the mask bits are off.

Rebuilding the binary with your patch applied solves the issue: now are
4 bits are set.

Thank you so much!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2: Add doc ref.
> 
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -395,7 +395,7 @@ return_to_hypervisor:
>          ldr r11, [sp, #UREGS_pc]
>          msr ELR_hyp, r11
>          ldr r11, [sp, #UREGS_cpsr]
> -        msr SPSR, r11
> +        msr SPSR_cxsf, r11
>  #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
>          /*
>           * Hardening branch predictor may require to setup a different
> 

