Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15A912F97
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 23:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745599.1152734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlrY-0005E4-PD; Fri, 21 Jun 2024 21:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745599.1152734; Fri, 21 Jun 2024 21:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlrY-0005CH-MR; Fri, 21 Jun 2024 21:32:04 +0000
Received: by outflank-mailman (input) for mailman id 745599;
 Fri, 21 Jun 2024 21:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKlrW-0005CB-Sv
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 21:32:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b097f025-3015-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 23:31:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 335FD62F9F;
 Fri, 21 Jun 2024 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4E5C2BBFC;
 Fri, 21 Jun 2024 21:31:56 +0000 (UTC)
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
X-Inumbo-ID: b097f025-3015-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719005517;
	bh=2b3yQ/OXCPBmU4nkW1SyGQ0JPBACNpJz2Dc/ulbusNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rltagSZ3JiFAhmjhxrMo2/zi9X0yuEx5aOyzFkY9dYyrO4/oXHKfJM2CwbQ7nlCiq
	 oLnJ0kUkd334ElyhrBt2BzkGKGuaADFJTyiW1/6KmCMXYvSSEgF7MKplJm08JXl491
	 v6Jysi1JFCc01tM7q6mV0YhocUNRaYlIG6ygZirZFSEZ8LL/lp70PKQq99T4UN7LNE
	 I8PJKEO0MYAaL1ycNm8ZQrKH8++jpxwDieQNnJVXpNRXuOY11YMd0XNa3tvCm66uKM
	 VMFs779lNcTYX9kWTCDyneZpsoM2NnbNf8RL2sQkDHW/O1SgUWQD69UmPIerexIQdX
	 HiwPMZQP11XYA==
Date: Fri, 21 Jun 2024 14:31:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    oleksii.kurochko@gmail.com
Subject: Re: [PATCH v2] common/unlzo: address violation of MISRA C Rule 7.3
In-Reply-To: <847f9b715b3c8e2ba0637fdd79111f4f828389c6.1718976211.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406211431210.2572888@ubuntu-linux-20-04-desktop>
References: <847f9b715b3c8e2ba0637fdd79111f4f828389c6.1718976211.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Alessandro Zucchelli wrote:
> This addresses violations of MISRA C:2012 Rule 7.3 which states as
> following: the lowercase character `l' shall not be used in a literal
> suffix.
> 
> The file common/unlzo.c defines the non-compliant constant LZO_BLOCK_SIZE with
> having a lowercase 'l'.
> It is now defined as '256*1024L'.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Asking for a release ack for this trivial change


> ---
> Changes from v1:
> Instead of deviating /common/unlzo.c reports fro Rule 7.3 they are addressed by
> changing the non-compliant definition of LZO_BLOCK_SIZE.
> ---
>  xen/common/unlzo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
> index bdcefa95b3..acb8dff600 100644
> --- a/xen/common/unlzo.c
> +++ b/xen/common/unlzo.c
> @@ -52,7 +52,7 @@ static inline u32 get_unaligned_be32(const void *p)
>  static const unsigned char lzop_magic[] = {
>  	0x89, 0x4c, 0x5a, 0x4f, 0x00, 0x0d, 0x0a, 0x1a, 0x0a };
>  
> -#define LZO_BLOCK_SIZE        (256*1024l)
> +#define LZO_BLOCK_SIZE        (256*1024L)
>  #define HEADER_HAS_FILTER      0x00000800L
>  #define HEADER_SIZE_MIN       (9 + 7     + 4 + 8     + 1       + 4)
>  #define HEADER_SIZE_MAX       (9 + 7 + 1 + 8 + 8 + 4 + 1 + 255 + 4)
> -- 
> 2.34.1
> 

