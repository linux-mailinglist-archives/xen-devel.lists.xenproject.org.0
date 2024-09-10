Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95997455E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 00:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796082.1205594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8zs-0005Mj-Og; Tue, 10 Sep 2024 22:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796082.1205594; Tue, 10 Sep 2024 22:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8zs-0005KR-Kk; Tue, 10 Sep 2024 22:06:04 +0000
Received: by outflank-mailman (input) for mailman id 796082;
 Tue, 10 Sep 2024 22:06:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1so8zr-0005KL-LQ
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 22:06:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8zr-00022n-9p; Tue, 10 Sep 2024 22:06:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8zr-0006lP-2F; Tue, 10 Sep 2024 22:06:03 +0000
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
	bh=OTZ6HinyxiVgsvqz8l3YXarS419zsCLluo2Myeq9Neg=; b=abbfWKBhIVHw0YjmPsBLrMiUDz
	AOJ8dD6vMEBnt5LUV+MMuhJ/E1jbjnYVqZ9s+fKo6MKH4Oqdc2ucWKSyZBtacXEBP6hSihWEX3dhf
	rbUVF7XzmuOIGrp1ZdBaQzkp87kP34d83MMGzhwyk7HufS5jxpM8VJzrUM03FHUnpvLw=;
Message-ID: <f08942b8-3a01-4176-8fad-525ad3261083@xen.org>
Date: Tue, 10 Sep 2024 23:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
> which need SCMI over SMC calls forwarded to the firmware
> running at EL3 (TF-A). Linux relies on the SCMI Platform
> for system services such as clocking, reset, etc.

Is it SMCI as in the Arm spec? If so, this should not be platform specific.

Furthermore, I was under the impression that we can't blindly forward 
everything from a domain to the firmware. While it might be okayish for 
dom0, you also seem to give access to all the domains on the system is 
it intended?

Anyway, there is a series on the ML to add a mediator for SCMI in Xen 
(see [1]). I think it would be preferable to focus on getting it merged 
as it would benefit everyone and increase the security posture (we could 
restrict access).

Cheers,

[1] 
https://lore.kernel.org/xen-devel/e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com

Cheers,

-- 
Julien Grall


