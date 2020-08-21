Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1624D23C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:25:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k94ET-0007zs-8w; Fri, 21 Aug 2020 10:25:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=82JZ=B7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k94ES-0007zn-Hm
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:25:12 +0000
X-Inumbo-ID: e2facad4-14b5-48c2-a2c0-003281d54a64
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2facad4-14b5-48c2-a2c0-003281d54a64;
 Fri, 21 Aug 2020 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598005511;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fVTn74rLusQ0gyN5zv1trKp9w9iVeSja+If/hM1umcI=;
 b=b6aZ72qd3s+9xM0AeBNtpWbxrByjIMM8c6FJoa6fCAfq+wpQL4GaoDOi
 DPvEJYhIPSzc2Mc7Ic0sOXJskwKf/09Iv8IbMGEaiwB4Uo5bH56sTG0uK
 OO8iWQX1JusqyuDSyM7iqjL4n1zpwc86I4FPy6TbPSjRUd31n7HCU9a40 A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Q6p+bSyp/ps/vi2hsqcrbbp0aCegSZ7uvK9RIN4AXwtunfeahxTkLDu2snGlGbuSM8w+xXLoGx
 fCsvggdSQmrufoRD3kH0vpaBDtRCCT2FxhKQ8e1jsgDnlBya5I0aKs7gSesX48vTHov6U3T/Dl
 g38FvFUZq2TABsW7MNm/Lve3NoeDYl5sL3+9Ite/AxsBHhjmrBdrXGfd4dmlD5pAddDd2TUN8C
 ZFFCiEh6Kf8jABTjJl7C3/Kux401uXOwjj8X6E6wnPv5HJTbomkhDj4nUvaVPVn4WhDl0vzssP
 MFU=
X-SBRS: 2.7
X-MesageID: 25355763
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,335,1592884800"; d="scan'208";a="25355763"
Subject: Re: shared features in cpuid
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20200821121224.24cecb4e.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <15c63fc5-2b59-63be-7f29-375b675c8ec4@citrix.com>
Date: Fri, 21 Aug 2020 11:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821121224.24cecb4e.olaf@aepfle.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/08/2020 11:12, Olaf Hering wrote:
> While reviewing changed behavior in 'xen-cpuid -d' output between Xen 4=
=2E8 and 4.9 I found commit 20e92c97f904aa460e2223c30dcad36c234496b6 ("x8=
6/cpuid: Only recalculate the shared feature bits once").
>
> I wonder what the mentioned "cross-vendor case" in the comment, which w=
as removed from sanitise_featureset(), really means.
>
> Does Xen attempt to support domU migration between AMD and Intel hardwa=
re?

http://developer.amd.com/wordpress/media/2012/10/CrossVendorMigration.pdf=


This was a feature put in a decade ago.

In practice, cross vendor migration works fine for PV guests, because
almost all of the vendor differences are abstracted away by the PV ABI.

We have no idea if anyone uses it still, but there is quite a lot of
ancillary code for it which we try our best not to break.

~Andrew


