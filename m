Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EECCB18F2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 02:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182460.1505326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8Zw-0001h5-50; Wed, 10 Dec 2025 01:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182460.1505326; Wed, 10 Dec 2025 01:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8Zw-0001d4-1z; Wed, 10 Dec 2025 01:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1182460;
 Wed, 10 Dec 2025 01:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8Zu-00014J-UG
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 01:01:14 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8630b16-d563-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 02:01:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C1A2860129;
 Wed, 10 Dec 2025 01:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18189C4CEF5;
 Wed, 10 Dec 2025 01:01:09 +0000 (UTC)
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
X-Inumbo-ID: b8630b16-d563-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765328471;
	bh=Lq94aNmgtgqA/YmJ2lIveeijcUD3NIyxdaSwjWATQwM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=COZsmXgCEEWOzm8myvj6VbEh4nli3u1t3WS5dPAC6tghfG3yvYPb2jWI5RlnUZlS6
	 +UMiHI2A2WUyufs76JRUlijR3bs6G1EJiNZH1aB4+LVZHQ7LL3Zl5PDqfmUeYi6bwa
	 9g9dVRttRGZeOOcnMAbfufZbW2TY4bhyUonFqoTySNCLWxXNTHUci7COZ6xRvTN1RO
	 3IkgwgpB04cxxrJbnaeIqcfb2f1BtVPSsSmLJixBJPD5Yep5a8AX0/RkLUXA4kzZKB
	 sur3F3whH/D7NNfWhBxg7Ee/LqyRjUG87l2GW6OMLPGz3ZIOIzrvTR1KL66IdB4IOt
	 HJiv1YRMi+bsA==
Date: Tue, 9 Dec 2025 17:01:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/gic_v3: fix MISRA C R2.1 violations in
 gicv3_do_LPI()
In-Reply-To: <b26772df8733dbd1ce6ea14a6e8b73f278db3a3d.1759174857.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2512091700130.19429@ubuntu-linux-20-04-desktop>
References: <b26772df8733dbd1ce6ea14a6e8b73f278db3a3d.1759174857.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Sep 2025, Dmytro Prokopchuk1 wrote:
> The function 'gicv3_do_LPI()' violates MISRA C 2012 Rule 2.1, which states:
> "A project shall not contain unreachable code." This is due to the use of
> the 'BUG()' macro, which causes the function to never return.
> 
> This behavior is intentional and safe within the specific build configuration
> defined by 'CONFIG_HAS_ITS'. The 'BUG()' macro handles irrecoverable error
> conditions where LPIs must not occur without an ITS enabled.
> 
> A SAF comment has been added to document the justification for this violation,
> stating that it is safe within the context of the Xen project.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2070455717
> ---
>  docs/misra/safe.json                  | 8 ++++++++
>  xen/arch/arm/include/asm/gic_v3_its.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 3584cb90c6..4c227c1e8b 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -124,6 +124,14 @@
>          },
>          {
>              "id": "SAF-15-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R2.1"
> +            },
> +            "name": "Rule 2.1: Unreachable code",
> +            "text": "It is safe because the BUG() macro is intentionally used to terminate execution when LPIs are enabled without an ITS."
> +        },
> +        {
> +            "id": "SAF-16-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
> index fc5a84892c..672dae7ac3 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -229,6 +229,7 @@ static inline unsigned int vgic_v3_its_count(const struct domain *d)
>      return 0;
>  }
>  
> +/* SAF-15-safe */
>  static inline void gicv3_do_LPI(unsigned int lpi)
>  {
>      /* We don't enable LPIs without an ITS. */

Please replace the BUG with ASSERT_UNRECHEABLE and it should resolve the
problem without needed the extra deviation

> -- 
> 2.43.0
> 

