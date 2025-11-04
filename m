Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE59C309A7
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 11:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155659.1485101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEeA-0000dp-FH; Tue, 04 Nov 2025 10:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155659.1485101; Tue, 04 Nov 2025 10:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEeA-0000bY-C8; Tue, 04 Nov 2025 10:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1155659;
 Tue, 04 Nov 2025 10:52:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGEe9-0000bR-75
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:52:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEe8-000mIJ-25;
 Tue, 04 Nov 2025 10:52:16 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEe8-00B5Bg-2F;
 Tue, 04 Nov 2025 10:52:16 +0000
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
	bh=kRLxWnq2X4p7eL66NrsFmwXTdVqToBKJkJP3mZbk/4w=; b=jJd1QMzzsf/rMOKbIxVcMFif1w
	inAghFL697UADc40Cnv0Z3EaefI/n4+iTuSSMx1Btmc0vNbVbPDXQTkYDiMXm/d8YOUJcUd/S1i45
	R1elIUuzfRPHUO9iz04pmAzH/8wxed5Lg+e3A8DEEw56uS16OIRd0ZxJCGbLFqaNzRqk=;
Message-ID: <58ab2145-62a9-4bc7-8889-b7a684c77259@xen.org>
Date: Tue, 4 Nov 2025 10:52:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] arm/time: Use static irqaction
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
 <af333b9ef3b79f4b0cfafb1f09da5b7bea04cfaa.1760083684.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <af333b9ef3b79f4b0cfafb1f09da5b7bea04cfaa.1760083684.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 10/10/2025 10:21, Mykyta Poturai wrote:
> When stopping a core deinit_timer_interrupt is called in non-alloc
> context, which causes xfree in release_irq to fail an assert.
> 
> To fix this, switch to a statically allocated irqaction that does not
> need to be freed in release_irq.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Assuming Mykola's comment will be addressed:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


