Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F04B3B436
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100705.1454039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtVv-00021H-Cg; Fri, 29 Aug 2025 07:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100705.1454039; Fri, 29 Aug 2025 07:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtVv-0001yx-9E; Fri, 29 Aug 2025 07:27:11 +0000
Received: by outflank-mailman (input) for mailman id 1100705;
 Fri, 29 Aug 2025 07:27:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urtVu-0001yr-0T
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:27:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urtVt-00CVG3-15;
 Fri, 29 Aug 2025 07:27:09 +0000
Received: from [2a02:8012:3a1:0:a40e:c7d9:d4:3bff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urtVt-007Cf8-1H;
 Fri, 29 Aug 2025 07:27:09 +0000
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
	bh=FIp47SrjTfal/i9/b+vjitlSqVMTU9g8i54S+zo1Nnk=; b=cnVdnFdUd3ZOqao6dihmKfCEJo
	u+nZdvB4tE2HqCwkjKwhsjOS8t/wx6iNCt18AOZ/h47mVHiM6jE+MzkAn8RiaD7G85nhyLhxd5acL
	Vf/ZxEV5vpoalcxnGMMN28CgZ7/qSUaz6cLwyMRUn/5sntVg+xcueCFH5u92mngznKN8=;
Message-ID: <a3e6c685-01fe-4ac5-b465-1356659b3d78@xen.org>
Date: Fri, 29 Aug 2025 08:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm/mpu: Implement setup_mm for MPU systems
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756379422.git.hari.limaye@arm.com>
 <2d41ab5c2bd45f788e96a93659595d66c258c8df.1756379422.git.hari.limaye@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2d41ab5c2bd45f788e96a93659595d66c258c8df.1756379422.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/08/2025 12:12, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement `setup_mm` for MPU systems. This variant doesn't need to set
> up the direct map.

If this is the only difference, then why do we duplicate the rest of the 
code? Why can't we instead setup the directmap helper or make it optional?

In fact, in the future we will want to initially have the directmap 
optional on Arm with MMU, but ultimately will be removed.

Cheers,

-- 
Julien Grall


