Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A167285FA5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3492.9997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ93Q-0004IE-3t; Wed, 07 Oct 2020 13:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3492.9997; Wed, 07 Oct 2020 13:00:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ93Q-0004Hp-0Q; Wed, 07 Oct 2020 13:00:24 +0000
Received: by outflank-mailman (input) for mailman id 3492;
 Wed, 07 Oct 2020 13:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FceR=DO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kQ93O-0004Hk-DZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:00:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d20856c-4643-4a7b-b700-783a73c1d132;
 Wed, 07 Oct 2020 13:00:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQ93M-0004Ei-3K; Wed, 07 Oct 2020 13:00:20 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQ93L-0007PC-SY; Wed, 07 Oct 2020 13:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FceR=DO=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kQ93O-0004Hk-DZ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:00:22 +0000
X-Inumbo-ID: 9d20856c-4643-4a7b-b700-783a73c1d132
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d20856c-4643-4a7b-b700-783a73c1d132;
	Wed, 07 Oct 2020 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=I504+elFMlT7w13ployzHQG4XVlP+UBRzPiuWe5Bo5M=; b=HWIALI5Nw1BtR47KCyfkVhX4PH
	MTH3jg9Ag40e0JDPznqjrQDJC9bjQ3hYiwzF8b220fkWXkXkvsIUYQOZBICFkzMna4URqNdvyELw6
	KrYEgxXvvi3DV8qxM5tlRZOAK9GDxqP1hWHCpLPDbxDBN5cVkBzBuRhm4GwU/FGdd7iU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQ93M-0004Ei-3K; Wed, 07 Oct 2020 13:00:20 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQ93L-0007PC-SY; Wed, 07 Oct 2020 13:00:20 +0000
Subject: Re: [PATCH] xen/arm: print update firmware only once
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <09d04b34e6b3b77ac206a42657b1b4116e7e11f3.1602068661.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4b3135ff-4795-e189-0430-da5627419e4e@xen.org>
Date: Wed, 7 Oct 2020 14:00:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <09d04b34e6b3b77ac206a42657b1b4116e7e11f3.1602068661.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 07/10/2020 12:05, Bertrand Marquis wrote:
> Fix enable_smccc_arch_workaround_1 to only print the warning asking to
> update the firmware once.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/cpuerrata.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 6c09017515..0c63dfa779 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -187,7 +187,7 @@ warn:
>           ASSERT(system_state < SYS_STATE_active);
>           warning_add("No support for ARM_SMCCC_ARCH_WORKAROUND_1.\n"
>                       "Please update your firmware.\n");
> -        warned = false;
> +        warned = true;

Thanks for spotting it. It looks like I introduced this bug in commit 
976319fa3de7f98b558c87b350699fffc278effc "xen/arm64: Kill 
PSCI_GET_VERSION as a variant-2 workaround".

I would suggest to add a fixes tag (can be done on commit).

Reviewed-by: Julien Grall <jgrall@amazon.com>

>       }
>   
>       return 0;
> 

-- 
Julien Grall

