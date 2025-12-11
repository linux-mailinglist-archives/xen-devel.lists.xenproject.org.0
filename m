Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C97CB55E1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183764.1506359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd5b-0008LZ-NM; Thu, 11 Dec 2025 09:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183764.1506359; Thu, 11 Dec 2025 09:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd5b-0008K5-KE; Thu, 11 Dec 2025 09:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1183764;
 Thu, 11 Dec 2025 09:35:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vTd5a-0008Jz-Ab
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:35:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vTd5Z-004kfO-1h;
 Thu, 11 Dec 2025 09:35:57 +0000
Received: from [2a02:8012:3a1:0:cd49:6fb:8176:d6c5]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vTd5Z-004m19-23;
 Thu, 11 Dec 2025 09:35:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=AfwQizTc1jEFFteetgNTxLeD46FJeUWFZtg2IATFydA=; b=ZYxYM/AzJW/RrAnW48ANfvQpoA
	FQaGGpjdGX1xZE3WoMgySFmk21ljGSpbg4/AnEvQ/p7bZC7TnUA8KrAr+hINsd6GzfbmIYFauT+cx
	W6PQDWIxxPgHvkzX3YPXaRwNboHjH2sS1kXdywaGFLSC8hN9N+cIt1CroVp1WqNmw6e8=;
Message-ID: <f49dd123-32ca-46b2-a00e-751267667bd2@xen.org>
Date: Thu, 11 Dec 2025 09:35:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm64: Add support Clang build on arm64
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2025 02:39, Saman Dehghan wrote:
> This patch enables building Xen on arm64 architecture using the Clang compiler.
> Changes include:
> - Add explicit -march=armv8 flag for arm64 builds.
> - Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
>    `vfp_restore_state` functions when building with Clang to allow
>    FP instructions despite `-mgeneral-regs-only`.
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>   README                   | 2 ++
>   xen/arch/arm/arch.mk     | 1 +
>   xen/arch/arm/arm64/vfp.c | 6 ++++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/README b/README
> index 889a4ea906..67c1aa7fe6 100644
> --- a/README
> +++ b/README
> @@ -45,6 +45,8 @@ provided by your OS distributor:
>         - For ARM:
>           - GCC 5.1 or later
>           - GNU Binutils 2.25 or later
> +        or
> +        - Clang/LLVM 11 or later

I forgot to ask. Is this cross-compiling or native? Or both?

And OOI, how did you chose Clang 11?

Cheers,

-- 
Julien Grall


