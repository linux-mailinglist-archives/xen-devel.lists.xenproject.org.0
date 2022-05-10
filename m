Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A4520E1D
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325242.547739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noJgL-0001IS-Qe; Tue, 10 May 2022 06:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325242.547739; Tue, 10 May 2022 06:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noJgL-0001GM-Mv; Tue, 10 May 2022 06:49:17 +0000
Received: by outflank-mailman (input) for mailman id 325242;
 Tue, 10 May 2022 06:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pA66=VS=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1noJgK-0001GG-EW
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 06:49:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4db2daa6-d02d-11ec-a406-831a346695d4;
 Tue, 10 May 2022 08:49:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A02E12FC;
 Mon,  9 May 2022 23:49:13 -0700 (PDT)
Received: from [10.57.3.29] (unknown [10.57.3.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ACDB3F73D;
 Mon,  9 May 2022 23:49:11 -0700 (PDT)
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
X-Inumbo-ID: 4db2daa6-d02d-11ec-a406-831a346695d4
Message-ID: <a96bc62d-8bf8-1507-5838-8e29297bc775@arm.com>
Date: Tue, 10 May 2022 08:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220505115906.380416-1-michal.orzel@arm.com>
 <YnO/bIw/bG8hMNx+@arm.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <YnO/bIw/bG8hMNx+@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Catalin,

On 05.05.2022 14:13, Catalin Marinas wrote:
> On Thu, May 05, 2022 at 01:59:06PM +0200, Michal Orzel wrote:
>> Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
>> and can lead to overflow. Currently there is no issue as it is used
>> in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
>> To avoid possible problems, fix the macro.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> Link: https://lore.kernel.org/r/20220426070603.56031-1-michal.orzel@arm.com
>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>> Origin: git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git (48e6f22e25a4)
>> ---
>> Changes since v1:
>> - add Origin tag as the patch was merged in upstream arm64 linux tree
> 
> Note that there's always a risk that the commit Id will be changed
> before it hits mainline (Linus' tree).
> 

This commit is now in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48e6f22e25a44e43952db5fbb767dea0c9319cb2
so we can be sure that the SHA will stay unmodified there (and will be the same in Linus' tree).

Question to maintainers:
Do you want me to update Origin to point to linux-next?

Cheers,
Michal

