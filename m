Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BF7180FB
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541780.844874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4LWy-0004K1-EK; Wed, 31 May 2023 13:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541780.844874; Wed, 31 May 2023 13:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4LWy-0004IM-BZ; Wed, 31 May 2023 13:06:24 +0000
Received: by outflank-mailman (input) for mailman id 541780;
 Wed, 31 May 2023 13:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibWb=BU=bombadil.srs.infradead.org=BATV+b81a8c9a6d22e8bb2302+7220+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q4LWw-0004IG-LV
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:06:23 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee7fcd44-ffb3-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 15:06:20 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q4LWl-00HUSK-1J; Wed, 31 May 2023 13:06:11 +0000
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
X-Inumbo-ID: ee7fcd44-ffb3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U9SykjTbl/OmSzNnS/VGmSZL4PA7bSh1J2szdt4a2Pw=; b=LbVnJ7tohLEudtorXqpRDpDZN3
	KXS1escUUdY/DOXE7glxtWC7fv9LCCpxim1GaC10rWst+5gsMqchki8IHRmidw7fP3Yp+eFn94KqR
	Sk3dPh8FTOHJx2C/NuNLtFTFLLg+Fd8C4Yr7YSG/vtsfYoF9ppSAaq2sz008A8aZIJk5eS/zyxQ8v
	XHhHoV4dijEof0Mg945LcJZFOINy4hrdPsD4A7V6Rvu5BcvrgpgHFOemHsIeOS9qELyCYqpg8Dm/9
	/VlSeRJ7BRB3iK335gAVE7bN5LCpjoCYZ6HS0gO8oj60ZKSJ/+BciNQmRVyAgUc4NgSQJYtOl37ba
	/yKTbOYw==;
Date: Wed, 31 May 2023 06:06:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 00/16] Diskseq support in loop,
 device-mapper, and blkback
Message-ID: <ZHdGQz/hZJhiShH3@infradead.org>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, May 30, 2023 at 04:31:00PM -0400, Demi Marie Obenour wrote:
> This work aims to allow userspace to create and destroy block devices
> in a race-free way, and to allow them to be exposed to other Xen VMs via
> blkback without races.
> 
> Changes since v1:
> 
> - Several device-mapper fixes added.

Let's get these reviewed by the DM maintainers independently.  This
series is mixing up way too many things.

