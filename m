Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443327AB44C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 17:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606925.945020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhdX-0001xB-Bf; Fri, 22 Sep 2023 15:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606925.945020; Fri, 22 Sep 2023 15:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhdX-0001u3-8k; Fri, 22 Sep 2023 15:00:07 +0000
Received: by outflank-mailman (input) for mailman id 606925;
 Fri, 22 Sep 2023 15:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YT8q=FG=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qjhdV-0001gg-D8
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 15:00:05 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c2a6f6-5958-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 17:00:04 +0200 (CEST)
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
X-Inumbo-ID: b5c2a6f6-5958-11ee-878a-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695394802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yymdn5Ib3vdedE1bKPjXhrIk07DP2toWMx0YBeOSCKc=;
	b=JCA+KUnb692VWlx1fmj161S4ivDwYTrM1u8X2p5arIqoauHvahJMRyQgJNnCijDhvdZTN5
	2vhPfci1iBhuF4Qy2zYMF8JGpNHrq0VAOBaIOZz4r3zSiAs1S0WjK2Y/a5ZLPZiRHiR72P
	REbPguOF78kSQmQ7J0MndgAQ5u9+VLIa/hw1U5uaXSml+++MgocMsUUHEo8yUUBhh55/dy
	QQw13O85IYkSyENm5eCNprEvBu0VGY6MYJBQev1Uj1n9rrZjN0zSSXrLOJq5WBnRYuLa3i
	/YCovSEvga/R0iW5oDIVClJYgWEFtXfzNaoHbWAAyTqcD536K6Nb5/nqacqCUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695394802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yymdn5Ib3vdedE1bKPjXhrIk07DP2toWMx0YBeOSCKc=;
	b=CIDz5h5BcX/Bz/jkuzgX2qYw3Xx+SDJYkCZCT8rgToE1CkxZkoLWZYWz8rraUAqGtvF28b
	64aTOX6aC7JwbuBQ==
To: "Li, Xin3" <xin3.li@intel.com>, "Li, Xin3" <xin3.li@intel.com>, Nikolay
 Borisov <nik.borisov@suse.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "Lutomirski, Andy" <luto@kernel.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Christopherson,, Sean" <seanjc@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "Gross, Jurgen"
 <jgross@suse.com>, "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "jiangshanlai@gmail.com"
 <jiangshanlai@gmail.com>
Subject: RE: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
In-Reply-To: <SA1PR11MB6734445986E951E686172419A8FFA@SA1PR11MB6734.namprd11.prod.outlook.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <dda01248-f456-d8d7-5021-ef6b2e7ade2c@suse.com>
 <SA1PR11MB6734F205C2171425415E4F00A8F9A@SA1PR11MB6734.namprd11.prod.outlook.com>
 <SA1PR11MB6734445986E951E686172419A8FFA@SA1PR11MB6734.namprd11.prod.outlook.com>
Date: Fri, 22 Sep 2023 17:00:02 +0200
Message-ID: <87o7hugsnh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 22 2023 at 08:16, Xin3 Li wrote:
>> > > +static __always_inline void __wrmsrns(u32 msr, u32 low, u32 high)
>> >
>> > Shouldn't this be named wrmsrns_safe since it has exception handling, similar
>> to
>> > the current wrmsrl_safe.
>> >
>> 
>> Both safe and unsafe versions have exception handling, while the safe
>> version returns an integer to its caller to indicate an exception did
>> happen or not.
>
> I notice there are several call sites using the safe version w/o
> checking the return value, should the unsafe version be a better
> choice in such cases?

Depends. The safe version does not emit a warning on fail. So if the
callsite truly does not care about the error it's fine.

