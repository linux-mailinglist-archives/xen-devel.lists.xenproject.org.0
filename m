Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D073711F61
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 07:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539914.841338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2QIn-0008BX-07; Fri, 26 May 2023 05:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539914.841338; Fri, 26 May 2023 05:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2QIm-00089s-Tg; Fri, 26 May 2023 05:47:48 +0000
Received: by outflank-mailman (input) for mailman id 539914;
 Fri, 26 May 2023 02:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muQi=BP=linux.microsoft.com=jamorris@srs-se1.protection.inumbo.net>)
 id 1q2NJU-0001ga-TG
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 02:36:20 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1825963e-fb6e-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 04:36:19 +0200 (CEST)
Received: by linux.microsoft.com (Postfix, from userid 1001)
 id 1932320FBE98; Thu, 25 May 2023 19:36:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
 by linux.microsoft.com (Postfix) with ESMTP id 1639D30013A9;
 Thu, 25 May 2023 19:36:18 -0700 (PDT)
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
X-Inumbo-ID: 1825963e-fb6e-11ed-b230-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1932320FBE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1685068578;
	bh=QsI2Tqrh7Dq8rATEw0dJAIe6Y8MEWIZaKj+0i4m1b94=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rc/phama1ktXAiy+vs2NVCSXABwbcfYCYzvoNhWo6b4QznrBTZJyht2XFXGcOWpXT
	 eN3vRQ77IyNVtRNsEt3dUwkwOKfWmDDqOGFtsKRkzHP0DTyYh3PuCH9zyVE+5kTU93
	 rssQ3lVi3y4biGwhIuiBnmIaxdqEKLD8WYOLFyno=
Date: Thu, 25 May 2023 19:36:18 -0700 (PDT)
From: James Morris <jamorris@linux.microsoft.com>
To: =?ISO-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
    Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>, 
    Sean Christopherson <seanjc@google.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
    Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>, 
    John Andersen <john.s.andersen@intel.com>, 
    Liran Alon <liran.alon@oracle.com>, 
    "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, 
    Marian Rotariu <marian.c.rotariu@gmail.com>, 
    =?UTF-8?Q?Mihai_Don=C8=9Bu?= <mdontu@bitdefender.com>, 
    =?UTF-8?Q?Nicu=C8=99or_C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>, 
    Rick Edgecombe <rick.p.edgecombe@intel.com>, 
    Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>, 
    Zahra Tarkhani <ztarkhani@microsoft.com>, 
    =?UTF-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>, 
    dev@lists.cloudhypervisor.org, kvm@vger.kernel.org, 
    linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
    qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org, 
    x86@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v1 0/9] Hypervisor-Enforced Kernel Integrity
In-Reply-To: <20230505152046.6575-1-mic@digikod.net>
Message-ID: <17f62cb1-a5de-2020-2041-359b8e96b8c0@linux.microsoft.com>
References: <20230505152046.6575-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

[Side topic]

Would folks be interested in a Linux Plumbers Conference MC on this 
topic generally, across different hypervisors, VMMs, and architectures?

If so, please let me know who the key folk would be and we can try writing 
up an MC proposal.



-- 
James Morris
<jamorris@linux.microsoft.com>

