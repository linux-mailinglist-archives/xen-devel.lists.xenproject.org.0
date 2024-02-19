Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388D85ABB1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 20:00:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683072.1062409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8sW-0001yl-4h; Mon, 19 Feb 2024 19:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683072.1062409; Mon, 19 Feb 2024 19:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8sW-0001wG-0l; Mon, 19 Feb 2024 19:00:36 +0000
Received: by outflank-mailman (input) for mailman id 683072;
 Mon, 19 Feb 2024 19:00:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rc8sV-0001w7-F0
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 19:00:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8sU-0005Nu-6e; Mon, 19 Feb 2024 19:00:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8sT-0007vg-US; Mon, 19 Feb 2024 19:00:34 +0000
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
	bh=zZlXVdLR7KZEi35q3pmO8jPghbVHhV84TtuMxosMGYg=; b=xSuRSWzReqnqr7OjPPJxqsuvha
	pHCH8vdAhyhb705AzqXCTBnRRwLU99erZQXhPkkZwcsaX7NBWQuEjPtkygmWt6+BJ8LLwsJjKocXp
	iIkxumgHx8cutg/vNXg9AQlVg41B9qPYdlQPMDzF2h63V8piwRz6dtAym4M5wGXLbaLw=;
Message-ID: <7a2ed74d-a773-4dc1-8331-a1ee28b17f4a@xen.org>
Date: Mon, 19 Feb 2024 19:00:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct
 dev
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/02/2024 12:39, Oleksii Kurochko wrote:
> The current patch is a follow-up to the patch titled:
>      xen/asm-generic: introduce generic device.h
> Also, a prerequisite for this patch is, without which a compilation
> error will occur:
>      xen/arm: switch Arm to use asm-generic/device.h
> 
> The 'struct dev_archdata' is exclusively used within 'struct device',
> so it could be merged into 'struct device.'
> 
> After the merger, it is necessary to update the 'dev_archdata()'
> macros and the comments above 'struct arm_smmu_xen_device' in
> drivers/passthrough/arm/smmu.c.
> Additionally, it is required to update instances of
> "dev->archdata->iommu" to "dev->iommu".
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>    This patch can be merged with patches 4 and 5 of this patch series.

I am a bit puzzled with this comment. If this is the case, then why was 
it done in a separate patch?

I know I suggested to create the separate patch but this was only in the 
case you decided to handle it after this series is merged. So this 
should have been merged when sending. Maybe I should have been clearer.

Anyway, regardless that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

