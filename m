Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B02768E1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 08:28:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLKit-0007Po-Ds; Thu, 24 Sep 2020 06:27:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StWZ=DB=amazon.com=prvs=52916e0f7=sjpark@srs-us1.protection.inumbo.net>)
 id 1kLKis-0007P5-1o
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 06:27:18 +0000
X-Inumbo-ID: 431743ed-f0c0-4c48-8ec0-b4535abba0f0
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 431743ed-f0c0-4c48-8ec0-b4535abba0f0;
 Thu, 24 Sep 2020 06:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600928837; x=1632464837;
 h=from:to:cc:subject:date:message-id:in-reply-to: mime-version;
 bh=zknW5jJHzdymA6wvIjLBr4rV/FXE51ARi7wGFxmt7nQ=;
 b=KrqgABaE2Ncw17dXyNT3rI/zOqgCoUgcqVrJdb0tYbXiWX4nZK/pGBl4
 eIrxvdZrmTCLG/J5NwWMU7ofUkrXyWTVMRrt3hETNHoIE8R81LHIPwD6s
 xKxTY/XjpHZD//eI/n97XR4fu9l86XOkj6GuEr9TLwfhRc4Rggf/zk/Fn s=;
X-IronPort-AV: E=Sophos;i="5.77,296,1596499200"; d="scan'208";a="56021443"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 24 Sep 2020 06:27:15 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id EB1FB1A03DC; Thu, 24 Sep 2020 06:27:14 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.146) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 24 Sep 2020 06:27:08 +0000
From: SeongJae Park <sjpark@amazon.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: SeongJae Park <sjpark@amazon.com>, <roger.pau@citrix.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Date: Thu, 24 Sep 2020 08:26:53 +0200
Message-ID: <20200924062653.9449-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923200930.GB11767@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.146]
X-ClientProxiedBy: EX13D17UWB004.ant.amazon.com (10.43.161.132) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 23 Sep 2020 16:09:30 -0400 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:

> On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Persistent grants feature provides high scalability.  On some small
> > systems, however, it could incur data copy overhead[1] and thus it is
> > required to be disabled.  But, there is no option to disable it.  For
> > the reason, this commit adds a module parameter for disabling of the
> > feature.
> 
> Would it be better suited to have it per guest?

The latest version of this patchset[1] supports blkfront side disablement.
Could that partially solves your concern?

[1] https://lore.kernel.org/xen-devel/20200923061841.20531-1-sjpark@amazon.com/


Thanks,
SeongJae Park

