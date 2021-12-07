Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6DE46B427
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240548.417115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muV84-00021Y-T3; Tue, 07 Dec 2021 07:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240548.417115; Tue, 07 Dec 2021 07:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muV84-0001yh-Py; Tue, 07 Dec 2021 07:43:12 +0000
Received: by outflank-mailman (input) for mailman id 240548;
 Tue, 07 Dec 2021 07:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muV83-0001hW-JN
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:43:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52d3f1a6-5731-11ec-8a4d-196798b21f7b;
 Tue, 07 Dec 2021 08:43:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F3313CE19FD;
 Tue,  7 Dec 2021 07:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDAFC341C3;
 Tue,  7 Dec 2021 07:43:08 +0000 (UTC)
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
X-Inumbo-ID: 52d3f1a6-5731-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638862988;
	bh=5v2CYN6Ek/VsBwXBgnA+9vhOyUOpZ4AXtUsFipJFXnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhIwRrB39WEo9ruwJWOuvB7N1crHht5tuI+kItER+b+vuapdVaIC+9lVIKc3Q5VBL
	 YdQQXLyF0FiNYgisXBRtnT2nfSUZlr1Kn5R/E2ykVg2r5rMoqIE2uU7VdjZDWuMWeM
	 5p2s+W7o63jkZoCUkzMytzmIEbC1GuZZxXiH55Kw=
Date: Tue, 7 Dec 2021 08:43:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 05/23] genirq/msi: Fixup includes
Message-ID: <Ya8Qim1ROOD/247D@kroah.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.103502021@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.103502021@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:31PM +0100, Thomas Gleixner wrote:
> Remove the kobject.h include from msi.h as it's not required and add a
> sysfs.h include to the core code instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

