Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BFD53A2A2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 12:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340417.565451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwLdx-0006kL-6h; Wed, 01 Jun 2022 10:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340417.565451; Wed, 01 Jun 2022 10:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwLdx-0006hT-2P; Wed, 01 Jun 2022 10:32:01 +0000
Received: by outflank-mailman (input) for mailman id 340417;
 Wed, 01 Jun 2022 10:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPHY=WI=citrix.com=prvs=144c139f6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nwLdv-0006hN-2l
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 10:31:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e6bb8c8-e196-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 12:31:56 +0200 (CEST)
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
X-Inumbo-ID: 0e6bb8c8-e196-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654079516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TSX9ZJegCdU06HW+9bJrKO5UO1rWK/XvE7f5oVsFUSE=;
  b=YeoJzS+D4LwuOB1mt90ltRLL8j7GdBvZhfkwFCxuGUSP1i/E6zzmH72j
   p8OMdz3AGB1PP4I50CyBH5/0PO2m5X71vkei+t+uVy3c3QUrUTlqzvfh2
   Wa8xoY0usW7+cAPaexaCSwGgCapnsvZn4oKb1tbapZH1b5/iKMDwHV6rJ
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71960707
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Kothq6vwoUq7/oJSlEJDTpKiyefnVEVeMUV32f8akzHdYApBsoF/q
 tZmKTzXOanZZ2TwKdt1bITipk8O7JOHx4dlHFFp+yphFygR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13V4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi84EfbgospecSVSTRNAPL9s2LX+EFug5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWU2PUqYPEUQUrsRILYYs9uF3Fj7SAJj8wO3/pIZ0jHY0BMkhdABN/KKI4fXFK25hH2wu
 W/HuW/5DxcyPcaajzGC9xqEmevnjS79HoUIG9WQ9PFwh0aI7ncOExBQXly+ydG9l0W3HdxWL
 UcZ/i4zhaEo8QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOvsIsWSYj0
 FPPmtrzHCFuq5WcU3fb/bCRxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5yP/WZtPO2Ow36n
 QK0rToUp78qvO0UgvDTEU/8v968mnTYZldru1mPAj37tVMRiJ2NPNLxtwWChRpUBMPAFwTa4
 iBZ8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirnUWWwC
 KMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YsKFfdpnkxOxHJhggBdXTAdolmY
 P+mnTuEVy5GWcyLMhLtLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaodFvxC3PXNrpRxPrd+G39q
 o8DX+PXmk43eLCvPUHqHXs7cAliwY4TXsim9aS6t4erf2JbJY3WI6WBmOt7Ktc7wfw9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:2xhIkq8X2Wr7/GfhgEduk+Fwdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQsdcdDpAtjlfZquz+8J3WBxB8buYOCCggqVxe5ZnPPfKlHbak/DH41mpO
 tdmspFeabN5DFB5K6QimTZYrUdKbK8gceVbJLlvg5QpHZRGsddBmlCe2OmO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLiIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmVM7rq4m2ecJ+OEzR/BkufJlaAkETTzYIbiJbofy/AzdZtvfrGrC3u
 O85CvIdP4Dl085NlvF3icFnTOQlgrHLxTZuAelabyJm72heNtyMbs+uatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAjqqOYmwtVrQcotQ0XbWLeUs4ikaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbNfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2HfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJ2+wdVRCD34GJff+rKGjqCq9MVlVdQ6duf129txlsre5QLLqNES4OSUTr/c=
X-IronPort-AV: E=Sophos;i="5.91,268,1647316800"; 
   d="scan'208";a="71960707"
Date: Wed, 1 Jun 2022 11:31:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libxl: optimize domain creation skipping domain
 cpupool move
Message-ID: <YpdACp5Wra1yWjow@perard.uk.xensource.com>
References: <20220526081230.3194-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220526081230.3194-1-luca.fancellu@arm.com>

On Thu, May 26, 2022 at 09:12:30AM +0100, Luca Fancellu wrote:
> Commit 92ea9c54fc81 ("arm/dom0less: assign dom0less guests to cpupools")
> introduced a way to start a domain directly on a certain cpupool,
> adding a "cpupool_id" member to struct xen_domctl_createdomain.
> 
> This was done to be able to start dom0less guests in different pools than
> cpupool0, but the toolstack can benefit from it because it can now use
> the struct member directly instead of creating the guest in cpupool0
> and then moving it to the target cpupool.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

