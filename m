Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EC48190C1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657120.1025844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfoC-0003WD-1m; Tue, 19 Dec 2023 19:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657120.1025844; Tue, 19 Dec 2023 19:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfoB-0003TL-VJ; Tue, 19 Dec 2023 19:31:15 +0000
Received: by outflank-mailman (input) for mailman id 657120;
 Tue, 19 Dec 2023 19:31:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFfoA-0003TF-M9
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:31:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFfoA-00014Q-3J; Tue, 19 Dec 2023 19:31:14 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFfo9-0004Sx-U4; Tue, 19 Dec 2023 19:31:14 +0000
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
	bh=AiKEAlVH4OP0omHtbllp9NWwsX+He4XFKQ0xZl+Vfo0=; b=4lqyoDs4Te0HsZ9X+LTTjv3ETo
	PEF6t5Xi90T0UHlTdm4leEnQBJQEFOHZa8O0kBsLOnSi6SwnZKvVVAaqNeUs+U2vlmDU5TariuQi2
	znB1DLT8d+BuPNrY/bGiJnEYkamPoIoM8iY2nY5wIVFkMnGiuFVugItwZFfEzwPW9nnM=;
Message-ID: <cd8936ed-e5f1-4333-b776-a99af648c390@xen.org>
Date: Tue, 19 Dec 2023 19:31:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] xen/arm: Fix mapping for PCI bridge mmio region
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-8-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-8-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Current code skip the mapping for PCI bridge MMIO region to dom0 when
> pci_passthrough_enabled flag is set. Mapping should be skip when
> has_vpci(d) is enabled for the domain, as we need to skip the mapping
> only when VPCI handler are registered for ECAM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

