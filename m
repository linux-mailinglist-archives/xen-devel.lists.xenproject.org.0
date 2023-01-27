Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84E67E8AF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485720.753132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLQ7Y-0002pb-CM; Fri, 27 Jan 2023 14:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485720.753132; Fri, 27 Jan 2023 14:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLQ7Y-0002mp-9W; Fri, 27 Jan 2023 14:54:28 +0000
Received: by outflank-mailman (input) for mailman id 485720;
 Fri, 27 Jan 2023 14:54:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLQ7X-0002mj-NZ
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:54:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLQ7X-0007NC-4D; Fri, 27 Jan 2023 14:54:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLQ7W-0000yI-V6; Fri, 27 Jan 2023 14:54:27 +0000
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
	bh=09u7c0dC1PQgPIcHx/A9P3MEkHG0v6TFFCoK2rui+fM=; b=sqHIPHI9+BZ/xNArFVvwAJ0UDv
	vjKwJ2RW1flYLTe+ri7W8wLawkVDYnmbKhV7yzA+Vy4MY/5KQlMoA9PYnuxy9C7w965BfMOZqiUDx
	E9JGa/MoL0l0/1UkdrqUr2yTUQs4QJQgNwmRGI6uKsFRN2d0YtJLLS/xTc6nw9blMhRs=;
Message-ID: <a8219b2d-a22d-63ac-5088-c33610310d6e@xen.org>
Date: Fri, 27 Jan 2023 14:54:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 27/01/2023 13:59, Oleksii Kurochko wrote:
> +static inline void wfi(void)
> +{
> +    __asm__ __volatile__ ("wfi");

I have starred at this line for a while and I am not quite too sure to 
understand why we don't need to clobber the memory like we do on Arm.

FWIW, Linux is doing the same, so I guess this is correct. For Arm we 
also follow the Linux implementation.

But I am wondering whether we are just too strict on Arm, RISCv compiler 
offer a different guarantee, or you expect the user to be responsible to 
prevent the compiler to do harmful optimization.

> +/*
> + * panic() isn't available at the moment so an infinite loop will be
> + * used temporarily.
> + * TODO: change it to panic()
> + */
> +static inline void die(void)
> +{
> +    for( ;; ) wfi();

Please move wfi() to a newline.

> +}

-- 
Julien Grall

