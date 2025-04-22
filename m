Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8AA975D2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 21:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963453.1354447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JYO-0006MI-AC; Tue, 22 Apr 2025 19:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963453.1354447; Tue, 22 Apr 2025 19:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JYO-0006KT-75; Tue, 22 Apr 2025 19:45:12 +0000
Received: by outflank-mailman (input) for mailman id 963453;
 Tue, 22 Apr 2025 19:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQpG=XI=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u7JYN-0006KM-BC
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 19:45:11 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ba0cb09-1fb2-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 21:45:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 343436115E;
 Tue, 22 Apr 2025 19:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47763C4CEE9;
 Tue, 22 Apr 2025 19:45:00 +0000 (UTC)
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
X-Inumbo-ID: 4ba0cb09-1fb2-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745351107;
	bh=SM6p/VeZczxklqTLgYwK5TNBFJzXTVCYUxX3c44n8dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vd9uFVutD/DiNg1ZxIBzrJdFL1jU2G6puZbnWNQs6i3n+kf4rc7vjxbWQL0R1Xh0o
	 JPrl6gnfZMUUMuCJ+LVDo47kM2iYR+B7MWiVlw8xE3k2+6jJlOnMuWlpfzng1j0fuc
	 eAe80vnHzBUZ/9P+E1w7FDylcBKZ7LPAR6dUi4s5hvfw4GYmiln7dnDRhkWFTZuLNC
	 OAUF4DLx/eqv0HGxif/3d/pgrzjjX7T3fipHd75VA+jrtzIbVoN5ZCL9JUglMrUv//
	 znxygIRCg4iMtIS6pOSxN31eRvCq5hhNGISN9GHZk2Q+nZkcDEYGreaG3shaMFEoS7
	 b+FuRzJGQ+M5g==
Date: Tue, 22 Apr 2025 21:44:57 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Xin Li <xin@zytor.com>, Sean Christopherson <seanjc@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"acme@kernel.org" <acme@kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"namhyung@kernel.org" <namhyung@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"irogers@google.com" <irogers@google.com>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	"ajay.kaher@broadcom.com" <ajay.kaher@broadcom.com>,
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"Ostrovsky, Boris" <boris.ostrovsky@oracle.com>,
	"kys@microsoft.com" <kys@microsoft.com>,
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>,
	"Cui, Dexuan" <decui@microsoft.com>
Subject: Re: [RFC PATCH v2 00/34] MSR refactor with new MSR instructions
 support
Message-ID: <aAfxuby_0eZZTrj-@gmail.com>
References: <20250422082216.1954310-1-xin@zytor.com>
 <aAevpauKYWwObsB7@google.com>
 <cb4e24a0-fdb7-46d2-9b0e-200f5e3e4c96@zytor.com>
 <DS7PR11MB6077B4D80EB7020C4D3FCD52FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR11MB6077B4D80EB7020C4D3FCD52FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>


* Luck, Tony <tony.luck@intel.com> wrote:

> > >> base-commit: f30a0c0d2b08b355c01392538de8fc872387cb2b
> > >
> > > This commit doesn't exist in Linus' tree or the tip tree, and the series doesn't
> > > apply cleanly on any of the "obvious" choices.  Reviewing a 34 patches series
> > > without being able to apply it is a wee bit difficult...
> > >
> >
> > $ git show f30a0c0d2b08b355c01392538de8fc872387cb2b
> > commit f30a0c0d2b08b355c01392538de8fc872387cb2b
> > Merge: 49b517e68cf7 e396dd85172c
> > Author: Ingo Molnar <mingo@kernel.org>
> > Date:   Tue Apr 22 08:37:32 2025 +0200
> >
> >      Merge branch into tip/master: 'x86/sev'
> >
> >       # New commits in x86/sev:
> >          e396dd85172c ("x86/sev: Register tpm-svsm platform device")
> >          93b7c6b3ce91 ("tpm: Add SNP SVSM vTPM driver")
> >          b2849b072366 ("svsm: Add header with SVSM_VTPM_CMD helpers")
> >          770de678bc28 ("x86/sev: Add SVSM vTPM probe/send_command
> > functions")
> >
> >      Signed-off-by: Ingo Molnar <mingo@kernel.org>
> >
> >
> > You probably need to git pull from the tip tree :-)
> 
> If possible, you should avoid basing a series on tip/master as it 
> gets recreated frequently by merging all the topic branches. The SHA1 
> is here today, gone tomorrow.

Correct, although for x86 patch submissions via email it's not wrong: 
what applies today will likely apply tomorrow as well, regardless of 
the SHA1 change. :-)

> If your changes only depend on one TIP topic branch, base on that and 
> mention in the cover letter (as well as the SHA1 supplied from git 
> format-patches --base=xxx).

Yeah, the main dependency this series has is tip:x86/msr I believe:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/msr

Which SHA1's should be stable at this point.

Thanks,

	Ingo


