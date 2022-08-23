Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA359D496
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 10:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391768.629721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPJu-00066F-9J; Tue, 23 Aug 2022 08:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391768.629721; Tue, 23 Aug 2022 08:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPJu-000639-5n; Tue, 23 Aug 2022 08:31:34 +0000
Received: by outflank-mailman (input) for mailman id 391768;
 Tue, 23 Aug 2022 08:31:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQPJs-000633-VY
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 08:31:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQPJs-0006vG-99; Tue, 23 Aug 2022 08:31:32 +0000
Received: from [54.239.6.189] (helo=[192.168.28.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQPJs-0004Lp-0f; Tue, 23 Aug 2022 08:31:32 +0000
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
	bh=6W3oB9ehHAH61dP058XqXZJ1cD5BrjvhUQd6eAbovsY=; b=qMvu4p15yUBwXUGaO7zNXahvxN
	D4g/PxjfZHa2gPdQrfk6ERExhyTjgPFlVUbboJIv7qeetziCFT5LMlQF/qAYiZGNVpCi2OAH1gWDu
	l+1czaw3c2aCzSRUBM4Auwqs+3FN2pRPSugBFCnX79lZugKjAXAjUWlTTAm3UpuiNM0k=;
Message-ID: <d8f1056c-8ab4-f220-8f2a-c1042e77ed58@xen.org>
Date: Tue, 23 Aug 2022 09:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 5/7] xen/evtchn: modify evtchn_alloc_unbound to
 allocate specified port
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <02234e7aab1e8f3d18e5398f1c4745203df77364.1660902588.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <02234e7aab1e8f3d18e5398f1c4745203df77364.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2022 11:02, Rahul Singh wrote:
> evtchn_alloc_unbound() always allocates the next available port. Static
> event channel support for dom0less domains requires allocating a
> specified port.

NIT: Same as patch #4, it is not clear you are talking about the current 
behavior.

> 
> Modify the evtchn_alloc_unbound() to accept the port number as an
> argument and allocate the specified port if available. If the port
> number argument is zero, the next available port will be allocated.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

