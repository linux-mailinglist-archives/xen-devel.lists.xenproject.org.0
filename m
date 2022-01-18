Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5AB493188
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 01:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258676.445794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9yOi-0006SX-ND; Wed, 19 Jan 2022 00:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258676.445794; Wed, 19 Jan 2022 00:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9yOi-0006Qp-JL; Wed, 19 Jan 2022 00:00:20 +0000
Received: by outflank-mailman (input) for mailman id 258676;
 Wed, 19 Jan 2022 00:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtCf=SD=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1n9yOg-0006Qg-5q
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 00:00:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84c4bc3-78ba-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 01:00:16 +0100 (CET)
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
X-Inumbo-ID: c84c4bc3-78ba-11ec-9bbc-9dff3e4ee8c5
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1642550414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJoRNYCC0qaPQvmOXkM+nCsiL5/VV0xKtAJ9Mq0RcS0=;
	b=a9MMj8QkoBwPjJ9s10Nj5dcTSEk5744AcGkY+mIqMyhSCNoNM/Icm0kXybWpkbKJFQighH
	1X9AZdGGKDLG3+SXqsfjv3JU9dRsBhgMjiZAZM0AF1fjiNoc/kyGj1WDfc13cCOD1x5fM6
	DWSEKg44FhgPmXAqIs3WIgSBCgxKc4pq7CN7jLxDnudGUV+EF6aJnCe5DaLVzCN42mwLal
	ceQwErmCYN5iHW/wBdHkoTdvHTRAkVF0oCvKcxs9zruKkcZH+DR26Tu171bTrPE0yo9FHi
	4rwrLMfSKfXYBCD5gQy/e3+J5TmjTVIfxiIu8I3nLvdQFvwghW7JJWPQwhCnjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1642550414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GJoRNYCC0qaPQvmOXkM+nCsiL5/VV0xKtAJ9Mq0RcS0=;
	b=m3IN+KU7X9XD5oXfHjNVtst6/jOc72hQesIDxbDqdrCWfpXMC6egl9W2w2q0aW8wkvWOLE
	kL3K2AGDiz3SUfAA==
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens
 <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Logan
 Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject: Re: [patch] genirq/msi: Populate sysfs entry only once
In-Reply-To: <1d5711be-c26d-d57b-10db-1b45d279515d@socionext.com>
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.224917330@linutronix.de> <87leznqx2a.ffs@tglx>
 <1d5711be-c26d-d57b-10db-1b45d279515d@socionext.com>
Date: Wed, 19 Jan 2022 00:59:58 +0100
Message-ID: <87a6fsa935.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Kunihiko,

On Wed, Jan 12 2022 at 09:05, Kunihiko Hayashi wrote:
> Is this fix the same as below?
> https://marc.info/?l=linux-kernel&m=164061119923119&w=2

pretty much the same, but I missed that patch. I was off for 2+ weeks
and on return Boris poked me about this issue and I fixed it. Then I
went ahead and marked all vacation mail read as I always do :)

So sorry for not noticing that patch.

Thanks,

        Thomas

