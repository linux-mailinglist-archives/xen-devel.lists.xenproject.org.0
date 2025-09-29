Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175EFBAA042
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 18:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133031.1471219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Gm4-0008W4-M9; Mon, 29 Sep 2025 16:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133031.1471219; Mon, 29 Sep 2025 16:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Gm4-0008Tj-Ip; Mon, 29 Sep 2025 16:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1133031;
 Mon, 29 Sep 2025 16:30:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v3Gm3-0008Td-LE
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 16:30:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v3Gm3-00Gd6D-0Z;
 Mon, 29 Sep 2025 16:30:51 +0000
Received: from [2a02:8012:3a1:0:4508:987f:45a1:fef]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v3Gm3-004jZf-0f;
 Mon, 29 Sep 2025 16:30:51 +0000
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
	bh=xgfmXV6sYhCbiYwxyUWoWuJpp/DaIQ1Tr62WWco6GOc=; b=BRkvWbsYnefbSo/vjXcNfxhefM
	y9plISOgimOsbHt17BVJ6uNeA1jCWU6U5Rv3MeclggDTya2y7tpVh4uq+SfBw2pEVwvNVIvyEdtK4
	Ifdz75/MX3o3dNsfveBv1VioMJt/8IDq9mxZL1PzJakSaMx300EwV/0kxrl6Kzlw1QFM=;
Message-ID: <9a8f99bb-fbe4-4df5-836f-c00a919aeec0@xen.org>
Date: Mon, 29 Sep 2025 17:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20ec9d9a8533417489a95543c1b72f7f55865c9c.1757856381.git.oleksii_moisieiev@epam.com>
 <6476dc12-1f9f-4b37-b569-e994bde6bcdb@xen.org>
 <4b1cab53-e2dc-4cd4-86b5-1d1be974d089@epam.com>
 <88a73261-4c24-465f-93df-6f9770046982@xen.org>
 <557392fd-f676-4aa0-9107-ee48243c336e@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <557392fd-f676-4aa0-9107-ee48243c336e@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 28/09/2025 14:52, Oleksii Moisieiev wrote:
> Thanks. I'm preparing patch-series with multi-agent support and will see
> where it could be moved.
> Should I send a new patch with
> "Fixes: <commit-id> ("<patch-subject>")"
> syntax or it can be fixed inplace during commit?

No need for a new version. I have updated the commit message and committed.

Cheers,

-- 
Julien Grall


