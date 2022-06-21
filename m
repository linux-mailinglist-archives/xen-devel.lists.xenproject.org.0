Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FE552F81
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 12:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353165.580079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3av5-0002M8-Rd; Tue, 21 Jun 2022 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353165.580079; Tue, 21 Jun 2022 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3av5-0002Ii-OC; Tue, 21 Jun 2022 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 353165;
 Tue, 21 Jun 2022 10:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/KMk=W4=citrix.com=prvs=16408edfd=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o3av5-0002Ic-3r
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 10:15:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1762ccc9-f14b-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 12:15:37 +0200 (CEST)
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
X-Inumbo-ID: 1762ccc9-f14b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655806537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QcSpgKS225JamIFv9EzQROZ047pLLv+YqmxHeJjalYQ=;
  b=GWG1+YoGZ8yADSDmscGvmX0/K8Zx8eP/cI5g0AvxWxNdGjbpBLeUuvHt
   lVqdD7a5SRyLGH/ZiOMwOs2YbcIMqhzhfQxCtdAx71bBWialjBHxdZdF2
   sNdWqSw6PhV86ivxQe9MQZJII5C3tJNQZW19OiWlOWyyhjUA0OWDV6Zaa
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74479126
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Cy6BZa5aSvgBW2sqn/pT8QxRtCLHchMFZxGqfqrLsTDasY5as4F+v
 jQdWD/Xb/yDYGXweN9+bN+yo0hUv8WEndBqSQNuryhkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurThd1gmF7LVmdgaXkRUTx9iZJdL27b+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VFNWU+NU6eC/FJEnwRWMoVsuuKvEvUcwII73iwmq0bvGeGmWSd15CyaYGIK7RmX/59h0udu
 yfa5WXnAxgeHNqYzzWD7zSrnOCntTjgRIsYGbm89/hrqF6e3GoeDFsRT1TTieGwl0qWS99Zb
 UsO9UIGp7I59FGgTcvVVhq85nWDu3Y0QtdVDqg25R+AzoLS5ACWAHVCSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpozLRj7Z3
 CmLkC8z2rlPs9JS7aiY9GmS1lpAuaP1oh4JChT/Bzz4s1wmOd77OORE+nCAs68ecd/xok2p+
 SFdxpPAtL1m4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 Kz741o5CGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonwzOhPIhz+3yRlz+U3aB
 Xt8WZ/0ZUv29Iw9lGbmLwvj+eRDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8HX+PTkkU3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLr7dSuencUl8Y8LsLUQJIdc6xP4KzLmWo
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldcwnxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:7qOdMqH/+cPYMaaRpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.92,209,1650945600"; 
   d="scan'208";a="74479126"
Date: Tue, 21 Jun 2022 11:15:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
	<qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2] xen/pass-through: don't create needless register group
Message-ID: <YrGaKdx+af+7g2HY@perard.uk.xensource.com>
References: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz.ref@aol.com>
 <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz@aol.com>

On Fri, Jun 17, 2022 at 03:13:33PM -0400, Chuck Zmudzinski wrote:
> Currently we are creating a register group for the Intel IGD OpRegion
> for every device we pass through, but the XEN_PCI_INTEL_OPREGION
> register group is only valid for an Intel IGD. Add a check to make
> sure the device is an Intel IGD and a check that the administrator has
> enabled gfx_passthru in the xl domain configuration. Require both checks
> to be true before creating the register group. Use the existing
> is_igd_vga_passthrough() function to check for a graphics device from
> any vendor and that the administrator enabled gfx_passthru in the xl
> domain configuration, but further require that the vendor be Intel,
> because only Intel IGD devices have an Intel OpRegion. These are the
> same checks hvmloader and libxl do to determine if the Intel OpRegion
> needs to be mapped into the guest's memory. Also, move the comment
> about trapping 0xfc for the Intel OpRegion where it belongs after
> applying this patch.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

