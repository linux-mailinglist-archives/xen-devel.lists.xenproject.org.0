Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764646BB9B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 13:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241051.417867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZrV-0003jd-95; Tue, 07 Dec 2021 12:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241051.417867; Tue, 07 Dec 2021 12:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muZrV-0003hi-5f; Tue, 07 Dec 2021 12:46:25 +0000
Received: by outflank-mailman (input) for mailman id 241051;
 Tue, 07 Dec 2021 12:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vuaW=QY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muZrT-0003hc-Na
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 12:46:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2b5d62-575b-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 13:46:21 +0100 (CET)
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
X-Inumbo-ID: ad2b5d62-575b-11ec-a831-37629979565c
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638881179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QKzQcfpFrakF1gaQnErus44+ZE9ndLllCgtGuvnr0lo=;
	b=zkOUIyV/MINXrUxqZ9LTk6Hht+Xmk8q0kbB/5Y19WuZGmYCp1YnKcRHA/Ud2ZzNf0tBhD1
	5ewm51F2t/LbVeitPsQv0NzSQYvxBgYBwS2c0MPgw3mJzPZAZ6q2GBlz1ILLKxM7NY+q56
	y6FO2Jf6F60qKB/xuNibwDIcpP0cREBO9k1rd9lF2bKMpcZfrjSZUCAv611PzYSfI9kaYD
	ozerFcwa3CJXVTsQElTER2+/qf7c08a86zn5ZozkKNQ9QsA7UC2wyWhtESX00QKpP6+lNz
	FelqwJ4Bd7vCMzYyeRjT3d7rSGV/Gz0CUgOyfaKzjKzk1KOF0aTbcueGSTp9SQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638881179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QKzQcfpFrakF1gaQnErus44+ZE9ndLllCgtGuvnr0lo=;
	b=yZ3GrlUbR1OmCFoNBVL41nwID0yawuJjFK0MUow1uzlkJmWNC0fYtNtLkZbCEAFV92VP56
	kQjuYi/bhsZdtdDA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, linux-pci@vger.kernel.org, Cedric Le Goater
 <clg@kaod.org>, xen-devel@lists.xenproject.org, Juergen Gross
 <jgross@suse.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject: Re: [patch V2 29/31] genirq/msi: Add abuse prevention comment to
 msi header
In-Reply-To: <Ya8Zj+bADtKEISSP@kroah.com>
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.170847844@linutronix.de> <Ya8Zj+bADtKEISSP@kroah.com>
Date: Tue, 07 Dec 2021 13:46:18 +0100
Message-ID: <87lf0w37mt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 07 2021 at 09:21, Greg Kroah-Hartman wrote:
> On Mon, Dec 06, 2021 at 11:51:49PM +0100, Thomas Gleixner wrote:
>>  #include <linux/cpumask.h>
>>  #include <linux/mutex.h>
>>  #include <linux/list.h>
>> 
> Ah, to be young and idealistic and hope that kernel developers read
> comments in header files :)

Hope dies last.

> You might want to add this to the driver-api kernel doc build?

When I do the next round of refactoring, I'm going to move the functions
which are available for drivers into a separate header file.

Thanks,

        tglx

