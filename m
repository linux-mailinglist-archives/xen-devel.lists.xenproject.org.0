Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD117CA2E0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 10:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617343.959867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJON-0003GM-5c; Mon, 16 Oct 2023 08:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617343.959867; Mon, 16 Oct 2023 08:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJON-0003Dx-30; Mon, 16 Oct 2023 08:56:03 +0000
Received: by outflank-mailman (input) for mailman id 617343;
 Mon, 16 Oct 2023 08:56:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsJOL-0003Dr-LA
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 08:56:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJOK-0004Ll-Uv; Mon, 16 Oct 2023 08:56:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJOK-0004MG-Oh; Mon, 16 Oct 2023 08:56:00 +0000
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
	bh=TayO3p1Si2RUSJQFk5L+slOxZhQ41jJCNd3m/yP23mI=; b=xXrUWre0jwl/7Pjs8dg7U2uNUu
	MtdK3Ad4NbR40i03pf6GKl4/VrXYZw2P7zNd8Vt1RfaTB0oWRp/tqImkzoIk1zoAll+oPSH55IjN0
	b4uxxj3V0BgBmQkujeuA0okObrpVfnz+KKJl290eWDAKHLzt1hhyq9ge7ia1vbpLdwhM=;
Message-ID: <e0d25773-8494-466a-82f8-8f01533d7c9a@xen.org>
Date: Mon, 16 Oct 2023 09:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/10] arm/cpufeature: address violations of MISRA
 C:2012 Rule 8.2
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/10/2023 16:24, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 8011076b8c..41e97c23dd 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
>   struct arm_cpu_capabilities {
>       const char *desc;
>       u16 capability;
> -    bool (*matches)(const struct arm_cpu_capabilities *);
> -    int (*enable)(void *); /* Called on every active CPUs */
> +    bool (*matches)(const struct arm_cpu_capabilities *caps);
> +    int (*enable)(void *ptr); /* Called on every active CPUs */

How did you come up with the name? The void * seems to be named 'data' 
by the declaration and I think we should be consistent, otherwise this 
is defeating the spirit of MISRA (assuming this is not a violation).

Cheers,

-- 
Julien Grall

