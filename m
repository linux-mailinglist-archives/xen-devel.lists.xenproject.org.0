Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2614677B4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237590.412075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt85i-0000oV-Vg; Fri, 03 Dec 2021 12:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237590.412075; Fri, 03 Dec 2021 12:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt85i-0000lU-Sc; Fri, 03 Dec 2021 12:55:06 +0000
Received: by outflank-mailman (input) for mailman id 237590;
 Fri, 03 Dec 2021 12:55:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mt85h-0000kG-DR
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:55:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt85c-0004Y7-D4; Fri, 03 Dec 2021 12:55:00 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.21.218]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt85c-0000zp-6d; Fri, 03 Dec 2021 12:55:00 +0000
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
	bh=Fvf2QVb6ygCzQF5irm/wFeKDgyIGyIyJG/7PObKzZrk=; b=BR18M0yOnCsffdbp1rPtahseV3
	oCMzZHTNOdOHqFisIDomkm6ZYwz+/6wHFNQ4WwjnPGi1UtUNm+ilxLCYuGm4S+Zalazx7Wr3k0C8K
	C8UVanpkgtdyP8WPgyOxaYY0nvhNXzGRPphu7i/UtOfbGZaQdjHp5QYwuGUkNkpd+tiU=;
Message-ID: <5d543a80-ab1c-8625-c97d-e1d6f1fb3f19@xen.org>
Date: Fri, 3 Dec 2021 12:54:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap operations
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-7-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211124075942.2645445-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/11/2021 07:59, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> 
> Currently this deferred processing is happening in common IOREQ code
> which doesn't seem to be the right place for x86 and is even more
> doubtful because IOREQ may not be enabled for Arm at all.
> So, for Arm the pending vPCI work may have no chance to be executed
> if the processing is left as is in the common IOREQ code only.
> For that reason make vPCI processing happen in arch specific code.
> 
> Please be aware that there are a few outstanding TODOs affecting this
> code path, see xen/drivers/vpci/header.c:map_range and
> xen/drivers/vpci/header.c:vpci_process_pending.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> [x86 part]
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

This patch technically needs an acked-by from Paul for the IOREQ part. Paul?

Cheers,

-- 
Julien Grall

