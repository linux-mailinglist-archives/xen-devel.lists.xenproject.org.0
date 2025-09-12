Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A881B5587F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 23:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122599.1466191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBRz-0006Wa-VF; Fri, 12 Sep 2025 21:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122599.1466191; Fri, 12 Sep 2025 21:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBRz-0006UJ-RZ; Fri, 12 Sep 2025 21:36:59 +0000
Received: by outflank-mailman (input) for mailman id 1122599;
 Fri, 12 Sep 2025 21:36:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxBRx-0006UC-Ol
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 21:36:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBRx-006dzk-1B;
 Fri, 12 Sep 2025 21:36:57 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBRx-006BGT-1Q;
 Fri, 12 Sep 2025 21:36:57 +0000
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
	bh=BIdtF20OI98y+cEOdWKs7eJUp00nycsNeL9Fr5TvTIM=; b=XvFSi3WyEKE9uiUFB2yzrNzFMs
	1nT+C9tduYwPhMtQdg1Up2UxNbmdTBQoq1Ft9Rd7C6pGlgPc/WmiWv14gcYZsvc0vehB+CtyuU/CO
	qYuVxGrT0VpsWVbD8uMk8p+NDASOcY4Zb6m/WjcW7U5uLv64tuyyh0qMVh7X9uCQmeT4=;
Message-ID: <705d4436-2263-462b-a582-5f0092821959@xen.org>
Date: Fri, 12 Sep 2025 22:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250911081213.1323594-1-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250911081213.1323594-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 11/09/2025 09:12, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Restrict cpu_up_send_sgi() function to arm32 code as it's used by arm32
> platforms only and unreachable on arm64 (Misra rule 2.1).
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
 > ---> Logically cpu_up_send_sgi() should be moved in arm32, but source is
> "GPL-2.0-or-later" while possible destination is "GPL-2.0-only", so put it
> under ifdef for now.

:(. I don't know if we will ever solve this license mess... Looking at 
the list of platform using cpu_up_send_sgi(), all the platforms are 10+ 
years old and to be honest except maybe the rcar2 development platforms. 
I doubt there are anyone using them.

So I would be tempted to get rid of them and mandate PSCI when booting 
on Xen.

Bertrand, Michal, Stefano any thoughts?

Meanwhile for this patch:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


