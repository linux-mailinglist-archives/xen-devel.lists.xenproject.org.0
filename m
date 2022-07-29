Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629625856AE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 23:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377874.611168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXw9-0001vV-IB; Fri, 29 Jul 2022 21:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377874.611168; Fri, 29 Jul 2022 21:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXw9-0001sd-Ek; Fri, 29 Jul 2022 21:54:25 +0000
Received: by outflank-mailman (input) for mailman id 377874;
 Fri, 29 Jul 2022 21:54:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHXw7-0001sR-Ir
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 21:54:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHXw6-000465-L1; Fri, 29 Jul 2022 21:54:22 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHXw6-0004LZ-Fz; Fri, 29 Jul 2022 21:54:22 +0000
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
	bh=vbpHLn6XCaVz2EkJDP3/OTuNWpvyNe9yKehAmdUInbE=; b=SkFhbsuCFwupZXy/XYqfpahHUv
	B/2Yt+yw3TMUpi10Ul1M3FTQ7JrX3ZMbGRcXJHKeAC/5bx3ZbKZjf1UBAL5honCdeqLk9r+XK3oO+
	B2m+a+pHljlDMrCkrmjEQExtvQ4k8CKYF1J/8dEOoQaTJ/y4IB51BxqDk/UJnsLgFChQ=;
Message-ID: <f070e2e8-2821-4ee9-211e-22542df036a6@xen.org>
Date: Fri, 29 Jul 2022 22:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/5] xen: Rename CONFIG_DOMAIN_PAGE to
 CONFIG_ARCH_MAP_DOMAIN_PAGE and...
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-4-julien@xen.org>
 <36782478-2EF8-45C6-A1CC-1E299704F33B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <36782478-2EF8-45C6-A1CC-1E299704F33B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2022 09:40, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 20 Jul 2022, at 19:44, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> move it to Kconfig.
>>
>> The define CONFIG_DOMAIN_PAGE indicates whether the architecture provide
>> helpers to map/unmap a domain page. Rename it to the define to
> 
> Maybe “the define to” can be removed in this sentence or it needs some rephrasing.

I have removed "the define to".

> 
>> CONFIG_ARCH_MAP_DOMAIN_PAGE so it is clearer that this will not remove
>> support for domain page (this is not a concept that Xen can't get
>> away with).
>>
>> Take the opportunity to move CONFIG_MAP_DOMAIN_PAGE to Kconfig as this
>> will soon be necessary to use it in the Makefile.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> With this fixed:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm part

Thanks!

Cheers,

-- 
Julien Grall

