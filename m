Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEEC333B90
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96023.181457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJxCE-0001wB-9b; Wed, 10 Mar 2021 11:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96023.181457; Wed, 10 Mar 2021 11:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJxCE-0001vm-60; Wed, 10 Mar 2021 11:40:10 +0000
Received: by outflank-mailman (input) for mailman id 96023;
 Wed, 10 Mar 2021 11:40:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJxCD-0001vh-5q
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:40:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJxCC-0000QF-6I; Wed, 10 Mar 2021 11:40:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJxCB-0004Fc-MQ; Wed, 10 Mar 2021 11:40:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4gwFw7bDZ4IVq9c0TeW+bp5lxQ6YAX7wVVnripp8gKg=; b=MC1NE7j+w5ZjNOxzCcjbPRBcsA
	PwYoIs00P0sXR2uiUmbm/rZ9N0UGwGcpUYo2Nmzt4bDR4GjfAG3LLbX46IZ5XoRdjqav/pSrzi8ri
	vC4pJ+ljUz9KzxcNUwDHsbjPAOyoNlAAwwRTmtSw2K4OppHffyLzz91xBQjYDVLUu7Ow=;
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: Michal Orzel <michal.orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20210310065803.348-1-michal.orzel@arm.com>
 <3247ee1d-f843-7c74-20a4-315716a91097@suse.com>
 <24648.44686.272676.156900@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c9595c38-ea5d-b975-c742-25017dfb5899@xen.org>
Date: Wed, 10 Mar 2021 11:40:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24648.44686.272676.156900@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 10/03/2021 11:33, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE"):
>> Nit: Linux, iirc, has dropped support for ---help--- (allowing
>> only help now). To limit churn whenever we're going to re-sync
>> our kconfig again, I'd like to avoid introduction of new uses
>> of the old form. I'm sure this could be taken care of while
>> committing.
> 
> At this stage of the release I would prefer to avoid updates made by
> the committer when committing.  Ie the thing that is committed should
> have been previously posted and had at least some minimal time to spot
> howlers.

I was under the impression that this patch would not target 4.15. At 
least I didn't see any request for it.

Cheers,

-- 
Julien Grall

