Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B2A5702F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 19:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905283.1313157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcAk-0002qF-A4; Fri, 07 Mar 2025 18:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905283.1313157; Fri, 07 Mar 2025 18:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqcAk-0002on-7G; Fri, 07 Mar 2025 18:11:46 +0000
Received: by outflank-mailman (input) for mailman id 905283;
 Fri, 07 Mar 2025 18:11:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqcAi-0002oh-97
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 18:11:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqcAh-0075lk-2C;
 Fri, 07 Mar 2025 18:11:43 +0000
Received: from [15.248.2.28] (helo=[10.24.67.32])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqcAh-00CyIl-03;
 Fri, 07 Mar 2025 18:11:43 +0000
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
	bh=BxL7dRHtzAZD81NyXHeVYChdlRwPDdaJmPSajOIJjI4=; b=OPIgHW+9pLLhmoaQgH8Bi/GU13
	rjxJHvyJPScVC8YH3PX40M1Uuf+nqPV1d2EqsC6Ld8Ll4I9YeD6Sf3B9X1pV+T6OdlPzm4fXc/FS2
	DdVB5WHYpkTBvb+2ca6QQkAy1JAmpVjLE8W6sMWSoZvLcpkH0AK8bvermwX3WxbWNGmc=;
Message-ID: <66a04219-ed4d-4959-9d44-43a38955471d@xen.org>
Date: Fri, 7 Mar 2025 18:11:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/03/2025 17:54, Andrew Cooper wrote:
> GCC 4.1.2 is from 2007, and Binutils 2.16 is a similar vintage.  Clang 3.5 is
> from 2014.  Supporting toolchains this old is a massive development and
> testing burden.
> 
> Set a minimum baseline of GCC 5.1 across the board, along with Binutils 2.25
> which is the same age.  These were chosen *3 years ago* as Linux's minimum
> requirements because even back then, they were ubiquitous in distros.  Choose
> Clang/LLVM 11 as a baseline for similar reasons; the Linux commit making this
> change two years ago cites a laudry list of code generation bugs.
> 
> This will allow us to retire a lot of compatiblity logic, and start using new
> features previously unavailable because of no viable compatibility option.
> 
> Merge the ARM 32bit and 64bit sections now they're the same.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


