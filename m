Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6710B29D05
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085775.1444066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvm5-0005Ig-E9; Mon, 18 Aug 2025 09:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085775.1444066; Mon, 18 Aug 2025 09:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvm5-0005GN-AY; Mon, 18 Aug 2025 09:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1085775;
 Mon, 18 Aug 2025 09:03:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1unvm4-0005GF-9H
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 09:03:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1unvm3-00Be7q-1V;
 Mon, 18 Aug 2025 09:03:27 +0000
Received: from [2a02:8012:3a1:0:ad2f:e692:6470:95d9]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1unvm3-007fzo-1Y;
 Mon, 18 Aug 2025 09:03:27 +0000
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
	bh=eS1n4xYPEb9OakrlpoefPX0czRp3HQqLk7dZByznKPg=; b=PS1Y5Yi5oXr5uwOGnX4p5eOyIX
	rxi5CJjIc+MxmtKsU+PydehqxJ2CaMGUCkyyszxAIaPNMMJe3vaiy7HepXqtphLZ9OG/zW/gATEez
	pTlSsrp9x5vL5rUPa344s6AZ2QUe8CJ39vuvx7bJtEFfnVt1e461VJXlR8foErx3QqKU=;
Message-ID: <d29bddc3-8bd7-4608-97da-bbfa1ae738c0@xen.org>
Date: Mon, 18 Aug 2025 10:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/link: Remove exception table sections
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250818081824.3538065-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250818081824.3538065-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 18/08/2025 09:18, Andrew Cooper wrote:
> This was almost certainly copy&paste from x86.  ARM does not us these nor
> selects HAS_EX_TABLE, so drop the sections and their boundary markers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> Found because I'm getting rid of .ex_table.pre on x86 too.
> ---
>   xen/arch/arm/xen.lds.S | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 9f30c3a13ed1..db17ff1efa98 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -86,16 +86,6 @@ SECTIONS
>     } : text
>   
>     .data.read_mostly : {
> -       /* Exception table */
> -       __start___ex_table = .;
> -       *(.ex_table)
> -       __stop___ex_table = .;
> -
> -       /* Pre-exception table */
> -       __start___pre_ex_table = .;
> -       *(.ex_table.pre)
> -       __stop___pre_ex_table = .;
> -
>          *(.data.read_mostly)
>     } :text
>   

-- 
Julien Grall


