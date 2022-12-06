Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7B644E77
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455637.713169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gFu-00081E-6d; Tue, 06 Dec 2022 22:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455637.713169; Tue, 06 Dec 2022 22:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gFu-0007yj-43; Tue, 06 Dec 2022 22:17:38 +0000
Received: by outflank-mailman (input) for mailman id 455637;
 Tue, 06 Dec 2022 22:17:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2gFs-0007yY-3d
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:17:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gFr-00049Z-OW; Tue, 06 Dec 2022 22:17:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gFr-0004iP-JD; Tue, 06 Dec 2022 22:17:35 +0000
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
	bh=YoZs3nTSDzJFjR3T0cyHZleJfMeq+DcRM8XyF6iEc/s=; b=tydCmNNPJS/rJN2fRRfOiVdYQL
	IMrY5W51nYozfMkwUtYHbmy1dmbOP+7cKnklQ3N+zumuiqejBVbe97e8dSQoAyVXNGrhJqYzoTNVn
	fZSwfwmCt/K8Du9LaQLqL3wNYQKU9pom5XX8vDN4eGjZrfuSi3hs0EuFSXvmr1BCSz3Y=;
Message-ID: <142b39dd-0c1b-b98f-91af-a06d5f34112d@xen.org>
Date: Tue, 6 Dec 2022 22:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 19/19] Fix misleading indentation gcc warning
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <3575d33c0520d3117e1d12af91f1b1e31a2571c2.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3575d33c0520d3117e1d12af91f1b1e31a2571c2.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> percpu.c: In function 'cpu_percpu_callback':
> percpu.c:61:7: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
>         if ( system_state != SYS_STATE_resume )
>         ^~
> percpu.c:63:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
>           break;
>           ^~~~~
> percpu.c:67:7: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
>         if ( system_state != SYS_STATE_suspend )
>         ^~
> percpu.c:69:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
>           break;
>           ^~~~~
> 
> Fixes: c3109b76d967 ("xen: don't free percpu areas during suspend")

This commit hash doesn't seem to exist upstream. But it sounds like you 
are fixing a bug that was introduced by this series.

In general, patch within a series should be able to compile without any 
follow-up requirement. Similarly, we should not bug fix a patch within 
the same series.

Instead, this should be folded in the patch that introduced the problem.

Cheers,

-- 
Julien Grall

