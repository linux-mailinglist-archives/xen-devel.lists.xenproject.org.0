Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD98D88C3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 20:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734990.1141140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sECaj-00054h-Ej; Mon, 03 Jun 2024 18:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734990.1141140; Mon, 03 Jun 2024 18:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sECaj-00052z-AD; Mon, 03 Jun 2024 18:39:33 +0000
Received: by outflank-mailman (input) for mailman id 734990;
 Mon, 03 Jun 2024 18:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wgl=NF=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1sECai-00052t-1J
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 18:39:32 +0000
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch
 [45.157.188.14]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca8f14b-21d8-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 20:39:30 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch
 [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VtMvh6qFGzbqD;
 Mon,  3 Jun 2024 20:39:28 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VtMvf5T4yz1Y3; Mon,  3 Jun 2024 20:39:26 +0200 (CEST)
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
X-Inumbo-ID: 9ca8f14b-21d8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1717439968;
	bh=gtIaPUDSXyeON8s2CCg1DgIhDlLJpeFMkqvOS8MasVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xgOLEnz6SJcIhFjVsyAJkws+cB0hDF1vBl5UhdAnMFZ3IwIv9+mfJG3z/z022GaLC
	 hucCNjddaf0O63psa6tLWOQ3L5xKcN9U7KIay9a2JpyiZ7tPESeMWs+1ppcAXahNNL
	 fGKNj5z+dog4VQDnEUOYMq6wUCsWbim9yiLiW2VQ=
Date: Mon, 3 Jun 2024 20:39:24 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Sean Christopherson <seanjc@google.com>
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Alexander Graf <graf@amazon.com>, Angelina Vu <angelinavu@linux.microsoft.com>, 
	Anna Trikalinou <atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Forrest Yuan Yu <yuanyu@google.com>, James Gowans <jgowans@amazon.com>, 
	James Morris <jamorris@linux.microsoft.com>, John Andersen <john.s.andersen@intel.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, =?utf-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>, 
	Thara Gopinath <tgopinath@microsoft.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, =?utf-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>, 
	dev@lists.cloudhypervisor.org, kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org, 
	x86@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
Message-ID: <20240603.ahNg8waif6Fu@digikod.net>
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com>
 <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com>
 <20240507.ieghomae0UoC@digikod.net>
 <ZjpTxt-Bxia3bRwB@google.com>
 <D15VQ97L5M8J.1TDNQE6KLW6JO@amazon.com>
 <20240514.mai3Ahdoo2qu@digikod.net>
 <ZkUb2IWj4Z9FziCb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkUb2IWj4Z9FziCb@google.com>
X-Infomaniak-Routing: alpha

On Wed, May 15, 2024 at 01:32:24PM -0700, Sean Christopherson wrote:
> On Tue, May 14, 2024, Mickaël Salaün wrote:
> > On Fri, May 10, 2024 at 10:07:00AM +0000, Nicolas Saenz Julienne wrote:
> > > Development happens
> > > https://github.com/vianpl/{linux,qemu,kvm-unit-tests} and the vsm-next
> > > branch, but I'd advice against looking into it until we add some order
> > > to the rework. Regardless, feel free to get in touch.
> > 
> > Thanks for the update.
> > 
> > Could we schedule a PUCK meeting to synchronize and help each other?
> > What about June 12?
> 
> June 12th works on my end.

Can you please send an invite?

 Mickaël

