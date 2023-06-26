Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3087573E1A6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555529.867363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmxa-0006y9-84; Mon, 26 Jun 2023 14:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555529.867363; Mon, 26 Jun 2023 14:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmxa-0006vV-59; Mon, 26 Jun 2023 14:12:54 +0000
Received: by outflank-mailman (input) for mailman id 555529;
 Mon, 26 Jun 2023 14:12:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDmxY-0006vP-UJ
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:12:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmxY-00030W-9C; Mon, 26 Jun 2023 14:12:52 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDmxY-0005Jo-1n; Mon, 26 Jun 2023 14:12:52 +0000
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
	bh=bhBa63lLLRZExQfr8fx9uhxf1l03JoDUHSbVdVPJWis=; b=mjd2sgAbM9BvduCRSxOd+9vEeS
	I+Stq4ZC/K2zpX4m7PIC8vJTJMf5Bh+Cka5ucb9w5d7zdu88uaB6wnA/xLU0xPeDGXmGpdBLjB0uQ
	/4FvbhcK4V3hPmFbcXcc+W1E3V3N9AT/9ewCblaHQ2v4FMnXJ0SOrX8FIwgezaQ7peVw=;
Message-ID: <c8b0f888-4947-20b6-1c2e-36256540ed52@xen.org>
Date: Mon, 26 Jun 2023 15:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 2/6] xen/arm: change parameter name 'vcpu' in
 domain() function definition.
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
 <e765493f0c0a9bc592197b5b0c102327db5eaf90.1687771796.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e765493f0c0a9bc592197b5b0c102327db5eaf90.1687771796.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 10:52, Federico Serafini wrote:
> In the current version of domain() function, the declaration
> (correctly) uses the parameter name 'v' while the definition uses the
> parameter name 'vcpu'.
> Since it is common to use 'v' to denote a vCPU, change the parameter
> name 'vcpu' of function definition to 'v', thus fixing a violation of
> MISRA C:2012 Rule 8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

