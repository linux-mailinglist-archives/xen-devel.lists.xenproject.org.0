Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A51660171
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472605.732883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmxq-0002Zx-GB; Fri, 06 Jan 2023 13:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472605.732883; Fri, 06 Jan 2023 13:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmxq-0002XS-CZ; Fri, 06 Jan 2023 13:40:54 +0000
Received: by outflank-mailman (input) for mailman id 472605;
 Fri, 06 Jan 2023 13:40:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDmxo-0002XK-Ky
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:40:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDmxo-00082r-7K; Fri, 06 Jan 2023 13:40:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDmxo-0001Dv-0C; Fri, 06 Jan 2023 13:40:52 +0000
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
	bh=pHwJANpkRcSFgmVES30QT1jRvgzCAyd+JZcZ0J+t3G4=; b=fDT4xYoOMSMvX2R8xytxQG0yJZ
	0RcDYcDeS5Xe+Iy7oZYXr0p9Zr7Bd00eR1p22/OZ0mYVDdkgTntLbNjMTiUbEe24usMnQ4cMpD879
	WtPgxwtvA/+XIY3tBYIMggLt2O4Cqym+z+dAbrCvFfH8aYdWK6yaTln9710nKqrdUsNw=;
Message-ID: <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
Date: Fri, 6 Jan 2023 13:40:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/01/2023 13:14, Oleksii Kurochko wrote:
> The patch introduce sbi_putchar() SBI call which is necessary
> to implement initial early_printk
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/Makefile          |  1 +
>   xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>   xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++

IMHO, it would be better to implement sbi.c in assembly so you can use 
print in the console before you jump to C world.

>   3 files changed, 79 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/sbi.h
>   create mode 100644 xen/arch/riscv/sbi.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 5a67a3f493..60db415654 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>   obj-$(CONFIG_RISCV_64) += riscv64/
>   obj-y += setup.o
> +obj-y += sbi.o

Please order the filename alphabetically.

Cheers,

-- 
Julien Grall

