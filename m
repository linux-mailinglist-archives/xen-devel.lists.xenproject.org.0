Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050646F4AB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243348.420958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPhO-0000pb-Ma; Thu, 09 Dec 2021 20:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243348.420958; Thu, 09 Dec 2021 20:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPhO-0000mb-Is; Thu, 09 Dec 2021 20:07:26 +0000
Received: by outflank-mailman (input) for mailman id 243348;
 Thu, 09 Dec 2021 20:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PaQb=Q2=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvPhN-0000mI-Io
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:07:25 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9db73802-592b-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:07:23 +0100 (CET)
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
X-Inumbo-ID: 9db73802-592b-11ec-a831-37629979565c
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639080439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t8vWSJsQ3BPUuA0dl4ZxOCitpzQBCnAQcAG9d/AyszY=;
	b=sHhovCXYznLQvrGNlUrM3WEopSb51XowtYU6ZRg8/yzFTDuzz216Ewv7DolyvFsUKx/1ke
	B5ybiEluLUSMnv6nlypjKB3an/Ik19E8hELGvpGfaVsmyqlgRZ28jDTwg9X2YLdv0WXzyT
	qC8D+iAPLh/KVpR+ate3DDYaz+32FbJXuKAi1Tm3x4JYB4PJdhnn64H+G0JP8NQWxBBKW9
	mGg+435IBYg7crZEFeHp62q1iA+vdQWU3kcVjCOYWzqdyfdsUINMLHQRoPn27ryaaZ5Q87
	tnfir7pXGA6MtmMp/oUILSVBjMo1EPXed/tAn3VW13a5C37FiNh4kwD3IB7i4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639080439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t8vWSJsQ3BPUuA0dl4ZxOCitpzQBCnAQcAG9d/AyszY=;
	b=JfqQs3MQSjnfAkz1VIzKG+EbEjFfElIM5AarYArIkvLdqdh5RCIVK40SvG1K0tmOwfjy8O
	tm5NFzpfUpuOaxAQ==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens
 <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Logan
 Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject: Re: [patch V2 02/31] genirq/msi: Add mutex for MSI list protection
In-Reply-To: <20211209004702.GL6385@nvidia.com>
References: <20211206210600.123171746@linutronix.de>
 <20211206210747.708877269@linutronix.de>
 <20211209004702.GL6385@nvidia.com>
Date: Thu, 09 Dec 2021 21:07:18 +0100
Message-ID: <87bl1pzgnd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 08 2021 at 20:47, Jason Gunthorpe wrote:
> On Mon, Dec 06, 2021 at 11:51:05PM +0100, Thomas Gleixner wrote:
>> +++ b/kernel/irq/msi.c
>> @@ -127,12 +127,37 @@ int msi_setup_device_data(struct device
>>  		return -ENOMEM;
>>  
>>  	INIT_LIST_HEAD(&md->list);
>> +	mutex_init(&md->mutex);
>>  	dev->msi.data = md;
>>  	devres_add(dev, md);
>>  	return 0;
>>  }
>>  
>>  /**
>> + * msi_lock_descs - Lock the MSI descriptor storage of a device
>> + * @dev:	Device to operate on
>> + */
>> +void msi_lock_descs(struct device *dev)
>> +{
>> +	if (WARN_ON_ONCE(!dev->msi.data))
>> +		return;
>
> Is this useful? Other places that call msi_lock_descs will continue on and deref
> null dev->msi anyhow - is the dump from the WARN_ON that much better
> than the oops from the null deref here:
>
>> +	mutex_lock(&dev->msi.data->mutex);

I put it there for paranoia reasons and forgot to revist it later. In
that case yes, it's of questionable value.

Thanks,

        tglx

