Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2A651CF1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466787.725728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Yg4-0007VD-4X; Tue, 20 Dec 2022 09:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466787.725728; Tue, 20 Dec 2022 09:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Yg4-0007Rm-0p; Tue, 20 Dec 2022 09:12:48 +0000
Received: by outflank-mailman (input) for mailman id 466787;
 Tue, 20 Dec 2022 09:12:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7Yg1-0007Ra-Sb
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:12:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7Yg1-0003GJ-LO; Tue, 20 Dec 2022 09:12:45 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7Yg1-0007dO-GL; Tue, 20 Dec 2022 09:12:45 +0000
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
	bh=yVgL+302xTF7eh/mqisll/n8lGvxZ2Gy4VeZN8725pM=; b=VYC6ux4D60EkLnuc5wo1cJ2LGK
	kbiW8h8qOAU1u1hRSHgaLhQH+IujJy+wg1x6WRZLBFe4aAOMw0QKt2HhhKv7q47na4kgBjbI07Aji
	Zg/1kAjOzLuGct+ieg/j3hh9FyXSCcY46I08F72g4sIAdrNCuoWAWmktip6uVw0J5IsY=;
Message-ID: <4b51edb0-a203-a6d1-b660-914dc0c87bf2@xen.org>
Date: Tue, 20 Dec 2022 09:12:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 05/18] arm: cppcheck: fix misra rule 20.7 on
 arm/include/asm/string.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221220085100.22848-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2022 08:50, Luca Fancellu wrote:
> Cppcheck has found a violation of rule 20.7 for the macro memset
> about missing parenthesis for the "n" argument, while the parenthesis
> are not mandatory because the argument is never used in an
> expression, adding them will not harm code and readability, so fix
> the finding adding parenthesis for the argument.

This is something I have argued against in the past (see [1]). So...

> 
> Eclair and coverity does not report this finding.

... if neither Eclair nor Coverity report it then I think this should be 
a bug report against Cppcheck.

Also, typo: s/does not/do not/

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/string.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/string.h b/xen/arch/arm/include/asm/string.h
> index b485e4904419..f1c87d215b0b 100644
> --- a/xen/arch/arm/include/asm/string.h
> +++ b/xen/arch/arm/include/asm/string.h
> @@ -30,7 +30,7 @@ void __memzero(void *ptr, size_t n);
>   
>   #define memset(p, v, n)                                                 \
>           ({                                                              \
> -                void *__p = (p); size_t __n = n;                        \
> +                void *__p = (p); size_t __n = (n);                      \
>                   if ((__n) != 0) {                                       \
>                           if (__builtin_constant_p((v)) && (v) == 0)      \
>                                   __memzero((__p),(__n));                 \

Cheers,

[1] 20220728134943.1185621-1-burzalodowa@gmail.com

-- 
Julien Grall

