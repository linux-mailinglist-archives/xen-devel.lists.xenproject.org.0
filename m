Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F8952D641
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333044.556830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhHT-0006FT-BJ; Thu, 19 May 2022 14:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333044.556830; Thu, 19 May 2022 14:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhHT-0006Dc-8K; Thu, 19 May 2022 14:37:35 +0000
Received: by outflank-mailman (input) for mailman id 333044;
 Thu, 19 May 2022 14:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qgK=V3=citrix.com=prvs=13100c9ce=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrhHS-0006DW-1N
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:37:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 363cc6c0-d781-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 16:37:32 +0200 (CEST)
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
X-Inumbo-ID: 363cc6c0-d781-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652971052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ebfjX54Q/dRlgfHegJC/4k9RI/dgb8rA4FaZPyu1KJc=;
  b=K84E+qbbtPb23OWLAYOtDKCcozWkkpwpGjp14KN5Xf4ivdKSFR2QnYr2
   5PsKubJ6tawqYpUP1sS1tGoDy2yQmHfCtQyQISHAnYtrVuZNy5Sg+ab0B
   7sQotjVc7YhjTaCMVe1Cxu2lXmXski+6vzBQE2cqE9/WGfuz27837kR1e
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71710597
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NIQFwKC8e5CfWRVW/3bkw5YqxClBgxIJ4kV8jS/XYbTApGwr1GdSn
 DEfXG3VMveIMWWjfNogb43n9hwF68fdytEyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhq8
 sdRmL+sRj0jAbz2vuZMcAt+TiNXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8XQq+GO
 ptGAdZpRBSfOiwMKHosMps/oOa4nXfwUHoBtWvA8MLb5ECMlVcsgdABKuH9YN2BRcxPkgCYq
 2TK8n7iBRcyMN2ZwCCCtHW2iYfnhSn8XpATEryQ7PNmgFSPgGcUDXU+UFKhqvS9zEemVd9bI
 UUJ/wIhqKEz8AqgSdyVdwS1pWPBtBobUNl4Feo85weQjK3O7G6xBHMCSSFpctEqtMYqAzct0
 zehkt/0DCZjt5WVQHie8ayI6zW/JUA9KHQeTTUJQQsM/5/op4RbpgvCS8smDLS0kNz8HRn2x
 DaFqjV4gK8c5eYS2qCmuFzKnT+ojp7OSAEz+0PQRG3Nxhh5aYi5ap2A5l3S7PIGJ4GcJnGRs
 X5Bl8WA4eQmCZCWiDfLUOgLBKuu5fuOLHvbm1EHN4Eo6jCF63OlO4dK71lWP1x1O8wJfTvoZ
 k77ug5L4pJXenywYsdKj5mZUppwi/K6TJK8C66SPoEmjoVNmBGv5xt8eWOzw2/Xmnc9q4c9a
 LSJV5uuJCNPYUh49waeS+AY2L4t4ykxw2LPWJz2pyiaPaqiiG29EulcbgbXBgwtxObd+ViOr
 Y4DXyef408HONASdBU75mL6wboiCXEgTa77pMVMHgJoClo3QTpxYxM9LF5IRmCEo0i3vrqRl
 p1echUBoLYauZEgAVzTAk2PkJu1Af5CQYsTZETAx2qA1Xk5epqI56wCbZYxdrRP3LU9kKQkF
 qNZJpzeWawnptH7F9M1NMmVkWCfXE7z2VLm09SNPlDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 lFT/lizfHb3fCw7VJy+QKv2lzuZ5CFB8MovDxqgCoQCIy3Erdk1QxEde9dqeqng3z2YnWDEv
 +tXaD9FzdTwT3gdqYmW2vvc9d/yewa8d2IDd1TmAX+NHXGy1gKeLUVoCY5koRi1uLvIxZif
IronPort-HdrOrdr: A9a23:v08bXqwXPdbnKZsMDznDKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="71710597"
Date: Thu, 19 May 2022 15:37:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, John Snow <jsnow@redhat.com>, "open list:IDE"
	<qemu-block@nongnu.org>
Subject: Re: [PATCH v2 3/3] include/hw/ide: Unexport
 pci_piix3_xen_ide_unplug()
Message-ID: <YoZWJFatGiKF1pUI@perard.uk.xensource.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513180957.90514-4-shentey@gmail.com>

On Fri, May 13, 2022 at 08:09:57PM +0200, Bernhard Beschow wrote:
> This function was declared in a generic and public header, implemented
> in a device-specific source file but only used in xen_platform. Given its
> 'aux' parameter, this function is more xen-specific than piix-specific.
> Also, the hardcoded magic constants seem to be generic and related to
> PCIIDEState and IDEBus rather than piix.
> 
> Therefore, move this function to xen_platform, unexport it, and drop the
> "piix3" in the function name as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

