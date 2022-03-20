Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250014E1AB0
	for <lists+xen-devel@lfdr.de>; Sun, 20 Mar 2022 08:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292543.496845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVqHQ-0000Kw-8K; Sun, 20 Mar 2022 07:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292543.496845; Sun, 20 Mar 2022 07:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVqHQ-0000J3-4M; Sun, 20 Mar 2022 07:47:12 +0000
Received: by outflank-mailman (input) for mailman id 292543;
 Sun, 20 Mar 2022 07:47:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVqHP-0000Ix-5V
 for xen-devel@lists.xenproject.org; Sun, 20 Mar 2022 07:47:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVqHL-0001aR-0c; Sun, 20 Mar 2022 07:47:07 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVqHK-0002WT-RB; Sun, 20 Mar 2022 07:47:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Y4/OOMxBxt9dtO702g8JlLtNX+ikUtslxbEvBEyvBOQ=; b=fj8okCEsXtL2CtainGVfgbytsU
	eUSDba7hmDL8pPSaeqtd/qTjkn80jcyX7Fmk/6y3KFDwce6e0Klo0I8KsgXCa6coYzOAAJWo0fmGN
	k+SJWmrqo5bGL2t4EwxpJ1qOJ5hkBCP2W6McvaTk8M9Wz/OmaLHx2uhv3jGnCa/V0nLU=;
Message-ID: <33f1ea14-4486-be3d-ca9f-a82274078dba@xen.org>
Date: Sun, 20 Mar 2022 07:47:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220320010509.3605525-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: skip first 32 bytes of zimage32
In-Reply-To: <20220320010509.3605525-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 20/03/2022 01:05, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> The first 32 bytes of zImage32 are NOPs, not useful just there for
> compatibility. The reason is that some bootloaders skip the first 32
> bytes when starting the kernel. See the comment in Linux
> arch/arm/boot/compressed/head.S.

Please mention the Linux verson.

> 
> Since the introduction of CONFIG_EFI in Linux arm32, those NOPs
> operations have changed implementation from:
> 
>      mov r0, r0
> 
> to:
>      .inst   MZ_MAGIC | (0x1310 << 16)   @ tstne r0, #0x4d000

I have duplicated the comment and the instructions below:

                 @ This is a two-instruction NOP, which happens to bear the
                 @ PE/COFF signature "MZ" in the first two bytes, so the 
kernel
                 @ is accepted as an EFI binary. Booting via the UEFI stub
                 @ will not execute those instructions, but the ARM/Linux
                 @ boot protocol does, so we need some NOPs here.
                 .inst   MZ_MAGIC | (0xe225 << 16)       @ eor r5, r5, 
0x4d000
                 eor     r5, r5, 0x4d000                 @ undo previous 
insn


I read this as they are NOPs and this change should not break the 
ARM/Linux boot protocol (we are using it in Xen).

BTW, the instruction decoding is different compare to me. Which version 
of Linux are you using?

> 
> See arch/arm/boot/compressed/efi-header.S.
> 
> The new implementation doesn't work on Xen (at least on all versions of
> QEMU I tried).

As I wrote above, they are NOPs. So why is this breaking?

> 
> Since the first 32 bytes are made to be skipped anyway, skip them. This
> enables Xen to load and start successfully (on QEMU) aarch32 kernels
> with CONFIG_EFI.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/kernel.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 8f43caa186..105a010bf4 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -411,10 +411,10 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
>           }
>       }
>   
> -    info->zimage.kernel_addr = addr;
> +    info->zimage.kernel_addr = addr + 32;

This will need some explanation in the code. The code in the tools will 
also need to be updated.

>   
>       info->zimage.start = start;
> -    info->zimage.len = end - start;
> +    info->zimage.len = end - start - 32;
>   
>       info->load = kernel_zimage_load;
>   

Cheers,

-- 
Julien Grall

