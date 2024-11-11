Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F19C3BCF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 11:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833477.1248638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARaf-0000BF-C9; Mon, 11 Nov 2024 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833477.1248638; Mon, 11 Nov 2024 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARaf-000099-9E; Mon, 11 Nov 2024 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 833477;
 Mon, 11 Nov 2024 10:24:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tARae-000092-3G
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 10:24:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tARad-0001C2-1D;
 Mon, 11 Nov 2024 10:24:11 +0000
Received: from [2a02:8012:3a1:0:440f:f547:9226:a08e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tARad-0002MR-1J;
 Mon, 11 Nov 2024 10:24:11 +0000
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
	bh=0YBhHb/6pDPGIbPhvORejdS9Cn2tGzlmu4vrEvNcDH0=; b=Tgxy7H1q/RpWRuPpoPhSZLlawH
	OA2QTjP4Dl+ceeBt3KaPGYsQA59vl/AtCCFwkAXLZOadaSV0MHT+KnJIldNZdHrigOTZa5lYNfpQk
	3/XSMrVE42xhi/9w0UGfYL+/c9eNzAjb+/Hym1S8dAJHn5Kx7PKHbQ7hjsbQxRgOwpGA=;
Message-ID: <96d8d5c0-015a-4dd5-8ef1-6d9cd6948cab@xen.org>
Date: Mon, 11 Nov 2024 10:24:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers/char: move dt_uart_init() to dt-uart.c
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <8e1036a7e6c884702d46e377c1c5b723570c819e.1731077742.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8e1036a7e6c884702d46e377c1c5b723570c819e.1731077742.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 08/11/2024 14:56, Oleksii Kurochko wrote:
> The `dt_uart_init()` functions is relocated to a new file `dt-uart.c` to allow
> for reuse across architectures that utilize the device tree to describe hardware
> components.
> 
> RISC-V is going to follow the same approach to UART initialization, which
> includes checking for the presence of `dtuart` in the console string or verifying
> the `stdout-path` property in the `/chosen` node, followed by searching for the UART
> node and calling `device_init()` for UART setup.
> 
> Add `xen/drivers/char/dt-uart.c` to the ARM ARCHITECTURE section in the MAINTAINERS
> file, as ARM maintainers are best suited to maintain this code.
> 
> No functional change.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   MAINTAINERS                 |  1 +
>   xen/drivers/char/Makefile   |  1 +
>   xen/drivers/char/arm-uart.c | 80 -------------------------------

The only thing left in arm-uart.c is the ACPI initialize. I guess at the 
some point this will be needed for other architectures. I think it would 
be more suitable if the file is renamed, maybe uart-init.c?

Cheers,

-- 
Julien Grall


