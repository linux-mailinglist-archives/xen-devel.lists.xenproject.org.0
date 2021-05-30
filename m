Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D370395279
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 20:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134402.250066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnQ8Y-0001UR-9e; Sun, 30 May 2021 18:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134402.250066; Sun, 30 May 2021 18:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnQ8Y-0001SM-5u; Sun, 30 May 2021 18:26:10 +0000
Received: by outflank-mailman (input) for mailman id 134402;
 Sun, 30 May 2021 18:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v38d=KZ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lnQ8M-0001SE-Kr
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 18:26:08 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6586ffd5-35ff-402a-8630-b6535a8ef4d5;
 Sun, 30 May 2021 18:25:55 +0000 (UTC)
Received: from zn.tnic (p200300ec2f2460006cdc9875a311c8ed.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f24:6000:6cdc:9875:a311:c8ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 297BA1EC04DA;
 Sun, 30 May 2021 20:25:54 +0200 (CEST)
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
X-Inumbo-ID: 6586ffd5-35ff-402a-8630-b6535a8ef4d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1622399154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=ZTX0veBS1A2m8n8rpJ5g64mOUcWUApPggEQNAUBCm9A=;
	b=IAw0F2TyYVY+rP1eI5AmqzSeMaa7HppyT4ap29b/IT/iNKMfdosPs+xMPG3f3mF2O4Wki1
	qhqGsUCN8l5tGn5bKA48frRbVNMVM2kOQP558FnSnfXnQJ2b7GfkbAAMJMi5biEwUyaXxK
	zI/Js2FGqWivkGhb4JVQazJsFli3sWY=
Date: Sun, 30 May 2021 20:25:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
	rppt@kernel.org, hannes@cmpxchg.org, cai@lca.pw,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 03/11] x86/Hyper-V: Add new hvcall guest address
 host visibility support
Message-ID: <YLPYqxF7urDIAd9z@zn.tnic>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-4-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-4-ltykernel@gmail.com>

On Sun, May 30, 2021 at 11:06:20AM -0400, Tianyu Lan wrote:
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 156cd235659f..a82975600107 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -29,6 +29,8 @@
>  #include <asm/proto.h>
>  #include <asm/memtype.h>
>  #include <asm/set_memory.h>
> +#include <asm/hyperv-tlfs.h>
> +#include <asm/mshyperv.h>
>  
>  #include "../mm_internal.h"
>  
> @@ -1986,8 +1988,14 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
>  	int ret;
>  
>  	/* Nothing to do if memory encryption is not active */
> -	if (!mem_encrypt_active())
> +	if (hv_is_isolation_supported()) {
> +		return hv_set_mem_host_visibility((void *)addr,
> +				numpages * HV_HYP_PAGE_SIZE,
> +				enc ? VMBUS_PAGE_NOT_VISIBLE
> +				: VMBUS_PAGE_VISIBLE_READ_WRITE);

Put all this gunk in a hv-specific function somewhere in hv-land which
you only call from here. This way you probably won't even need to export
hv_set_mem_host_visibility() and so on...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

