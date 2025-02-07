Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89793A2CEB7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 22:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884003.1293800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgVYP-0002F8-1d; Fri, 07 Feb 2025 21:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884003.1293800; Fri, 07 Feb 2025 21:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgVYO-0002D8-V2; Fri, 07 Feb 2025 21:06:24 +0000
Received: by outflank-mailman (input) for mailman id 884003;
 Fri, 07 Feb 2025 21:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTXj=U6=desiato.srs.infradead.org=BATV+283d3205a5fdf6ec7e2e+7838+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tgVYM-0002D2-Lk
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 21:06:23 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bcbffa9-e597-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 22:06:13 +0100 (CET)
Received: from [2001:8b0:10b:5:4b09:6838:d292:2864] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tgVY9-0000000HJY6-1q3T; Fri, 07 Feb 2025 21:06:09 +0000
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
X-Inumbo-ID: 5bcbffa9-e597-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LZO3COT8kUUb9a66R4TRMCeBBKOc0btjWfEndw9H1KY=; b=l5qEclpUeZ40bJSc747L1wcntK
	+EwqoEUUFCXt/4AzXtSJfM4VZYHcRU5N0CtxoJeWdTYWUAr0+DwUB2h+91ptSCiWSFHK6DCXul3av
	MnYBayP/s4n9U6CYUZcS4+W7fvHk2TI53BBM+sjuxlAOyt1hg0Z+gCTnYyarIEh3IpUtYUvJiqeGs
	/zIPOANuqOOR9GbxEYt9rlnt0U04f4XHgCgAJBy2zk+JlIx4nXgmrgbNKMPYKvstb2WCTT9qAQmkU
	u7KR7bl0F0OtkY/mje1VLvJxphkvCCvxzTiaou3N8iH2+qrBeWhNA5E44jQ4GPBmtvvJJ30yItHHf
	TaJo8auA==;
Date: Fri, 07 Feb 2025 21:06:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Sean Christopherson <seanjc@google.com>
CC: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org, kvm@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_i386/xen=3A_Move_KVM=5FXEN=5F?=
 =?US-ASCII?Q?HVM=5FCONFIG_ioctl_to_kvm=5Fxen=5Finit=5Fvcpu=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z6YoxFOaMdNiD_uv@google.com>
References: <20250207143724.30792-1-dwmw2@infradead.org> <Z6YoxFOaMdNiD_uv@google.com>
Message-ID: <A51B44C4-5D78-4D8A-A6EB-DA937377F6CE@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 7 February 2025 15:37:40 GMT, Sean Christopherson <seanjc@google=2Ecom> =
wrote:
>On Fri, Feb 07, 2025, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> At the time kvm_xen_init() is called, hyperv_enabled() doesn't yet work=
, so
>> the correct MSR index to use for the hypercall page isn't known=2E
>>=20
>> Rather than setting it to the default and then shifting it later for th=
e
>> Hyper-V case with a confusing second call to kvm_init_xen(), just do it
>> once in kvm_xen_init_vcpu()=2E
>
>Is it possible the funky double-init is deliberate, to ensure that Xen is
>configured in KVM during VM setup?  I looked through KVM and didn't see a=
ny
>obvious dependencies, but that doesn't mean a whole lot=2E

I am fairly sure there are no such dependencies=2E It was just this way be=
cause shifting the MSR to accommodate Hyper-V (and making kvm_xen_init() id=
empotent in order to do so) was an afterthought=2E In retrospect, I should =
have done it this way from the start=2E It's cleaner=2E And you don't requi=
re as much caffeine to understand it :)

