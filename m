Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DCF49367F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258772.446057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6ae-0002Bh-U1; Wed, 19 Jan 2022 08:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258772.446057; Wed, 19 Jan 2022 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6ae-00029I-Qk; Wed, 19 Jan 2022 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 258772;
 Wed, 19 Jan 2022 08:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqGR=SD=socionext.com=hayashi.kunihiko@srs-se1.protection.inumbo.net>)
 id 1nA6ac-00029C-UG
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:45:10 +0000
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1912fd0f-7904-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 09:45:07 +0100 (CET)
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 19 Jan 2022 17:45:04 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id F085B2059054;
 Wed, 19 Jan 2022 17:45:03 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Wed, 19 Jan 2022 17:45:03 +0900
Received: from [10.212.181.226] (unknown [10.212.181.226])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id 11233B62A1;
 Wed, 19 Jan 2022 17:45:02 +0900 (JST)
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
X-Inumbo-ID: 1912fd0f-7904-11ec-a115-11989b9578b4
Subject: Re: [patch] genirq/msi: Populate sysfs entry only once
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.224917330@linutronix.de> <87leznqx2a.ffs@tglx>
 <1d5711be-c26d-d57b-10db-1b45d279515d@socionext.com> <87a6fsa935.ffs@tglx>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <7d6445e9-011f-60ec-0fd0-3c354d507d57@socionext.com>
Date: Wed, 19 Jan 2022 17:45:01 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87a6fsa935.ffs@tglx>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 2022/01/19 8:59, Thomas Gleixner wrote:
> Kunihiko,
> 
> On Wed, Jan 12 2022 at 09:05, Kunihiko Hayashi wrote:
>> Is this fix the same as below?
>> https://marc.info/?l=linux-kernel&m=164061119923119&w=2
> 
> pretty much the same, but I missed that patch. I was off for 2+ weeks
> and on return Boris poked me about this issue and I fixed it. Then I
> went ahead and marked all vacation mail read as I always do :)
> 
> So sorry for not noticing that patch.

No problem. If this issue wansn't resolved, the PCIe controller wouldn't
work properly, so I'm relieved to solve the issue and get your response.

Thank you,

---
Best Regards
Kunihiko Hayashi

