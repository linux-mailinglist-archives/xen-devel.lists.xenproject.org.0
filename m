Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7CEAAC11D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 12:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977008.1364096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFKT-0005kj-Td; Tue, 06 May 2025 10:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977008.1364096; Tue, 06 May 2025 10:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFKT-0005jG-Q8; Tue, 06 May 2025 10:15:13 +0000
Received: by outflank-mailman (input) for mailman id 977008;
 Tue, 06 May 2025 10:15:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCFKS-0005jA-SS
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 10:15:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCFKS-00Cc9R-0i;
 Tue, 06 May 2025 10:15:12 +0000
Received: from [2a02:8012:3a1:0:7157:32ca:2aea:33a3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCFKS-00FwLm-05;
 Tue, 06 May 2025 10:15:12 +0000
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
	bh=D6GfJJejLuaeHsmXVZVCpGoUnVnF6gmM7bS1JOgbAWw=; b=xyRXcx5Lfk2lNEliuq03ckPaUN
	WZE+xBcjlQ/gJSj+8tttd0+Z/WuaLjTwvVAN7B9JF27F//dFFjI8v+NW96ZLo3hR0ev6YB/8bKAfh
	pYFTDqgrOouj1ByMHu0GMQb6JCB2MFaQasI37jrfU1r+swxaYR1Nx11HIeefa6ypOTRc=;
Message-ID: <daf9d45e-bcbf-4554-83d8-e51e3fc0ed38@xen.org>
Date: Tue, 6 May 2025 11:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] xen/gnttab: limit cache flush operation to guests
 allowed cache control
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250506083148.34963-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roger,

On 06/05/2025 09:31, Roger Pau Monne wrote:
> Whether a domain is allowed to issue cache-control operations is reported
> by the cache_flush_permitted() check.  Introduce such check to limit the
> availability of GNTTABOP_cache_flush to only guests that are granted cache
> control.

Can you outline what's the problem you are trying to solve? Asking, 
because I don't see the problem of allowing any guest calling 
GNTTABOP_cache_flush on Arm from any domains.

Cheers,

-- 
Julien Grall


