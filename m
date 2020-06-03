Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE661ED48D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 18:52:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgWcC-0003CQ-1s; Wed, 03 Jun 2020 16:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZjh=7Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jgWcA-0003CL-RZ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 16:51:42 +0000
X-Inumbo-ID: 7fa57f0a-a5ba-11ea-ad67-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fa57f0a-a5ba-11ea-ad67-12813bfff9fa;
 Wed, 03 Jun 2020 16:51:41 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4decgFsKWVfn1fWOoLwMQVuM72S682hSoKwo8se4vZ+1DVD4ts/5dVGfITtwNzfl+5JVQGgS34
 B79x6y2Nw2Vkal3x6wnsBCOQX3JfUHDOZZpaEEL4O5cTQa0XEmolumQ1UMkCaLdHy95vw67HOh
 IKuxQbsUto2Yk2AlzO+fGHE7jr6QcCnpiSfSSXpHBDLyt9YWCvxCDlL/GCcXBvTIjTNcPe3Jt5
 HfoCkTjys8DX/p7u2o9orlu69ySp80ehc3kQyFaJOr7G5aZm/tp6wW48H3y8yeOljyNkZk3DkD
 SBw=
X-SBRS: 2.7
X-MesageID: 19395688
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,468,1583211600"; d="scan'208";a="19395688"
Date: Wed, 3 Jun 2020 18:51:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] xen: fix build without pci passthrough
Message-ID: <20200603165134.GG1195@Air-de-Roger>
References: <20200603160442.3151170-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200603160442.3151170-1-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 05:04:42PM +0100, Anthony PERARD wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Xen PCI passthrough support may not be available and thus the global
> variable "has_igd_gfx_passthru" might be compiled out. Common code
> should not access it in that case.
> 
> Unfortunately, we can't use CONFIG_XEN_PCI_PASSTHROUGH directly in
> xen-common.c so this patch instead move access to the
> has_igd_gfx_passthru variable via function and those functions are
> also implemented as stubs. The stubs will be used when QEMU is built
> without passthrough support.
> 
> Now, when one will want to enable igd-passthru via the -machine
> property, they will get an error message if QEMU is built without
> passthrough support.
> 
> Fixes: 46472d82322d0 ('xen: convert "-machine igd-passthru" to an accelerator property')
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Tested-by: Roger Pau Monné <roger.pau@citrix.com>

Fixes the build for me on FreeBSD without pci-passthrough.

Thanks!

