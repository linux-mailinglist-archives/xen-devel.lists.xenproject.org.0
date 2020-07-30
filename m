Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFA233BED
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 01:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Hde-0004Je-V8; Thu, 30 Jul 2020 23:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G63=BJ=amazon.com=prvs=473b2afd7=anchalag@srs-us1.protection.inumbo.net>)
 id 1k1Hdd-0004JZ-9l
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 23:07:01 +0000
X-Inumbo-ID: 5f2241ec-d2b9-11ea-8dee-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f2241ec-d2b9-11ea-8dee-bc764e2007e4;
 Thu, 30 Jul 2020 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1596150421; x=1627686421;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=7vMrFvtUTBg/lhMoMFfi8NrSvzxD5ruFtgpTJwVUKIE=;
 b=Sy3nT18hAsrqiQ2zpjwTU5xG8Gfqb8e59l6yda9R0Hzsr7XoDr9m9nHD
 i3ELluJGFVhVBeD2iBNLK29S6Gs82hkerQnKxL9hzgd5Qfd0IcrOxxDKs
 vdy7k7C40AySq/0w22cGhPrBjTRJxr0WRIWiCA3EGd7hH0GNTEZ8JEiDn k=;
IronPort-SDR: QtZ+XaoPa1wpxqYDTq2G1f0sXs4cmexTY/A+g/lEhuRJZ3WCcxB5sOu3b78fnTjQ8rKbrbn3ky
 jsdilpsZgCJg==
X-IronPort-AV: E=Sophos;i="5.75,415,1589241600"; d="scan'208";a="64407396"
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Jul 2020 23:06:55 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 143F3A2573; Thu, 30 Jul 2020 23:06:47 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 30 Jul 2020 23:06:35 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 30 Jul 2020 23:06:35 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Thu, 30 Jul 2020 23:06:35 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id BFA4640384; Thu, 30 Jul 2020 23:06:34 +0000 (UTC)
Date: Thu, 30 Jul 2020 23:06:34 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200730230634.GA17221@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
 <20200721000348.GA19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <408d3ce9-2510-2950-d28d-fdfe8ee41a54@oracle.com>
 <alpine.DEB.2.21.2007211640500.17562@sstabellini-ThinkPad-T480s>
 <20200722180229.GA32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007221645430.17562@sstabellini-ThinkPad-T480s>
 <20200723225745.GB32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007241431280.17562@sstabellini-ThinkPad-T480s>
 <66a9b838-70ed-0807-9260-f2c31343a081@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <66a9b838-70ed-0807-9260-f2c31343a081@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: x86@kernel.org, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 pavel@ucw.cz, hpa@zytor.com, Stefano Stabellini <sstabellini@kernel.org>,
 eduval@amazon.com, mingo@redhat.com, xen-devel@lists.xenproject.org,
 sblbir@amazon.com, axboe@kernel.dk, konrad.wilk@oracle.com, bp@alien8.de,
 tglx@linutronix.de, jgross@suse.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, kamatam@amazon.com,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 27, 2020 at 06:08:29PM -0400, Boris Ostrovsky wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 7/24/20 7:01 PM, Stefano Stabellini wrote:
> > Yes, it does, thank you. I'd rather not introduce unknown regressions so
> > I would recommend to add an arch-specific check on registering
> > freeze/thaw/restore handlers. Maybe something like the following:
> >
> > #ifdef CONFIG_X86
> >     .freeze = blkfront_freeze,
> >     .thaw = blkfront_restore,
> >     .restore = blkfront_restore
> > #endif
> >
> >
> > maybe Boris has a better suggestion on how to do it
> 
> 
> An alternative might be to still install pm notifier in
> drivers/xen/manage.c (I think as result of latest discussions we decided
> we won't need it) and return -ENOTSUPP for ARM for
> PM_HIBERNATION_PREPARE and friends. Would that work?
>
I think the question here is for registering driver specific freeze/thaw/restore
callbacks for x86 only. I have dropped the pm_notifier in the v3 still pending
testing. So I think just registering driver specific callbacks for x86 only is a
good option. What do you think?

Anchal
> 
> -boris
> 
> 
> 

