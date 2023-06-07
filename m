Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD057268BA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 20:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544964.851100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6xuf-0007ip-Sp; Wed, 07 Jun 2023 18:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544964.851100; Wed, 07 Jun 2023 18:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6xuf-0007gq-Of; Wed, 07 Jun 2023 18:29:41 +0000
Received: by outflank-mailman (input) for mailman id 544964;
 Wed, 07 Jun 2023 18:29:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zL4u=B3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q6xue-0007gk-Dm
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 18:29:40 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 400e7615-0561-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 20:29:34 +0200 (CEST)
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
X-Inumbo-ID: 400e7615-0561-11ee-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686162573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vhANbTQxhW5giEgdQGefPD2Te4s/UC7F1qDEdOjzG0=;
	b=Mo7738aD+YotFaAvA5/ObujektbVcCYSas0zkHcEOWfQQrl8ZTc7i/g5UJWB/I7qd3aPpx
	D9IqLWq8iOUr1ZQqXlngl2cfBao8fNu4CGXKcpGjxggXz8HIfzDmo8h9tC//7H4DY4yI/g
	XQag2wldSYYM+/zTYUeIU22/CCMKNnrNQFMAYvEffPwFIY5450/eHdZ1quVfXMtlpfzkfm
	Xjb8T5mR1MBaMavj145MvDt1tuUUtB4EDj0IWGj8080CtI5KuD8T4VSfekn9sXObLqatQY
	/oNfNVpg7nj2VOqs5BMOldxSX1HC+9bjp7eFGMdHPj+7lZayUHPRYuHYvpk5eA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686162573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vhANbTQxhW5giEgdQGefPD2Te4s/UC7F1qDEdOjzG0=;
	b=/h0BEeBYLORpbcZp0MX6wq1y2VNw6+Wea4DCG/vpqwQeLOBfgwkSRAUP4ZtqpiT3J0Wu21
	xKOnKuP3naVH45BQ==
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>, Hou Wenlong
 <houwenlong.hwl@antgroup.com>, Alexey Makhalov <amakhalov@vmware.com>,
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
In-Reply-To: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
Date: Wed, 07 Jun 2023 20:29:32 +0200
Message-ID: <877csfjfcj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 15 2023 at 16:19, Hou Wenlong wrote:

> This patchset unifies FIXADDR_TOP as a variable for x86, allowing the
> fixmap area to be movable and relocated with the kernel image in the
> x86/PIE patchset [0]. This enables the kernel image to be relocated in
> the top 512G of the address space.

What for? What's the use case.

Please provide a proper argument why this is generally useful and
important.

Thanks,

        tglx

