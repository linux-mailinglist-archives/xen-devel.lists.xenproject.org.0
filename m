Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CC4F9FC3
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 00:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301806.515133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxRH-0007Q6-Ie; Fri, 08 Apr 2022 22:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301806.515133; Fri, 08 Apr 2022 22:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxRH-0007Mx-FW; Fri, 08 Apr 2022 22:50:47 +0000
Received: by outflank-mailman (input) for mailman id 301806;
 Fri, 08 Apr 2022 22:50:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncxRG-0007Mr-3O
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 22:50:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncxRF-0004m3-Qt; Fri, 08 Apr 2022 22:50:45 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncxRF-0005WE-LB; Fri, 08 Apr 2022 22:50:45 +0000
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
	bh=ju5Wtq+n2J4zrnhb+bLOe79KxVjb/Aq57b4UdXK/ujY=; b=iEBsgV5HGzFRc6G/GA8um3414+
	AqDMY+vK4g6v/FbKDU9L25vv7hYjN2VO6G/LZdQaZWvOvM4wWPaEaQRlDPzglPRPbvxtbUE/lp7Jv
	AH4Cmhz1Zj9xAuUkXVIWmDIoP5BWBBiD0B0Jy4HaKHgbsZUgdEsd7S5N1DYUgnOEU/2Q=;
Message-ID: <a9628233-5c2e-abb2-1df8-f45e4ac3280b@xen.org>
Date: Fri, 8 Apr 2022 23:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-7-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2203171744190.3497@ubuntu-linux-20-04-desktop>
 <DU2PR08MB732540A4196E8634B4D8A579F71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204081516400.3066615@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
In-Reply-To: <alpine.DEB.2.22.394.2204081516400.3066615@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/04/2022 23:18, Stefano Stabellini wrote:
> On Tue, 29 Mar 2022, Penny Zheng wrote:
>> Right now, the memory attribute of static shared memory is RW as default,
>> What if we add memory attribute setting in device tree configuration, sometimes,
>> Users want to specify that borrower domain only has RO right, hmm, then the
>> Initialization for p2mt could be either p2m_ram_rw or p2m_ram_ro?
>> In such case, we could add another parameter in guest_physmap_add_shm to
>> show the p2m type...
>> Hope I understand what you suggested here.
> 
> Yes, I think I understand. I think your suggestion is OK too. However,
> your suggestion is much more work than mine: I was only suggesting a
> small improvement limited to guest_physmap_add_shm and
> get_pages_from_gfn. Your suggestion involves a device tree change that
> would have a larger impact on the patch series. So if you are up for it,
> I am happy to review it. I am also fine just to have a small improvement
> on guest_physmap_add_shm/get_pages_from_gfn.

AFAIU, your proposal would mean that the behavior for 
get_pages_from_gfn() and get_page_from_gfn() will differ. This is not great.

I don't think we can easily change the behavior of get_page_from_gfn() 
because some callers can accept multiple types.

Furthermore, while today we only check p2m_ram_rw. It might be possible 
that we would want to check different type. For instance, if we want to 
use read-only mapping, it would be fine to accept p2m_ram_ro and p2m_ram_rw.

So overall, I am not in favor of initializing p2mt and let 
get_pages_from_gfn() to check the type.

Cheers,

-- 
Julien Grall

