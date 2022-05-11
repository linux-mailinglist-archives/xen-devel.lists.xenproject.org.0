Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F222522E35
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 10:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326584.549136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohbB-00033P-JA; Wed, 11 May 2022 08:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326584.549136; Wed, 11 May 2022 08:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohbB-00031T-FY; Wed, 11 May 2022 08:21:33 +0000
Received: by outflank-mailman (input) for mailman id 326584;
 Wed, 11 May 2022 08:21:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nohb9-000310-L1
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 08:21:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nohb7-0001v5-DZ; Wed, 11 May 2022 08:21:29 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nohb7-00026r-6i; Wed, 11 May 2022 08:21:29 +0000
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
	bh=cVuT8BsUmJCkpTwqIIBhTI5zdEZNHzUDxqOAo5Nra78=; b=uSn4LTxTdLWRY3sLQUzuo8UBPW
	qH0Rf2ez0CRe+WbempgARnDJRtHALah2Hi0wszEhbVm3ZX5QJqc6MqfOUAmzdpxYEe291KExEH3NK
	mlfaUsagmYg6WvaZvQQ6d3hq3XRuO6MBbw+nwM6QAql0b8y+59hEL8TxuJSO0E+1En68=;
Message-ID: <a0abcc7b-a9fd-41f4-3bf1-8d03362561b8@xen.org>
Date: Wed, 11 May 2022 09:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <amc96@srcf.net>, Lin Liu <lin.liu@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
 <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
 <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net>
 <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
 <alpine.DEB.2.22.394.2205102012210.43560@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2205102012210.43560@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/05/2022 04:12, Stefano Stabellini wrote:
> Alternatively, I also think that taking this patch as is without
> alignment fix (either using be16_to_cpu or be16_to_cpup) is fine. The
> alignment could be fixed afterwards. The key is that I think it should
> be one of the maintainers to write the follow-up fix. Both of you are
> very fast coders and would certainly finish the patch before finishing
> the explanation on what needs to be done, which then would need to be
> understood and implemented by the contributor (opportunity for
> misunderstandings), and verified again by the reviewer on v2. That would
> take an order of magnitude more of collective time and effort.

I am happy to write a follow-up patch so long be16_to_cpup() (& co) are 
kept (because this is where I want to fix this issue so it is done for 
everyone).

Cheers,

-- 
Julien Grall

