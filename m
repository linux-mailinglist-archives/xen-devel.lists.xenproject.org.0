Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073088C6F89
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722711.1126945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P3z-0004gl-OM; Thu, 16 May 2024 00:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722711.1126945; Thu, 16 May 2024 00:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P3z-0004fE-Lf; Thu, 16 May 2024 00:33:39 +0000
Received: by outflank-mailman (input) for mailman id 722711;
 Thu, 16 May 2024 00:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7P3y-0004f8-0t
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:33:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edf9d4a1-131b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 02:33:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A972861637;
 Thu, 16 May 2024 00:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268C2C116B1;
 Thu, 16 May 2024 00:33:33 +0000 (UTC)
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
X-Inumbo-ID: edf9d4a1-131b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819614;
	bh=wufE5MAe99888uZBmU34n3fYHQZDQKudRYwmkN0nIzw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HertGY37cas/q50fkWRT0guRLPsZ5oNhbJoVvxYZ47ZU0bR48vAfL9QVQhEMsQODo
	 2TsOjJeEu9YOqi1LG2wktyuRJHy0VXm5bCH4GaWvydeHyU9kmIF3pV8hH0JC897QAp
	 gCka/H1Qf1O/Pd9HZJBGtB/QcJaUkIcqUVRoAeFindvJxoaVDNCBOfeiCazz68Gkc9
	 IaqQgqF5aCmew8Lvsr78e9J74OogTB1bcJs26cwvPse2kM6XWTn/cyWr9UO7R3sZc7
	 ulQfbaLT9T6ia9xh93JHPxSQgsLIlB4GTus4s4aX3MG9+KR3/xg4JLRtW/PzQy0anV
	 GwKe2M+RJMW1w==
Date: Wed, 15 May 2024 17:33:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [XEN PATCH v2 05/15] x86: introduce CONFIG_ALTP2M Kconfig
 option
In-Reply-To: <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151732490.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Add new option to make altp2m code inclusion optional.
> Currently altp2m support provided for VT-d only, so option is dependant on VMX.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 8c9f8431f0..2872b031a7 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -358,6 +358,11 @@ config REQUIRE_NX
>  	  was unavailable. However, if enabled, Xen will no longer boot on
>  	  any CPU which is lacking NX support.
>  
> +config ALTP2M
> +	bool "Alternate P2M support"
> +	def_bool y
> +	depends on VMX && EXPERT

I think we need a small help text here, something like

Alternate-p2m allows a guest to manage multiple p2m guest physical "memory
views" (as opposed to a single p2m). Useful for memory introspection.


>  endmenu
>  
>  source "common/Kconfig"
> -- 
> 2.25.1
> 

