Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93574783B67
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588221.919710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMPC-0003Hc-Ua; Tue, 22 Aug 2023 08:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588221.919710; Tue, 22 Aug 2023 08:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMPC-0003Fx-RR; Tue, 22 Aug 2023 08:06:26 +0000
Received: by outflank-mailman (input) for mailman id 588221;
 Tue, 22 Aug 2023 08:06:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYMPB-0003Fr-Tx
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:06:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYMPB-0004gt-If; Tue, 22 Aug 2023 08:06:25 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYMPB-0001Zx-Cc; Tue, 22 Aug 2023 08:06:25 +0000
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
	bh=x5hXNjO3nZQsDdqrCuGSnO1F6b29AuzWuWIUOcURrLg=; b=B03q6qa9Z84hIzIIyyCeHpSacu
	Q/3ipxbG69d0EHpzuN3TEQL6mDE3x1YQM+VUbpokCnndYFy6vfA3xF9po7az8ebLMy1RB7XUKdPh8
	j3Y+XsogcONw3X8hw8cKOLZjzpjpVT89L9y/ToZEB1MtaIjS4nFE0yUfLVxJaFHdDprY=;
Message-ID: <a19f88f6-3c5e-48a1-805f-8afcad22ba4b@xen.org>
Date: Tue, 22 Aug 2023 09:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-9-Henry.Wang@arm.com>
 <7503cbad-a0b9-4683-880f-1099ad62f2f7@xen.org>
 <65B3F435-4086-4DDE-A050-A7B741D67973@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65B3F435-4086-4DDE-A050-A7B741D67973@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/08/2023 03:42, Henry Wang wrote:
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 0d433a32e7..bc3e5bd6f9 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -16,7 +16,6 @@
>   #include <xen/vmap.h>
> 
>   #include <asm/byteorder.h>
> -#include <asm/fixmap.h>
>   #include <asm/kernel.h>
>   #include <asm/setup.h>
> ```

The changes in kernel.c should go in patch #12 where the fixmap user is 
moved out.

Cheers,

-- 
Julien Grall

