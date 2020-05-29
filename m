Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F51E7EA0
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:27:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jef29-0000IQ-PU; Fri, 29 May 2020 13:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jef28-0000IL-21
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:26:48 +0000
X-Inumbo-ID: 0bad9e7e-a1b0-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bad9e7e-a1b0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=y9d3Sz8TkZs8K4+aocoQALMZMUfk0CJsw4anA87e/mQ=; b=fKLRYmggfk771pQEovQC9Jfuby
 DE6ZqkPi70Hu4cVD6H6/qgl7289Kq64ApRlXBFpzhOLOm4k6R2TG0DI6A2McTvs+lDZvboolYRJjl
 X8TUD7Rm4bH0DA3gjJOpoS0jQiMYjRTzsdJO5pP8z+6KrMjv/eKgEzLdv9E6YujIMbT0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jef25-0005FB-Oa; Fri, 29 May 2020 13:26:45 +0000
Received: from [212.230.157.105] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jef25-0007ZM-8N; Fri, 29 May 2020 13:26:45 +0000
Date: Fri, 29 May 2020 15:26:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Message-ID: <20200529132020.GN1195@Air-de-Roger>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
 <B5889544-3EB5-41ED-8428-8BCA05269371@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <B5889544-3EB5-41ED-8428-8BCA05269371@arm.com>
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

On Fri, May 29, 2020 at 08:32:51AM +0000, Bertrand Marquis wrote:
> Hi Jan
> 
> > On 29 May 2020, at 08:35, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 28.05.2020 20:54, Julien Grall wrote:
> >> On 28/05/2020 16:25, Bertrand Marquis wrote:
> >>> At the moment on Arm, a Linux guest running with KTPI enabled will
> >>> cause the following error when a context switch happens in user mode:
> >>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> >>> 
> >>> This patch is modifying runstate handling to map the area given by the
> >>> guest inside Xen during the hypercall.
> >>> This is removing the guest virtual to physical conversion during context
> >>> switches which removes the bug
> >> 
> >> It would be good to spell out that a virtual address is not stable. So 
> >> relying on it is wrong.
> > 
> > Guests at present are permitted to change the mapping underneath the
> > virtual address provided (this may not be the best idea, but the
> > interface is like it is). Therefore I don't think the present
> > interface can be changed like this. Instead a new interface will need
> > adding which takes a guest physical address instead. (Which, in the
> > end, will merely be one tiny step towards making the hypercall
> > interfaces use guest physical addresses. And it would be nice if an
> > overall concept was hashed out first how that conversion should
> > occur, such that the change here could at least be made fit that
> > planned model. For example, an option might be to retain all present
> > hypercall numbering and simply dedicate a bit in the top level
> > hypercall numbers indicating whether _all_ involved addresses for
> > that operation are physical vs virtual ones.)
> 
> I definitely fully agree that moving to interfaces using physical addresses
> would definitely be better but would need new hypercall numbers (or the
> bit system you suggest) to keep backward compatibility.
> 
> Regarding the change of virtual address, even though this is theoretically
> possible with the current interface I do not really see how this could be
> handled cleanly with KPTI or even without it as this would not be an atomic
> change on the guest side so the only way to cleanly do this would be to
> do an hypercall to remove the address in xen and then recall the hypercall
> to register the new address.
> 
> So the only way to solve the KPTI issue would actually be to create a new
> hypercall and keep the current bug/problem ?

I think you will find it easier to just introduce a new hypercall that
uses a physical address and has a set of restrictions similar to
VCPUOP_register_vcpu_info for example than to bend the current
hypercall into doing something sane.

TBH I would just remove the error message on Arm from the current
hypercall, I don't think it's useful. If there's corruption caused by
the hypercall we could always make it a noop and simply update the
runstate area only once at registration and leave it like that. The
guest should check the timestamp in the data and realize the
information is stale.

Roger.

