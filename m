Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0F9F3878
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 19:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858435.1270649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNFYa-0006lS-Gr; Mon, 16 Dec 2024 18:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858435.1270649; Mon, 16 Dec 2024 18:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNFYa-0006jY-DI; Mon, 16 Dec 2024 18:11:00 +0000
Received: by outflank-mailman (input) for mailman id 858435;
 Mon, 16 Dec 2024 18:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzbA=TJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tNFYY-0006jR-Va
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 18:10:59 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1763e6b3-bbd9-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 19:10:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DDDF38285957;
 Mon, 16 Dec 2024 12:10:53 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id P0J_JgFj_ghK; Mon, 16 Dec 2024 12:10:51 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 950F28286E56;
 Mon, 16 Dec 2024 12:10:51 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6W7QW7VkX1SO; Mon, 16 Dec 2024 12:10:51 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1FD668285957;
 Mon, 16 Dec 2024 12:10:51 -0600 (CST)
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
X-Inumbo-ID: 1763e6b3-bbd9-11ef-99a3-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 950F28286E56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1734372651; bh=lPPk6R6rdL6JixBNW3JHNMX+w5zgsjUn60i4BqLYnpk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Dz5TzI4/ZCgb9jyFXiFpWMHkpG3wOhlYmtA+sAc5lCZpQ+cs8HZssw/2hTa1uJZxP
	 UE/7Xvz3f9EriT/H7+5l139XP/1d+7Esa92Aeow/2BTeqVnsYYs9l2AkakUdhzM/Ye
	 vrRF9F/xx9CmDEdYmfrYHERFjfbhCkc9QKoMykE8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <edf7dd3c-a424-4202-8e5d-ea5728cf11ee@raptorengineering.com>
Date: Mon, 16 Dec 2024 12:10:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/device-tree: Allow region overlapping with
 /memreserve/ ranges
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241114102802.54512-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20241114102802.54512-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/14/24 4:28 AM, Luca Fancellu wrote:
> There are some cases where the device tree exposes a memory range
> in both /memreserve/ and reserved-memory node, in this case the
> current code will stop Xen to boot since it will find that the
> latter range is clashing with the already recorded /memreserve/
> ranges.
> 
> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
> in the /memreserve/ part and even in this case this will prevent
> Xen to boot since it will see that the module memory range that
> it is going to add in 'add_boot_module' clashes with a /memreserve/
> range.
> 
> When Xen populate the data structure that tracks the memory ranges,
> it also adds a memory type described in 'enum membank_type', so
> in order to fix this behavior, allow overlapping with the /memreserve/
> ranges in the 'check_reserved_regions_overlap' function when a flag
> is set.
> 
> In order to implement this solution, there is a distinction between
> the 'struct membanks *' handled by meminfo_overlap_check(...) that
> needs to be done, because the static shared memory banks doesn't have
> a usable bank[].type field and so it can't be accessed, hence now
> the 'struct membanks_hdr' have a 'enum region_type type' field in order
> to be able to identify static shared memory banks in meminfo_overlap_check(...).
> 
> While there, set a type for the memory recorded using meminfo_add_bank()
> from efi-boot.h.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Sorry for the late response on this and I know it has already gone in,
but I just wanted to confirm that this fixes the original issue I
observed with overlapping regions in skiboot's generated DT.

Thanks!

