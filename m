Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C681A052
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657847.1026985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFx1F-0001vP-5j; Wed, 20 Dec 2023 13:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657847.1026985; Wed, 20 Dec 2023 13:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFx1F-0001st-24; Wed, 20 Dec 2023 13:53:53 +0000
Received: by outflank-mailman (input) for mailman id 657847;
 Wed, 20 Dec 2023 13:53:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFx1D-0001sn-LQ
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:53:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFx1D-00067o-Al; Wed, 20 Dec 2023 13:53:51 +0000
Received: from [15.248.2.151] (helo=[10.6.7.47])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFx1D-0008PA-4r; Wed, 20 Dec 2023 13:53:51 +0000
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
	bh=9HqDhSHp+DV1ck4uC5QA+u3EF2fs8qSL7gsTa92jb2A=; b=zcUgmWUGcnytY3pcERSVYFV6zv
	KNGTDa2WpRyoeX1h+cQxHlssC/M2bZmubIUE1NPPSHx2gXYoWv8snWvt3RfegXDb3wWPxP4BlFCXr
	5HJukAiCWZ/2Rs/kJsAKxAaZay7Iir1W3V7F37BW7KJc2Bz2CmbQ1E2fgQPj7yNT6cwY=;
Message-ID: <6a60f94e-a02b-4aed-be60-3f071c8d4e08@xen.org>
Date: Wed, 20 Dec 2023 13:53:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 15/12/2023 02:43, Shawn Anastasio wrote:
> Move Arm's bootfdt.c to xen/common so that it can be used by other
> device tree architectures like PPC and RISCV. Only a minor change to
> conditionalize a call to a function only available on EFI-supporting
> targets was made to the code itself. >
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

With the MAINTAINERS file updated (I would add under DEVICE TREE) and 
one note below:

Acked-by: Julien Grall <jgrall@amazon.com>

> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>   {
>       int rc = 0;
>   
> -    /*
> -     * If Xen has been booted via UEFI, the memory banks are
> -     * populated. So we should skip the parsing.
> -     */
> -    if ( !efi_enabled(EFI_BOOT) &&
> -         device_tree_node_matches(fdt, node, "memory") )
> +    if ( device_tree_node_matches(fdt, node, "memory") )
> +#if defined(CONFIG_ARM_EFI)

As discussed in a separate subthread, I would be ok with any of the 
options proposed. So feel free ot keep my Acked-by once this is settled.

Cheers,

-- 
Julien Grall

