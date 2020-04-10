Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135CD1A488F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 18:37:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMweZ-0006KT-Ce; Fri, 10 Apr 2020 16:37:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PXqy=52=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jMweY-0006KM-Qi
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 16:37:14 +0000
X-Inumbo-ID: 888a97c2-7b49-11ea-83d8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 888a97c2-7b49-11ea-83d8-bc764e2007e4;
 Fri, 10 Apr 2020 16:37:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98BE820769;
 Fri, 10 Apr 2020 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586536633;
 bh=5PS9fYIZDPDoLe+uz2ZQEmHmHiSdkQspw450gTNWdbM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VJRmePrBvXI8TCXivjL7StG5JYI6ck+HVHkozi7pLdtzcwDDp209h84iWc0le6if/
 PeZ6Qa9KaUvpVjNQ5RHEIK3SOGx927wx0hz4bkaMq+ltfXIL+1okr8OTqKFtKvLIGV
 q2sASmkee9Qg5JJDQpMTB9k6jlUERFmXVS6ATtHw=
Date: Fri, 10 Apr 2020 09:37:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>, jbeulich@suse.com
Subject: Re: preparations for 4.13.1 and 4.12.3
In-Reply-To: <86c6ffb6-22d0-cbce-8682-dac37697bbfd@xen.org>
Message-ID: <alpine.DEB.2.21.2004100926350.19608@sstabellini-ThinkPad-T480s>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
 <86c6ffb6-22d0-cbce-8682-dac37697bbfd@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 10 Apr 2020, Julien Grall wrote:
> On 09/04/2020 08:41, Jan Beulich wrote:
> > All,
> 
> Hi Jan & Stefano,
> 
> > the releases are due in a week or two. Please point out backports
> > you find missing from the respective staging branches, but which
> > you consider relevant. (Ian, I notice there haven't been any
> > tools side backports at all so far. Julien, Stefano - same for
> > Arm.)
> 
> Below a list of suggested backport for Arm for 4.12 and 4.13:
> 
> b4637ed6cd5375f04ac51d6b900a9ccad6c6c03a  xen/arm: initialize vpl011 flag
> register
> b31666c8912bf18d9eff963b06d856e7e818ff34  xen/arm: during efi boot, improve
> the check for usable memory
> f14f55b7ee295277c8dd09e37e0fa0902ccf7eb4  xen/arm: remove physical timer
> offset
> 3c601c5f056fba055b7a1438b84b69fc649275c3  xen/arm: Sign extend TimerValue when
> computing the CompareValue


Thanks! I did these four and also the following:

69da7d5440c609c57c5bba9a73b91c62ba2852e6 xen/arm: Handle unimplemented VGICv3 registers as RAZ/WI



Jan,

I think the following could be a good candidate. It also touches x86 so
I thought I should ask you.

6827bea2b3b99153821b8b7446bdced27f720188 dom0-build: fix build with clang5

