Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F3254A2D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 18:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBKOL-0005SD-Mw; Thu, 27 Aug 2020 16:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SL7=CF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kBKOK-0005S8-Gv
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 16:04:44 +0000
X-Inumbo-ID: 81856fca-8bde-4658-b861-f6383e2e9d18
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81856fca-8bde-4658-b861-f6383e2e9d18;
 Thu, 27 Aug 2020 16:04:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4CAB2080C;
 Thu, 27 Aug 2020 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598544283;
 bh=pJjXYDhHaAbz50kR7zkxIcdTQY+QrAF9ZkkSbNO46Nc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=D1Wg/Tutq2ZGMt6GgBMtVXA06ZHOPhozDRCs6YBwKTSwKHmvcpQJ7YxW/iX/lgl32
 3T/u2gV5qgH57YUeeAF7PHkUkuanJWDBoMEj951tXwPsi/7Kx2EZQpWrSo2JCT5jsv
 iVjKCpnDVLIdsDYidk1RW2zVMcdfnmtzgj65ljcM=
Date: Thu, 27 Aug 2020 09:04:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
cc: Julien Grall <julien@xen.org>, Simon Leiner <simon@leiner.me>, 
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
In-Reply-To: <18229211-c7b5-21bc-f3a9-4a9a1974094e@suse.com>
Message-ID: <alpine.DEB.2.21.2008270903430.4412@sstabellini-ThinkPad-T480s>
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <eb1c9e1a-d8b5-cfd5-4575-3ae47f99ad44@xen.org>
 <61f11689-8d6b-0407-b76d-ec5c3a57be4c@suse.com>
 <3a1cad1b-3d78-e5b0-0f68-70c245dbcc1a@xen.org>
 <18229211-c7b5-21bc-f3a9-4a9a1974094e@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1807581589-1598544230=:4412"
Content-ID: <alpine.DEB.2.21.2008270904170.4412@sstabellini-ThinkPad-T480s>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1807581589-1598544230=:4412
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008270904171.4412@sstabellini-ThinkPad-T480s>

On Thu, 27 Aug 2020, Jürgen Groß wrote:
> On 27.08.20 10:24, Julien Grall wrote:
> > 
> > 
> > On 27/08/2020 06:21, Jürgen Groß wrote:
> > > On 26.08.20 20:37, Julien Grall wrote:
> > > "Usually" is a bit gross here. The only generic call site I could find
> > > is xenbus_grant_ring(). All other instances (I counted 22) are not
> > > generic at all.
> > > 
> > > > will only catch one instance and it means we would have to fix the first
> > > > instance and then re-run to catch the others.
> > > > 
> > > > So I think we want to switch to WARN_ON() here.
> > > 
> > > No, please don't. In case there would be a frequent path the result
> > > would be a basically unusable system due to massive console clobbering.
> > 
> > Right, but if that's really happenning then you have a much bigger problem
> > on your platform because the address returned will be invalid.
> > 
> > So I still don't see the advantage of WARN_ON_ONCE() here.
> 
> Depends of the (potential) source of the warnings. I think we can agree
> that e.g. a problem in the pv network stack is rather improbable, as it
> would have been detected long ago.
> 
> If, however, the problem is being introduced by one of the rather new
> pv-drivers (like sound, pvcalls, 9pfs) it is perfectly fine to assume
> the overall system is still functional even without those drivers
> working correctly. Having a message storm from those sources is still
> quite undesirable IMO and doesn't really help.

I agree with this.
--8323329-1807581589-1598544230=:4412--

