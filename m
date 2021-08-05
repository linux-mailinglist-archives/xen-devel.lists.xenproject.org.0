Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75933E16E1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164331.300604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeIQ-0000CE-9b; Thu, 05 Aug 2021 14:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164331.300604; Thu, 05 Aug 2021 14:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeIQ-0000A2-5K; Thu, 05 Aug 2021 14:24:30 +0000
Received: by outflank-mailman (input) for mailman id 164331;
 Thu, 05 Aug 2021 14:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnXf=M4=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mBeIN-00009s-9a
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:24:28 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05273d70-309d-4f59-9781-2f8bbd0aeec3;
 Thu, 05 Aug 2021 14:24:21 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBeHe-0064f4-Gt; Thu, 05 Aug 2021 14:23:42 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B62C30027B;
 Thu,  5 Aug 2021 16:23:41 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1E329201DCD23; Thu,  5 Aug 2021 16:23:41 +0200 (CEST)
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
X-Inumbo-ID: 05273d70-309d-4f59-9781-2f8bbd0aeec3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zMcKhJ07Z0yEyEv/MZ8pR7li72ad4G0VC4wqCeDkbDY=; b=Q8Gt1gPN7F9SkQKtk66lR0Nvuh
	J+bQdo/XSF0T67gISx6Vc66q4fTo+FTFXUMBRhgaIYcCdf4qsGlh0/mWJ+py9vssB/RciYSkt7LqL
	D0cqTwAYfbBkgMf2ypNTXXW2W20qbJJiGowvi4sZXl3BoY2qT/+k7Nng8ZQfv0ypsUQI4WocLRzCG
	u80NaVh0JtgNowR5InuyXmnurSDKaZAz/gxT14CsI+ZrymZR8Osz9v++VxUgQS1ig9yJ1gWeOnHdN
	4FgEGzlqGLrJBOnGChRGgnAbrCvPvgpl8CZ89abXFTd7+wD4SGh2nZ+kuynsPyLw62j/Wl+j9erZJ
	uCRxZNTA==;
Date: Thu, 5 Aug 2021 16:23:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>, kys@microsoft.com,
	haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, akpm@linux-foundation.org,
	brijesh.singh@amd.com, thomas.lendacky@amd.com, pgonda@google.com,
	david@redhat.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
	aneesh.kumar@linux.ibm.com, xen-devel@lists.xenproject.org,
	martin.b.radev@gmail.com, ardb@kernel.org, rientjes@google.com,
	tj@kernel.org, keescook@chromium.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, parri.andrea@gmail.com
Subject: Re: [PATCH V2 03/14] x86/set_memory: Add x86_set_memory_enc static
 call support
Message-ID: <YQv0bRBUq1N5+jgG@hirez.programming.kicks-ass.net>
References: <20210804184513.512888-1-ltykernel@gmail.com>
 <20210804184513.512888-4-ltykernel@gmail.com>
 <5823af8a-7dbb-dbb0-5ea2-d9846aa2a36a@intel.com>
 <942e6fcb-3bdf-9294-d3db-ca311db440d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942e6fcb-3bdf-9294-d3db-ca311db440d3@gmail.com>

On Thu, Aug 05, 2021 at 10:05:17PM +0800, Tianyu Lan wrote:
>  static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
>  {
> +	return static_call(x86_set_memory_enc)(addr, numpages, enc);
>  }

Hurpmh... So with a bit of 'luck' you get code-gen like:

__set_memory_enc_dec:
	jmp __SCT_x86_set_memory_enc;

set_memory_encrypted:
	mov $1, %rdx
	jmp __set_memory_enc_dec

set_memory_decrypted:
	mov $0, %rdx
	jmp __set_memory_enc_dec


Which, to me, seems exceedingly daft. Best to make all 3 of those
inlines and use EXPORT_STATIC_CALL_TRAMP_GPL(x86_set_memory_enc) or
something.

This is assuming any of this is actually performance critical, based off
of this using static_call() to begin with.

