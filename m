Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED48C21BB
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719657.1122501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NCL-0002tk-Ru; Fri, 10 May 2024 10:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719657.1122501; Fri, 10 May 2024 10:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5NCL-0002rL-PF; Fri, 10 May 2024 10:09:53 +0000
Received: by outflank-mailman (input) for mailman id 719657;
 Fri, 10 May 2024 10:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQS+=MN=amazon.es=prvs=8538b48ee=nsaenz@srs-se1.protection.inumbo.net>)
 id 1s5N9w-0002mv-LX
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:07:24 +0000
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com
 [99.78.197.220]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167ba843-0eb5-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 12:07:21 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80009.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:07:15 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:54770]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.14.131:2525]
 with esmtp (Farcaster)
 id 0c298036-b7a6-49e7-b4ba-4e0b449ad4e5; Fri, 10 May 2024 10:07:14 +0000 (UTC)
Received: from EX19D004EUC001.ant.amazon.com (10.252.51.190) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 10 May 2024 10:07:13 +0000
Received: from localhost (10.13.235.138) by EX19D004EUC001.ant.amazon.com
 (10.252.51.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Fri, 10 May
 2024 10:07:03 +0000
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
X-Inumbo-ID: 167ba843-0eb5-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715335641; x=1746871641;
  h=mime-version:content-transfer-encoding:date:message-id:
   subject:from:to:cc:references:in-reply-to;
  bh=ODj1UcfgLsilkOJ93AaBzpY+nLn2txKitmtJHEr2EDY=;
  b=uG+dDPkwkAFq226GFq4iDLlUiLv6H1U46ZqcdZ+yh4ACgeE8BgHoHHiZ
   UjXwZV7FpLhhGn9wWNjkR2NsgYyUz2ekzRhobbSdavUiLpP2MNV5qrSk7
   zYUiNi5hHzYJX9gTly4lQsCmQnZV9yvn6maEL+fdU4Q56AiR0LBX00vNc
   U=;
X-IronPort-AV: E=Sophos;i="6.08,150,1712620800"; 
   d="scan'208";a="88359429"
X-Farcaster-Flow-ID: 0c298036-b7a6-49e7-b4ba-4e0b449ad4e5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 May 2024 10:07:00 +0000
Message-ID: <D15VQ97L5M8J.1TDNQE6KLW6JO@amazon.com>
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
From: Nicolas Saenz Julienne <nsaenz@amazon.com>
To: Sean Christopherson <seanjc@google.com>,
	=?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
CC: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kees
 Cook" <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>, Alexander Graf <graf@amazon.com>, Angelina Vu
	<angelinavu@linux.microsoft.com>, Anna Trikalinou
	<atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>,
	"Forrest Yuan Yu" <yuanyu@google.com>, James Gowans <jgowans@amazon.com>,
	James Morris <jamorris@linux.microsoft.com>, John Andersen
	<john.s.andersen@intel.com>, "Madhavan T . Venkataraman"
	<madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>,
	=?utf-8?q?Mihai_Don=C8=9Bu?= <mdontu@bitdefender.com>,
	=?utf-8?q?Nicu=C8=99or_C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>, Thara
 Gopinath <tgopinath@microsoft.com>, "Trilok Soni" <quic_tsoni@quicinc.com>,
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, Yu Zhang
	<yu.c.zhang@linux.intel.com>, =?utf-8?q?=C8=98tefan_=C8=98icleru?=
	<ssicleru@bitdefender.com>, <dev@lists.cloudhypervisor.org>,
	<kvm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-security-module@vger.kernel.org>, <qemu-devel@nongnu.org>,
	<virtualization@lists.linux-foundation.org>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.16.0-127-gec0f4a50cf77
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net> <ZjTuqV-AxQQRWwUW@google.com>
 <20240506.ohwe7eewu0oB@digikod.net> <ZjmFPZd5q_hEBdBz@google.com>
 <20240507.ieghomae0UoC@digikod.net> <ZjpTxt-Bxia3bRwB@google.com>
In-Reply-To: <ZjpTxt-Bxia3bRwB@google.com>
X-Originating-IP: [10.13.235.138]
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D004EUC001.ant.amazon.com (10.252.51.190)

On Tue May 7, 2024 at 4:16 PM UTC, Sean Christopherson wrote:
> > If yes, that would indeed require a *lot* of work for something we're n=
ot
> > sure will be accepted later on.
>
> Yes and no.  The AWS folks are pursuing VSM support in KVM+QEMU, and SVSM=
 support
> is trending toward the paired VM+vCPU model.  IMO, it's entirely feasible=
 to
> design KVM support such that much of the development load can be shared b=
etween
> the projects.  And having 2+ use cases for a feature (set) makes it _much=
_ more
> likely that the feature(s) will be accepted.

Since Sean mentioned our VSM efforts, a small update. We were able to
validate the concept of one KVM VM per VTL as discussed in LPC. Right
now only for single CPU guests, but are in the late stages of bringing
up MP support. The resulting KVM code is small, and most will be
uncontroversial (I hope). If other obligations allow it, we plan on
having something suitable for review in the coming months.

Our implementation aims to implement all the VSM spec necessary to run
with Microsoft Credential Guard. But note that some aspects necessary
for HVCI are not covered, especially the ones that depend on MBEC
support, or some categories of secure intercepts.

Development happens
https://github.com/vianpl/{linux,qemu,kvm-unit-tests} and the vsm-next
branch, but I'd advice against looking into it until we add some order
to the rework. Regardless, feel free to get in touch.

Nicolas

