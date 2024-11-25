Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28999D8D78
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843168.1258818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfop-0004Gw-VA; Mon, 25 Nov 2024 20:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843168.1258818; Mon, 25 Nov 2024 20:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfop-0004FT-SI; Mon, 25 Nov 2024 20:36:27 +0000
Received: by outflank-mailman (input) for mailman id 843168;
 Mon, 25 Nov 2024 20:36:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFfoo-0004FG-0O
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:36:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfon-00540G-1O;
 Mon, 25 Nov 2024 20:36:25 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfon-006IiT-1h;
 Mon, 25 Nov 2024 20:36:25 +0000
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
	bh=JI9h7VJ5yAkpw9iwbgmGEitHW5CVD3+jJSjOdNxpL2U=; b=ap6ARBDcjHjJ2FvaX16wDz2JVT
	MkRhtSuY0r98WN2S7JI91yuPY1eSZvM4fTyh0+v8o6Z2ozB5gfAvN/hg+tNyQS/7e1pXsA6wQuRmn
	QRF/q/SJoDFV9mWWnqIzzR/ftAgW2h2lXOdhJVSzCgdPIl9Gc9qjDI6lejUjCMfTaaBM=;
Message-ID: <20d65a5d-dfdc-4622-b066-fc6de705af57@xen.org>
Date: Mon, 25 Nov 2024 20:36:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: common: add ability to enable stack protector
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
 <20241122210719.2572072-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241122210719.2572072-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Hi Volodymyr,

On 22/11/2024 21:07, Volodymyr Babchuk wrote:
> diff --git a/xen/include/xen/stack_protector.h b/xen/include/xen/stack_protector.h
> new file mode 100644
> index 0000000000..97f1eb5ac0
> --- /dev/null
> +++ b/xen/include/xen/stack_protector.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN__STACK_PROTECTOR_H
> +#define XEN__STACK_PROTECTOR_H
> +
> +#ifdef CONFIG_STACKPROTECTOR
> +
> +#ifndef CONFIG_X86
> +extern unsigned long __stack_chk_guard;

Is this variable meant to change after boot? If not, then can you tag it 
with __ro_after_init?

> +#endif
> +
> +/*
> + * This function should be always inlined. Also it should be called
> + * from a function that never returns.
> + */
> +static inline void boot_stack_chk_guard_setup(void)
> +{
> +	__stack_chk_guard = get_random();
> +	if (BITS_PER_LONG == 64)
> +		__stack_chk_guard |= ((unsigned long)get_random()) << 32;
> +}
> +
> +#else
> +
> +static inline void boot_stack_chk_guard_setup(void) {}
> +
> +#endif /* CONFIG_STACKPROTECTOR  */
> +
> +#endif /* XEN__STACK_PROTECTOR_H */
> +

Cheers,

-- 
Julien Grall

