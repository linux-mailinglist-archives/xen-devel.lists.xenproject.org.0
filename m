Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA68A7871D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 06:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935098.1336577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzpQr-0004xd-KJ; Wed, 02 Apr 2025 04:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935098.1336577; Wed, 02 Apr 2025 04:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzpQr-0004uo-HX; Wed, 02 Apr 2025 04:10:29 +0000
Received: by outflank-mailman (input) for mailman id 935098;
 Wed, 02 Apr 2025 04:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Wck=WU=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1tzpQq-0004ui-CH
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 04:10:28 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6765d36e-0f78-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 06:10:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DEDAD61130;
 Wed,  2 Apr 2025 04:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD29C4CEE9;
 Wed,  2 Apr 2025 04:10:15 +0000 (UTC)
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
X-Inumbo-ID: 6765d36e-0f78-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743567024;
	bh=I0s5Gv1mQHqnKIzWxsoxCEERoVHvYzeckwE8nOas3VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnGYyG5PegnZexH78EkVEZhjl67pWL7sXIuankw0lLUoS6l525yDJb1k2Y991Swzi
	 Y/BQdn5EKeOPY4iCMiCsl/wcs58dUo6w4xmkNpQPl13ChnxQG34bUHyTmZ9oI5i9zj
	 GXNesFcifbImdVA7Krak7NrblCx3xnxnf0NZrjadpmZUOlSF3sDsu4Wqsh/OKamc5N
	 +/zpZVi9YHfAGYahd4Ce8z4sLXldFsNZWZ5Nqw2T1fjxJ8DAvB6m9Rtz/uEQMlDmh/
	 IRy6AIGMdjxGih5ykPwxvU4bKYE7f4SM5B+pULQxCAmH41LRub4Yb6OVvdI2LbooM3
	 g8DLjexGSgPew==
Date: Wed, 2 Apr 2025 06:10:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Xin Li <xin@zytor.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, linux-edac@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-ide@vger.kernel.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
	peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
	pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
	luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
	haiyangz@microsoft.com, decui@microsoft.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v1 01/15] x86/msr: Replace __wrmsr() with
 native_wrmsrl()
Message-ID: <Z-y4pGxgiP55lpOj@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-2-xin@zytor.com>
 <Z-pruogreCuU66wm@gmail.com>
 <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
 <Z-ubVFyoOzwKhI53@gmail.com>
 <7a503d55-db41-42da-8133-4a3dbbd36c7e@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a503d55-db41-42da-8133-4a3dbbd36c7e@zytor.com>


* Xin Li <xin@zytor.com> wrote:

> Hi Ingo,
> 
> Is this branch public?
> 
> I wanted to rebase on it and then incooperate your review comments, but
> couldn't find the branch.

Yeah, I moved it over to:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/msr

Thanks,

	Ingo

