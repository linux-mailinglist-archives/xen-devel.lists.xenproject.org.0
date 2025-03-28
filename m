Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F6A7508E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 19:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931139.1333601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyElC-0006dG-CY; Fri, 28 Mar 2025 18:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931139.1333601; Fri, 28 Mar 2025 18:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyElC-0006b4-9w; Fri, 28 Mar 2025 18:48:54 +0000
Received: by outflank-mailman (input) for mailman id 931139;
 Fri, 28 Mar 2025 18:48:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyElA-0006ar-FP
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 18:48:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyElA-00DzCo-0f;
 Fri, 28 Mar 2025 18:48:52 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyElA-004tJN-0A;
 Fri, 28 Mar 2025 18:48:52 +0000
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
	bh=15BJ7FZZ3sCpKjquQdflkFx5KJ0ZCoLfshzLMFGQsCE=; b=CBL1p6Dn8a7n+lZA+pdNLl0Lzo
	6qq+Z0BHzJwnq3p2HKTIPCADNrBScwri1mV5sZhBp/NjypoW3WJfq6KbL5Kramq3/E+a1TPHHLTCi
	XVsSDTZjq99wzKQGqGHInHr5Xo4xx3eidKYo9n3Iak+DQGoXApiBoMGYK6SNSidFSVcg=;
Message-ID: <0991c762-0709-41db-9e3d-5be1a19afaa4@xen.org>
Date: Fri, 28 Mar 2025 18:48:50 +0000
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

Same as patch #2 and #6.

With that addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


