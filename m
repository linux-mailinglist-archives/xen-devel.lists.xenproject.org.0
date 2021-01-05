Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F582EAF96
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 17:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62071.109669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kworF-0003er-1Q; Tue, 05 Jan 2021 16:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62071.109669; Tue, 05 Jan 2021 16:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kworE-0003eS-U9; Tue, 05 Jan 2021 16:06:52 +0000
Received: by outflank-mailman (input) for mailman id 62071;
 Tue, 05 Jan 2021 16:06:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kworD-0003eM-KS
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 16:06:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kworC-0004di-Ju; Tue, 05 Jan 2021 16:06:50 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kworC-0005Ha-DQ; Tue, 05 Jan 2021 16:06:50 +0000
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
	bh=DwgI10LMWsniAURmB0Pd1lFBYmqh47uAh4jigoSdgNE=; b=lB5f+Af5mSMDCa5O6rIZOSJ+QP
	dk1q5jQ2rQJVwtL5oXrSU0lIBFy6XmRQLg9eGm3Cy5GtPXkO8dcrJGWsuwH4ehjSjEFq9VN4jCvRu
	TNzfXF2tirzgL0PU/gQFSx9cVW9hbdgpDjdlhiT6RvwYMokiD6DOaDi2dVBNhCrXdPVg=;
Subject: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm: Emulate ID
 registers)
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 Ian Jackson <iwj@xenproject.org>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org>
Date: Tue, 5 Jan 2021 16:06:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Ian and Andre)

Hi Bertrand,

On IRC, Ian pointed out that the smoke test was failing on Cubietruck. 
The only patches because the last success and the failure are your series.

This seems to be a very early failure as there is no output from Xen [1].

I originally thought the problem was because some of the ID registers 
(such as ID_PFR2) introduced in patch #2 doesn't exist in Armv7.

But per B7.2.1 in ARM DDI 0406C.d, unallocated ID registers should be 
RAZ. So it would result to a crash. Andre confirmed that PFR2 can be 
accessed by writing a small baremetal code and booted on Cortex-A7 and 
Cortex-A20.

So I am not entirely sure what's the problem. Andre kindly accepted to 
try to boot Xen on his board. Hopefully, this will give us a clue on the 
problem.

If not, I will borrow a Cubietruck in OssTest and see if I can reproduce 
it and debug it.

Cheers,

On 17/12/2020 15:38, Bertrand Marquis wrote:
> The goal of this serie is to emulate coprocessor ID registers so that
> Xen only publish to guest features that are supported by Xen and can
> actually be used by guests.
> One practical example where this is required are SVE support which is
> forbidden by Xen as it is not supported, but if Linux is compiled with
> it, it will crash on boot. An other one is AMU which is also forbidden
> by Xen but one Linux compiled with it would crash if the platform
> supports it.
> 
> To be able to emulate the coprocessor registers defining what features
> are supported by the hardware, the TID3 bit of HCR must be disabled and
> Xen must emulated the values of those registers when an exception is
> catched when a guest is accessing it.
> 
> This serie is first creating a guest cpuinfo structure which will
> contain the values that we want to publish to the guests and then
> provides the proper emulationg for those registers when Xen is getting
> an exception due to an access to any of those registers.
> 
> This is a first simple implementation to solve the problem and the way
> to define the values that we provide to guests and which features are
> disabled will be in a future patchset enhance so that we could decide
> per guest what can be used or not and depending on this deduce the bits
> to activate in HCR and the values that we must publish on ID registers.
> 
> ---
> Changes in V2:
>    Fix First patch to properly handle DFR1 register and increase dbg32
>    size. Other patches have just been rebased.
> 
> Changes in V3:
>    Add handling of reserved registers as RAZ
>    Minor fixes described in each patch
> 
> Changes in V4:
>    Add a patch to switch implementation to use READ_SYSREG instead of the
>    32/64 bit version of it.
>    Move cases for reserved register handling from macros to the code
>    itself.
>    Various typos fixes.
> 
> Bertrand Marquis (8):
>    xen/arm: Use READ_SYSREG instead of 32/64 versions
>    xen/arm: Add ID registers and complete cpuinfo
>    xen/arm: Add arm64 ID registers definitions
>    xen/arm: create a cpuinfo structure for guest
>    xen/arm: Add handler for ID registers on arm64
>    xen/arm: Add handler for cp15 ID registers
>    xen/arm: Add CP10 exception support to handle MVFR
>    xen/arm: Activate TID3 in HCR_EL2
> 
>   xen/arch/arm/arm64/vsysreg.c        |  82 ++++++++++++++++++++
>   xen/arch/arm/cpufeature.c           | 113 ++++++++++++++++++++++------
>   xen/arch/arm/traps.c                |   7 +-
>   xen/arch/arm/vcpreg.c               | 102 +++++++++++++++++++++++++
>   xen/include/asm-arm/arm64/hsr.h     |  37 +++++++++
>   xen/include/asm-arm/arm64/sysregs.h |  28 +++++++
>   xen/include/asm-arm/cpregs.h        |  15 ++++
>   xen/include/asm-arm/cpufeature.h    |  58 +++++++++++---
>   xen/include/asm-arm/perfc_defn.h    |   1 +
>   xen/include/asm-arm/traps.h         |   1 +
>   10 files changed, 409 insertions(+), 35 deletions(-)
> 

[1] 
http://logs.test-lab.xenproject.org/osstest/logs/158152/test-armhf-armhf-xl/info.html

-- 
Julien Grall

