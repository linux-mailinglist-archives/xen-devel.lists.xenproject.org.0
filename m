Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34B7B022D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608884.947668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS5j-0002ba-MV; Wed, 27 Sep 2023 10:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608884.947668; Wed, 27 Sep 2023 10:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS5j-0002Yp-Js; Wed, 27 Sep 2023 10:48:27 +0000
Received: by outflank-mailman (input) for mailman id 608884;
 Wed, 27 Sep 2023 10:48:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlS5i-0002Yh-4f
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:48:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlS5h-00007v-El; Wed, 27 Sep 2023 10:48:25 +0000
Received: from [15.248.2.159] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlS5h-0005uH-92; Wed, 27 Sep 2023 10:48:25 +0000
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
	bh=8NbhY/7bO6QFbd/8bdAUIDcE3hm36e7grSYaoGNBZu8=; b=1+3u3UJ+hbVRkmeBE/8kSjFCWA
	1molvidbarAbHZjw07Ee7n3qjfil2vPa8zj49QTo9fhE2Wy/N8U67WFb6rGKc+URDTLhL3h8qP1Ug
	xW9HZZJIP74MTVjCWKMQ+ebGBxQjr2hck7ASiHIiCmeqPbYExHjSc2oiKiB1WS9yG/h8=;
Message-ID: <73f0c7c5-8a35-47df-a1ab-dfe784fed3d9@xen.org>
Date: Wed, 27 Sep 2023 11:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230926053333.180811-1-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

Adding some comments on top of what already said.

On 26/09/2023 06:33, Leo Yan wrote:
> +static bool __init memory_node_is_available(const void *fdt, unsigned long node)
> +{
> +    const char *status = fdt_getprop(fdt, node, "status", NULL);
> +
> +    if (!status)
> +        return true;
> +

We have a similar implement based on the unflatten DT (see 
dt_device_is_available()). While trying to consolidate them is probably 
not worth it, I think the behavior should match.

In this case, you want to check the len is greater than 0 before doing 
the comparison.

Cheers,

-- 
Julien Grall

