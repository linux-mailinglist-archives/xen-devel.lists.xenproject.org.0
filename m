Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2195B304
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 12:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781721.1191210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5Bh-0006nU-8e; Thu, 22 Aug 2024 10:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781721.1191210; Thu, 22 Aug 2024 10:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5Bh-0006m1-64; Thu, 22 Aug 2024 10:37:05 +0000
Received: by outflank-mailman (input) for mailman id 781721;
 Thu, 22 Aug 2024 10:37:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sh5Bg-0006lt-05
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 10:37:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh5Bf-0002JI-Dq; Thu, 22 Aug 2024 10:37:03 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh5Bf-0003qQ-7N; Thu, 22 Aug 2024 10:37:03 +0000
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
	bh=3m4vTjRxGgp56ZZ8neP6PYKjEtXOY6tr6HqVR77VYHU=; b=j18Qe2/eHVTNJ+fyhK6roIXJIu
	1O2zNuGoE7FiWdHTyf6OD/wmZSeRSYYPt2Q8WjUe0ryYqWdqq9U7cSTXR+ToWwhosxd2FIcT2urF4
	cmlnwpEoQBwgefHwOZvGRVcZc58M6YvVWCLO48UyEpkj0GGGGdCuhrVNP1e3GEXhVLag=;
Message-ID: <dc95ec85-4ce8-4ca7-8c09-dbf403952822@xen.org>
Date: Thu, 22 Aug 2024 11:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] xen: arm: Split MMU code in preparation for MPU
 work (part 2)
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/08/2024 13:24, Ayan Kumar Halder wrote:
> Hi,
> 
> In https://patchew.org/Xen/20231116145032.1651305-1-Henry.Wang@arm.com/, Henry has
> reorganized some of the code between the MMU specific and generic files.
> 
> In this patch serie, we address the remaining code reorg so that MMU specific
> code is cleanly separated and we have added stubs wherever necessary to avoid
> introducing if-def.
> 
> Changes from :-
> 
> v1..v2 - mentioned in individual patches.
> v3 - Reordered the patches so that first 3 can be committed (as they have been
> reviewed).
> 
> Ayan Kumar Halder (4):
>    xen: arm: Add a new helper update_boot_mapping()
>    xen: arm: Move domain_page.c to MMU specific
>    xen: arm: Enclose access to EL2 MMU specific registers under
>      CONFIG_MMU

I have committed the above 3 patches. AFAICT...

>    xen: make VMAP support in MMU system only

... this patch may require a respin and definitely needs more acks.

Cheers,

-- 
Julien Grall


