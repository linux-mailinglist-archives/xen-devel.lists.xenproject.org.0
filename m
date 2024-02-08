Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873284EA84
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678481.1055813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYByh-0005Nv-U4; Thu, 08 Feb 2024 21:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678481.1055813; Thu, 08 Feb 2024 21:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYByh-0005LT-Qp; Thu, 08 Feb 2024 21:30:39 +0000
Received: by outflank-mailman (input) for mailman id 678481;
 Thu, 08 Feb 2024 21:30:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYByg-0005LN-5j
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 21:30:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYBye-0007vN-IL; Thu, 08 Feb 2024 21:30:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYBye-0003d4-BD; Thu, 08 Feb 2024 21:30:36 +0000
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
	bh=qLuY6Xv9ODJMnAYKAyM+fFuhel2IAtcX/BmcTYKANqg=; b=zxi3l04EdWxoLyYeCvznLofZ9k
	IrFzQOUrV3i7aEXXLA5NFVBwDeoIml9rczuIrsl0157Q0XoPMUwW58CRfpeRAApWyom5HyG2ARsV8
	p6HN1BUGA0tW0gIv51xPic77OLFM3UoZ/yu3wUKj8VUlAOTGAjSj1A7tHvcnfkIAuJsg=;
Message-ID: <07e4b9b0-5ddd-4499-b280-bd5d583b8b8c@xen.org>
Date: Thu, 8 Feb 2024 21:30:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
 ASSERT_UNREACHABLE() to xen/bug.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 02/02/2024 18:03, Oleksii Kurochko wrote:
> Move the macros mentioned in the commit subject to their appropriate
> locations.
> Additionally, eliminate the dependency of xen/lib.h from xen/bug.h and
> include "xen/bug.h" in files where xen/bug.h macros are utilized.
> 
> Most of the changes were made because a file requires macros from xen/bug.h,
> except for some files for Arm which require definitions of BUG_OPCODE,
> BUG_INSTR, BUG_FN_REG.
> 
> xen/lib.h was added to list-sort.c ( otherwise compilation errors related
> to {d}printk occur during compilation of list-sort.c. ) as xen/lib.h was
> removed from xen/list.h. Since nothing in xen/list.h depends on xen/lib.h
> functionality and only xen/bug.h is needed.
> 
> cpufeature.h requires the inclusion of <xen/cache.h>;
> otherwise, the following error will occur:
> ld: common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
> multiple definitions of `__cacheline_aligned';
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

