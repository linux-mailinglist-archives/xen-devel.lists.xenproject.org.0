Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AE7087CE
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 20:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536505.834891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pziOO-0001yM-JY; Thu, 18 May 2023 18:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536505.834891; Thu, 18 May 2023 18:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pziOO-0001vu-GU; Thu, 18 May 2023 18:30:24 +0000
Received: by outflank-mailman (input) for mailman id 536505;
 Thu, 18 May 2023 18:30:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pziOM-0001vk-Pp
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 18:30:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pziOM-0001P6-Dq; Thu, 18 May 2023 18:30:22 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.26.27]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pziOM-0007nP-8d; Thu, 18 May 2023 18:30:22 +0000
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
	bh=27+5mE4ZVTNFrOH1jB3mQzfQNjqckp9iiGm+9CxUwOU=; b=stRZrsjSuAJyoEHazgcR+F1uaL
	p8Qh6X8IuwpHbJE+0Elkuucy3K//2gd02XT6O4Flhr/EU4o9InDgDDGokn3iwRkAj7UbdLtSvXX2N
	FQV5luKdB329KzXU/G07otN1h4H88lMQCNNJh4CrUCK0kysdkmRJbne0lwqzEBG1xiQE=;
Message-ID: <779e46a5-a3d0-187a-6d15-e1a12f71278f@xen.org>
Date: Thu, 18 May 2023 19:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230424060248.1488859-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

One more remark.

On 24/04/2023 07:02, Luca Fancellu wrote:
>   #else /* !CONFIG_ARM64_SVE */
>   
> @@ -46,6 +50,15 @@ static inline unsigned int get_sys_vl_len(void)
>       return 0;
>   }
>   
> +static inline int sve_context_init(struct vcpu *v)
> +{
> +    return 0;

The call is protected by is_domain_sve(). So I think we want to return 
an error just in case someone is calling it outside of its intended use.

> +}
> +
> +static inline void sve_context_free(struct vcpu *v) {}
> +static inline void sve_save_state(struct vcpu *v) {}
> +static inline void sve_restore_state(struct vcpu *v) {}
> +

-- 
Julien Grall

