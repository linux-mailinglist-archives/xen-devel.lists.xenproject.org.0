Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC93899AF
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 01:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130508.244437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljVLV-0001jP-Te; Wed, 19 May 2021 23:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130508.244437; Wed, 19 May 2021 23:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljVLV-0001hF-Pa; Wed, 19 May 2021 23:11:21 +0000
Received: by outflank-mailman (input) for mailman id 130508;
 Wed, 19 May 2021 23:11:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fN8=KO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ljVLU-0001h9-KP
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 23:11:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aab6d8f6-e046-487a-848a-5aae1e1d0b5a;
 Wed, 19 May 2021 23:11:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A37C16135A;
 Wed, 19 May 2021 23:11:18 +0000 (UTC)
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
X-Inumbo-ID: aab6d8f6-e046-487a-848a-5aae1e1d0b5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621465878;
	bh=EvFrIr6fZy8YEMJUnzLDKEcfcg+OZxPugZIf/czZVko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pL0XCRuTIW3VYsZLlwzkbwsPBtrYA8/P3wgI388dwFY/xiYNnZwUQuyzzeKCRsd3h
	 Kb2R+06vsDak29xzOov67/jxkBLDQQHvm9ybmiuRkxyAj3qu6fA+JASWqQCTeumv5J
	 qfLwOd5/9Zhfpc5q4mIC6ZOX+DbhBqLG63qdQ6x05MeCQN/2dwrXmlHAlHQea5Qcnj
	 Sdzb8tvfSuE6iGtsBbmWwp//uCGfXmGkv5M5rYPQZmgmTN7cXb1Af12kwTX48N31Xf
	 g1g6/BLvV1ixf4CP9HnRRBX+A9cNXOYjchARHYclEP1J1tc9G5gUwR5I2brX6XinTA
	 rgp5IXbnHgayA==
Date: Wed, 19 May 2021 16:11:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Hand over of the Xen shared info page
In-Reply-To: <8d1ecf6c-a0d1-d9bc-5daf-d02a34fff1e6@xen.org>
Message-ID: <alpine.DEB.2.21.2105191604130.14426@sstabellini-ThinkPad-T480s>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com> <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org> <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com> <8d1ecf6c-a0d1-d9bc-5daf-d02a34fff1e6@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 May 2021, Julien Grall wrote:
> On 14/05/2021 10:50, Anastasiia Lukianenko wrote:
> > Hi Julien!
> 
> Hello,
> 
> > On Thu, 2021-05-13 at 09:37 +0100, Julien Grall wrote:
> > > 
> > > On 13/05/2021 09:03, Anastasiia Lukianenko wrote:
> > > The alternative is for U-boot to go through the DT and infer which
> > > regions are free (IOW any region not described).
> > 
> > Thank you for interest in the problem and advice on how to solve it.
> > Could you please clarify how we could find free regions using DT in U-
> > boot?
> 
> I don't know U-boot code, so I can't tell whether what I suggest would work.
> 
> In theory, the device-tree should described every region allocated in address
> space. So if you parse the device-tree and create a list (or any
> datastructure) with the regions, then any range not present in the list would
> be free region you could use.

Yes, any "empty" memory region which is neither memory nor MMIO should
work.


> However, I realized a few days ago that the magic pages are not described in
> the DT. We probably want to fix it by marking the page as "reserved" or create
> a specific bindings.
> 
> So you will need a specific quirk for them.

It should also be possible to keep the shared info page allocated and
simply pass the address to the kernel by adding the right node to device
tree. To do that, we would have to add a description of the magic pages
to device tree, which I think would be good to have in any case. In that
case it would be best to add a proper binding for it under the "xen,xen"
node.

