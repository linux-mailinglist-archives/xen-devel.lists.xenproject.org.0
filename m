Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0152D618
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333017.556797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhA2-0003b0-Uz; Thu, 19 May 2022 14:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333017.556797; Thu, 19 May 2022 14:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhA2-0003Z9-Qq; Thu, 19 May 2022 14:29:54 +0000
Received: by outflank-mailman (input) for mailman id 333017;
 Thu, 19 May 2022 14:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qgK=V3=citrix.com=prvs=13100c9ce=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrhA1-0003Z3-3U
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:29:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23497ab5-d780-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 16:29:50 +0200 (CEST)
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
X-Inumbo-ID: 23497ab5-d780-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652970590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r9lkrrxfjkjFuwcAENsqT/4XhkccjDDyecQwXCzjSPY=;
  b=WsA4wF+UbsxE0Y+0B/3CpvyMTGLNp/6n9Zewapc7bmZ+6SyZn6xuiv2f
   Bs6ETatVItZzXzeRQZbx6jDJwH6NR8oIVvCyT5ZTYWbdG0A7YLATiqzjX
   yeD5oGl/wuoWWW3jq+w0QCwwUiLOAH417VXg/iq+d3B/Ky2V60N46DUxI
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72097988
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:v3GPyqzBMmFL99XFBYd6t+dowSrEfRIJ4+MujC+fZmUNrF6WrkVWy
 zEZXziPM/vYZzanf9skOYuy9EkB6JSGytNkG1dsqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12InhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplm4WdSy1wAZL1le1MahQFOjk9Eb140eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BP
 ZJINms/PHwsZTUfEFE6NbwXld6npXDOXmRakUy/lfEetj27IAtZj+G2bYu9lsaxbcBOgm6Cq
 27G9ni/CRYfXPSSxSeM6H6rru/GlyD8Q55UErCkntZwgVaTz3YfTh0bU1e2u+K+jGa6WtRWM
 UtS/TAhxYAr+Um2C9P5WBa7iHiDuBEaRpxXCeJSwAOWzK3LyxyUCmgNUnhKb9lOnMo/Xzcn0
 hmAh93kATZmrbi9RneU97PSpjS3UQANJ2gEdy4CTCMf7tXjqZ11hRXKJv56Hauoy8HvGC/xy
 jSiqi84iLMOy8kR2M2T5F3Cnnegq4bESiYz4QPYWH/j6Rl2DKa+Z4Gu9VXKxflFJYedCFKGu
 RAsi8WYqewDE5yJvCiMW/kWWqGk4e6fNz/RikIpGIMunxy18mOnVZBd5nd5PkgBGt0fZTbjb
 UvXuAVQzJxeJn2naelweY3ZNigx5fG+T5K/DKmSN4cQJMgqHOOawM1wTWCJ8mLHyXcTqKw2a
 K6WLO+0TloKN40ymVJaWNwh+bMswyk/w0baSpb60wmr3NKiWZKFdVsWGADQN75ktctotC2Qq
 o8CbJXSl32zRcWkOkHqHZgvwUfmxJTRLbT/sIRpe+GKOWKK80lxWqaKkdvNl2GI9pm5d9skH
 FngAye0K3Kl3BUrzDlmjVg6MdvSsW5X9y5TAMDVFQ/AN4IfSYiu9rwDUJA8YKMq8udupdYtE
 aRfK5zaXqkWFG+fk9j4UXUahNUyHClHeCrUZ3b1CNTBV8AIq/P1Fi/MIVK0qXhm4tufvsoiu
 bywvj43srJYLzmO+P3+Mar1p3vo5CB1sLsrAyPgf4kCEG2xodMCA3Gg0ZcKzzQkdEyrKs2yj
 F3NX3/1ZIDl/ucIzTU+rfnU8NjyS7EmRSK33QDztN6LCMUTxUL7qacobQpCVWq1uL/ckEl6W
 dho8g==
IronPort-HdrOrdr: A9a23:OeyjjKD0QigQIbzlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="72097988"
Date: Thu, 19 May 2022 15:29:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>, "open list:IDE"
	<qemu-block@nongnu.org>
Subject: Re: [PATCH v2 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen"
 device class
Message-ID: <YoZUVvjL0EFjvqgj@perard.uk.xensource.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513180957.90514-2-shentey@gmail.com>

On Fri, May 13, 2022 at 08:09:55PM +0200, Bernhard Beschow wrote:
> Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
> generic class init function' already resolved redundant code which in
> turn rendered piix3-ide-xen redundant.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Creating a guest and migrating a guest seems to work fine without
"piix3-ide-xen", and I can't find this name used outside of QEMU. So I
guess it's fine to remove it.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

