Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94E7EE3F4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634453.989895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e2t-0004e0-2n; Thu, 16 Nov 2023 15:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634453.989895; Thu, 16 Nov 2023 15:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e2s-0004bU-Vp; Thu, 16 Nov 2023 15:12:42 +0000
Received: by outflank-mailman (input) for mailman id 634453;
 Thu, 16 Nov 2023 15:12:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3e2r-0004b1-Id
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:12:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3e2q-0007yy-3w; Thu, 16 Nov 2023 15:12:40 +0000
Received: from [15.248.3.7] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3e2p-0004jF-U1; Thu, 16 Nov 2023 15:12:40 +0000
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
	bh=+Yh8qfBLoV8LGjC/Zw+8IdjQPZEWnLWYQHF0m9aGQF0=; b=0WMWCvkirxVMtoq8kishIHLYbO
	/lOpS9peYFRsvVX/UOzCasaweNuYDP2ZS1hwbruC2u0Fc9Q1Iv+E0mfA30o+oVhg9vOVfIfcBY1DM
	2UpcDCJN3htxoY4U1OrsSdYnI7uFZEI9YxNFZqSUV2pwbLpDdKh7Qo3qNy6JYz7dBHcY=;
Message-ID: <0999dc30-05ed-4afd-bb10-0128e2ca1d97@xen.org>
Date: Thu, 16 Nov 2023 15:12:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <875y2168ki.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <875y2168ki.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 16/11/2023 15:07, Volodymyr Babchuk wrote:
> With my vPCI patch series in place, hypervisor itself assigns BDFs for
> passed-through devices. Toolstack needs to get this information to know
> which BDFs are free and can be used by virtio-pci.

It sounds a bit odd to let the hypervisor to assign the BDFs. At least 
because there might be case where you want to specific vBDF (for 
instance this is the case with some intel graphic cards). This should be 
the toolstack job to say "I want to assign the pBDF to this vBDF".

Do you have a link to the patch adding the logic in the hypervisor? I 
will comment there as well.

Cheers,

-- 
Julien Grall

