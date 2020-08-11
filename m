Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FB241924
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 11:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5QyQ-0005rl-10; Tue, 11 Aug 2020 09:53:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDC2=BV=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k5QyO-0005rg-3p
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 09:53:36 +0000
X-Inumbo-ID: 41587448-bc08-4538-b6a6-8448ffd635f8
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41587448-bc08-4538-b6a6-8448ffd635f8;
 Tue, 11 Aug 2020 09:53:34 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597139612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34NxuTHuuaxlTrp0QBpYwXdJxhoYhWgkXsT79ACXhBI=;
 b=yXFv45j/NkN12I89hPKrRRt3y6IsbXp2z30BW9LR1+SIMEFThp1pdeaQ4LM9L9tiAa69no
 OxF24BGPWPyOplVt5AYdHm0lzBQPC7WqiZBg7GprfATjSKTVoHqu7aZNMhwmN8VMuE7VzF
 PU4DBYxA9+atj4AOLidlBQ71941w/45ny6a9eL9yMvPKZHRm08ocVrwOr4tN6lc2EbCfi2
 dFobLLI83Tl6TLwvgx01ezVcJ6H2SRevkfo3LB4VAsKYpsUY5bPf3nqv2pfT6ZqSxqVVCZ
 MUc+cyl80tzreWSxW2glFKK9WZ4rsz6Zwwl0yY+5FvSLfHBKxEcOyFg3+KRE+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597139612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34NxuTHuuaxlTrp0QBpYwXdJxhoYhWgkXsT79ACXhBI=;
 b=neMWOMBKOlsGBQxKGobT2vLvpDelklSE+tFhByonXtY94FggYvZ0ZvmMgZA35XKqEp1WwM
 Hbwv0AiwaKv3KDAA==
To: "Dey\, Megha" <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 02/18] irq/dev-msi: Add support for a new DEV_MSI
 irq domain
In-Reply-To: <87ft8uxjga.fsf@nanos>
References: <87h7tcgbs2.fsf@nanos.tec.linutronix.de> <87ft8uxjga.fsf@nanos>
Date: Tue, 11 Aug 2020 11:53:31 +0200
Message-ID: <87d03x5x0k.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "hpa@zytor.com" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "netanelg@mellanox.com" <netanelg@mellanox.com>,
 Marc Zyngier <maz@kernel.org>, "Lin, Jing" <jing.lin@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "Ortiz, Samuel" <samuel.ortiz@intel.com>,
 "yan.y.zhao@linux.intel.com" <yan.y.zhao@linux.intel.com>,
 xen-devel@lists.xenproject.org, "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan
 J" <dan.j.williams@intel.com>, "Lu, Baolu" <baolu.lu@intel.com>,
 Juergen Gross <jgross@suse.com>, "Luck, Tony" <tony.luck@intel.com>, "Hossain,
 Mona" <mona.hossain@intel.com>, "vkoul@kernel.org" <vkoul@kernel.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Thomas Gleixner <tglx@linutronix.de> writes:

CC+: XEN folks

> Thomas Gleixner <tglx@linutronix.de> writes:
>> The infrastructure itself is not more than a thin wrapper around the
>> existing msi domain infrastructure and might even share code with
>> platform-msi.
>
> And the annoying fact that you need XEN support which opens another can
> of worms...

which needs some real cleanup first.

x86 still does not associate the irq domain to devices at device
discovery time, i.e. the device::msi_domain pointer is never populated.

So to support this new fangled device MSI stuff we'd need yet more
x86/xen specific arch_*msi_irqs() indirection and hackery, which is not
going to happen.

The right thing to do is to convert XEN MSI support over to proper irq
domains. This allows to populate device::msi_domain which makes a lot of
things simpler and also more consistent.

Thanks,

        tglx

