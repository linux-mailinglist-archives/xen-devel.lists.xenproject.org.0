Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D817A199336
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:13:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDqM-0006tk-Nj; Tue, 31 Mar 2020 10:10:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sM9E=5Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJDqL-0006pE-HF
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:10:01 +0000
X-Inumbo-ID: c85abc70-7337-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c85abc70-7337-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kM1gxrHgt/WUdagzTGxeRu57Vae5mZSFClwkBMPmwxg=; b=Lwt+oy1cWcdJ2bPFHH72vm29tW
 hC1xROO7lb8UVlrO488zAr+Z+aYD5d1Rkh3NlFmssB4p71IjVjWUEyLsX4P5VsJxCuuiW3qZtHooX
 IWUH8Hd9JD6MgiZdVxc1ATKr+0r3kP0hrcb9YRNtsHRaaWt8EKue80l+mGE0vYMj3+Uo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJDqF-0001wZ-JA; Tue, 31 Mar 2020 10:09:55 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJDqF-000422-B6; Tue, 31 Mar 2020 10:09:55 +0000
Subject: Re: [PATCH v13 1/3] xen/mem_sharing: VM forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1585579955.git.tamas.lengyel@intel.com>
 <f40757694decdfdbd5a264be4c277ba824261874.1585579955.git.tamas.lengyel@intel.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bb1e6c7d-52ac-80a6-0247-48f2d2cb33bd@xen.org>
Date: Tue, 31 Mar 2020 11:09:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f40757694decdfdbd5a264be4c277ba824261874.1585579955.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 30/03/2020 16:02, Tamas K Lengyel wrote:
> VM forking is the process of creating a domain with an empty memory space and a
> parent domain specified from which to populate the memory when necessary. For
> the new domain to be functional the VM state is copied over as part of the fork
> operation (HVM params, hap allocation, etc).
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v13: Address issues pointed out by Roger & Jan
>       Introduce & use PAGE_OFFSET to calculate vcpu_info offset
> ---
>   xen/arch/x86/domain.c             |  13 ++
>   xen/arch/x86/hvm/hvm.c            |   4 +-
>   xen/arch/x86/mm/hap/hap.c         |   3 +-
>   xen/arch/x86/mm/mem_sharing.c     | 351 ++++++++++++++++++++++++++++++
>   xen/arch/x86/mm/p2m.c             |   9 +-
>   xen/include/asm-arm/page.h        |   1 +

For the Arm change:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

