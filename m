Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC51C3724
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 12:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYbE-00064b-TH; Mon, 04 May 2020 10:45:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3Bs=6S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVYbD-00064R-DY
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:45:23 +0000
X-Inumbo-ID: 5a884974-8df4-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a884974-8df4-11ea-ae69-bc764e2007e4;
 Mon, 04 May 2020 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588589122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tXO0ICCiT142bp9ixaiqrYulWlsUgTl6QaOusnFsu4U=;
 b=SesOYbNy18JXQZdG8vW5dESkleHqbOqoKbTaz1gMXdUxmIZ3lRpgQsGn
 Y9d1FsAOemTtp9XzdMUZwYbQZL63dDc4J3o39SvSpcDZO6ckikDTRLUZX
 XkP47w1qgu+YG5KFFjqJ5bMsvVGL0aNR4XzxOsFW/F4h8bJOBO5Vg04sC E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VA3TIEhLTXp19jB7KBHvDtiNb7ydxUl7/pqE0PN/ICWErY/2eqpU1iwd9W7mtFrxXdtFnLftqj
 0Kmkr+jP+e5W/4TSAaIZwVGklxWHvocqq8eQ64FOAj9FxBheeCKksSPw+q1C9OL+x58Db5JKA7
 YOOT/DjeR/kDcJQU9cRw3AspnuU36z5KDTLLlx3Q58mlTEVWFqcTwnywwvbwASFSLpDGIpCAPu
 V4GbVkYxG276mG1eZYPLKhcJ0Bh9wQ8sUWfXS9rXnO1l57OMkxUzoA/149rGJZhHprFTGQCd4u
 bOM=
X-SBRS: 2.7
X-MesageID: 17353198
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,351,1583211600"; d="scan'208";a="17353198"
Date: Mon, 4 May 2020 12:45:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] xen: fix build without pci passthrough
Message-ID: <20200504104512.GA1353@Air-de-Roger>
References: <20200504101443.3165-1-roger.pau@citrix.com>
 <ccf11b67-4aaa-5fb2-e23f-674380b47a13@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccf11b67-4aaa-5fb2-e23f-674380b47a13@redhat.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 04, 2020 at 12:35:39PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Roger,
> 
> On 5/4/20 12:14 PM, Roger Pau Monne wrote:
> > has_igd_gfx_passthru is only available when QEMU is built with
> > CONFIG_XEN_PCI_PASSTHROUGH, and hence shouldn't be used in common
> > code without checking if it's available.
> > 
> > Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> See Kconfig fix suggested here:
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg61844.html

Having it available on Kconfig is indeed fine, but this still needs
some kind of configure checks AFAIK, as it's only available on Linux.

I'm certainly missing some context, but whether XEN_IGD_PASSTHROUGH
gets defined on Kconfig or not shouldn't really matter for this patch,
as we would still need to gate the code properly so it's not build
when PCI passthrough (or whatever name the option has) is not enabled?

Thanks, Roger.

