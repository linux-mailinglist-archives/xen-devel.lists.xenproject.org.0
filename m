Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA151C41F
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 17:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322267.543521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdcJ-00022g-UC; Thu, 05 May 2022 15:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322267.543521; Thu, 05 May 2022 15:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmdcJ-000205-RQ; Thu, 05 May 2022 15:42:11 +0000
Received: by outflank-mailman (input) for mailman id 322267;
 Thu, 05 May 2022 15:42:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmdcJ-0001zz-1W
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 15:42:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmdcI-0000rJ-OY; Thu, 05 May 2022 15:42:10 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.17])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmdcI-0006QB-Hm; Thu, 05 May 2022 15:42:10 +0000
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
	bh=Yg+jQsbbtK3mqpAwq5ielWTFuF24rFXyVtWodJ/+lsQ=; b=5cmqFXjCYad1JyJT9We5iKJWUb
	WCtzuPq4iuWIf0AupmBZtG+Hvgs+AuAW5YpANe314SqGERvAfoIl4Lh8rRU95R4w3hjK6AtpRBcrn
	tdIyyJG8C0iPIynbNDc1sUsjalJLXC7b5B1iYRHOPoGrprwEFYW+y7xMdk+oAiRE3P8M=;
Message-ID: <19987e35-38c2-9ba3-43b0-ee8f13a07b06@xen.org>
Date: Thu, 5 May 2022 16:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2] arm/its: enable LPIs before mapping the collection
 table
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b19768d1db24123c76e50a410965582502937bb4.1651684160.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b19768d1db24123c76e50a410965582502937bb4.1651684160.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 04/05/2022 18:15, Rahul Singh wrote:
> When Xen boots on the platform that implements the GIC 600, ITS
> MAPC_LPI_OFF uncorrectable command error issue is observed.
> 
> As per the GIC-600 TRM (Revision: r1p6) MAPC_LPI_OFF command error can
> be reported if the MAPC command has tried to map a collection to a core
> that does not have LPIs enabled. The definition of GICR.EnableLPIs
> also suggests enabling the LPIs before sending any ITS command that
> involves LPIs
> 
> 0b0 LPI support is disabled. Any doorbell interrupt generated as a
>      result of a write to a virtual LPI register must be discarded,
>      and any ITS translation requests or commands involving LPIs in
>      this Redistributor are ignored.
> 
> 0b1 LPI support is enabled.
> 
> To fix the MAPC command error issue, enable the LPIs using
> GICR_CTLR.EnableLPIs before mapping the collection table.
> 
> gicv3_enable_lpis() is using writel_relaxed(), write to the GICR_CTLR
> register may not be visible before gicv3_its_setup_collection() send the
> MAPC command. Use wmb() after writel_relaxed() to make sure register
> write to enable LPIs is visible.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

