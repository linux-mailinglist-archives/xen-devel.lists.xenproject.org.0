Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D723CDB7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 19:43:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3NRA-0005zC-UH; Wed, 05 Aug 2020 17:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQ3y=BP=amazon.com=prvs=479808023=anchalag@srs-us1.protection.inumbo.net>)
 id 1k3NR9-0005z7-GB
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 17:42:47 +0000
X-Inumbo-ID: 5426db28-2a1c-4b93-85b2-055c0a10ca65
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5426db28-2a1c-4b93-85b2-055c0a10ca65;
 Wed, 05 Aug 2020 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1596649367; x=1628185367;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=lNEkMbYi0vdrAauS7Kx1F2bZJKjVMy/W93IpO/fQsUY=;
 b=Fm6joPKFAVmwAkSmSuDiGnD7vVXqrnmajd3Am0kq/CpoJO3FbNIrY6py
 14raY8atiI10mrwX80EUIUmiaXIsyZ7N1WOakfgRfqv8DrMuGVa7lpK28
 ZTImJ0P6hBK+xf/ZRsknkuLA+1Mg3toe48eITJj9HKd9xCjEkxkKD2cdW A=;
IronPort-SDR: 9ySw8fWle7MttK7suY4BIhxnPpUpw/OAAJafe5LAcUtSaR7nXlHuY3JimXe5qJR44ypaJ2YRoP
 96gheUehfPyA==
X-IronPort-AV: E=Sophos;i="5.75,438,1589241600"; d="scan'208";a="57653120"
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 05 Aug 2020 17:42:44 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com (Postfix) with ESMTPS
 id C5250A2967; Wed,  5 Aug 2020 17:42:42 +0000 (UTC)
Received: from EX13D08UEB001.ant.amazon.com (10.43.60.245) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 5 Aug 2020 17:42:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEB001.ant.amazon.com (10.43.60.245) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 5 Aug 2020 17:42:20 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Wed, 5 Aug 2020 17:42:19 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id D027740865; Wed,  5 Aug 2020 17:42:19 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:42:19 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200805174219.GA16105@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <alpine.DEB.2.21.2007211640500.17562@sstabellini-ThinkPad-T480s>
 <20200722180229.GA32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007221645430.17562@sstabellini-ThinkPad-T480s>
 <20200723225745.GB32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007241431280.17562@sstabellini-ThinkPad-T480s>
 <66a9b838-70ed-0807-9260-f2c31343a081@oracle.com>
 <20200730230634.GA17221@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <53b577a3-6af9-5587-7e47-485be38b3653@oracle.com>
 <20200804234201.GA23820@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <50d0dbe1-533e-792a-6916-8c72d623064a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50d0dbe1-533e-792a-6916-8c72d623064a@oracle.com>
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

On Wed, Aug 05, 2020 at 09:31:13AM -0400, Boris Ostrovsky wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 8/4/20 7:42 PM, Anchal Agarwal wrote:
> >
> > I think this could be done. PM_HIBERNATION_PREPARE could return -ENOTSUPP
> > for arm and pvh dom0 when the notifier call chain is invoked for this case
> > in hibernate(). This will then be an empty notifier just for checking two
> > usecases.
> > Also, for pvh dom0, the earlier code didn't register any notifier,
> > with this approach you are suggesting setup the notifier for hvm/pvh dom0 and
> > arm but fail during notifier call chain during PM_HIBERNATION_PREPARE ?
> 
> 
> Right.
> 
> 
> (Although the earlier code did register the notifier:
> xen_setup_pm_notifier() would return an error for !xen_hvm_domain() and
> PVH *is* an HVM domain, so registration would actually happen)
>
Yes you are right. My bad, what I meant with "earlier code" was whatever we
discussed w.r.t to removing the notifier all together, it won't be registered for
pvh dom0.
Anyways got the point :)
> 
> >
> > I think still getting rid of suspend mode that was earlier a part of this
> > notifier is a good idea as it seems redundant as you pointed out earlier.
> 
> 
> Yes.
> 
> 
> -boris
Thanks,
Anchal
> 
> 

