Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850867E334
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485474.752724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMsd-00078e-Qc; Fri, 27 Jan 2023 11:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485474.752724; Fri, 27 Jan 2023 11:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMsd-00076U-Nn; Fri, 27 Jan 2023 11:26:51 +0000
Received: by outflank-mailman (input) for mailman id 485474;
 Fri, 27 Jan 2023 11:26:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLMsc-00076O-7V
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:26:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLMsb-0001y8-9I; Fri, 27 Jan 2023 11:26:49 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.15.151]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLMsb-0000u0-3D; Fri, 27 Jan 2023 11:26:49 +0000
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
	bh=hFl5q6c+KORc9MJ6+SiJJd3W2y82G42bzfwPnw4ZJbc=; b=PnSVrYQzHzPWSr3n7CEfHGOhua
	A8Z6JsWtAPJaYJIDY38k1t5/Eg6lC97GL30Ico7Yxu4JQoMc5MraQwMnGWavGwVh0kSiDnd7+S0hV
	UA01SdrJ5YaEkGwyoTUdhCCsm6W7BkiOapnyan7/npeJzdExZfZ8nlgfuq05xsLxlhH0=;
Message-ID: <fbab23b9-663e-9516-5721-a92486686f84@xen.org>
Date: Fri, 27 Jan 2023 11:26:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/2] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674816429.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674816429.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <06c2c36bd68b2534c757dc4087476e855253680a.1674816429.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2023 11:15, Oleksii Kurochko wrote:
> Because printk() relies on a serial driver (like the ns16550 driver)
> and drivers require working virtual memory (ioremap()) there is not
> print functionality early in Xen boot.
> 
> The patch introduces the basic stuff of early_printk functionality
> which will be enough to print 'hello from C environment".
> 
> Originally early_printk.{c,h} was introduced by Bobby Eshleman
> (https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d1aab71384)
> but some functionality was changed:
> early_printk() function was changed in comparison with the original as
> common isn't being built now so there is no vscnprintf.
> 
> This commit adds early printk implementation built on the putc SBI call.
> 
> As sbi_console_putchar() is already being planned for deprecation
> it is used temporarily now and will be removed or reworked after
> real uart will be ready.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> ---
> Changes in V6:
>      - Remove __riscv_cmodel_medany check from early_printk.c

Why? I know Andrew believed this is wrong, but I replied back with my 
understanding and saw no discussion afterwards explaining why I am 
incorrect.

I am not a maintainer of the code here, but I don't particularly 
appreciate comments to be ignored. If there was any discussion on IRC, 
then please summarize them here.

Cheers,

-- 
Julien Grall

