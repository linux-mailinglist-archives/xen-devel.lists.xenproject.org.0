Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901CC3BF655
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 09:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152921.282513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1OYG-000885-1B; Thu, 08 Jul 2021 07:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152921.282513; Thu, 08 Jul 2021 07:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1OYF-00086E-UD; Thu, 08 Jul 2021 07:34:27 +0000
Received: by outflank-mailman (input) for mailman id 152921;
 Thu, 08 Jul 2021 07:34:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1OYF-000868-0a
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 07:34:27 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb75271e-dfbe-11eb-855d-12813bfff9fa;
 Thu, 08 Jul 2021 07:34:25 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx687Y4Yio
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 09:34:04 +0200 (CEST)
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
X-Inumbo-ID: eb75271e-dfbe-11eb-855d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625729648;
    s=strato-dkim-0002; d=aepfle.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Ie8bhNxcgTEIyaHnXue+qUsCeFcFU7OWzE+Hs21wg9g=;
    b=nKxlYYk9ExTxZ9BuI9EhfpAje6vEfx0GVmBer00VZb2GlgTta4a3e6mEReme+AVLKJ
    x1g28GBLyGoFvM6gaG5z7b+cV6ZJFLoem/obwXB9+z0+SoPV6pwNVVIIk3/UOPHsneyg
    GWLwYXUqnjer9VpKH4m9Cx5Kv703S9RZFcbTVNL6kEIMVP91SRDKJaQgZM42hrAkVc4e
    lmSSydRxnY+lu4pZdDi8VibLUhPOJminze/kIh5/0FPTHkurK2p5a/EfuKxM/KIN1xWG
    WfgjyRn1yLU1J5t4Nvhf0XjMie6PdfNUCxeSR2W7CoeJ26/3wkjbXCgr0r3rPyjQAbxh
    dA9w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QDiZbDmui9LcK/RdXt7GAQpV1nK0bLlEYINdoY/p1XzQbc+3kk9TsJTnzSvdM+YSIzPms="
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 09:34:00 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com, rppt@kernel.org,
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
	Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com, ardb@kernel.org,
	nramas@linux.microsoft.com, robh@kernel.org, keescook@chromium.org,
	rientjes@google.com, pgonda@google.com, martin.b.radev@gmail.com,
	hannes@cmpxchg.org, saravanand@fb.com, krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org, tj@kernel.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: Re: [RFC PATCH V4 01/12] x86/HV: Initialize shared memory boundary
 in the Isolation VM.
Message-ID: <20210708073400.GA28528@aepfle.de>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
 <20210707153456.3976348-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210707153456.3976348-2-ltykernel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jul 07, Tianyu Lan wrote:

> +++ b/include/asm-generic/mshyperv.h
> @@ -34,8 +34,18 @@ struct ms_hyperv_info {

>  	void  __percpu **ghcb_base;

It would be cool if the cover letter states which commit id this series is based on.

Thanks,
Olaf

