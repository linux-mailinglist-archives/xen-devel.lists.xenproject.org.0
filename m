Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FDFA7254A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 23:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928275.1331003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZPN-00063i-PT; Wed, 26 Mar 2025 22:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928275.1331003; Wed, 26 Mar 2025 22:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZPN-000620-Ls; Wed, 26 Mar 2025 22:39:37 +0000
Received: by outflank-mailman (input) for mailman id 928275;
 Wed, 26 Mar 2025 22:39:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txZPM-00061u-3t
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 22:39:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZPL-009zI3-2q;
 Wed, 26 Mar 2025 22:39:35 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZPL-000bb2-1X;
 Wed, 26 Mar 2025 22:39:35 +0000
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
	bh=GiHcjSwJhOtVDq0CbptCd7RnLfeSC1dtn2MNTZP5GeQ=; b=RxKKXbbru1EphRGNYtOhKFrMnM
	nIn1CmCVIR8b92qT860miJPj5wBfvoLxccek+BhzzNPjjZLPVuU0EUXygYS3VsmZ4e4ai0dgNMyjQ
	mwqvsX7G9mAvrw9JPHNDyUn4auH6I21faT9TSsOhZOVNBiR6frMZv5FbJs9trA/zhPoQ=;
Message-ID: <1f72a6e2-c573-43b1-b1e9-b7bf16e07bd2@xen.org>
Date: Wed, 26 Mar 2025 22:39:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
 <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
 <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
 <b3a91dc6-0133-4b9a-bc15-7f1e1272f940@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b3a91dc6-0133-4b9a-bc15-7f1e1272f940@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 26/03/2025 11:45, Oleksandr Tyshchenko wrote:
> Also it is not entirely clear what we should do with acpi_disabled=true
> during declaration (what current patch does), even if we decided to go
> with splitting should we retain that change?

It should not be necessary. But I will leave up to you whether you want 
to upstream this patch. Although, I will need a commit rewording.

Cheers,

-- 
Julien Grall


