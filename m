Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7913461132
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234394.406797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrd3c-0006JC-Qc; Mon, 29 Nov 2021 09:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234394.406797; Mon, 29 Nov 2021 09:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrd3c-0006GR-NC; Mon, 29 Nov 2021 09:34:44 +0000
Received: by outflank-mailman (input) for mailman id 234394;
 Mon, 29 Nov 2021 09:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C85y=QQ=mg.codeaurora.org=bounce+538f1c.be9e4a-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1mrcz5-0005YH-0h
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:30:03 +0000
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id eca4db3b-50f6-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 10:30:01 +0100 (CET)
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61a49d941abc6f02d06239d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Nov 2021 09:29:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B5BA9C4360D; Mon, 29 Nov 2021 09:29:56 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C23B0C4338F;
 Mon, 29 Nov 2021 09:29:49 +0000 (UTC)
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
X-Inumbo-ID: eca4db3b-50f6-11ec-976b-d102b41d0961
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1638178201; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=6eYnZqn/a+66YlvOdqd+LVZ4HfzlOTayDC9zFdg1eh8=; b=HiD4aaSGpVZ0Y4jGVbXU09fQB1Qd/lWGhVNPA7aYWkhmncRF5dmS27IP4LB2Wwc3BmMXmjOJ
 nGoEZq5hDhTJkaz8PUmVhpDRmbGqbD6mbL08y946/Pzh5At/QKhqEf0SVNATa5wE8nhbw/RZ
 lPNOKUUF1e6XvSuBy1hu9az0NOs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIyYTI5MyIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Sender: kvalo=codeaurora.org@mg.codeaurora.org
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C23B0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,  Bjorn Helgaas <helgaas@kernel.org>,  Marc Zygnier <maz@kernel.org>,  Alex Williamson <alex.williamson@redhat.com>,  Kevin Tian <kevin.tian@intel.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Megha Dey <megha.dey@intel.com>,  Ashok Raj <ashok.raj@intel.com>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  sparclinux@vger.kernel.org,  x86@kernel.org,  xen-devel@lists.xenproject.org,  ath11k@lists.infradead.org,  linux-pci@vger.kernel.org,  Michael Ellerman <mpe@ellerman.id.au>,  Paul Mackerras <paulus@samba.org>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,  linuxppc-dev@lists.ozlabs.org,  Thomas Bogendoerfer <tsbogend@alpha.franken.de>,  linux-mips@vger.kernel.org,  Wei Liu <wei.liu@kernel.org>,  linux-hyperv@vger.kernel.org,  Juergen Gross <jgross@suse.com>,  Christian Borntraeger <borntraeger@de.ibm.com>,  Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch 10/22] genirq/msi, treewide: Use a named struct for PCI/MSI attributes
References: <20211126222700.862407977@linutronix.de>
	<20211126223824.679247706@linutronix.de>
Date: Mon, 29 Nov 2021 11:29:46 +0200
In-Reply-To: <20211126223824.679247706@linutronix.de> (Thomas Gleixner's
	message of "Sat, 27 Nov 2021 02:18:50 +0100 (CET)")
Message-ID: <874k7vcnsl.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Thomas Gleixner <tglx@linutronix.de> writes:

> The unnamed struct sucks and is in the way of further cleanups. Stick the
> PCI related MSI data into a real data structure and cleanup all users.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: ath11k@lists.infradead.org
> ---
>  arch/powerpc/platforms/cell/axon_msi.c    |    2 
>  arch/powerpc/platforms/powernv/pci-ioda.c |    4 -
>  arch/powerpc/platforms/pseries/msi.c      |    6 -
>  arch/sparc/kernel/pci_msi.c               |    4 -
>  arch/x86/kernel/apic/msi.c                |    2 
>  arch/x86/pci/xen.c                        |    6 -
>  drivers/net/wireless/ath/ath11k/pci.c     |    2 

For ath11k:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

