Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E84F428C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 23:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299316.509953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbr18-000328-4z; Tue, 05 Apr 2022 21:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299316.509953; Tue, 05 Apr 2022 21:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbr18-0002z2-0T; Tue, 05 Apr 2022 21:47:14 +0000
Received: by outflank-mailman (input) for mailman id 299316;
 Tue, 05 Apr 2022 21:47:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nbr16-0002yw-4e
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 21:47:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nbr14-0002QE-K7; Tue, 05 Apr 2022 21:47:10 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nbr14-0002ug-DZ; Tue, 05 Apr 2022 21:47:10 +0000
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
	bh=WkCMBdUkRg0ng2tZBdBpDn0ZoEa3DBuyOHtbCvIM7fM=; b=wJrsPCaV+yxIuCZsNBxrmT7qgK
	FLTy/9o4BZ0ALuWG8tQBga+VVYdrgHGBhWWgqVsfn4lEk8GHMov00RaG+CR0dyQpSJOOH1wZqEw4h
	hboHQKDyips2bFpqtaD5+VWPo0cxU2EEez6pIOIea3SvnA4B+9aDAaEmuSqsVh6nBnrw=;
Message-ID: <ddfdefed-21e6-06ee-182b-731fd130794a@xen.org>
Date: Tue, 5 Apr 2022 22:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-14-julien@xen.org>
 <alpine.DEB.2.22.394.2204051411510.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 13/19] xen/arm: Move fixmap definitions in a separate
 header
In-Reply-To: <alpine.DEB.2.22.394.2204051411510.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/04/2022 22:12, Stefano Stabellini wrote:
>> +/* Map a page in a fixmap entry */
>> +extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
>> +/* Remove a mapping from a fixmap entry */
>> +extern void clear_fixmap(unsigned map);
>> +
>> +#endif /* __ASSEMBLY__ */
>> +
>> +#endif /* __ASM_FIXMAP_H */
> 
> 
> It is a good idea to create fixmap.h, but I think it should be acpi.h to
> include fixmap.h, not the other way around.

As I wrote in the commit message, one definition in fixmap.h rely on 
define from acpi.h (i.e NUM_FIXMAP_ACPI_PAGES). So if we don't include 
it, then user of FIXMAP_PMAP_BEGIN (see next patch) will requires to 
include acpi.h in order to build.

Re-ordering the values would not help because the problem would exactly 
be the same but this time the acpi users would have to include pmap.h to 
define NUM_FIX_PMAP.

> 
> The appended changes build correctly on top of this patch.

That's expected because all the users of FIXMAP_ACPI_END will be 
including acpi.h. But after the next patch, we would need pmap.c to 
include acpi.h.

I don't think this would be right (and quite likely you would ask why
this is done). Hence this approach.

Cheers,

-- 
Julien Grall

