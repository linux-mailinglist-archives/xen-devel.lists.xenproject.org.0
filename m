Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E86682BB4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 12:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487556.755224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMp2L-0004dA-TC; Tue, 31 Jan 2023 11:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487556.755224; Tue, 31 Jan 2023 11:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMp2L-0004aC-PG; Tue, 31 Jan 2023 11:42:53 +0000
Received: by outflank-mailman (input) for mailman id 487556;
 Tue, 31 Jan 2023 11:42:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMp2K-0004a6-5m
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 11:42:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMp2I-0000Ws-Sc; Tue, 31 Jan 2023 11:42:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.14.74]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMp2I-0008A1-KV; Tue, 31 Jan 2023 11:42:50 +0000
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
	bh=cYbddL3CURU9jdq9J7FCfPemIrbfq0pmftxjWKGQ/ZI=; b=wYvuRrvUUllwl+hlSoOYmu4Xai
	4RXlNO4qcCusshnaSe0roGVQ5Q4XrUMpxP8+2SR7JE59ruCiYhcCnkIqgNK/JnsvoUBQTndZfYy2W
	EWxnv/Bc4e2Jb2pzXHWbQV0YnSRlngoqXUaBCpKrSFGfvkA/qsZwSQSwi32ay+5v8NdE=;
Message-ID: <12f4a315-19dc-2462-7bbf-f02408b09081@xen.org>
Date: Tue, 31 Jan 2023 11:42:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v8 1/2] xen/riscv: introduce early_printk basic stuff
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
References: <cover.1675163330.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1675163330.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <06c2c36bd68b2534c757dc4087476e855253680a.1675163330.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 31/01/2023 11:17, Oleksii Kurochko wrote:
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
> Changes in V8:
>      - Nothing was changed
> ---
> Changes in V7:
>      - Nothing was changed
> ---
> Changes in V6:
>      - Remove __riscv_cmodel_medany check from early_printk.c

This discussion is still not resolved. I will echo Jan's point [1] and 
expand it. There is limited point to keep sending a new version for 
small changes if there main open points are not addressed.

Can you please look at settling done on the issues first and then send a 
new version?

Cheers,

[1] 1d63dd9a-77df-4fca-e35b-886ba19fb35d@suse.com

-- 
Julien Grall

