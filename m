Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F448AA14
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 10:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255646.438124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7D2l-0008UY-J6; Tue, 11 Jan 2022 09:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255646.438124; Tue, 11 Jan 2022 09:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7D2l-0008SA-FE; Tue, 11 Jan 2022 09:02:15 +0000
Received: by outflank-mailman (input) for mailman id 255646;
 Tue, 11 Jan 2022 09:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tm+C=R3=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1n7D2k-0008S4-G4
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 09:02:14 +0000
Received: from 5.mo552.mail-out.ovh.net (5.mo552.mail-out.ovh.net
 [188.165.45.220]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a5a6453-72bd-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 10:02:13 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D4DDE2252A;
 Tue, 11 Jan 2022 09:02:10 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 10:02:01 +0100
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
X-Inumbo-ID: 2a5a6453-72bd-11ec-9ce5-af14b9085ebd
Authentication-Results: garm.ovh; auth=pass (GARM-95G001713f3599-f95f-45bc-8458-3cc8394211bc,
                    5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <83cac5d2-b5f2-836c-1f4f-bfe054a8bedb@kaod.org>
Date: Tue, 11 Jan 2022 10:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch] genirq/msi: Populate sysfs entry only once
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
	<ashok.raj@intel.com>, <linux-pci@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Niklas Schnelle
	<schnelle@linux.ibm.com>, <linux-s390@vger.kernel.org>, Heiko Carstens
	<hca@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Logan
 Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
	<dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	<linux-ntb@googlegroups.com>
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.224917330@linutronix.de> <87leznqx2a.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87leznqx2a.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62e82270-dbcc-463c-8f53-caaee6d6cca0
X-Ovh-Tracer-Id: 5157184527403223894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehvddguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugidqnhhtsgesghhoohhglhgvghhrohhuphhsrdgtohhm

On 1/10/22 19:12, Thomas Gleixner wrote:
> The MSI entries for multi-MSI are populated en bloc for the MSI descriptor,
> but the current code invokes the population inside the per interrupt loop
> which triggers a warning in the sysfs code and causes the interrupt
> allocation to fail.
> 
> Move it outside of the loop so it works correctly for single and multi-MSI.
> 
> Fixes: bf5e758f02fc ("genirq/msi: Simplify sysfs handling")
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   kernel/irq/msi.c |   11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -887,12 +887,11 @@ int __msi_domain_alloc_irqs(struct irq_d
>   			ret = msi_init_virq(domain, virq + i, vflags);
>   			if (ret)
>   				return ret;
> -
> -			if (info->flags & MSI_FLAG_DEV_SYSFS) {
> -				ret = msi_sysfs_populate_desc(dev, desc);
> -				if (ret)
> -					return ret;
> -			}
> +		}
> +		if (info->flags & MSI_FLAG_DEV_SYSFS) {
> +			ret = msi_sysfs_populate_desc(dev, desc);
> +			if (ret)
> +				return ret;
>   		}
>   		allocated++;
>   	}
> 


