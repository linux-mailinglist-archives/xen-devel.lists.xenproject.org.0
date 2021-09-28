Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67241A990
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197619.350777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7Ms-0004l2-Le; Tue, 28 Sep 2021 07:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197619.350777; Tue, 28 Sep 2021 07:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7Ms-0004ir-Hu; Tue, 28 Sep 2021 07:17:34 +0000
Received: by outflank-mailman (input) for mailman id 197619;
 Tue, 28 Sep 2021 07:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYy3=OS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mV7Mr-0004if-E6
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:17:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4da8ecb7-fe45-492e-9720-cb973f554718;
 Tue, 28 Sep 2021 07:17:32 +0000 (UTC)
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
X-Inumbo-ID: 4da8ecb7-fe45-492e-9720-cb973f554718
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632813452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5osQiy25+qlibc4sOvnrOTTHPxbvy7TZ7VPEO2+0X6w=;
  b=NBFoTyG2+CSyRWutm5Z3Sj99CAL1wkI5b3LfFlHbXb9uOm93uyjfmU0R
   UX3wR6d7JThswFMWuGqFwefI2r+GqGG5/uLTipK/Ihx9sseXyOY3UxQLh
   Qj1Z5yOywclhZlNCRBvnnVvw/OBIMif9HEXs7coLAREYD6LQNRY6ndplu
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oJY0Zz3tbisaqEJK4cSD9EfSY2YZiM60KyMsmlEP1x3M1WWcWJbVc/Q7xj8QPt8iLQQ2Y873lj
 OR4rmPzWLJbstJrR79CpB5UB0d1MXJ4cdAkuDUKD61dh8vUZXolI3EWSysLgursty6UBFbShTp
 r2iUKeu/bHQkhnj8u9NXl8ynyS64VWmrw6ePuw3puEP6IVAPQ1u7cgkmDohtULG21HXhusMaeP
 bvFz+J8xuhCTUVc395glxog24zxuf76dSb6jGRMXs/F7HIItlCmckix7xFGGZWY1ULGu2CWGsY
 ZQJwm7tkKziuv5PJ0OnptVvB
X-SBRS: 5.1
X-MesageID: 53797650
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CBScM6vH4+WVkmxZjtnXagsuzefnVNRZMUV32f8akzHdYApBsoF/q
 tZmKWqFPKmPamvxLthza4zio05SuZfdydVlSlM9/Cs2Fy8a+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524jhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnMOAdl0GZoD3ov08fzYDFgpgeqBBweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DP
 JVINmQyNHwsZTVIJXoQT74nxtyCgyP0WCZS9FevgIQotj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWMwkQDBRtQUkG0ydG4lUyWS99ZM
 1YT+Cclse417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby/C8kL5poUridex6MYKa1djeB3b9x
 Anf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlknPdH0PuRE/XCeva4Zc9rJJrWUl
 CJc8/Vy+tziGn1keMalbuIXAPmN7uuJPSfQiFpid3XK32/2oCbyFWy8DSsXGauIDirmUWO1C
 KMwkVkIjHO2AJdMRfQsC25WI552pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FKpzzUyZAUP47lWHeqwIhPVkDnXtWKYT7H8yT8vha+eDGOC79pUktajNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dR7ELz+FlBiXcqeg5UOLoare1M6cEl8W6656e5wIORNwvUK/tokC
 1ngAye0PnKk3iaZQehLA1g+AI7SsWFX9ylmYnB8YQjyixDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6VtlxyoDqsdRzLZ1S4aaJWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWEcgZWgBvLMfKc/bznVm/imcQxbBpVEzSL9gNJEi1qNp2Kzb8h+McKt0XLUmR3SOT0
 gubWE9KpeTEr4Iv3sPOgKSI89WgH+dkRxIIFGjH97emcyLd+zP7k4NHVe+JexHbVX/1p/r+N
 bkEkamkPaRezlhQsod6H7J69o4E5oPi9+1A0wBpPHTXdFD3WLluFWaLgJtUvapXy74H5QbvA
 hCT+sNXMKmiMd/+FAJDPxIsa+mO2K1GmjTW6vhpckz26DUuoeiCWERWeRKNlDZcPP1+N4Z8m
 bUtv8sf6gqejBs2M4nZ0nAIpjrUdnFQAb86spw6AZPwjlt5w15PVpXQFyvq7czdcN5LKEQrf
 meZiaeqa26wHaYen67fzUTw4Nc=
IronPort-HdrOrdr: A9a23:p/Z7C6tyX2AcY/SSfoED0FFf7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.85,328,1624334400"; 
   d="scan'208";a="53797650"
Date: Tue, 28 Sep 2021 08:17:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108
Message-ID: <YVLBgcaFp/CzDgms@perard>
References: <20210831123637.22647-1-anthony.perard@citrix.com>
 <24878.13708.826632.607786@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <24878.13708.826632.607786@mariner.uk.xensource.com>

On Tue, Aug 31, 2021 at 02:58:36PM +0100, Ian Jackson wrote:
> Anthony PERARD writes ("[XEN PATCH] Config.mk: update OVMF to edk2-stable202108"):
> > Update to the latest stable tag.
> 
> Thanks.  I am OK with this but I think we should hold off committing
> it until the XSA fallout has been sorted.

Hopefully, this is sorted now. Time to commit the patch?

Thanks,

-- 
Anthony PERARD

