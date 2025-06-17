Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D6ADD190
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 17:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018279.1395178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYI8-0001qb-Dm; Tue, 17 Jun 2025 15:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018279.1395178; Tue, 17 Jun 2025 15:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYI8-0001pA-A5; Tue, 17 Jun 2025 15:32:04 +0000
Received: by outflank-mailman (input) for mailman id 1018279;
 Tue, 17 Jun 2025 15:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eF/U=ZA=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uRYI6-0001p4-P0
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 15:32:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 33edfab6-4b90-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 17:31:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D095150C;
 Tue, 17 Jun 2025 08:31:35 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.67.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04BDF3F673;
 Tue, 17 Jun 2025 08:31:54 -0700 (PDT)
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
X-Inumbo-ID: 33edfab6-4b90-11f0-b894-0df219b8e170
Date: Tue, 17 Jun 2025 16:31:53 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: Re: [PATCH v4 3/3] arm/mpu: Enable read/write to protection regions
 for arm32
Message-ID: <ooreogquosdrshq6zw552mwqewoaxjhlwnaqqfx4aoips7cat4@qrhqnnknuejt>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
 <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617111251.1711553-4-ayan.kumar.halder@amd.com>

Hi Ayan,

> +/*
> + * Armv8-R supports direct access and indirect access to the MPU regions through
> + * registers:
> + *  - indirect access involves changing the MPU region selector, issuing an isb
> + *    barrier and accessing the selected region through specific registers
> + *  - direct access involves accessing specific registers that point to
> + *    specific MPU regions, without changing the selector, avoiding the use of
> + *    a barrier.
> + * For Arm32 the HPR{B,L}AR<n> (for n=0..31) are used for direct access to the
> + * first 32 MPU regions.
> + * For MPU region numbered 32..254, one need to set the region number in HPRSELR,
> + * followed by configuring HPR{B,L}AR.
> + */
> +static void prepare_selector(uint8_t *sel)

NIT: s/one need/one needs/
NIT: s/MPU region numbered/MPU regions numbered/

Also - it's not clear to me what is meant by "followed by configuring HPR{B,L}AR";
if I understand correctly, once we have set the region number in HPRSELR
and issued an isb we can simply read/write HPR{B,L}AR as indicated in
the bullet point above?

> On Tue, Jun 17, 2025 at 12:12:51PM +0000, Ayan Kumar Halder wrote:
> Define prepare_selector(), read_protection_region() and
> write_protection_region() for arm32. Also, define
> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 254.
> 
> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
> Enable pr_of_addr() for arm32.
> 
> The maximum number of regions supported is 255 (which corresponds to the
> maximum value in HMPUIR).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---

Apart from the above, all LGTM! I've tested compilation for both 64-bit
and 32-bit and all is building successfully.

Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>

Cheers,
Hari

