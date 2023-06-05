Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF8722FC5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543886.849237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FpW-00066c-H6; Mon, 05 Jun 2023 19:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543886.849237; Mon, 05 Jun 2023 19:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6FpW-00065G-EO; Mon, 05 Jun 2023 19:25:26 +0000
Received: by outflank-mailman (input) for mailman id 543886;
 Mon, 05 Jun 2023 19:25:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6FpV-00065A-Me
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:25:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FpV-00041L-DJ; Mon, 05 Jun 2023 19:25:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6FpV-0001Di-8d; Mon, 05 Jun 2023 19:25:25 +0000
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
	bh=9NroE4j9cL2ErGWO95oWCCU47E5xsrm19qrYddMsEE8=; b=UPve7CzbaKyw/zrnoOip+IfVuw
	9lBiyuiGQPPzKT0A+bG/WnD/RaIGedJt1nz2z7kSZsqvv4dZtv4u4U0UohSAXuCsR/BlecJ9Vrfei
	RyMA0WVU5IHExNpvNMtm2ufN7G+5xr1W1ooHWQUCbH6aljz+vJC3b4fvbzEr/cMnFxfQ=;
Message-ID: <c67a6e1b-71b7-166b-a270-5a3b3973fad7@xen.org>
Date: Mon, 5 Jun 2023 20:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v7 10/19] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-11-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602004824.20731-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

The commit message is a bit light. What sort of concurrent access add 
are you talking about? Is it of the same node? Different node?

Also, is it a existing issue or something that will become one with a 
follow-up patch in your series?

Cheers,

-- 
Julien Grall

