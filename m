Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317CB35DAAA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 11:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109598.209218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWF1I-0001eA-80; Tue, 13 Apr 2021 09:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109598.209218; Tue, 13 Apr 2021 09:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWF1I-0001dl-4W; Tue, 13 Apr 2021 09:07:40 +0000
Received: by outflank-mailman (input) for mailman id 109598;
 Tue, 13 Apr 2021 09:07:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWF1G-0001dg-6J
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 09:07:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWF1F-00080r-4a; Tue, 13 Apr 2021 09:07:37 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWF1E-0006PF-S7; Tue, 13 Apr 2021 09:07:36 +0000
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
	bh=SnRaJlUhpLjGwpHoUNF1BhChmVspLX+FOUGiLu57eTs=; b=UchJwUA2e77QMBNfIbft1I9Q8J
	Bi5Y8ab7nDUpo5ClC9f4E70nsGc4acdWnwd2EMEn+/FVo5wZOTckZ3hluV70woiJekw3eLyO4azYb
	OSDSVDV/m9qXXI8+9N03bg8jPCrHLgWgku8jup0X4srz0MmzU711O2xr5Q2pw97LjSsA=;
Subject: Re: [PATCH] Remove support for ThumbEE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210413082447.30313-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1c3d1c69-976c-6626-74e7-ded112f6ed03@xen.org>
Date: Tue, 13 Apr 2021 10:07:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413082447.30313-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 13/04/2021 09:24, Michal Orzel wrote:
> ThumbEE(T32EE) was introduced in ARMv7 and removed in ARMv8.
> In 2011 ARM deprecated any use of the ThumbEE instruction set.

This doesn't mean this is not present in any CPU. In fact, in the same 
section (see A2.10 in ARM DDI 0406C.d):

"ThumbEE is both the name of the instruction set and the name of the 
extension that provides support for that
instruction set. The ThumbEE Extension is:
   - Required in implementations of the ARMv7-A profile.
   - Optional in implementations of the ARMv7-R profile.
"

> 
> This feature is untested and as per my understanding
> there are no reported users for it. >
> Remove all the bits related to it.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com> > ---
>   xen/arch/arm/cpufeature.c        |  3 +++
>   xen/arch/arm/domain.c            | 12 ------------
>   xen/arch/arm/setup.c             |  3 +--
>   xen/include/asm-arm/cpregs.h     |  6 ------
>   xen/include/asm-arm/cpufeature.h |  1 -
>   xen/include/asm-arm/domain.h     |  1 -
>   6 files changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 1d88783809..82265a72f4 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -209,6 +209,9 @@ static int __init create_guest_cpuinfo(void)
>       guest_cpuinfo.pfr32.ras = 0;
>       guest_cpuinfo.pfr32.ras_frac = 0;
>   
> +    /* Hide ThumbEE support */
> +    guest_cpuinfo.pfr32.thumbee = 0;

Even if you hide the feature from the guest, the registers are still 
accessible. So you are not removing support but just opening a potential 
security hole as the registers now gets shared...

Looking at the spec, it doesn't look like it is possible to trap them.

In any case, the number of registers to save/restore is pretty limited. 
So I don't see the problem to keep the code around. It doesn't mean the 
feature is working, it just means we properly keep the domain isolated 
from each other.

Cheers,

-- 
Julien Grall

