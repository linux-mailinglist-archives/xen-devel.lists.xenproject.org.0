Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EBE55B7EE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356217.584303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iHT-0004I4-D7; Mon, 27 Jun 2022 06:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356217.584303; Mon, 27 Jun 2022 06:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iHT-0004FS-A6; Mon, 27 Jun 2022 06:31:31 +0000
Received: by outflank-mailman (input) for mailman id 356217;
 Mon, 27 Jun 2022 06:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5iHS-0004FM-3h
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:31:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c6ccb74b-f5e2-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 08:31:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B52631758;
 Sun, 26 Jun 2022 23:31:28 -0700 (PDT)
Received: from [10.57.42.186] (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FC693F5A1;
 Sun, 26 Jun 2022 23:31:26 -0700 (PDT)
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
X-Inumbo-ID: c6ccb74b-f5e2-11ec-b725-ed86ccbb4733
Message-ID: <1218329a-13a3-79b6-6753-c2c9a0c45b2d@arm.com>
Date: Mon, 27 Jun 2022 08:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/7] xen/arm32: head.S: Introduce a macro to load the
 physical address of a symbol
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-3-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220624091146.35716-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> A lot of places in the ARM32 assembly requires to load the physical address
> of a symbol. Rather than open-coding the translation, introduce a new macro
> that will load the phyiscal address of a symbol.
> 
> Lastly, use the new macro to replace all the current open-coded version.
> 
> Note that most of the comments associated to the code changed have been
> removed because the code is now self-explanatory.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index c837d3054cf9..77f0a619ca51 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -65,6 +65,11 @@
>          .endif
>  .endm
>  
> +.macro load_paddr rb, sym
> +        ldr   \rb, =\sym
> +        add   \rb, \rb, r10
> +.endm
> +
All the macros in this file have a comment so it'd be useful to follow this convention.
Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

