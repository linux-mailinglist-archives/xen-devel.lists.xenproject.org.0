Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35072AE22
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 20:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546583.853558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q83Sn-00025R-Ir; Sat, 10 Jun 2023 18:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546583.853558; Sat, 10 Jun 2023 18:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q83Sn-00023X-Fd; Sat, 10 Jun 2023 18:37:25 +0000
Received: by outflank-mailman (input) for mailman id 546583;
 Sat, 10 Jun 2023 18:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mkd/=B6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q83Sm-00023O-0e
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 18:37:24 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d509df91-07bd-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 20:37:20 +0200 (CEST)
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
X-Inumbo-ID: d509df91-07bd-11ee-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686422239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7WjIOv23GkoARnLqItYOF1clW2sOuIKmsM3GXO5Xpg=;
	b=YCL2WcdNIO0s3K7UdC06CzI1RNfJDkJe7HEF4v5qdxN8RrO3sAaq8xX62f444BjcyFpI8P
	dvsdlA/V4XzVxCD0n8uz5bQYGAgwsvDqWJ8rNLJDHj8k8iQwRRGGrRVWI0YDNiCXV818Ht
	GruRrk0/QYF97Rhj5uVOQfTLlEitAY6Rs+rjvdpG7tob605G0Kvr/fVugOur6hufdowyf4
	Ax62Ig7bPHia5hggr2KaWqBtF0qOBpkmhrvFk02kMofvAv6EhF1xBRXZSKW4DrYvu52o5K
	D3W+c9UFX4owv7UrRYBLocORMja3sAJWQxRmRkowpokWoNy9GULDK6NIlr681w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686422239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7WjIOv23GkoARnLqItYOF1clW2sOuIKmsM3GXO5Xpg=;
	b=S7g5PoBvQUVBSn498XvK9vJHSGy+5G3W0vpFYxeTng6YEJJyB4cAG/EGEkYC18Ui7RMwlG
	7oqYWL4zDKXltfCg==
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, Dave Hansen
 <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan
 <jiangshan.ljs@antgroup.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Borislav
 Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian
 Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Juergen Gross <jgross@suse.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, Peter
 Zijlstra <peterz@infradead.org>, "Srivatsa S. Bhat (VMware)"
 <srivatsa@csail.mit.edu>, Suren Baghdasaryan <surenb@google.com>, Usama
 Arif <usama.arif@bytedance.com>,
 virtualization@lists.linux-foundation.org, VMware PV-Drivers Reviewers
 <pv-drivers@vmware.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 0/4] x86/fixmap: Unify FIXADDR_TOP
In-Reply-To: <20230608093303.GA16983@k08j02272.eu95sqa>
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
 <1f633e99-d294-6932-31e9-0eb158d030ea@intel.com>
 <20230608093303.GA16983@k08j02272.eu95sqa>
Date: Sat, 10 Jun 2023 20:37:18 +0200
Message-ID: <87y1kr88pt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 08 2023 at 17:33, Hou Wenlong wrote:
> On Wed, Jun 07, 2023 at 08:49:15PM +0800, Dave Hansen wrote:
>> What problems does this patch set solve?  How might that solution be
>> visible to end users?  Why is this problem important to you?
>
> We want to build the kernel as PIE and allow the kernel image area,
> including the fixmap area, to be placed at any virtual address.

You are still failing to tell us why you want that and which problem
this solves. Just that fact that you want to something is not an
argument.

> We have also implemented a PV Linux guest based on PIE, which can be
> used in software virtualization similar to Lguest. PIE makes the guest
> kernel share the host kernel space similar to a normal userspace
> process.  Additionally, we are considering whether it is possible to
> use PIE and PVOPS to implement a user-mode kernel.

That solves what?

Thanks,

        tglx

