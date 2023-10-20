Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1197D14EC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 19:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619901.965732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttN5-0007Ml-CG; Fri, 20 Oct 2023 17:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619901.965732; Fri, 20 Oct 2023 17:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttN5-0007KK-9l; Fri, 20 Oct 2023 17:33:15 +0000
Received: by outflank-mailman (input) for mailman id 619901;
 Fri, 20 Oct 2023 17:33:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qttN3-0007KE-D7
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 17:33:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttN3-0000qg-4n; Fri, 20 Oct 2023 17:33:13 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttN2-0004rx-Uz; Fri, 20 Oct 2023 17:33:13 +0000
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
	bh=2FdsT/hYGGXxepvNVi5gE1b31G743twemEEKB1qxrhA=; b=n236KeKRkqKFk0b0ybepnXx7jP
	WbSTZrGypQ6RCQSg931JvkiH4h4WIu9grrXYLWFvnMztg5EpwrpQNHxpVcvM9SVCj4zLbeZWjQLYY
	kNaMRCL2wqvZAeR68piYp1AW1KYHRuo9bmKlPlGVhV4JGpvMiaCFpE79ohxpdvVaTt5E=;
Message-ID: <6b446a2d-ac23-4cb4-ad6a-1a816b497023@xen.org>
Date: Fri, 20 Oct 2023 18:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] xen/arm: enable vPCI for dom0
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-5-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009195747.889326-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 09/10/2023 20:57, Stewart Hildebrand wrote:
> Set the pci flags in xen_arch_domainconfig to enable vPCI for dom0.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Julien had a suggestion to make this conditional on pci_passthrough_enabled [1].
> However, in v5 of the PCI ARM SMMU series [2], we propose removing the
> pci_passthrough_enabled flag. If pci_passthrough_enabled is gone, the conditions
> under which vPCI should be enabled for dom0 aren't entirely clear to me (other
> than CONFIG_HAS_VPCI=y).

I think it should be based on whether Xen detected a PCI hostbridge in 
system. I haven't looked which variable/function could be used in Xen 
for this purpose.

Cheers,

-- 
Julien Grall

