Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7D853713
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 18:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680097.1057951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwQ9-0001hl-E5; Tue, 13 Feb 2024 17:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680097.1057951; Tue, 13 Feb 2024 17:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwQ9-0001f4-BO; Tue, 13 Feb 2024 17:18:13 +0000
Received: by outflank-mailman (input) for mailman id 680097;
 Tue, 13 Feb 2024 17:18:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZwQ7-0001ey-LB
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 17:18:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwQ6-0004BR-KZ; Tue, 13 Feb 2024 17:18:10 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwQ6-0000Sb-Dj; Tue, 13 Feb 2024 17:18:10 +0000
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
	bh=VNnM4VQF0vjcdTR7KXseCdKfZl7qNpyp0ViprkBLpws=; b=TZVIEQjS0rEVeNqWXb8Hra5dO4
	9Zn3BGXU82HEde78hfVwcmsJS/RM3JSlUI3KitOwpa8oRy9wHNB02GUA0VBQVq/nT1I5loWWsHqyb
	f36LupXy1/7hGT+LI2rT9MwctPW+eZeXn022/WTvUL7dUdofJiRUpDEnq4rOdSVyw0+g=;
Message-ID: <01167c19-d1ff-41ea-8852-3eef307f2156@xen.org>
Date: Tue, 13 Feb 2024 17:18:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/lib: introduce generic find next bit operations
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 09/02/2024 17:58, Oleksii Kurochko wrote:
> find-next-bit.c is common for Arm64, PPC and RISCV64,
> so it is moved to xen/lib.
> 
> PPC has been transitioned to generic functions from find-next-bit.c
> since it now shares the same implementation as the PPC-specific code.
> 
> The MISRA exclude list has been updated to verify
> lib/find-next-bit.c instead of Arm's find_next_bit.c,
> as Arm's find_next_bit.c has been relocated to xen/lib/.
> 
> Despite CONFIG_GENERIC_FIND_FIRST_BIT not currently being used in
> Xen and being removed from the Linux kernel [1], it could theoretically
> prove useful for Xen. This is because the Linux kernel transitioned
> Arm to the generic version of find_first_bit() and
> find_first_zero_bit() due to improvements [1] in both performance
> and .text size.
> It would be prudent to investigate whether [1] is applicable to Xen
> as well and, if so, implement the necessary changes in a separate patch.
> 
> [1] https://lore.kernel.org/linux-arch/20211005054059.475634-5-yury.norov@gmail.com/
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

