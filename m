Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A9255912
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 13:04:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBcAw-0007YV-8e; Fri, 28 Aug 2020 11:04:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HK1f=CG=amazon.co.uk=prvs=50283cf21=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kBcAv-0007YQ-7R
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 11:04:05 +0000
X-Inumbo-ID: f5cab2d6-9d72-4719-bc2b-0a7daefe45de
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5cab2d6-9d72-4719-bc2b-0a7daefe45de;
 Fri, 28 Aug 2020 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1598612644; x=1630148644;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=CDq7xKYPkkt7PuHYQl2qxutKjlq8b16rcswrdQtwq3k=;
 b=krfd5tDZjDHWCXM8j8ECI2/d1W6NxF8oS2ZHL4fiw9zb21SVc1s7GdZD
 O8qkxnmsr+BnHX+evmrpbpJJpS6RvBXHBY3KBzhIst5bhS6YistStGveQ
 rS7PZ7uFMkAXhdZrPn2nEj824CkaK8q/8I08L3gYOTq29TBjCWYq0HAYM s=;
X-IronPort-AV: E=Sophos;i="5.76,363,1592870400"; d="scan'208";a="50515814"
Subject: RE: [PATCH v3 0/8] tools: propogate MTU to vif frontends
Thread-Topic: [PATCH v3 0/8] tools: propogate MTU to vif frontends
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 28 Aug 2020 11:04:04 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id CE811240C49; Fri, 28 Aug 2020 11:04:00 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 28 Aug 2020 11:03:59 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 28 Aug 2020 11:03:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Thread-Index: AQEumUhvHiZ3DlNpPSS634pQPp7DggFfRPU1qpIo75A=
Date: Fri, 28 Aug 2020 11:03:59 +0000
Message-ID: <6071f14fbf4f467482a668f7134940ac@EX13D32EUC003.ant.amazon.com>
References: <20200811080202.31163-1-paul@xen.org>
 <20200827095805.6mg3oolt5s246mku@liuwe-devbox-debian-v2>
In-Reply-To: <20200827095805.6mg3oolt5s246mku@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.196]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 27 August 2020 10:58
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>=
; Andrew Cooper
> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@citrix.com>; =
George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan =
Beulich <jbeulich@suse.com>;
> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org=
>; Wei Liu <wl@xen.org>
> Subject: RE: [EXTERNAL] [PATCH v3 0/8] tools: propogate MTU to vif fronte=
nds
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open
> attachments unless you can confirm the sender and know the content is saf=
e.
>=20
>=20
>=20
> On Tue, Aug 11, 2020 at 09:01:54AM +0100, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > This is an expansion from v2 of the series to include the facility to s=
et
> > the MTU in the vif config.
> >
> > There is also one cleanup patch to remove the defunct 'vif2' script.
> >
> > Paul Durrant (8):
> >   public/io/netif: specify MTU override node
> >   tools/hotplug/Linux: re-factor add_to_bridge() in
> >     xen-network-common.sh
> >   tools/hotplug/Linux: add remove_from_bridge()
> >   tools/hotplug/Linux: remove code duplication in vif-bridge
> >   libxl: wire the libxl_device_nic 'mtu' value into xenstore
> >   tools/hotplug/Linux: modify set_mtu() to optionally use a configured
> >     value...
> >   xl: add 'mtu' option to network configuration
> >   remove netchannel2 hotplug script... ancient history
> >
>=20
> Patches 2 - 8:
> Acked-by: Wei Liu <wl@xen.org>
>=20
> (I already acked patch 1)

Thanks Wei.

Ian... ping?

  Paul


