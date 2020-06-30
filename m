Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7420F7ED
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 17:09:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqHsd-0004rN-QS; Tue, 30 Jun 2020 15:09:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJnf=AL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jqHsb-0004qr-Ix
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 15:09:01 +0000
X-Inumbo-ID: 9ffd562c-bae3-11ea-b7bb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ffd562c-bae3-11ea-b7bb-bc764e2007e4;
 Tue, 30 Jun 2020 15:08:59 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OjpqnZo3XH7g7b87jmn7DyAGGy6bnb1vG0VaLDdwnbRe5viygiv6JcLiAhoVymBXSaSdifaKYW
 bu0yCX7KWl3TJWfIEmK9avXh/VBUr6kY2qjK36Fhl+ov/GVYjrQdWlcZjEwZbCuQvvEXoNC1DX
 uFgiDiABsgJwowLWz9ZYhrlqb/o5mUsCSgMw/LRuw7UfHl+SUQoBXSlKUfYBXoyhPnE2ud8a3U
 wNQQ83m4aRjNZbCYpsogUZkLpa/mDZfMfOkrXd+R3XWBTTuyXg27l+UEIkPf8F1lI5KZzaKOJ2
 sPg=
X-SBRS: 2.7
X-MesageID: 21294008
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,297,1589256000"; d="scan'208";a="21294008"
Date: Tue, 30 Jun 2020 16:08:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
Message-ID: <20200630150849.GA2110@perard.uk.xensource.com>
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200624121841.17971-3-paul@xen.org>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <pdurrant@amazon.com>,
 Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 01:18:41PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The generic pc_machine_initfn() calls pc_system_flash_create() which creates
> 'system.flash0' and 'system.flash1' devices. These devices are then realized
> by pc_system_flash_map() which is called from pc_system_firmware_init() which
> itself is called via pc_memory_init(). The latter however is not called when
> xen_enable() is true and hence the following assertion fails:
> 
> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> Assertion `dev->realized' failed
> 
> These flash devices are unneeded when using Xen so this patch avoids the
> assertion by simply removing them using pc_system_flash_cleanup_unused().
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockdev")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Tested-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

I think I would add:

Fixes: dfe8c79c4468 ("qdev: Assert onboard devices all get realized properly")

as this is the first commit where the unrealized flash devices are an
issue.

-- 
Anthony PERARD

