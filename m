Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C48927914E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 21:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLt1b-00057f-DY; Fri, 25 Sep 2020 19:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kj7V=DC=amazon.com=prvs=53038a08f=anchalag@srs-us1.protection.inumbo.net>)
 id 1kLt1Z-00057a-Ks
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 19:04:53 +0000
X-Inumbo-ID: 0630a9e8-993a-475c-b839-f0cdab34b360
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0630a9e8-993a-475c-b839-f0cdab34b360;
 Fri, 25 Sep 2020 19:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1601060692; x=1632596692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DEwVMNNAxG5t04sf/ERocCPHsXOzC3I1duBnCyy9B6A=;
 b=vn5FNzXT09F3vQscqPFKPQClbZ44DJdsXV/Vi8ft9nEKuDn4JW9Y3A8X
 aTtw811SGpz4Rb02QBpvZAUW5MFRJHzNfbfvh3zQMVHvDSy/Zcxqw1pcP
 xM0IQFo3UTnc9sbtSiw5AwhCW6CvMcTL9zaNIX9TL/lgUDPSJwWl603uT 4=;
X-IronPort-AV: E=Sophos;i="5.77,303,1596499200"; d="scan'208";a="79358644"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 25 Sep 2020 19:04:41 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 115A4A1C3F; Fri, 25 Sep 2020 19:04:40 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 25 Sep 2020 19:04:24 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 25 Sep 2020 19:04:24 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 25 Sep 2020 19:04:24 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 05B2640150; Fri, 25 Sep 2020 19:04:24 +0000 (UTC)
Date: Fri, 25 Sep 2020 19:04:23 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <boris.ostrovsky@oracle.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <jgross@suse.com>, <linux-pm@vger.kernel.org>,
 <linux-mm@kvack.org>, <kamatam@amazon.com>, <sstabellini@kernel.org>,
 <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>,
 <davem@davemloft.net>, <rjw@rjwysocki.net>, <len.brown@intel.com>,
 <pavel@ucw.cz>, <peterz@infradead.org>, <eduval@amazon.com>,
 <sblbir@amazon.com>, <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>, 
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 01/11] xen/manage: keep track of the on-going suspend
 mode
Message-ID: <20200925190423.GA31885@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1598042152.git.anchalag@amazon.com>
 <9b970e12491107afda0c1d4a6f154b52d90346ac.1598042152.git.anchalag@amazon.com>
 <4b2bbc8b-7817-271a-4ff0-5ee5df956049@oracle.com>
 <20200914214754.GA19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <e9b94104-d20a-b6b2-cbe0-f79b1ed09c98@oracle.com>
 <20200915180055.GB19975@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5f1e4772-7bd9-e6c0-3fe6-eef98bb72bd8@oracle.com>
 <20200921215447.GA28503@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <e3e447e5-2f7a-82a2-31c8-10c2ffcbfb2c@oracle.com>
 <20200922231736.GA24215@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200922231736.GA24215@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 22, 2020 at 11:17:36PM +0000, Anchal Agarwal wrote:
> On Tue, Sep 22, 2020 at 12:18:05PM -0400, boris.ostrovsky@oracle.com wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On 9/21/20 5:54 PM, Anchal Agarwal wrote:
> > > Thanks for the above suggestion. You are right I didn't find a way to declare
> > > a global state either. I just broke the above check in 2 so that once we have
> > > support for ARM we should be able to remove aarch64 condition easily. Let me
> > > know if I am missing nay corner cases with this one.
> > >
> > > static int xen_pm_notifier(struct notifier_block *notifier,
> > >       unsigned long pm_event, void *unused)
> > > {
> > >     int ret = NOTIFY_OK;
> > >     if (!xen_hvm_domain() || xen_initial_domain())
> > >       ret = NOTIFY_BAD;
> > >     if(IS_ENABLED(CONFIG_ARM64) && (pm_event == PM_SUSPEND_PREPARE || pm_event == HIBERNATION_PREPARE))
> > >       ret = NOTIFY_BAD;
> > >
> > >     return ret;
> > > }
> > 
> > 
> > 
> > This will allow PM suspend to proceed on x86.
> Right!! Missed it.
> Also, wrt KASLR stuff, that issue is still seen sometimes but I haven't had
> bandwidth to dive deep into the issue and fix it. I seem to have lost your email
> in my inbox hence covering the question here.
> > 
> >
Can I add your Reviewed-by or Signed-off-by to it?
> > -boris
> > 
>
-Anchal

