Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53643817F4E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656446.1024606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP1p-0005BV-8p; Tue, 19 Dec 2023 01:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656446.1024606; Tue, 19 Dec 2023 01:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP1p-00059Z-56; Tue, 19 Dec 2023 01:36:13 +0000
Received: by outflank-mailman (input) for mailman id 656446;
 Tue, 19 Dec 2023 01:36:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFP1n-00059K-JS
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:36:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc50f519-9e0e-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:36:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1D99BB81229;
 Tue, 19 Dec 2023 01:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F30C433C8;
 Tue, 19 Dec 2023 01:36:07 +0000 (UTC)
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
X-Inumbo-ID: fc50f519-9e0e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949768;
	bh=0J96ySdbbzl4ZsgquTQftGIDZeBgzpJgnGcLARnBKww=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZuVmERx09sYlVRs5NG/Uwk8ynpw0u36kFjgIC4DinvFs6ZrLZvGCrca3CA1hUIR61
	 xKVLYl3uQP1mpDDfbxY4dlITyHnTjHC78bXvF9qTS+jfSEzoS8uNKjzy1qmi+gf2gj
	 jP9nFkkLVPAmV1JTpBvfOBna0bHEZ48d6VycmUpKmy1KUXpqZzZw9lOkAVfVhhyXMv
	 08ps7xr81hWQ3N8vD6LnlOt28Lf5TE9zECoWs+TZBOigkvyHD3xOxSZBZaEnnvfTVU
	 n0xZmeCgSH144hUDGCyRzpE1sFDAnINyX4ZJHp1w7zED/xdF2OeB3pwWPE688U2x8k
	 ejguis22ST6yw==
Date: Mon, 18 Dec 2023 17:36:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 4/7] xen/arm: traps: add ASSERT_UNREACHABLE()
 where needed
In-Reply-To: <02070d1bb4bfc0e88d548a529bef8bedab5b3488.1702891792.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181735550.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <02070d1bb4bfc0e88d548a529bef8bedab5b3488.1702891792.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> The statements after a call to the noreturn function 'do_unexpected_trap'
> can't be reached, thus violating MISRA C:2012 Rule 2.1
> ("A project shall not contain unreachable code.").
> ASSERT_UNREACHABLE() is used to signal that the unreachable break-s are used as
> a defensive coding measure to prevent inadvertent fallthrough.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Use ASSERT_UNREACHABLE() to prevent mistakes.
> ---
>  xen/arch/arm/traps.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 3784e8276ef6..77220ba0927a 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2152,6 +2152,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
>      case HSR_EC_SVE:
>          /* An SVE exception is a bug somewhere in hypervisor code */
>          do_unexpected_trap("SVE trap at EL2", regs);
> +        ASSERT_UNREACHABLE();
>          break;
>  #endif
>      case HSR_EC_DATA_ABORT_CURR_EL:
> @@ -2171,7 +2172,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
>              dump_hyp_walk(get_hfar(is_data));
>  
>          do_unexpected_trap(fault, regs);
> -
> +        ASSERT_UNREACHABLE();
>          break;
>      }
>      default:
> -- 
> 2.34.1
> 

