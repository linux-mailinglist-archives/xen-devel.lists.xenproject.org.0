Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C472460FA1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 08:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234321.406673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrbRV-0007Ab-2y; Mon, 29 Nov 2021 07:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234321.406673; Mon, 29 Nov 2021 07:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrbRU-000778-W0; Mon, 29 Nov 2021 07:51:16 +0000
Received: by outflank-mailman (input) for mailman id 234321;
 Mon, 29 Nov 2021 07:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KK+l=QQ=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1mrbRT-000772-Jj
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 07:51:15 +0000
Received: from 4.mo548.mail-out.ovh.net (4.mo548.mail-out.ovh.net
 [188.165.42.229]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e7a1597-50e9-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 08:51:11 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1E69A2045C;
 Mon, 29 Nov 2021 07:51:11 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 08:51:10 +0100
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
X-Inumbo-ID: 1e7a1597-50e9-11ec-b941-1df2895da90e
Authentication-Results: garm.ovh; auth=pass (GARM-95G0018853b231-08ce-4c1d-9d13-72c8b66df497,
                    3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1ecfbea2-e5f7-b28b-5345-8b2ee82ae861@kaod.org>
Date: Mon, 29 Nov 2021 08:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 17/22] PCI/MSI: Split out !IRQDOMAIN code
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <linux-hyperv@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
	<sparclinux@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Ashok Raj
	<ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, <x86@kernel.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
	<helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<ath11k@lists.infradead.org>, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
	Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223825.093887718@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126223825.093887718@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8993720d-da60-4607-9d73-3bc5ffee8fa3
X-Ovh-Tracer-Id: 9686961325338364828
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh


> +void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
> +{
> +	struct msi_desc *desc;
> +	int i;
> +
> +	for_each_pci_msi_entry(desc, dev) {
> +		if (desc->irq) {
> +			for (i = 0; i < entry->nvec_used; i++)

I guess this is 'desc' ?

Thanks,

C.

> +				arch_teardown_msi_irq(desc->irq + i);
> +		}
> +	}
> +}

