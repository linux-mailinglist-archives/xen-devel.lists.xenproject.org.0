Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A373317B3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 20:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95062.179314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJLrg-0007Wo-I1; Mon, 08 Mar 2021 19:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95062.179314; Mon, 08 Mar 2021 19:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJLrg-0007WP-EB; Mon, 08 Mar 2021 19:48:28 +0000
Received: by outflank-mailman (input) for mailman id 95062;
 Mon, 08 Mar 2021 19:48:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJLre-0007WJ-Hj
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 19:48:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJLrd-0003cl-5f; Mon, 08 Mar 2021 19:48:25 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJLrc-0006aE-T0; Mon, 08 Mar 2021 19:48:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=SWAW896krNQ7uBnY5aTRSBeZLWYPuMmU5UC6Lez3ZMY=; b=VZVmPdPWlyIBPPWgUMOHTg9RAL
	DGSDxKqiF5HhfvWK94Jx+OculxGk5Xrh2XE12nr5Iw+a5GUhcqXS3ubm/+sSUE33iQVUrwU2AoVyP
	qoxtLUOHGRcyuMQKSiOtpfeueza3ztUBnQv+6qCWeMCGqMjZ9Y7nk/Mt8m4zAwsGndvg=;
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
Date: Mon, 8 Mar 2021 19:48:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 08/03/2021 17:18, Bertrand Marquis wrote:
> All cpu identification registers that we store in the cpuinfo structure
> are 64bit on arm64 and 32bit on arm32 so storing the values in 32bit on
> arm64 is removing the higher bits which might contain information in the
> future.
> 
> This patch is changing the types in cpuinfo to register_t (which is
> 32bit on arm32 and 64bit on arm64) and adding the necessary paddings
> inside the unions.

I read this as we would replace uint32_t with register_t. However, there 
are a few instances where you, validly, replace uint64_t with 
register_t. I would suggest to clarify it in the commit message.

> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index cae2179126..ea0dd3451e 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -321,7 +321,8 @@ void start_secondary(void)
>       if ( !opt_hmp_unsafe &&
>            current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
>       {
> -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU MIDR (0x%x),\n"
> +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not match boot "
> +               "CPU MIDR (0x%"PRIregister"),\n"

For printk messages, we don't tend to split it like that (even for more 
than 80 characters one). Instead, the preferred approach is:

printk(XENLOG_ERR
        "line 1\n"
        "line 2\n")


The rest of the code looks good to me:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

