Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E097CAE2AE3
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 19:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021669.1397581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uT2Rn-0007TU-Ew; Sat, 21 Jun 2025 17:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021669.1397581; Sat, 21 Jun 2025 17:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uT2Rn-0007Qx-Bo; Sat, 21 Jun 2025 17:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1021669;
 Sat, 21 Jun 2025 17:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uT2Rm-0007Qr-KU
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 17:56:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd63cf21-4ec8-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 19:56:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1D2C5C35B1;
 Sat, 21 Jun 2025 17:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0CFC4CEE7;
 Sat, 21 Jun 2025 17:55:57 +0000 (UTC)
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
X-Inumbo-ID: fd63cf21-4ec8-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750528559;
	bh=cbKij5rY8MqKV2pBio60lHHafYTeUqHLsxJliWIT4Y8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IspJ/srRtwRmE5u0Zh0bjKhPS+OUakGIBeg8c1HNiNN1JZAnz/y0449Dng5O8rGET
	 C9jDsJaRNZfOQ1ffkFTaDYdtB3+zNebPV4tl10dnkhvUs/CB1xGtB0ncQ6V4GXJe0P
	 FgxG9msWEoeErTWOL0Jdt1TwlEZ0GnPBQdWXKrqKilHiD5PNwPOYejS1IhxspUIr/+
	 suREoqDlL2i+16Hanezcb1PAqs7p1Rb41OSLX+i7wrvvpDwrSWdyvJfqvhu2ZZuD6z
	 sUUUfFtJlBlbk6jP6h+rVA1a3CB3v3XY7Kfjm6HMutdL9K0iqZPUxnifUeB4X61B6y
	 EaLqoxm4S1Bow==
Date: Sat, 21 Jun 2025 10:55:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] xen: fix header guard generation for asm-generic
 headers
In-Reply-To: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2506211055500.2978375@ubuntu-linux-20-04-desktop>
References: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Jun 2025, Nicola Vetrini wrote:
> Dashes were wrongly not translated into underscores, thus generating
> an unexpected guard identifier.
> 
> Fixes: ee79f378311b ("xen: add header guards to generated asm generic headers")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>


Thank you so much for the quick fix!!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>  xen/scripts/Makefile.asm-generic | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
> index b0828018080d..f6850758c54b 100644
> --- a/xen/scripts/Makefile.asm-generic
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -34,7 +34,7 @@ unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>  quiet_cmd_wrap = WRAP    $@
>        cmd_wrap = \
>  	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
> -	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '__'); \
>  	echo "\#ifndef $${arch}_GENERIC_$${upper}" > $@.new; \
>  	echo "\#define $${arch}_GENERIC_$${upper}" >> $@.new; \
>  	echo "\#include <asm-generic/$*.h>" >> $@.new; \
> -- 
> 2.43.0
> 

