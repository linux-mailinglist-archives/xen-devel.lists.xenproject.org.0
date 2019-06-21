Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142054F14B
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTFq-0003UF-Ho; Fri, 21 Jun 2019 23:47:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTFo-0003TQ-Fu
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:47:36 +0000
X-Inumbo-ID: f1a92c30-947e-11e9-a3a0-9bc5fd98009f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1a92c30-947e-11e9-a3a0-9bc5fd98009f;
 Fri, 21 Jun 2019 23:47:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B657220449;
 Fri, 21 Jun 2019 23:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561160855;
 bh=y4WTY28rUDzSkzi922lHwEeKTfOl/eTqiZv4DsOkb5I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OXa/de2fRqWtFb5XlJpmCN17wcXQ3iUmHqPumRVLaoKmmatRbl0dDfQxlxeyGzPO4
 8CU/8Ckj4WVsjp+Z/abzk9jmpNkFPOwLQM2v4I4FgR2bFJTz1jCZ2gsD3XJ/9BCnUV
 fGLB8TmD9pK6uUlC/6W6soISJgs49fRDMojQv2+w=
Date: Fri, 21 Jun 2019 16:47:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <ca98ab78-452b-4429-9310-1a7c3f5bde36@arm.com>
Message-ID: <alpine.DEB.2.21.1906211646020.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-10-git-send-email-sstabellini@kernel.org>
 <1b8217e1-8671-e1e7-d5bc-4b4c144eedd6@arm.com>
 <alpine.DEB.2.21.1905101326060.25766@sstabellini-ThinkPad-T480s>
 <0dc6d4db-7b83-0b8d-77c4-2f97f73a659e@arm.com>
 <20f548ea-eb18-8700-9d1e-53462abbff0c@arm.com>
 <alpine.DEB.2.21.1905201407410.16404@sstabellini-ThinkPad-T480s>
 <c94041e2-8f85-6fd6-21cd-3dd082882854@arm.com>
 <ca98ab78-452b-4429-9310-1a7c3f5bde36@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-75277426-1561160854=:25730"
Subject: Re: [Xen-devel] [PATCH v2 10/10] xen/arm: add reserved-memory
 regions to the dom0 memory node
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
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-75277426-1561160854=:25730
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 5 Jun 2019, Julien Grall wrote:
> Hi,
> 
> On 20/05/2019 23:38, Julien Grall wrote:
> > On 20/05/2019 22:26, Stefano Stabellini wrote:
> > > On Sat, 11 May 2019, Julien Grall wrote:
> > > This is not about privilege over the system: whoever will make the
> > > decision to ask the hypervisor to map the page will have all the
> > > necessary rights to do it.  If the user wants to map a given region,
> > > either because she knows what she is doing, because she is
> > > experimenting, or for whatever reason, I think she should be allowed. In
> > > fact, she can always do it by reverting the patch. So why make it
> > > inconvenient for her?
> > TBH, I am getting very frustrated on reviewing this series. We spent our
> > previous f2f meetings discussing reserved-memory in lengthy way. We also
> > agreed on a plan (see below), but now we are back on square one again...
> > 
> > Yes, a user will need to revert the patch. But then as you said the user
> > would know what he/she is doing. So reverting a patch is not going to be a
> > complication.
> > 
> > However, I already pointed out multiple time that giving permission is not
> > going to be enough. So I still don't see the value of having that in Xen
> > without an easy way to use it.
> > 
> > For reminder, you agreed on the following splitting the series in 3 parts:
> >     - Part 1: Extend iomem to support cacheability
> >     - Part 2: Partially support reserved-memory for Dom0 and don't give
> > iomem permission on them
> >     - Part 3: reserved-memory for guest
> > 
> > I agreed to merge part 1 and 2. Part 3 will be a start for a discussion how
> > this should be supported for guest. I also pointed out that Xilinx can carry
> > part 3 in their tree if they feel like too.
> 
> I just wanted to bump this as I haven't got any feedback on the way forward
> here.
> It should be possible get part 1 and 2 merged for Xen 4.13.

I am about to send an update with Part 2 only. I tried to address all
comments, the only one I didn't address (splitting a function into two),
I mentioned it explicitely.  Apologies if I missed anything, it wasn't
intentional.
--8323329-75277426-1561160854=:25730
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-75277426-1561160854=:25730--

