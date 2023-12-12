Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E23D80ECB0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 13:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653102.1019335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2M1-00077Q-3t; Tue, 12 Dec 2023 12:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653102.1019335; Tue, 12 Dec 2023 12:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2M1-00075O-16; Tue, 12 Dec 2023 12:59:17 +0000
Received: by outflank-mailman (input) for mailman id 653102;
 Tue, 12 Dec 2023 12:59:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD2Lz-00071b-7O
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 12:59:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD2Ly-0006t7-TN; Tue, 12 Dec 2023 12:59:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD2Ly-0003wo-OI; Tue, 12 Dec 2023 12:59:14 +0000
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
	bh=N5fA+ntBTjPqXaa194HlxUl9zGQGBIufeRBe97Pk7JE=; b=lehRiEMfF2E4f5rOEahe3G8ZlM
	+i9ka6qiQDTXPNSQDU3hgel8xHXGkzhYyZGpZi17OrQ+H6rjeYbuXQt7Wv52G5hIWTPEaapqRms32
	hNsBLBBZ4kwnWATCXazu4eL+PDrzU7jpwLsGgZpg416pTPK3gbHtWVzdtqQHGiGtkyp8=;
Message-ID: <10e5466c-a7d1-48b1-b040-b1ff04f1a4ee@xen.org>
Date: Tue, 12 Dec 2023 12:59:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] xen/spinlock: rename recursive lock functions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Paul Durrant <paul@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 09:47, Juergen Gross wrote:
> Rename the recursive spin_lock() functions by replacing the trailing
> "_recursive" with a leading "r".
> 
> Switch the parameter to be a pointer to rspinlock_t.
> 
> Remove the indirection through a macro, as it is adding only complexity
> without any gain.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

