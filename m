Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA3475FBC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 18:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247513.426807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYOI-00013x-7Q; Wed, 15 Dec 2021 17:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247513.426807; Wed, 15 Dec 2021 17:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYOI-00011n-3x; Wed, 15 Dec 2021 17:48:34 +0000
Received: by outflank-mailman (input) for mailman id 247513;
 Wed, 15 Dec 2021 17:48:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxYOG-00011N-N6
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 17:48:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxYOG-0000oq-CO; Wed, 15 Dec 2021 17:48:32 +0000
Received: from [54.239.6.190] (helo=[10.85.97.145])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxYOG-0000yb-6H; Wed, 15 Dec 2021 17:48:32 +0000
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
	bh=EIXY0pH3FFvVoepyu1PKulGiK0ad+7HJPnljWC/AowE=; b=j7andU+Iq29SJZqxaN5390cmaR
	BHJx0e9DCKWMImxriCMzem4/oZUFk0O3iNYbobcOfX6bc46GTDizcUNVr/awoeLrL8IJPTvsI+Fn8
	QbtdipOxtk/fWyk7C5Y94dBQDEdgHIevVIzhDTAW0jOOB+JrFNIA1f65v16ScElqdScU=;
Message-ID: <17e4ce2b-be61-8fdb-d742-ea6ddf8fa996@xen.org>
Date: Wed, 15 Dec 2021 17:48:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v8 0/4] PCI devices passthrough on Arm, part 2
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211209072918.460902-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2021 07:29, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Hi, all!

Hi Oleksandr,

> This is an assorted series of patches which aim is to make some further
> basis for PCI passthrough on Arm support. The series continues the work
> published earlier by Arm [1] and adds new helpers and clears the way for
> vPCI changes which will follow.
> 
> RFC is at [2], [3]. Design presentation can be found at [4].Hi
> 
> I have removed patch
> [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled devices
> as it seems that this needs more time for decision on how to achive
> that.
> 
> I have also added a new patch
> [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host bridge
> with a tiny latent bug fix.
> 
> This series contains all the patches which are left un-committed yet.
> 
> Thank you,
> Oleksandr
> 
> [1] https://patchwork.kernel.org/project/xen-devel/list/?series=558681
> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
> [3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
> [4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf
> 
> Oleksandr Andrushchenko (4):
>    xen/arm: add pci-domain for disabled devices
>    xen/arm: setup MMIO range trap handlers for hardware domain
>    xen/arm: account IO handler for emulated PCI host bridge
>    xen/arm: do not map PCI ECAM and MMIO space to Domain-0's p2m
> 
>   xen/arch/arm/domain.c              |   2 +
>   xen/arch/arm/domain_build.c        | 132 ++++++++++++++++++++---------
>   xen/arch/arm/pci/ecam.c            |  14 +++
>   xen/arch/arm/pci/pci-host-common.c |  77 ++++++++++++++++-
>   xen/arch/arm/pci/pci-host-zynqmp.c |   1 +
>   xen/arch/arm/vpci.c                |  85 ++++++++++++++++---
>   xen/arch/arm/vpci.h                |   6 ++
>   xen/include/asm-arm/pci.h          |  22 +++++
>   xen/include/asm-arm/setup.h        |  13 +++

As a FYI, Jan pushed today a commit that moved the headers from 
xen/include/asm-arm to xen/arch/arm/include/asm/.

I have handled the clash for this series while committing.

Thank you for the contribution.

Cheers,

-- 
Julien Grall

