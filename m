Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DE803B87
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 18:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647258.1010192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACk9-0003Zu-Fp; Mon, 04 Dec 2023 17:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647258.1010192; Mon, 04 Dec 2023 17:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACk9-0003Y9-D9; Mon, 04 Dec 2023 17:28:29 +0000
Received: by outflank-mailman (input) for mailman id 647258;
 Mon, 04 Dec 2023 17:28:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rACk7-0003Y1-KX
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 17:28:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rACk6-0007YL-LI; Mon, 04 Dec 2023 17:28:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.23.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rACk6-0005IU-Ef; Mon, 04 Dec 2023 17:28:26 +0000
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
	bh=JO+1xJmHICPUF3HautaGK23vUEzYv/EMy96CippJyXE=; b=3pZKqf2i6WEIkc2o8VAsnwJtm/
	rnXW/9Ut71dxa975BhXwJoNTRZkJw1lLvYpwHyxNwGxCFQzPFJXzZ3VqwhNUWXUiv0L3Svil+zdY6
	x82ETF3gDamEiyjd8FVJ4BAUEEZnGur7Gt5/ZgThYCgrMOsPdKJmdXB5YbzGR0cruEtw=;
Message-ID: <2d7f5ae2-410f-49d4-b0b0-05e9f690bd76@xen.org>
Date: Mon, 4 Dec 2023 17:28:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <de2bfb322d91e99cf794c233461a04e638ee93aa.1701707356.git.maria.celeste.cesario@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <de2bfb322d91e99cf794c233461a04e638ee93aa.1701707356.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/12/2023 16:32, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Remove or amend casts to comply with Rule 11.8.
> 
> Fix violations by adding missing const qualifier in cast.
> Fix violations by removing unnecessary cast.
> Change type of operands from char* to uintptr_t: uintptr_t is
> the appropriate type for memory address operations.
> 
> No functional changes.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

