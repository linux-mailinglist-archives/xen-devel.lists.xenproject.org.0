Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F7BAF483
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 08:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134646.1472377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3qb7-0003Ix-E4; Wed, 01 Oct 2025 06:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134646.1472377; Wed, 01 Oct 2025 06:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3qb7-0003GR-AD; Wed, 01 Oct 2025 06:45:57 +0000
Received: by outflank-mailman (input) for mailman id 1134646;
 Wed, 01 Oct 2025 06:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSmv=4K=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1v3qb5-0003G2-DF
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 06:45:55 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 463c9d4e-9e92-11f0-9d14-b5c5bf9af7f9;
 Wed, 01 Oct 2025 08:45:54 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v3qat-00000008K4b-0YaL; Wed, 01 Oct 2025 06:45:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 552DC300212; Wed, 01 Oct 2025 08:45:43 +0200 (CEST)
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
X-Inumbo-ID: 463c9d4e-9e92-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QjlhTp+r7CWvr2hwonpt0lAiAd5bdRhkMYmYsK0uFOs=; b=RJ+2xvWrMWoKdKQyz+zpdd5gfJ
	YhYsbT3i08QHxLvo48Rr7myLVjUOOcBD0uqkDLR8AAvzaG5juY/1D7D752Eyw8kA/N8kopAu3n5CR
	ujm3jRymFuWLt33m+r7DxTLCq58ekiTe2UIxiI7y2W1SaHQD9ZuQEMFf9aHwfFDXc47s2BLcC5nma
	pfLAVKbtc2Qfsh9BIh1e5F+mgm9+o+c833EZEsxQ1DjCeFJdqus4Hqx9Ds+q53OB95vT0OKpbQLM6
	wHa/o0EWQB721aW+vrNB4Ge/7KkrVae9TNO4Q+xzCFTEUygqtIEWUkL0+Bt39q8GIPfyqrViFxvE4
	5br3cvjg==;
Date: Wed, 1 Oct 2025 08:45:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, xin@zytor.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
Message-ID: <20251001064543.GM4067720@noisy.programming.kicks-ass.net>
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-12-jgross@suse.com>
 <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
 <1541b670-8b29-42a5-a58d-34d85197751d@suse.com>
 <20250930100404.GK4067720@noisy.programming.kicks-ass.net>
 <fefbd1ee-ab8c-465e-89bf-39cd2601fc60@suse.com>
 <d2c68cbe-2e92-4801-b1a3-af4645e9ba78@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c68cbe-2e92-4801-b1a3-af4645e9ba78@zytor.com>

On Tue, Sep 30, 2025 at 12:49:21PM -0700, H. Peter Anvin wrote:

> /* Xen code, stub sets CF = 1 on failure */
> 
>    0:   e8 xx xx xx xx          call   asm_xen_pv_wrmsr
>    5:   73 03                   jnc    0xa
>    7:   0f 0b                   ud2
>    9:   90                      nop
>    a:
> 
> The trap point even ends up in the same place! UD2 can be any 1-, 2-, or
> 3-byte trapping instruction.

Please don't rely on flags to be retained by RET. The various
mitigations have trouble with that.

