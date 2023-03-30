Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF56D05E2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 15:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516728.801326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phryk-000750-O1; Thu, 30 Mar 2023 13:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516728.801326; Thu, 30 Mar 2023 13:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phryk-00072x-L3; Thu, 30 Mar 2023 13:06:10 +0000
Received: by outflank-mailman (input) for mailman id 516728;
 Thu, 30 Mar 2023 13:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzUU=7W=citrix.com=prvs=446aa7e4f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1phryj-00071a-Nv
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 13:06:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a229381c-cefb-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 15:06:08 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a229381c-cefb-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680181568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TuGjNP9wS9q3cj3/CeZM+y+PDS7rTjgGAvX7wsCvqME=;
  b=Ic2+uNgLYumPxWEix7Ia6OFW9B+5e91d07snDp60mOAow5vCKQC1Udrs
   mRZ84D1M5lfGyk8SRNjZBViN3sxuRer2QfBrZmR43/C5mY26PVGdikM+Q
   qkGGQZS+LqkJRAsAO2bcbPgDdSQtvl/FBVcoh4+xHJUdGnqrEk8GHRZWX
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103042161
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:APHGX6L6p7KmbJzdFE+RyJIlxSXFcZb7ZxGr2PjKsXjdYENSgjUOy
 jdMCDuGbP2LZWWne99ya4uz9hgB65XTzt9nTAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5sX1tv2
 8ZHdwwHQU7Tov2tmpGVQ8dF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZ4NwhzB+
 DuuE2LRWy4kFs6++yW+6Gvygcr/xyT+Z78pC+jtnhJtqALKnTFCYPEMbnOgofS/lkOvc91aI
 k0QvCEpqMAa7UGuU5zxUgO1pFaCuRgTXccWFPc1gCmIw7Df7gLfD3AKQzpLYcEjnMAzTD0uk
 FSOmrvBHTZotq+UT3O17LqYrTqufyMSKAcqaTABUiMM5tDxp4d1hRWJU9ULOK6ticDuAjD26
 yqHpSMigK5VitQEv42y4ErKhzOhoLDAUxQ44l6NGGSo8mtRaYK4bpak7nDb5PxDK52FCF+Mo
 BAsg8GD6MgeAJfLkzaCKM0dEbfs6/ubPTn0hV90A4Jn5zmr42Skf41b/Hd5PkgBGsMfZRfzb
 UPTsB8X75hWVFOxdrN+aY+1D8UszIDjGM7jW/SSacBBCrBrdQSH9TtiI06d2WzgilMrl4k7O
 JGSa8HqCmwVYYx/zDuyQus11b4tzzo5g2TJSvjTxQ6s0aeVZ2y9QLABdlCJa4gR5buJugzP/
 /5DNsGBzFNUV+iWX8XM2ddNdxZQdyF9XM2o7ZUNLYZvPzaKBkk6VcXw74l+JLBvsPoFs/jTp
 FKTU2FxnQ+XaWL8FemaVpxyQOqxAscu/SJnYXxE0UWAgCZ6P9v2hEsLX95uJOR8qrQ+pRJhZ
 6NdE/hsFMijXdguF941SZDm5LJvex2w7e5lF3r0OWNvF3KMquGgxzMFQucM3HNUZsZPnZFiy
 4BMLyuCKXb5eyxsDdzNdNWkxE6rsH4WlYpaBhWYeoAKJBuzrtg0dUQda8PbxelWcX0vIRPEv
 zt6/D9C/bWdy2PL2IKhaV+4Q3eBTLIlQxsy85jz5reqLyjKlleeLXt7eL/QJ1j1DTqkkJhOk
 M0Jl5kQxtVbxgcV22e9ep43pZ8DCyzH/eUEllw5Ry2UMTxGyNpIexG74CWGjYUVrpcxhOd8c
 hjVkjWGEd1l4P/YLWM=
IronPort-HdrOrdr: A9a23:yna82qvAQS6Vlp0/d72mft3C7skDqtV00zEX/kB9WHVpm62j5r
 uTdZEgviMc5wx+ZJhNo7290eq7MBfhHOdOgLX5ZI3DYOCEghrLEGgB1/qb/9SIIUSXnNK1s5
 0QFpSWY+eeMbEVt6rHCUaDYrEdKXS8gcaVrPab5U1ECSttb7hk7w9/AAreKEtrXwNLbKBJd6
 Z0ovA33gadRQ==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103042161"
Date: Thu, 30 Mar 2023 14:05:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
	<aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
	<brchuckz@aol.com>
Subject: Re: [PATCH v3 6/6] hw/isa/piix3: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Message-ID: <3af0ddf0-4c2c-4f42-bc48-0775fa33238c@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-7-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-7-shentey@gmail.com>

On Sun, Mar 12, 2023 at 01:02:21PM +0100, Bernhard Beschow wrote:
> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
> TYPE_PIIX3_DEVICE. Remove this redundancy.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

