Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2291722F2E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543862.849195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FWN-0001uN-1b; Mon, 05 Jun 2023 19:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543862.849195; Mon, 05 Jun 2023 19:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FWM-0001rr-V7; Mon, 05 Jun 2023 19:05:38 +0000
Received: by outflank-mailman (input) for mailman id 543862;
 Mon, 05 Jun 2023 19:05:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6FWL-0001rj-L0
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:05:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FWK-0003UC-UM; Mon, 05 Jun 2023 19:05:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FWK-0000TJ-OH; Mon, 05 Jun 2023 19:05:36 +0000
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
	bh=kwFpDDddew8z+1ukC9DIRvWwCUE8T1GDgKlI3rXRmn8=; b=5PGuH7rZMF6D5sx+6SQxg/rrni
	+sxUaQ0TPxF+9/1RM+LTtqyaROfI7BE/f1nYMBLuOwpPGwbluyn2vPnKklNT98B3MUiqy1E/oe8tT
	oVGptRyAjU1CPhIvtoy51wRhUcbffYRlUQ/7WA5VpG4vPCdcPFDdbGNBKgd/dygY6nFY=;
Message-ID: <7e8d566b-6d87-8453-4b3a-2bfa4a6b91e6@xen.org>
Date: Mon, 5 Jun 2023 20:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v7 07/19] libfdt: overlay: change
 overlay_get_target()
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-8-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602004824.20731-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
> function type.
> 
> This is done to get the target path for the overlay nodes which is very useful
> in many cases. For example, Xen hypervisor needs it when applying overlays
> because Xen needs to do further processing of the overlay nodes, e.g. mapping of
> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git 45f3d1a095dd
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Juline Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

