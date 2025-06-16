Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B8ADAA9F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016871.1393835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR59j-0004aq-69; Mon, 16 Jun 2025 08:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016871.1393835; Mon, 16 Jun 2025 08:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR59j-0004Yf-3c; Mon, 16 Jun 2025 08:25:27 +0000
Received: by outflank-mailman (input) for mailman id 1016871;
 Mon, 16 Jun 2025 08:25:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uR59i-0004YZ-Fr
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:25:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR59i-004SjT-09;
 Mon, 16 Jun 2025 08:25:26 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR59h-0077dm-2k;
 Mon, 16 Jun 2025 08:25:25 +0000
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
	bh=EhwWTi6TgbQ/ygG0CtFy4MFehIWr2Ic3nEjDNEUHPyQ=; b=XaqgMEnSfGIs3PphmmlvnMySq4
	epxTmt4l3PisRj+jYkK4DOKSW0RCbni60eTQI7PwLdepJg0ujJDM6vymv/PPSz88zNb7MaVI8eXO5
	P2LHQ14j9nTUehhX3htPzLDpseuzqmv3IP/TT9vgupRUpA/wcrsK07AoyfY87/P/+CTg=;
Message-ID: <d6a39204-56d2-48d0-b199-7b5731611d6a@xen.org>
Date: Mon, 16 Jun 2025 09:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250611143544.3453532-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 11/06/2025 15:35, Ayan Kumar Halder wrote:
> Modify Arm32 assembly boot code to reset any unused MPU region, initialise
> 'max_mpu_regions' with the number of supported MPU regions and set/clear the
> bitmap 'xen_mpumap_mask' used to track the enabled regions.
> 
> Introduce cache.S to hold arm32 cache related functions.
> 
> Use the macro definition for "dcache_line_size" from linux.
> 
> Change the order of registers in prepare_xen_region() as 'strd' instruction
> is used to store {prbar, prlar} in arm32. Thus, 'prbar' has to be a even
> numbered register and 'prlar' is the consecutively ordered register.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


