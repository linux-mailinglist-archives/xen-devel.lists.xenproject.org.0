Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED7AB64DF
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983983.1370153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6uV-0008VB-Hb; Wed, 14 May 2025 07:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983983.1370153; Wed, 14 May 2025 07:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6uV-0008Sp-Er; Wed, 14 May 2025 07:52:15 +0000
Received: by outflank-mailman (input) for mailman id 983983;
 Wed, 14 May 2025 07:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF6uU-0008Sj-O7
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:52:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6uU-008Gmn-1r;
 Wed, 14 May 2025 07:52:14 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6uT-00Ee5q-2i;
 Wed, 14 May 2025 07:52:13 +0000
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
	bh=Sductja8UUY6rnUsKg/TzWmvUR/B80JRIQkzTurD8Vg=; b=uK78uNoHtr+4Hg7oNWo6mXxCld
	CEfzDzo6L2hnLRUMyxPZ3Aravw8eHnTrCM055r++MN0mKSMZT1F8N6bJi/SdoiUCq3pVVnLGlXmkq
	yM8831dmJVkTqeIzr5BMuRbXZsU9rVCEsdNBz32clMxYZpsIaPhZOFw16ovUHxcyA7OI=;
Message-ID: <8d603bce-09c3-4c9f-a31a-0cf3bdc20b39@xen.org>
Date: Wed, 14 May 2025 08:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] docs/arm: Document Xen booting protocol on Armv8-R
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250513084532.4059388-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 13/05/2025 09:45, Luca Fancellu wrote:
> Document the requirement needed to boot Xen on Armv8-R platforms.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
 > ---> v5 changes:
>   - restructured and removed some EL3 reference that might not
>     be there on Armv8-R aarch64
>   - add R-by Ayan and Michal
> v4 changes:
>   - New patch
> ---
>   docs/misc/arm/booting.txt | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..ca05274392be 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -56,12 +56,17 @@ image header to determine the load address, entry point, etc.
>   Firmware/bootloader requirements
>   --------------------------------
>   
> -Xen relies on some settings the firmware has to configure in EL3 before starting Xen.
> +Xen relies on some settings the firmware has to configure before starting Xen.
>   
> -* Xen must be entered in NS EL2 mode
> +* Xen must be entered in:
> +  * Non-Secure EL2 mode for Armv8-A Arm64 and Arm32, Armv8-R Arm32.
> +  * Secure EL2 mode for Armv8-R Arm64.
>   
> -* The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
> +* When EL3 is supported, the bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must
> +  be set to 1.
>   
> +* Xen must be entered with MMU/MPU off and data cache disabled (SCTLR_EL2.M bit
> +  and SCTLR_EL2.C set to 0).

The document read much better. Thanks for the update:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


