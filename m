Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA01AC9C9C5
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 19:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176290.1500789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQUzh-0003gM-Is; Tue, 02 Dec 2025 18:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176290.1500789; Tue, 02 Dec 2025 18:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQUzh-0003eQ-FX; Tue, 02 Dec 2025 18:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1176290;
 Tue, 02 Dec 2025 18:20:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vQUzf-0003eK-9x
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 18:20:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQUze-003GaQ-2I;
 Tue, 02 Dec 2025 18:20:54 +0000
Received: from [2a02:8012:3a1:0:2026:f832:c2a8:fb4c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vQUzd-005umB-2q;
 Tue, 02 Dec 2025 18:20:54 +0000
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
	bh=o70NayaIlwLvt3TegZsweJjmkQ5zEv5n425MWdEhIz4=; b=I9iO9HkkjsRt99hoAjjJlkdySr
	TwIHx4yhPic7N+GXPqLdaD5Zp8yOGdm7SbORYbQQPYEJHnzwqW9PU23m3GZ2CM/TRtR77sAzt1a7L
	ByVy/LH7OE5984xsWEDWnM7t0JoeI/5jX38fVwYFjMn9zSD/iGVpAcn/puiRnlLC5tQE=;
Message-ID: <64aafb9b-c1b3-44a7-bcaa-c007dcfcf24f@xen.org>
Date: Tue, 2 Dec 2025 18:20:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vgic-v3: Ignore writes to ISACTIVER{nE}N when eSPI is
 not used
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251128114913.36244-1-michal.orzel@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20251128114913.36244-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/11/2025 11:49, Michal Orzel wrote:
> Prior to introducing GICv3 eSPI support, writes to these registers were
> ignored. Now the behavior is changed and we inject fault to the guests.
> According to documentation, eSPI registers are treated as RES0, when
> GICD_TYPER.ESPI is 0 (this would be the case when CONFIG_GICV3_ESPI=n or
> nr_espis is 0). Restore the previous behavior by checking whether eSPI
> is in use or not.
> 
> Fixes: 93eecb2c4b88 ("xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


