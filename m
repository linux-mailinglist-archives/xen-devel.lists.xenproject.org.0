Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB2A97622
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 21:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963480.1354467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JfH-0001w5-AD; Tue, 22 Apr 2025 19:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963480.1354467; Tue, 22 Apr 2025 19:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JfH-0001tQ-7a; Tue, 22 Apr 2025 19:52:19 +0000
Received: by outflank-mailman (input) for mailman id 963480;
 Tue, 22 Apr 2025 19:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dB82=XI=flex--seanjc.bounces.google.com=3OvMHaAYKCYc3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@srs-se1.protection.inumbo.net>)
 id 1u7JfF-0001tK-LM
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 19:52:17 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b3ea38e-1fb3-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 21:51:24 +0200 (CEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-30364fc706fso4885189a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 12:51:24 -0700 (PDT)
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
X-Inumbo-ID: 2b3ea38e-1fb3-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745351483; x=1745956283; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mH6UGx1+cJUt0+vdtDYj5GNgwh2+pJEonMo7kApLLOI=;
        b=p9w18MM12KU7PuLQqhXeFlaZM2pAHPeaxeoIdGJOtaHmqyQ2p0ztwJ6rmw+s1I7nG2
         zuSpvjpyfgIch+6NXD7xqUrvbcZTQcoYsfMGz59K2B/4m3ch8znvBpywjLmayFd9UMMw
         DD8kECf1nRme3mEBb4mXALq8AjjPasBn6cw0i8YclxsLjYqlOGBS1MtkfslN+om+eYcN
         k+8ixyZgSNeatJB7nRfewlv2Qm9tSdmCTm88Z0+6EoDma8qNV3rw4nktwJBa7+K2vhfa
         ewaOwT+0+tk7K78Yy7eTtPaZRjJMuCn2dfzLo4TuQHOmiIajI8Ax7bCV/d01mB9XhmDM
         3ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351483; x=1745956283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH6UGx1+cJUt0+vdtDYj5GNgwh2+pJEonMo7kApLLOI=;
        b=pytysf0GICjl+B653n2bSOBQp06ZLo+H7urj2nQo+BwFO4Iqz4LxtC5C4CVfhRB5C8
         LQ8bO2Usib7Vw9Tm3zYVXbtaSdtTSS7CQTkk9mfBUE4dokmmGvCA0cevYSl5htUEZeux
         O0sbQrjCFyvtiC1o8Wb/Zx2xRLVRN6Xpc7Cg3VWZxWlvvS0/g1iVeWKc4fldbIo2f1KM
         MnyGXQkhOHoZT/2bxMNmduk/iGV3krVNmotuC4kBEUmaN3WrBg/ih3Yt9mthPjpWWj3i
         nq3wSewJ+kIenNyWwRYcsRCSLhyi7IWlqws2QDcWk+dEMKHfN65HvHs+zAAA6bikCsfb
         toxA==
X-Forwarded-Encrypted: i=1; AJvYcCVojOkZm+LcWtOscTOIxKufDaum+QCGTkpaMqaYVI8I25dauSUQavgvhqMKMjFjQeDzIOhrwYCVtxc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWF6FKqykMqcz1ieJZSBkUYx3rcQuMTXmFDxe9vm96hqKv1J6s
	8N65Gfxbz+fSnvj1PWqrqA6enjmU5GYG80VeaBqkT6313pkEYa4AP/8DJq8tGUeJIxIeMvdzhWQ
	HWg==
X-Google-Smtp-Source: AGHT+IGkV0RcloCvNwgssDSlkXsqRo5n8/rzSZ0U6QUVt02K3Nbge8IReH8D+uHUWVsCRD28uFY//07FCPo=
X-Received: from pjbsr7.prod.google.com ([2002:a17:90b:4e87:b0:301:2679:9d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b90:b0:2ee:bc7b:9237
 with SMTP id 98e67ed59e1d1-3087bb9ede2mr21004314a91.27.1745351482796; Tue, 22
 Apr 2025 12:51:22 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:51:21 -0700
In-Reply-To: <aAfxuby_0eZZTrj-@gmail.com>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com> <aAevpauKYWwObsB7@google.com>
 <cb4e24a0-fdb7-46d2-9b0e-200f5e3e4c96@zytor.com> <DS7PR11MB6077B4D80EB7020C4D3FCD52FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
 <aAfxuby_0eZZTrj-@gmail.com>
Message-ID: <aAfzOWnYzcPjZDEI@google.com>
Subject: Re: [RFC PATCH v2 00/34] MSR refactor with new MSR instructions support
From: Sean Christopherson <seanjc@google.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>, Xin Li <xin@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
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
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "acme@kernel.org" <acme@kernel.org>, "jgross@suse.com" <jgross@suse.com>, 
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"irogers@google.com" <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
	"ajay.kaher@broadcom.com" <ajay.kaher@broadcom.com>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"luto@kernel.org" <luto@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	"kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>, 
	Dexuan Cui <decui@microsoft.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Ingo Molnar wrote:
> 
> * Luck, Tony <tony.luck@intel.com> wrote:
> 
> > > >> base-commit: f30a0c0d2b08b355c01392538de8fc872387cb2b
> > > >
> > > > This commit doesn't exist in Linus' tree or the tip tree, and the series doesn't
> > > > apply cleanly on any of the "obvious" choices.  Reviewing a 34 patches series
> > > > without being able to apply it is a wee bit difficult...
> > > >
> > >
> > > $ git show f30a0c0d2b08b355c01392538de8fc872387cb2b
> > > commit f30a0c0d2b08b355c01392538de8fc872387cb2b
> > > Merge: 49b517e68cf7 e396dd85172c
> > > Author: Ingo Molnar <mingo@kernel.org>
> > > Date:   Tue Apr 22 08:37:32 2025 +0200
> > >
> > >      Merge branch into tip/master: 'x86/sev'
> > >
> > >       # New commits in x86/sev:
> > >          e396dd85172c ("x86/sev: Register tpm-svsm platform device")
> > >          93b7c6b3ce91 ("tpm: Add SNP SVSM vTPM driver")
> > >          b2849b072366 ("svsm: Add header with SVSM_VTPM_CMD helpers")
> > >          770de678bc28 ("x86/sev: Add SVSM vTPM probe/send_command
> > > functions")
> > >
> > >      Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > >
> > >
> > > You probably need to git pull from the tip tree :-)
> > 
> > If possible, you should avoid basing a series on tip/master as it 
> > gets recreated frequently by merging all the topic branches. The SHA1 
> > is here today, gone tomorrow.
> 
> Correct, although for x86 patch submissions via email it's not wrong: 
> what applies today will likely apply tomorrow as well, regardless of 
> the SHA1 change. :-)

Yeah, but as Tony pointed out, when using base commit that may be ephemeral, then
the cover letter needs to call out the tree+branch.  This series applies on the
current tip/master, but there was nothing to clue me into that fact.

