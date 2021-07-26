Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690023D59AA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jul 2021 14:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160938.295508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7zt0-0004So-Fu; Mon, 26 Jul 2021 12:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160938.295508; Mon, 26 Jul 2021 12:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7zt0-0004Qt-Ag; Mon, 26 Jul 2021 12:39:10 +0000
Received: by outflank-mailman (input) for mailman id 160938;
 Mon, 26 Jul 2021 12:39:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PJJi=MS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m7zsy-0004Qn-7H
 for xen-devel@lists.xenproject.org; Mon, 26 Jul 2021 12:39:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07122a09-fc2d-44a5-9549-a7040130b438;
 Mon, 26 Jul 2021 12:39:07 +0000 (UTC)
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
X-Inumbo-ID: 07122a09-fc2d-44a5-9549-a7040130b438
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627303147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gTyJRNEeK98z5dPRaascPIibUbsMt8Ordgy4S6rhZuU=;
  b=h/5IWSr4ma4r/TGawGxtBRFmT1hO2oqH/+oEACH0amhlfSjVXjlCOQCH
   Fx90p686TE3WFTcrh44jtU0ougnoFIQz2VPAbEPmociLFHJxTSiIhKJhv
   YNMTxJLeXg04u/2EL0ZB4YurSWhlFvYdWz5rVLsakA+PuFDY39r5YvcHK
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qWQD+B5RnypOk/sNGzjyrGavw/mGt+t5BUmXloGLWXvOSN3X/1P1Qaw0hXSNcNDYIVoPSpVfUS
 5qBS2y+UMYMGn7ZQ1UDUXCEaMHHzyXBL20ID7yT5QVBszf5HHwJCEbb3ldFNAInB2X6bO0PaFo
 95Y5gOGjrZgZ8mfk7WA6L6KvpoWuKjx8/BqXad96oL0vMj9RjC/nHI8tJhnCdEN9Qb1OmsRx9w
 1uSVe5sXrmKB4Xa0rVNHNIeHN5S4z8b9s8lXJSNaHOE5ajVD+WLoXKXDrizVWo7qoKWPPAo2eH
 0wQK562qrtH0cblE2pXUQSCX
X-SBRS: 5.1
X-MesageID: 49124590
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:E070rqmLuJQoJ3vJNjLAA6F5ONjpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.84,270,1620705600"; 
   d="scan'208";a="49124590"
Date: Mon, 26 Jul 2021 13:39:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Ping: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file if
 exist and update OVMF
Message-ID: <YP6s5q/hAbupbB/S@perard>
References: <20210719134845.681725-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210719134845.681725-1-anthony.perard@citrix.com>

On Mon, Jul 19, 2021 at 02:48:45PM +0100, Anthony PERARD wrote:
> A platform introduced in EDK II named OvmfXen is now the one to use for
> Xen instead of OvmfX64. It comes with PVH support.
> 
> Also, the Xen support in OvmfX64 is deprecated,
>     "deprecation notice: *dynamic* multi-VMM (QEMU vs. Xen) support in OvmfPkg"
>     https://edk2.groups.io/g/devel/message/75498
> and has been removed upstream.
> 
> We need to also update to a newer version of OVMF as OvmfXen in the
> release "edk2-stable202105" doesn't work well with Xen, so we need the
> fix b37cfdd28071 ("OvmfPkg/XenPlatformPei: Relocate shared_info page
> mapping").
> 
> Also, don't set anymore the number of thread for parallel build when
> building the newer platform, OvmfPkg/build.sh is now doing parallel
> build by default.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Can we commit this soon? Thanks.

-- 
Anthony PERARD

