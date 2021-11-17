Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF0454F57
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 22:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226996.392463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSSI-00058I-67; Wed, 17 Nov 2021 21:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226996.392463; Wed, 17 Nov 2021 21:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSSI-00056W-39; Wed, 17 Nov 2021 21:26:58 +0000
Received: by outflank-mailman (input) for mailman id 226996;
 Wed, 17 Nov 2021 21:26:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnSSG-00056Q-3e
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 21:26:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSSE-00017s-Ow; Wed, 17 Nov 2021 21:26:54 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSSE-0008FS-J0; Wed, 17 Nov 2021 21:26:54 +0000
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
	bh=gSMmsE0cVcj2jqOMEN+Z+yv4TFLSQtEc4bWoWX4Jifw=; b=Tdmi6yF+pObdDrc6SQO1Q/cmH7
	7ID/FneEMQIeN5quQ1MzUH9OaKZtpuwVTb7J+QYuV4gku9sdKyVsRmFHKRjYPr3KFoWsJIkWydBXe
	BMho/ku78CSdol/yRIW5f1+g3+7FOOw1cLvBuWcWfjh+VlzZbUvtBNLQuaoOZDiIJ07o=;
Message-ID: <a0f371ce-df7f-fdfb-f4f2-f963d2468480@xen.org>
Date: Wed, 17 Nov 2021 21:26:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 6/7] xen/arm: process pending vPCI map/unmap operations
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-7-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211105063326.939843-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
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

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

