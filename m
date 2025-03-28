Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B374BA7508D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 19:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931130.1333591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEkT-000675-4l; Fri, 28 Mar 2025 18:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931130.1333591; Fri, 28 Mar 2025 18:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEkT-00065U-1z; Fri, 28 Mar 2025 18:48:09 +0000
Received: by outflank-mailman (input) for mailman id 931130;
 Fri, 28 Mar 2025 18:48:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyEkS-00065O-8N
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 18:48:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEkR-00DzC5-34;
 Fri, 28 Mar 2025 18:48:07 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEkR-004tHi-2a;
 Fri, 28 Mar 2025 18:48:07 +0000
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
	bh=WTj1RdbGPcTHJ3WIrKDrW+XcHyuV8vLh9F8cTYhnEws=; b=dQBgvPsD36JLK26TXReWM/tWS8
	dUm6cfEuE19oWtyVKFYXOFLMKEXLUVZrC87v/4fW/Y+cwipO24EeWZid0w2aJ68DJjxJ6HgsLfpjt
	ZqCLBt0Skce2O9YvHLSuCEFzsOEYKpS7KClz8Q6WMiKMr/7kiRnDeFaGN77hEmAC3ya8=;
Message-ID: <aa3da97a-a655-47a9-b7e7-898df2a2bbb6@xen.org>
Date: Fri, 28 Mar 2025 18:48:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 4/6] Arm32: use new-style entry annotations in
 head.S
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <cffeb50d-5d99-4fa9-871c-f710da8bd028@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cffeb50d-5d99-4fa9-871c-f710da8bd028@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/03/2025 08:08, Jan Beulich wrote:
> Locally override SYM_PUSH_SECTION() to retain the intended section
> association.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
> ---
> v8: Re-base.
> v7: New.
> 
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -48,13 +48,20 @@
>   
>           .section .text.header, "ax", %progbits
>           .arm
> +/*
> + * Code below wants to all live in the section established above.  Annotations
> + * from xen/linkage.h therefore may not switch sections (honoring
> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
> + */
> +#undef SYM_PUSH_SECTION
> +#define SYM_PUSH_SECTION(name, attr)

Similar to patch #2, I think SYM_PUSH_SECTION doesn't yet exist.

With that fixed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


