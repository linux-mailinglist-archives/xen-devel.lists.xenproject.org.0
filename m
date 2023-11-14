Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A347EA9EE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 06:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632121.986139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2lZP-0007Wa-Am; Tue, 14 Nov 2023 05:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632121.986139; Tue, 14 Nov 2023 05:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2lZP-0007TX-7w; Tue, 14 Nov 2023 05:02:39 +0000
Received: by outflank-mailman (input) for mailman id 632121;
 Tue, 14 Nov 2023 05:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jmH2=G3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r2lZN-0007TR-Oo
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 05:02:37 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06c57358-82ab-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 06:02:36 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8EEE540E0191; 
 Tue, 14 Nov 2023 05:02:33 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OLoj8MhEtgvD; Tue, 14 Nov 2023 05:02:31 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 15CEE40E0032;
 Tue, 14 Nov 2023 05:02:09 +0000 (UTC)
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
X-Inumbo-ID: 06c57358-82ab-11ee-98db-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1699938151; bh=dUNHth64wAi+DfNN2LL+fvN9ITMNu8XyaBkF7nxLEPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyPAvs8EM1vwD3w0yM6uPenFZuJ20wSRyZ9hjuiQyOL8O2giIr8S5BXx9anHdygDG
	 CFaXI6vczp2qx7Oiicr6bHk4Bhk0EKoec4EBYGgRx8/PgK0HOdeGlgHCrS/LyKfLOn
	 +Rek8cAJbX7v56BxizHvEb6+v0Rr4aoK2eIz0ZQuQ+BYQNjHN9Irbhg/4P6ylIrTIK
	 L96EjujMwTv03F5ZwqQWljZuNIR8jz8EsCCUq4yQ98y/6ReCeOJAMA3AGIhfcYY8Va
	 TxptPFnV9Jn/V88TPz4opLGkUqaBEfGXX0ntniZgugahJgApJ+lhbu07+xYq5fEE9q
	 aZIeHwwJSbzpWBStJMEhFon4R35ReXDbGOktsEphMNxdUmTuIHoseUct3QYUNjqBns
	 ke/rvL+1u7nChtWL+hpQRCLVY6hYb3wJJ6DIgaU4s6EW5CaHdwvhjpVSMkVy5lY2Lr
	 UIm8VoXWV/zEDUtPgERX9tQUEiU3sj7Qwu4s2iECuHd+S2HxfX6t295O+Bpdsqbrna
	 WZ18C6yTZZH9FVRZ58Dv2OKmEMb51UQ3XVnwCCrHe7XtSEwRvuraOUR4QywbPCMBrL
	 HY7DOKuH0Oy4OYsYDpkkfOVc5aA95lX/saZyWxsbWxzGa8Twt59w6yupWMfewKfsLL
	 BQ5N9OijKGco3KNW5DAtAtqc=
Date: Tue, 14 Nov 2023 06:02:01 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Li, Xin3" <xin3.li@intel.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"Lutomirski, Andy" <luto@kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Christopherson,, Sean" <seanjc@google.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"Gross, Jurgen" <jgross@suse.com>,
	"Shankar, Ravi V" <ravi.v.shankar@intel.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v12 01/37] x86/cpufeatures: Add the cpu feature bit for
 WRMSRNS
Message-ID: <20231114050201.GAZVL/Sd/yLIdON9la@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-2-xin3.li@intel.com>
 <20231108123647.GBZUuA31zntox0W0gu@fat_crate.local>
 <SA1PR11MB673495967E44583FC36B5E39A8B2A@SA1PR11MB6734.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA1PR11MB673495967E44583FC36B5E39A8B2A@SA1PR11MB6734.namprd11.prod.outlook.com>

On Tue, Nov 14, 2023 at 12:43:38AM +0000, Li, Xin3 wrote:
> No.  tglx asked for it:
> https://lkml.kernel.org/kvm/87y1h81ht4.ffs@tglx/

Aha

"According to the CPU folks FRED systems are guaranteed to have WRMSRNS -
I asked for that :). It's just not yet documented."

so I'm going to expect that to appear in the next FRED spec revision...

> Because we are doing 
> 		wrmsrns(MSR_IA32_FRED_RSP0, ...)
> here, and X86_FEATURE_WRMSRNS doesn't guarantee MSR_IA32_FRED_RSP0 exists.
> 
> Or I missed something?

Well, according to what I'm hearing and reading so far:

FRED means WRMSRNS
FRED means MSR_IA32_FRED_RSP0

and if you had to be precise, the code should do:

	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
		if (cpu_feature_enabled(X86_FEATURE_WRMSRNS))
			wrmsrns(MSR_IA32_FRED_RSP0, (unsigned long)task_stack_page(task) + THREAD_SIZE);
		else
			wrmsr(MSR_IA32_FRED_RSP0, (unsigned long)task_stack_page(task) + THREAD_SIZE);
	}

but apparently FRED implies WRMSRNS - not documented anywhere currently
- so you can save yourself one check.

But your version checks FRED if it can do WRMSRNS while there's
a separate WRMSRNS flag and that made me wonder...

> Another patch set should replace WRMSR with WRMSRNS, with SERIALIZE added
> when needed.

I sense someone wants to optimize MSR writes ... :-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

