Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0648CEC9A
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 01:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730018.1135393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAe3z-00041P-SG; Fri, 24 May 2024 23:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730018.1135393; Fri, 24 May 2024 23:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAe3z-0003z6-Pb; Fri, 24 May 2024 23:11:03 +0000
Received: by outflank-mailman (input) for mailman id 730018;
 Fri, 24 May 2024 23:11:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAe3y-0003xT-4a
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 23:11:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAe3x-00045E-Oe; Fri, 24 May 2024 23:11:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAe3x-0004Dj-Js; Fri, 24 May 2024 23:11:01 +0000
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
	bh=YEE0nsQxqil5WQHvWkqkH3PfCuFWkuWW0g1Tlj6XwYo=; b=XLaO3LJj/qMaxf314cxkO2gwuM
	LmqGx7xxc80Jr8fFw0w7esmclWlfDaWvQGSkrDJV6TO6dfHLQxnTf5hTxG+hGPju8LkqwhLPf4X5t
	1QBPerFIk9ln1K3SmX2+D5ecuAnXpheZrDTU+0S8GWzgTthKZuuoBHxPRFDSNEZ+0Vtc=;
Message-ID: <30438a6b-a4d9-408e-b7cb-2d64b63ba5d4@xen.org>
Date: Sat, 25 May 2024 00:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] xen/arm: Add XEN_DOMCTL_dt_overlay and device
 attachment to domains
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: anthony@xenproject.org, sstabellini@kernel.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Henry Wang <xin.wang2@amd.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
 <20240524221647.2860711-5-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524221647.2860711-5-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/05/2024 23:16, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> In order to support the dynamic dtbo device assignment to a running
> VM, the add/remove of the DT overlay and the attach/detach of the
> device from the DT overlay should happen separately. Therefore,
> repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
> overlay to Xen device tree, instead of assigning the device to the
> hardware domain at the same time. It is OK to change the sysctl behavior
> as this feature is experimental so changing sysctl behavior and breaking
> compatibility is OK.
> 
> Add the XEN_DOMCTL_dt_overlay with operations
> XEN_DOMCTL_DT_OVERLAY_ATTACH to do the device assignment to the domain.
> 
> The hypervisor firstly checks the DT overlay passed from the toolstack
> is valid. Then the device nodes are retrieved from the overlay tracker
> based on the DT overlay. The attach of the device is implemented by
> mapping the IRQ and IOMMU resources. All devices in the overlay are
> assigned to a single domain.
> 
> Also take the opportunity to make one coding style fix in sysctl.h.
> Introduce DT_OVERLAY_MAX_SIZE and use it to avoid repetitions of
> KB(500).
> 
> xen,reg is to be used to handle non-1:1 mappings but it is currently
> unsupported. For now return errors for not-1:1 mapped domains.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

