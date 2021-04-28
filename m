Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E484936D7A3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 14:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119310.225742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbja1-0003Dh-0y; Wed, 28 Apr 2021 12:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119310.225742; Wed, 28 Apr 2021 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbja0-0003DI-UH; Wed, 28 Apr 2021 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 119310;
 Wed, 28 Apr 2021 12:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbjZy-0003DD-V0
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 12:46:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbjZy-0005O2-F3; Wed, 28 Apr 2021 12:46:10 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbjZy-0000f1-7x; Wed, 28 Apr 2021 12:46:10 +0000
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
	bh=uJsCxf4Vu0qb3CoGNz7sE9H1wWrv8iQ7ATmxRvsCo4s=; b=N8iVWdBCyYixJQLqGkrpncOGMn
	IlqO/UOg+DRe/s405KNuvmTN7xM8FE5DoceDzOyD/NiuUFsk4mOfB1A+AVaue3dwGe1iOwu2WpC2+
	FKW+NkB06q5Ok4rqZ3kfcDbNjJS9ZnYIgHi9hpxJGRMysjTxh9wQNb3Yl+BHhC3twmYQ=;
Subject: Re: Discussion of Xenheap problems on AArch64
To: Henry Wang <Henry.Wang@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
Date: Wed, 28 Apr 2021 13:46:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 28/04/2021 10:28, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> 
> I've done some test about the patch series in
> https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/pt/rfc-v2
> 

Thanks you for the testing. Some questions below.

> Log:
> (XEN)   VTCR_EL2: 80000000
> (XEN)  VTTBR_EL2: 0000000000000000
> (XEN)
> (XEN)  SCTLR_EL2: 30cd183d
> (XEN)    HCR_EL2: 0000000000000038
> (XEN)  TTBR0_EL2: 000000008413d000
> (XEN)
> (XEN)    ESR_EL2: 96000041
> (XEN)  HPFAR_EL2: 0000000000000000
> (XEN)    FAR_EL2: 00008010c3fff000
> (XEN) Xen call trace:
> (XEN)    [<000000000025c7a0>] clear_page+0x10/0x2c (PC)
> (XEN)    [<00000000002caa30>] setup_frametable_mappings+0x1ac/0x2e0 (LR)
> (XEN)    [<00000000002cbf34>] start_xen+0x348/0xbc4
> (XEN)    [<00000000002001c0>] arm64/head.o#primary_switched+0x10/0x30
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ****************************************
> 
> 2. Apply patch and use two memory banks which have a big gap:
> Memory node:
> memory@80000000 {
>                  device_type = "memory";
>                  reg = <0x00 0x80000000 0x00 0x7f000000 0x8800 0x00000000 0x00 0x80000000>;
> };
> 
> Log:
> (XEN)   VTCR_EL2: 80000000
> (XEN)  VTTBR_EL2: 0000000000000000
> (XEN)
> (XEN)  SCTLR_EL2: 30cd183d
> (XEN)    HCR_EL2: 0000000000000038
> (XEN)  TTBR0_EL2: 000000008413c000
> (XEN)
> (XEN)    ESR_EL2: 96000043
> (XEN)  HPFAR_EL2: 0000000000000000
> (XEN)    FAR_EL2: 0000000000443000
> (XEN)
> (XEN) Xen call trace:
> (XEN)    [<000000000025c7a0>] clear_page+0x10/0x2c (PC)
> (XEN)    [<000000000026cf9c>] mm.c#xen_pt_update+0x1b8/0x7b0 (LR)
> (XEN)    [<00000000002ca298>] setup_xenheap_mappings+0xb4/0x134
> (XEN)    [<00000000002cc1b0>] start_xen+0xb6c/0xbcc
> (XEN)    [<00000000002001c0>] arm64/head.o#primary_switched+0x10/0x30
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ****************************************

I am a bit confused with the output with and without my patches. Both of 
them are showing a data abort in clear_page().

Above, you suggested that there is a big gap between the two memory 
banks. Are the banks still point to actual RAM?

Cheers,

-- 
Julien Grall

