Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820FF660180
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472619.732906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDn2o-0003mg-Bf; Fri, 06 Jan 2023 13:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472619.732906; Fri, 06 Jan 2023 13:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDn2o-0003jF-84; Fri, 06 Jan 2023 13:46:02 +0000
Received: by outflank-mailman (input) for mailman id 472619;
 Fri, 06 Jan 2023 13:46:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDn2n-0003j7-4v
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:46:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDn2m-00088g-6r; Fri, 06 Jan 2023 13:46:00 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDn2m-0001UQ-0p; Fri, 06 Jan 2023 13:46:00 +0000
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
	bh=c9iXVFW3rTmIfW3C/upQrZFmISBGPfs6G7zwCooEQRg=; b=2gEsn1qCwQ/J91sTxhEMaLFzx/
	le4lD/EPMDVOP2QpO/C+9vmfClynQs7/Sa45hepN9a1BJ8/DuWzrAbAJqxEvUfOYef3IdGhZyCioz
	hoZLIICMm469iZzmRvcGCbGqYDIdDzNpbYqGlDk8G2zKV70+sRF7wkWL+fwdbgp2ltUw=;
Message-ID: <2db650a0-49c4-9894-3220-a13306c7e2ea@xen.org>
Date: Fri, 6 Jan 2023 13:45:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 5/8] xen/include: include <asm/types.h> in
 <xen/early_printk.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <940bf18969634564fa5d206d02eb2a116c9e0ea0.1673009740.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <940bf18969634564fa5d206d02eb2a116c9e0ea0.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/01/2023 13:14, Oleksii Kurochko wrote:
> <asm/types.h> should be included because second argument of
> early_puts has type 'size_t' which is defined in <asm/types.h>
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/include/xen/early_printk.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/include/xen/early_printk.h b/xen/include/xen/early_printk.h
> index 0f76c3a74f..abb34687da 100644
> --- a/xen/include/xen/early_printk.h
> +++ b/xen/include/xen/early_printk.h
> @@ -4,6 +4,8 @@
>   #ifndef __XEN_EARLY_PRINTK_H__
>   #define __XEN_EARLY_PRINTK_H__
>   
> +#include <asm/types.h>
> +
>   #ifdef CONFIG_EARLY_PRINTK
>   void early_puts(const char *s, size_t nr);
>   #else

-- 
Julien Grall

