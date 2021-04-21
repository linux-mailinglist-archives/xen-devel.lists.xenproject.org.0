Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE1366ED7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114829.218912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEWD-0002Fk-Q8; Wed, 21 Apr 2021 15:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114829.218912; Wed, 21 Apr 2021 15:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEWD-0002FL-Mi; Wed, 21 Apr 2021 15:11:57 +0000
Received: by outflank-mailman (input) for mailman id 114829;
 Wed, 21 Apr 2021 15:11:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZEWB-0002FG-W7
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:11:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZEWA-00026x-Q1; Wed, 21 Apr 2021 15:11:54 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZEWA-0000ag-Jx; Wed, 21 Apr 2021 15:11:54 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=B57esD0uaflGy6Sk6zufUTvvD/NMq5fDGYBPRHkkNJ0=; b=kTUMmkBkFgaWJWicDVXfA9Lt61
	JtMYmPelbiZIEGeVWuOwiWXSEI3dycs6zzxt5MJ5sPKWpX1C3dwhuCWD6s+3+HbHoNiDEUiLX8Iua
	xCZKUdjQFeqcl9YKc0MBUYpfKPdj54k92VLQwiJBLAVbb5UI9cZ/nb0aHuh1RqBj+o/E=;
Subject: Re: [PATCH 6/9] arm/page: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-7-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1d74eeaa-5809-093a-d05a-159498a01e03@xen.org>
Date: Wed, 21 Apr 2021 16:11:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420070853.8918-7-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/04/2021 08:08, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 sysregs have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify accesses to CTR_EL0 to use READ/WRITE_SYSREG.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

