Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFEBAC98B9
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001796.1381925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAhl-000370-Lk; Sat, 31 May 2025 01:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001796.1381925; Sat, 31 May 2025 01:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAhl-00034z-Iy; Sat, 31 May 2025 01:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1001796;
 Sat, 31 May 2025 01:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAhj-00034t-VY
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:08:07 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b30adfa6-3dbb-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 03:08:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D17F629C1;
 Sat, 31 May 2025 01:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478D9C4CEEB;
 Sat, 31 May 2025 01:08:00 +0000 (UTC)
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
X-Inumbo-ID: b30adfa6-3dbb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748653681;
	bh=wvJ1e/lNv/4dB+Vpy2uuG4CqzZ7ePBOWv5u/o4IyD3U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O7kckEgDuKvVfKT0h0jJFgRQ0KTsQwidz0By0tQ5KkdA8tj5YgARi2gnJIb4DGm8I
	 HfPWEsI1uDbd8S1zOV51hS4Tjq5v+oUI+xKeRsRK10vmpaZNkh9N/kJVxsIRi21uX+
	 3GW1M2jbO1pH72exFp5pENqMyu91qP05UnkVN5XcSk+WOT0YOgQIKzrSnS0w4yD8fp
	 ++oVOcpHDtCR8M7zqLSigCH1tQxU4s7S8+ESp3ORzrv11eKWAWk6xZ1/DAcsl/Z9xd
	 Grs7g63x6ljrejOsJnPgdgnWMxYatRzVbsCn3Kfo0mZPjYXYlglPCFr0r6V2sH6XFB
	 Zc9vW6onKyzww==
Date: Fri, 30 May 2025 18:07:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 09/19] x86: Preinitialise all modules to be of kind
 BOOTMOD_UNKNOWN
In-Reply-To: <20250530120242.39398-10-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301807060.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-10-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> A later patch removes boot_module and replaces its uses with bootmodule.
> The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
> value, so it must be explicitly set in the static xen_boot_info.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/setup.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 1f5cb67bd0..5da9df33c9 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -298,6 +298,7 @@ struct boot_info __initdata xen_boot_info = {
>      .loader = "unknown",
>      .cmdline = "",
>      .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
> +    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
>  };
>  
>  static struct boot_info *__init multiboot_fill_boot_info(
> -- 
> 2.43.0
> 
> 

