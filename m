Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8046D13E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 11:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242135.418819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuRL-00033Y-1W; Wed, 08 Dec 2021 10:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242135.418819; Wed, 08 Dec 2021 10:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuRK-00030m-UG; Wed, 08 Dec 2021 10:44:46 +0000
Received: by outflank-mailman (input) for mailman id 242135;
 Wed, 08 Dec 2021 10:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9Z0=QZ=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1muuRK-00030c-2m
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 10:44:46 +0000
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db1a4ddf-5813-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 11:44:44 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4A0F4D092F09;
 Wed,  8 Dec 2021 11:44:42 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 8 Dec
 2021 11:44:40 +0100
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
X-Inumbo-ID: db1a4ddf-5813-11ec-a831-37629979565c
Authentication-Results: garm.ovh; auth=pass (GARM-96R001f5056120-68a4-4c0a-bc06-f617410d6d7e,
                    EB01F339838E5AA67C986A6C3251B49097B81903) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.172.254
Message-ID: <e92f2bb3-b5e1-c870-8151-3917a789a640@kaod.org>
Date: Wed, 8 Dec 2021 11:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman
	<mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
	<ashok.raj@intel.com>, <linux-pci@vger.kernel.org>, Paul Mackerras
	<paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	<linuxppc-dev@lists.ozlabs.org>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, <linux-mips@vger.kernel.org>, Kalle
 Valo <kvalo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<sparclinux@vger.kernel.org>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>, <ath11k@lists.infradead.org>, Wei Liu
	<wei.liu@kernel.org>, <linux-hyperv@vger.kernel.org>, Christian Borntraeger
	<borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
 <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org> <8735n42lld.ffs@tglx>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8735n42lld.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d54a9dd7-eba7-4e7f-a7a0-0dc7c43fc796
X-Ovh-Tracer-Id: 10131410315672259365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgtohhm

On 12/7/21 21:42, Thomas Gleixner wrote:
> Cedric,
> 
> On Tue, Dec 07 2021 at 16:50, Cédric Le Goater wrote:
>> On 12/7/21 12:36, Michael Ellerman wrote:
>>>
>>> This patch should drop those selects I guess. Can you send an
>>> incremental diff for Thomas to squash in?
>>
>> Sure.
>>
>>> Removing all the tendrils in various device tree files will probably
>>> require some archaeology, and it should be perfectly safe to leave those
>>> in the tree with the driver gone. So I think we can do that as a
>>> subsequent patch, rather than in this series.
>>
>> Here are the changes. Compiled tested with ppc40x and ppc44x defconfigs.
> 
> < Lots of patch skipped />
>> @@ -141,7 +138,6 @@ config REDWOOD
>>    	select FORCE_PCI
>>    	select PPC4xx_PCI_EXPRESS
>>    	select PCI_MSI
>> -	select PPC4xx_MSI
>>    	help
>>    	  This option enables support for the AMCC PPC460SX Redwood board.
> 
> While that is incremental it certainly is worth a patch on it's
> own. Could you add a proper changelog and an SOB please?

Here you are.

  https://github.com/legoater/linux/commit/75d2764b11fe8f6d8bf50d60a3feb599ce27b16d

Thanks,

C.

