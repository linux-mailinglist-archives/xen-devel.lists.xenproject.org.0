Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C81E79D6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 11:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jebeH-0003aA-UO; Fri, 29 May 2020 09:49:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jebeF-0003a5-VC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 09:49:56 +0000
X-Inumbo-ID: c0163aa2-a191-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0163aa2-a191-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOmCYfViT/gnMVzEfQOK08rkdIYmB9uvCDe9hw0Yw5Y=; b=CdoVjT0Z8XSHGVcO/KWT3rhrip
 AtQSdn2RcYzae1lcl8ig2HRWcrOfzx1hLHmKGhxAlbi4NCANThJppbAbCjDYtjP4mP3JVZQ872d0I
 /9xkvKKRz1Lp32/bL5so75g+W3RVw8t/sLrBrMRmb2XRbQDahG3oQn/VUAqHHG4HpJVo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jebeC-00005E-NV; Fri, 29 May 2020 09:49:52 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jebeC-0001Jo-C7; Fri, 29 May 2020 09:49:52 +0000
Message-ID: <bb5b3e39f59e652dd4040fcfe936334aa1a6d17b.camel@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
From: Hongyan Xia <hx242@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Date: Fri, 29 May 2020 10:49:49 +0100
In-Reply-To: <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-05-29 at 08:13 +0000, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Bertrand,
> > 
> > Thank you for the patch.
> > 
> > On 28/05/2020 16:25, Bertrand Marquis wrote:
> > > At the moment on Arm, a Linux guest running with KTPI enabled
> > > will
> > > cause the following error when a context switch happens in user
> > > mode:
> > > (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> > > 0xffffff837ebe0cd0
> > > This patch is modifying runstate handling to map the area given
> > > by the
> > > guest inside Xen during the hypercall.
> > > This is removing the guest virtual to physical conversion during
> > > context
> > > switches which removes the bug
> > 
> > It would be good to spell out that a virtual address is not stable.
> > So relying on it is wrong.
> > 
> > > and improve performance by preventing to
> > > walk page tables during context switches.
> > 
> > With Secret free hypervisor in mind, I would like to suggest to
> > map/unmap the runstate during context switch.
> > 
> > The cost should be minimal when there is a direct map (i.e on Arm64
> > and x86) and still provide better performance on Arm32.
> 
> Even with a minimal cost this is still adding some non real-time
> behaviour to the context switch.
> But definitely from the security point of view as we have to map a
> page from the guest, we could have accessible in Xen some data that
> should not be there.
> There is a trade here where:
> - xen can protect by map/unmapping
> - a guest which wants to secure his data should either not use it or
> make sure there is nothing else in the page
> 
> That sounds like a thread local storage kind of problematic where we
> want data from xen to be accessible fast from the guest and easy to
> be modified from xen.

Can't we just map it into the per-domain region, so that the mapping
and unmapping of runstate is baked into the per-domain region switch
itself during context switch?

Anyway, I am glad to help with secret-free bits if required, although
my knowledge on the Xen Arm side is limited.

Hongyan


