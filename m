Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2735B21328
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 19:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077864.1438888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWKP-0004jL-7J; Mon, 11 Aug 2025 17:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077864.1438888; Mon, 11 Aug 2025 17:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWKP-0004hl-4N; Mon, 11 Aug 2025 17:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1077864;
 Mon, 11 Aug 2025 17:28:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulWKO-0004hP-08
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 17:28:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulWKN-000Avr-0X;
 Mon, 11 Aug 2025 17:28:55 +0000
Received: from [2a02:8012:3a1:0:2562:7575:7df6:8090]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulWKN-000Q9m-1K;
 Mon, 11 Aug 2025 17:28:55 +0000
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
	bh=O1lA9/19+j5F2XJyQPpRqhW/plmDGmDoSavMLAxlWn4=; b=Gq2Q5vJPPhovhs4JcJ8a0++IBc
	AKtS1VKousYN/0pdIzMj7zgS1Q1LiOsThKX5lYrx/vnvExWrX0/YIJw4invjXWgmqVE21QduuCb43
	55rHq7V87kkHWNgNC+iUYC+QAfOgFh/YkglSGIR28mUZc4A0RGbGXiAKmbeZnq1pW354=;
Message-ID: <1a51ba8c-93c5-4cfb-b76e-26e318c0b22d@xen.org>
Date: Mon, 11 Aug 2025 18:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: irq: add missing spin_unlock() in
 init_local_irq_data() error path
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>
References: <f983bb7c3c9f0912da7e7f2fc22384ce1081a7a3.1754901835.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f983bb7c3c9f0912da7e7f2fc22384ce1081a7a3.1754901835.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 11/08/2025 09:45, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> If init_one_irq_desc() fails, init_local_irq_data() returns without
> releasing local_irqs_type_lock, leading to a possible deadlock.
> 
> Release the lock before returning to ensure proper cleanup.
> 
> Fixes: 2bb32b809250 ("xen/irq: Propagate the error from init_one_desc_irq() in init_*_irq_data()")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I will commit the patch soon.

Cheers,

-- 
Julien Grall


