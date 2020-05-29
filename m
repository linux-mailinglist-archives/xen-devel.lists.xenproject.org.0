Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68391E796E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:28:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebIj-0001SI-Ti; Fri, 29 May 2020 09:27:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jebIi-0001SD-5N
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:27:40 +0000
X-Inumbo-ID: a3d26170-a18e-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3d26170-a18e-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 09:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxZZQfnKFewwzq6TFnDVatgM6OggcVXQyx/sXIIHAcI=; b=w3HrklYNl+P8T19a167HNJaL8z
 gTW5RAxMHFSeAkK0dpCQ7C6ixBME8D9PDndGjhxSAb8Gx2f+aMTJk+D7XMC3YvdHby84LHa6O87z3
 RVaGr5UDNYHAxZyLB6lc5SWcCy12LbxEohF/ximCti8eIVg7r8jXNyzZA4Udn8+0gNKc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jebIf-00084J-GH; Fri, 29 May 2020 09:27:37 +0000
Received: from [212.230.157.105] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jebIf-0008Qa-1D; Fri, 29 May 2020 09:27:37 +0000
Date: Fri, 29 May 2020 11:27:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Message-ID: <20200529092716.GK1195@Air-de-Roger>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
 <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
 <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <077FCC5B-AD47-4707-AF55-12F0455ED26F@arm.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 09:18:42AM +0000, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 29 May 2020, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 29.05.2020 10:13, Bertrand Marquis wrote:
> >>> On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
> >>> AFAICT, there is no restriction on when the runstate hypercall can be called. So this can even be called before the vCPU is brought up.
> >> 
> >> I understand the remark but it still feels very weird to allow an invalid address in an hypercall.
> >> Wouldn’t we have a lot of potential issues accepting an address that we cannot check ?
> > 
> > I don't think so: The hypervisor uses copy_to_guest() to protect
> > itself from the addresses to be invalid at the time of copying.
> > If the guest doesn't make sure they're valid at that time, it
> > simply won't get the information (perhaps until Xen's next
> > attempt to copy it out).
> > 
> > You may want to take a look at the x86 side of this (also the
> > vCPU time updating): Due to the way x86-64 PV guests work, the
> > address may legitimately be unmapped at the time Xen wants to
> > copy it, when the vCPU is currently executing guest user mode
> > code. In such a case the copy gets retried the next time the
> > guest transitions from user to kernel mode (which involves a
> > page table change).
> 
> If I understand everything correctly runstate is updated only if there is
> a context switch in xen while the guest is running in kernel mode and
> if the address is mapped at that time.
> 
> So this is a best effort in Xen and the guest cannot really rely on the
> runstate information (as it might not be up to date).
> Could this have impacts somehow if this is used for scheduling ?
> 
> In the end the only accepted trade off would be to:
> - reduce error verbosity and just ignore it
> - introduce a new system call using a physical address
>   -> Using a virtual address with restrictions sounds very complex
>   to document (current core, no remapping).
> 
> But it feels like having only one hypercall using guest physical addresses
> would not really be logic and this kind of change should be made across
> all hypercalls if it is done.

FRT, there are other hypercalls using a physical address instead of a
linear one, see VCPUOP_register_vcpu_info for example. It's just a
mixed bag right now, with some hypercalls using a linear address and
some using a physical one.

I think introducing a new hypercall that uses a physical address would
be fine, and then you can add a set of restrictions similar to the
ones listed by VCPUOP_register_vcpu_info.

Changing the current hypercall as proposed is risky, but I think the
current behavior is broken by design specially on auto translated
guests, even more with XPTI.

Thanks, Roger.

