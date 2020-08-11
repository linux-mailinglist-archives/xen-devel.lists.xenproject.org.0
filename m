Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36A241A02
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 12:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5RwL-0002p8-Mz; Tue, 11 Aug 2020 10:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9tog=BV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1k5RwJ-0002p2-OY
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 10:55:31 +0000
X-Inumbo-ID: 27f63c8a-e575-42cd-b595-1b2d8dc7d8e9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27f63c8a-e575-42cd-b595-1b2d8dc7d8e9;
 Tue, 11 Aug 2020 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597143328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HJeFnSV/+ONcf4QjRxk/eFMrNPUmsA5U0nFiCFmbOF4=;
 b=CDJ3EfssE25d4oXaFkEm61V4TEIXatHBCXrU29YsCF7m1hJ40044aj22
 WYCXaNh+huafAe5urAOL7jCV1OQYmfb549JlFDHtgLWl6ogY7eJwoyJ3U
 0otijogfrXbg4ZBmFwod8ih1Ci0oyVQ3yuOSMDT7isK12VJZu7MKwpQsm 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EZMbyMaOMLPt1xDQxrFocP3wLpqJ33C91woV+4GwI5YkFG7akLl86jAftNH0Op8MDbxKbopIy2
 U+7KaKFLcHIcBBrluwTFyB41KCfKkHudc1njk+sNZECRDJDynEdBeqyU7uAdgpvvRFwrhmw48p
 rIXJzvEuBpBVgxi2wPWMki40pr3EhGZTZkQWRtZVUuvktWY4haN4pEjOQT+zHXuv6+5RltLEHz
 uKnDGfr9ApsnIsmEhw9Ynfiy6GaYgkMY4pdb6AMl1AtJ+3u+/ldwb8DwISCQTd7XUwD1fRL6sC
 /E0=
X-SBRS: 2.7
X-MesageID: 25162782
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,461,1589256000"; d="scan'208";a="25162782"
Date: Tue, 11 Aug 2020 11:55:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2] hw/i386/q35: Remove unreachable Xen code on Q35
 machine
Message-ID: <20200811105522.GB2024@perard.uk.xensource.com>
References: <20200722082517.18708-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722082517.18708-1-philmd@redhat.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo
 Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 10:25:17AM +0200, Philippe Mathieu-Daudé wrote:
> Xen accelerator requires specific changes to a machine to be able
> to use it. See for example the 'Xen PC' machine configure its PCI
> bus calling pc_xen_hvm_init_pci(). There is no 'Xen Q35' machine
> declared. This code was probably added while introducing the Q35
> machine, based on the existing PC machine (see commit df2d8b3ed4
> "Introduce q35 pc based chipset emulator"). Remove the unreachable
> code to simplify this file.

This is almost correct, we can't start a xen guest with the q35 machine
due to missing setup. But we wouldn't need to declare a new xen specific
machine as setting "accel=xen" is enough.

Anyway, that patch can be reverted whenever someone takes care of
bringing q35 to xen.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

