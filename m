Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34738A9CB0E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968134.1357829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Jfr-00061O-WA; Fri, 25 Apr 2025 14:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968134.1357829; Fri, 25 Apr 2025 14:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Jfr-0005z5-TS; Fri, 25 Apr 2025 14:05:03 +0000
Received: by outflank-mailman (input) for mailman id 968134;
 Fri, 25 Apr 2025 14:05:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u8Jfr-0005yz-5p
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:05:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u8Jfq-003qOw-2c;
 Fri, 25 Apr 2025 14:05:02 +0000
Received: from [2a02:8012:3a1:0:8daa:3830:53f7:173e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u8Jfq-009GjR-1s;
 Fri, 25 Apr 2025 14:05:02 +0000
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
	bh=79jHBIQMz4P6KJqNF/n36Ih2RBqJq/34ybT7duPwOco=; b=PGK9uVpR61MJw7CyBkxiV73AvN
	/ra16eUpZW7hvInN5mxUViobHqoeTscb4Y3SSzRu+kiFlhp5PBO96PsLP0e+14XlhrHFV0v/U4Zxj
	+ppNm70c1z+QqWkoVA7gQGVIzHmMMFM+y5qZim/Q/g8t1kCLsO62Bu9iN4KSd9jyt3DM=;
Message-ID: <82de1227-7489-4ac9-a52c-2da188bd8e54@xen.org>
Date: Fri, 25 Apr 2025 15:05:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: AArch32-V8R: Add MPU register definitions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250425124506.390458-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250425124506.390458-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 25/04/2025 13:45, Ayan Kumar Halder wrote:
> Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
> The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3 HPRBAR<n>,
> E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.
> 
> Introduce pr_t typedef which is a structure having the prbar and prlar members,
> each being structured as the registers of the AArch32-V8R architecture.
> This is the arm32 equivalent of
> "arm/mpu: Introduce MPU memory region map structure".
> 
> Few differences worth noting:-
> 1. The XN in HPRBAR is 1 bit in Arm32 (unlike 2 bits in Arm64).
> 2. PRSELR_EL2 is not used to access HPRBAR<0..31> and HPRLAR<0..31>.
> 
> Introduce macros PR{B,L}AR_EL2_(num) to generate alias for the sysregs.
> 
> Also, took the opportunity to fix the register definition of HPRLAR.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Introduce macros for PR{B,L}AR_EL2_(num). Similar macros need to be
> defined for arm64 as well.
> 2. Some style fixes
> 
> Comments not addressed
> 1. Renaming of PRBAR_EL2_XN if needed.
> 2. Using res0 for ns.

Why are you rushing sending a new version that doesn't address most of 
the comments when ...

> 
> This patch should be applied after
> "[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to enable
> compilation for AArch32 and macros need to be defined for Arm64 as well.

... this depends on a patch still under review? This is not a very good 
use of reviewers time.

Cheers,

-- 
Julien Grall


