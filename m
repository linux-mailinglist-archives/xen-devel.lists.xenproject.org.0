Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497376031E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 01:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569267.889683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4xB-0001G2-Ov; Mon, 24 Jul 2023 23:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569267.889683; Mon, 24 Jul 2023 23:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4xB-0001E7-MH; Mon, 24 Jul 2023 23:27:01 +0000
Received: by outflank-mailman (input) for mailman id 569267;
 Mon, 24 Jul 2023 23:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO4xA-0001E1-3d
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 23:27:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94da31fc-2a79-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 01:26:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF79F61464;
 Mon, 24 Jul 2023 23:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631C9C433C7;
 Mon, 24 Jul 2023 23:26:54 +0000 (UTC)
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
X-Inumbo-ID: 94da31fc-2a79-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690241215;
	bh=VpbOjrX3jU4/CqCdljyGKHEWm7DOHDx2keBjS5cUgQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jnIOAoX/wpFu3EH2c21D1BUMwRIIEzpvXNEbN4WZAyJIE7SHWs8bWw78Esht2ptU3
	 LA+DUpHQb11YoQwLP9wvnK1IF35gSNlgMeBnTjQO3fEyEm8cRVffqzOEwdhxfjAMWP
	 /d3YuN/relvLLMJYZP9EWw7UoOuCr2PiuptTZLS5wHYAyp6VDCIegv54DsChuEvirU
	 lF9TUGebfWhMzXOde9MZAIAnHb/DniM39kWlvRrsHJ6EoWIVKbv5AQ8edsrTy3x41k
	 mbt0dU4RjjQQZ3LGg431bNF0dqmcjssKovsGKMMwxkN9jk0KdLdb5o10krRNbUrLvM
	 S+LE77ZFvPOnw==
Date: Mon, 24 Jul 2023 16:26:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] docs/misra: document the usage of array range
 initializers
In-Reply-To: <5dc1aa0a5cd2ee3410047956f8e69c32c4b227ca.1690215341.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241626270.3118466@ubuntu-linux-20-04-desktop>
References: <5dc1aa0a5cd2ee3410047956f8e69c32c4b227ca.1690215341.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Nicola Vetrini wrote:
> The usage of a documented GNU extension that allows a range of elements
> in an array to be initalized to the same value using a designated
> initalizer is added to this document, to fully comply with
> MISRA C:2012 Rule 1.1.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/misra/C-language-toolchain.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index 8651f59118..785aed1eaf 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -196,6 +196,10 @@ The table columns are as follows:
>       - X86_64
>       - See Section "6.9 128-bit Integers" of GCC_MANUAL.
>  
> +   * - Designated initializer for a range of elements
> +     - ARM64, X86_64
> +     - See Section "6.29 Designated Initializers" of GCC_MANUAL
> +
>  
>  Translation Limits
>  __________________
> -- 
> 2.34.1
> 

