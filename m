Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8593806E7
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 12:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127322.239274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUjl-00069Y-Vs; Fri, 14 May 2021 10:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127322.239274; Fri, 14 May 2021 10:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUjl-00067I-SS; Fri, 14 May 2021 10:08:05 +0000
Received: by outflank-mailman (input) for mailman id 127322;
 Fri, 14 May 2021 10:08:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+syT=KJ=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1lhUjk-00067A-Ld
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 10:08:04 +0000
Received: from mx2.freebsd.org (unknown [2610:1c1:1:606c::19:2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d55b3dde-8f08-4378-9e93-fa6d2c2f3489;
 Fri, 14 May 2021 10:08:03 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 076D78682A;
 Fri, 14 May 2021 10:08:03 +0000 (UTC)
 (envelope-from royger@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4FhPNf6XZDz3FKW;
 Fri, 14 May 2021 10:08:02 +0000 (UTC)
 (envelope-from royger@freebsd.org)
Received: from localhost (unknown [93.176.185.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 6FCB7236D9;
 Fri, 14 May 2021 10:08:02 +0000 (UTC)
 (envelope-from royger@freebsd.org)
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
X-Inumbo-ID: d55b3dde-8f08-4378-9e93-fa6d2c2f3489
Date: Fri, 14 May 2021 12:07:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@freebsd.org>
To: Julien Grall <julien@xen.org>
Cc: Elliott Mitchell <ehem+undef@m5p.com>, xen-devel@lists.xenproject.org,
	Mitchell Horne <mhorne@freebsd.org>
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
Message-ID: <YJ5L+ar29Q8g+xm+@Air-de-Roger>
References: <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com>
 <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com>
 <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com>
 <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
 <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>

On Fri, May 14, 2021 at 09:32:10AM +0100, Julien Grall wrote:
> Hi Elliott,
> 
> On 14/05/2021 03:42, Elliott Mitchell wrote:
> > Was it intended for the /hypervisor range to dynamically scale with the
> > size of the domain?
> As per above, this doesn't depend on the size of the domain. Instead, this
> depends on what sort of the backend will be present in the domain.

It should instead scale based on the total memory on the system, ie:
if your hardware has 4GB of RAM the unpopulated range should at least
be: 4GB - memory of the current domain, so that it could map any
possible page assigned to a different domain (and even then I'm not
sure we shouldn't account for duplicated mappings).

> > Might it be better to deprecate the /hypervisor range and have domains
> > allocate any available address space for foreign mappings?
> 
> It may be easy for FreeBSD to find available address space but so far this
> has not been the case in Linux (I haven't checked the latest version
> though).
> 
> To be clear, an OS is free to not use the range provided in /hypervisor
> (maybe this is not clear enough in the spec?). This was mostly introduced to
> overcome some issues we saw in Linux when Xen on Arm was introduced.
> 
> > 
> > Should the FreeBSD implementation be treating grant tables as distinct
> > from other foreign mappings?
> 
> Both require unallocated addres space to work. IIRC FreeBSD is able to find
> unallocated space easily, so I would recommend to use it.

I agree. I think the main issue here is that there seems to be some
bug (or behavior not understood properly) with the resource manager
on Arm that returns an error when requesting a region anywhere in the
memory address space, ie: [0, ~0].

> > (is treating them the same likely to
> > induce buggy behavior on x86?)
> 
> I will leave this answer to Roger.

x86 is already treating them the same by using xenmem_alloc to request
memory to map the grant table or foreign mappings, so there's no
change on x86 in that regard.

Maybe I'm not getting that last question right.

Roger.

