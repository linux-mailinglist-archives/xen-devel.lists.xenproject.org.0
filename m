Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C276DDDC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 04:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575964.901565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNlT-0000jD-Cp; Thu, 03 Aug 2023 02:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575964.901565; Thu, 03 Aug 2023 02:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNlT-0000gV-AB; Thu, 03 Aug 2023 02:08:35 +0000
Received: by outflank-mailman (input) for mailman id 575964;
 Thu, 03 Aug 2023 02:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNlR-0000gL-L5
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 02:08:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fa6c0f-31a2-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 04:08:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B748F61A55;
 Thu,  3 Aug 2023 02:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B98C433C8;
 Thu,  3 Aug 2023 02:08:27 +0000 (UTC)
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
X-Inumbo-ID: a3fa6c0f-31a2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691028509;
	bh=aA4v9h6t6gO/CizV6u27fPJ0WGPVWaL/wPZimXZ9TTk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AZ5jQHaSAx8zb39wSfyXbgqcZx/tMUjunnIR7lpJoLCByPab88TkYaVbZpREGYpTD
	 nnufxQ6hIVQoNZjNEzuHlZTes+9G5ydPwH7Ik7ly/ax+7AXM6Gc3Paglo5b8U9i9hc
	 G6PAaAiIyiO7mBgGHGdSBbRUn/BeE3chFOEgmWCb5AFbdAxsUmpc/4RMa1xPaLTUBD
	 TXkS7jrXJ+9yCHoJtKfOS2xOqDwmOW4RyNGbpBshpU9wxTCVqunJPTxgeeihfCCE0d
	 odTZvybce7JkxMHnxiemGWsnrR2znRU6ndpbA8mOiPHuJzWu54Qy3ZcnAvXgntRS5J
	 S/XNi6SyGAVkg==
Date: Wed, 2 Aug 2023 19:08:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 01/11] x86/efi: move variable declaration to address
 MISRA C:2012 Rule 2.1
In-Reply-To: <aa72e3371fa4ab4806cd866c569718d766d3142e.1690985045.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021906530.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <aa72e3371fa4ab4806cd866c569718d766d3142e.1690985045.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> The variable declaration is moved where it's actually used, rather
> than being declared in the switch before any clause, thus being
> classified as unreachable code.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/efi/efi-boot.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 92f4cfe8bd..b00441b1a2 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -390,8 +390,6 @@ static void __init efi_arch_edd(void)
>          {
>              switch ( DevicePathType(devp.DevPath) )
>              {
> -                const u8 *p;
> -
>              case ACPI_DEVICE_PATH:
>                  if ( state != root || boot_edd_info_nr > EDD_INFO_MAX )
>                      break;
> @@ -463,7 +461,8 @@ static void __init efi_arch_edd(void)
>                  params->device_path_info_length =
>                      sizeof(struct edd_device_params) -
>                      offsetof(struct edd_device_params, key);
> -                for ( p = (const u8 *)&params->key; p < &params->checksum; ++p )
> +                for ( const u8 *p = (const u8 *)&params->key;
> +                      p < &params->checksum; ++p )

In Xen we don't mix declaration and code. So the following is not
something we use:

  for (int i = 0; i < 10; i++)

I think you'd have to introduce another block under case
MESSAGING_DEVICE_PATH so that you can moved const u8 *p there


>                      params->checksum -= *p;
>                  break;
>              case MEDIA_DEVICE_PATH:
> -- 
> 2.34.1
> 

