Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0FF6E396A
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 16:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521592.810379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po3YK-0000sn-TV; Sun, 16 Apr 2023 14:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521592.810379; Sun, 16 Apr 2023 14:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po3YK-0000pP-QI; Sun, 16 Apr 2023 14:40:28 +0000
Received: by outflank-mailman (input) for mailman id 521592;
 Sun, 16 Apr 2023 14:40:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po3YJ-0000pJ-En
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 14:40:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po3YJ-0005AC-1o; Sun, 16 Apr 2023 14:40:27 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.23.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po3YI-0000TV-RZ; Sun, 16 Apr 2023 14:40:26 +0000
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
	bh=OOaJ+8vNffk7s48mUmpmVVVIbeY7Bkju8QIE2ghOtF8=; b=Qic22POWKxGt425lF3wz3lFBM3
	sWO78K0JY7yXsVqa9jGO/zHEaHiuNJqQD5dO01js5bkWlqGNTXzbWLSviar+yDnQZh/asfoTvxoHd
	/B3iuRDLaQ24BdQCvvsUWKIX1M4ETKK+r8fkonsa/AXjEFps+GAQep+8NLG75/WzZc0Y=;
Message-ID: <092e0ca3-f10f-63bd-2b0b-62ac556f7233@xen.org>
Date: Sun, 16 Apr 2023 15:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20230328071334.2098429-1-Henry.Wang@arm.com>
 <20230328071334.2098429-5-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230328071334.2098429-5-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/03/2023 08:13, Henry Wang wrote:
> With the change in previous patch, the initial 16 pages in the P2M
> pool is not necessary anymore. Drop them for code simplification.
> 
> Also the call to p2m_teardown() from arch_domain_destroy() is not
> necessary anymore since the movement of the P2M allocation out of
> arch_domain_create(). Drop the code and the above in-code comment
> mentioning it. Take the opportunity to fix a typo in the original
> in-code comment.
> 
> With above clean-up, the second parameter of p2m_teardown() is
> also not needed anymore. Drop this parameter and the logic related
> to this parameter.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

