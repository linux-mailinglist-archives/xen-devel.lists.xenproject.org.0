Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2B44C21F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 14:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224293.387524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknhA-0004Nq-J3; Wed, 10 Nov 2021 13:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224293.387524; Wed, 10 Nov 2021 13:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknhA-0004M4-Fe; Wed, 10 Nov 2021 13:31:20 +0000
Received: by outflank-mailman (input) for mailman id 224293;
 Wed, 10 Nov 2021 13:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssld=P5=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1mknh9-0004Ly-KP
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 13:31:19 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c528d64-422a-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 14:31:18 +0100 (CET)
Received: from [193.180.18.161] (port=47568 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1mknh7-009tmM-Jm; Wed, 10 Nov 2021 14:31:17 +0100
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
X-Inumbo-ID: 7c528d64-422a-11ec-a9d2-d9f7a1cc8784
Message-ID: <b003df90-0c85-a51c-0e8a-600a85912d85@oderland.se>
Date: Wed, 10 Nov 2021 14:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH v2] PCI/MSI: Move non-mask check back into low level
 accessors
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jgross@suse.com,
 linux-pci@vger.kernel.org, maz@kernel.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>, David Woodhouse <dwmw2@infradead.org>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx>
 <87cznqg5k8.ffs@tglx> <d1cc20aa-5c5c-6c7b-2e5d-bc31362ad891@oderland.se>
 <89d6c2f4-4d00-972f-e434-cb1839e78598@oderland.se>
 <5b3d4653-0cdf-e098-0a4a-3c5c3ae3977b@oderland.se> <87k0ho6ctu.ffs@tglx>
 <87h7cs6cri.ffs@tglx> <87pmr92xek.ffs@tglx>
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <87pmr92xek.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 11/9/21 15:53, Thomas Gleixner wrote:
> On Thu, Nov 04 2021 at 00:27, Thomas Gleixner wrote:
>>  
>> -		if (!entry->msi_attrib.is_virtual) {
>> +		if (!entry->msi_attrib.can_mask) {
> Groan. I'm a moron. This obviously needs to be
>
> 		if (entry->msi_attrib.can_mask) {
I will compile and check. Thanks for being thorough.
>>  			addr = pci_msix_desc_addr(entry);
>>  			entry->msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>>  		}


