Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04738765C42
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 21:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571260.894684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6sG-00032o-Dy; Thu, 27 Jul 2023 19:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571260.894684; Thu, 27 Jul 2023 19:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP6sG-00031A-Ao; Thu, 27 Jul 2023 19:42:12 +0000
Received: by outflank-mailman (input) for mailman id 571260;
 Thu, 27 Jul 2023 19:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qP6sF-000312-1q
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 19:42:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac01c10c-2cb5-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 21:42:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5D8E61EF0;
 Thu, 27 Jul 2023 19:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F8CC433C7;
 Thu, 27 Jul 2023 19:42:05 +0000 (UTC)
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
X-Inumbo-ID: ac01c10c-2cb5-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690486927;
	bh=9qPDHGoxEaEDr7A4BW04hX62T/INSv0+yTyd5V/hDjI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=thEAFTw/rWTIN4fgYkPmaU46FW0/J0TMp756+0DHuF+34xQTNb66OI7sjrqEifc7w
	 qfgsm9S/Uw/iWEr/foBWLE/H++uVee0hNnbeprxG+KDehNNIrGot6tXDv+i8bLeh65
	 k7FnQm3lxVOvACzs5isdFdJerPEtEOqenvWDFHnG/DeNUZBDInjM7co+ThXwn/Mpof
	 KluaGtEi3Py7wJnq9s5b3d25JJDOHeIzXsBDENfW+O+AiWY32jm6RB9ppzIKw/VgD1
	 aGlYFOXiajeAXLaOwSEPpG14U3Q++l9d9Th+v/scYB5i4+S9e0bSQcxOOKbk7hS0E3
	 Fy12FxOQP5Fyg==
Date: Thu, 27 Jul 2023 12:42:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/notifier: address violations of MISRA C:2012
 Rule 8.3
In-Reply-To: <d362ef56c8c31bcca47d71a430879f087d9a9d04.1690474136.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307271241580.3118466@ubuntu-linux-20-04-desktop>
References: <d362ef56c8c31bcca47d71a430879f087d9a9d04.1690474136.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jul 2023, Federico Serafini wrote:
> Change parameter names in function declarations to be consistent with
> the corresponding definitions. This addesses violations of MISRA C:2012
> Rule 8.3: "All declarations of an object or function shall use the same
> names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/notifier.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/xen/notifier.h b/xen/include/xen/notifier.h
> index 3d6017d4f7..51453c1552 100644
> --- a/xen/include/xen/notifier.h
> +++ b/xen/include/xen/notifier.h
> @@ -37,9 +37,9 @@ struct notifier_head {
>  
>  
>  void notifier_chain_register(
> -    struct notifier_head *nh, struct notifier_block *nb);
> +    struct notifier_head *nh, struct notifier_block *n);
>  void notifier_chain_unregister(
> -    struct notifier_head *nh, struct notifier_block *nb);
> +    struct notifier_head *nh, struct notifier_block *n);
>  
>  int notifier_call_chain(
>      struct notifier_head *nh, unsigned long val, void *v,
> -- 
> 2.34.1
> 

