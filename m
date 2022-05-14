Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3EE52709E
	for <lists+xen-devel@lfdr.de>; Sat, 14 May 2022 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329030.552198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npopk-0005Io-5a; Sat, 14 May 2022 10:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329030.552198; Sat, 14 May 2022 10:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npopk-0005GT-2M; Sat, 14 May 2022 10:17:12 +0000
Received: by outflank-mailman (input) for mailman id 329030;
 Sat, 14 May 2022 10:17:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npopi-0005GN-2Z
 for xen-devel@lists.xenproject.org; Sat, 14 May 2022 10:17:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npopg-0007Zx-UF; Sat, 14 May 2022 10:17:08 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npopg-0000al-NT; Sat, 14 May 2022 10:17:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=RzxzoxRqkI3amrqgxzwZsVJofbqkBwiBCm0zGv46f6c=; b=0MFgZEgobD+W7djbQopj50+CL3
	tO/sPtDCfiy2ZQf2L2DZs6+Pdp9seMWmxl/VVe4MK9ThFH3ONRgWvhTCNgA/RojvU1xWkOlMtJe7h
	k7i/rRN7aps9Oa6DClnCy5Znrhy65XS/CWMFmLsYKErcXwElNpXXGJDpcFm+VwMoR1/o=;
Message-ID: <a14435f6-2ae4-4889-99b2-e0b3fa1445d7@xen.org>
Date: Sat, 14 May 2022 11:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-15-julien@xen.org>
 <alpine.DEB.2.22.394.2204051423490.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
In-Reply-To: <alpine.DEB.2.22.394.2204051423490.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/04/2022 22:27, Stefano Stabellini wrote:
> On Mon, 21 Feb 2022, Julien Grall wrote:
>> diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
>> new file mode 100644
>> index 000000000000..70eafe2891d7
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/pmap.h
>> @@ -0,0 +1,33 @@
>> +#ifndef __ASM_PMAP_H__
>> +#define __ASM_PMAP_H__
>> +
>> +#include <xen/mm.h>
>> +
>> +/* XXX: Find an header to declare it */
>> +extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
> 
> Why not fixmap.h?

I wanted to find a helper that would only get included by pmap.c and 
mm.c, this would help to prevent someone to use xen_fixmap[] directly.

Anyway, I am OK with fixmap.h and we will rely on review to catch any 
new user of xen_fixmap.

Cheers,

-- 
Julien Grall

