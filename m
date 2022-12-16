Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4964EB33
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464554.722979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69Ug-0005pf-R7; Fri, 16 Dec 2022 12:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464554.722979; Fri, 16 Dec 2022 12:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69Ug-0005n0-Nu; Fri, 16 Dec 2022 12:07:14 +0000
Received: by outflank-mailman (input) for mailman id 464554;
 Fri, 16 Dec 2022 12:07:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69Uf-0005mr-NJ
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:07:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69Uf-0002gE-D3; Fri, 16 Dec 2022 12:07:13 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69Uf-0005qf-6s; Fri, 16 Dec 2022 12:07:13 +0000
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
	bh=jwhWCfplLIKLSijcEjeZDs3YoIntFJjexeGwJv84qOI=; b=3+klEv7L0FKzv+deyLp7sOH5pr
	VjD9fyOwggkJGJaL1Z7BHD/Qz95A0+pOLuElclr3D5a22BSI0X3z9B9MBCeo5Z+IrfUhYujTpm+YG
	0vFPkrj5VQGB8mpBFdfz300FeGM7dtTaT/fDrZ3JmedgZth6W3T/KOYt79R21ialzrec=;
Message-ID: <a0d8e33d-027f-dc34-31cc-3a425a12a041@xen.org>
Date: Fri, 16 Dec 2022 12:07:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 03/22] acpi: vmap pages in acpi_os_alloc_memory
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-4-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221216114853.8227-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/12/2022 11:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also, introduce a wrapper around vmap that maps a contiguous range for
> boot allocations. Unfortunately, the new helper cannot be a static inline
> because the dependences are a mess. We would need to re-include
> asm/page.h (was removed in aa4b9d1ee653 "include: don't use asm/page.h
> from common headers") and it doesn't look to be enough anymore
> because bits from asm/cpufeature.h is used in the definition of PAGE_NX.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----

Sorry I sent this patch (and the others) with 4 dashes rather than 3. 
This is my way to workaround an issue with the patchqueue tools I am 
using (it would strip the text after the --- otherwise).

I will try to remember to remove the extra dash in the next version.

Cheers,

-- 
Julien Grall

