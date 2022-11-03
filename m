Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3F1617BD6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436375.690461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYeU-0007Xs-Cg; Thu, 03 Nov 2022 11:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436375.690461; Thu, 03 Nov 2022 11:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYeU-0007Vb-8m; Thu, 03 Nov 2022 11:44:54 +0000
Received: by outflank-mailman (input) for mailman id 436375;
 Thu, 03 Nov 2022 11:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYeS-0007VT-Bk
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:44:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb0ccd4-5b6c-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:44:50 +0100 (CET)
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
X-Inumbo-ID: ebb0ccd4-5b6c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667475890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYi/ZuaPzd42DGLG3VnTKnMCeYaXtJay8PAOFO5Gtp4=;
  b=iJrxfk2b3C/mq6BSs+aUUOuXh3gcRn6X8BVBz5qR8xKsIkXNJchOLXnK
   VKwctVlppISA7V7LPj8RosCyYrc0m4BBDyzBuIE2iI6lxcO1a2yRDEaqE
   /DedQ0LWxC9GCI6WVlQM5w1whclxVif8KYKsypPrzdsLBEGevUgoDoKpD
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84512473
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:USSv7a93CieZhi+Cds2aDrUDV36TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zRNC2qEaa3ZYWSjKN93YYzj8U0EuJ7Uz9ZqSVdqqXg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPKgQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkQq
 tAZLTxWLSrZuPip8Y+DDbFy1/oKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUJwx/C+
 j2dl4j/KgwBZJuAmTquy3KlvubIjTH0SLkOSaLto5aGh3XMnzdOWXX6T2CTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bpjLCSMxyVpG8iNLdECv1h
 TuNqUADa6471JBRkf/hpBae3mzq9sOhohMJChv/AD2J7wZ1P82fPbOy9mnm1bEYMtenZwzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRTNt4wOuBJ2+U3aB
 Xt8WZ/1ZUv28Yw9kFKLqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiDKFe5ZaQDTNL5mhE9hnOky2
 48BX/ZmNj0FCLGuCsUp2dN7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt4E7GJa599z76Ql
 kxRr2cClzLXn2PcEwyWZxhLMPW/AP6TW1pnYnF3VbtpslB/CbuSAFA3LctvIed/r7I/kpaZj
 ZAtIq29PxiGcRyfkxx1UHU3hNUKmMiD7e5WAxeYXQ==
IronPort-HdrOrdr: A9a23:R/cawaGJDpI5icBspLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="84512473"
Date: Thu, 3 Nov 2022 11:44:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Message-ID: <Y2OprECz0HkqGDAr@perard.uk.xensource.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-4-anthony.perard@citrix.com>
 <fad0265d-a736-5135-b5ea-3735a8bc72da@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fad0265d-a736-5135-b5ea-3735a8bc72da@xen.org>

On Wed, Nov 02, 2022 at 01:16:04PM +0000, Julien Grall wrote:
> Hi,
> 
> On 02/11/2022 11:28, Anthony PERARD wrote:
> > This header have been created by moving code from other part of the
> > project and miss a licence header. The original source code was some
> > version of GPL or LGPL but we intend to have the public header to be
> > MIT so they can be included easily in other projects.
> > 
> > Part of device_tree_defs.h were moved from libxl_arm.c which is
> > LGPL-2.1-only. And part were moved from device_tree.h that is
> > GPL-2.0-only.
> > 
> > Part of the original code were added by Julien Grall @ Citrix with a
> > Linaro "hat" in commits c3ba52a84dd8 and 405c167f0ec9 and
> > 886f34045bf0.
> 
> From this comment it is not entirely who you think the copyright owner is.

That's because I'm not sure.

> IIRC, part of the agreement was that all code written with my Linaro "hat"
> would be copyrighted by Linaro rather than Citrix.
>
> So I think we would need Linaro's agreement for the relicensing.

Sounds good to me.

Cheers,

-- 
Anthony PERARD

