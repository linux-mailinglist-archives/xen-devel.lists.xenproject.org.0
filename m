Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD96FF494
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533432.830104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7Q8-0003uX-Lk; Thu, 11 May 2023 14:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533432.830104; Thu, 11 May 2023 14:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7Q8-0003sk-He; Thu, 11 May 2023 14:37:28 +0000
Received: by outflank-mailman (input) for mailman id 533432;
 Thu, 11 May 2023 14:37:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1px7Q7-0003qb-5q
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:37:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px7Q6-0005dz-47; Thu, 11 May 2023 14:37:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px7Q5-0000Gg-Ss; Thu, 11 May 2023 14:37:26 +0000
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
	bh=ZYhj0Eshn4W2mHjc4M/pi9DEN1/5+B9kJarqvHqicHY=; b=YwuYaXhk+5Mwwu6s/r1P9lTWDX
	AlDO+xkOuePh/AhYLQ719tKz6MBjGLuy3e6UlMeyHDk5RddPOGzEwyKOAl7cNxl7BuOderEnV7GD0
	g6y8ILJfcPhAoNwMTORxi1DuwBm6XnW9JLEukdT/F9izY2d86jmn4KPXe448wgYCuU0k=;
Message-ID: <a15dee7c-c460-a581-3ae4-c7066223c403@xen.org>
Date: Thu, 11 May 2023 15:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] SUPPORT.md: explicitly mention EFI (secure) boot status
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <82c8ce93-a9a7-9309-2b04-8092ca84e7d6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <82c8ce93-a9a7-9309-2b04-8092ca84e7d6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/05/2023 15:34, Jan Beulich wrote:
> While normal booting is properly supported on both x86 and Arm64, secure
> boot reportedly requires quite a bit more work to be actually usable
> (and providing the intended guarantees). The mere use of the shim
> protocol for verifying the Dom0 kernel image isn't enough.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -63,6 +63,16 @@ For the Cortex A57 r0p0 - r1p1, see Erra
>       Status, x86 PV: Supported
>       Status, ARM: Experimental
>   
> +### Host EFI Boot
> +
> +    Status, x86: Supported
> +    Status, Arm64: Supported
> +
> +### Host EFI Secure Boot
> +
> +    Status, x86: Experimental
> +    Status, Arm64: Experimental
> +
>   ### x86/Intel Platform QoS Technologies
>   
>       Status: Tech Preview

-- 
Julien Grall

