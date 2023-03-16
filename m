Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCE6BCE85
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510517.788316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclx6-0006Lr-3g; Thu, 16 Mar 2023 11:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510517.788316; Thu, 16 Mar 2023 11:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclx6-0006Jx-0j; Thu, 16 Mar 2023 11:39:24 +0000
Received: by outflank-mailman (input) for mailman id 510517;
 Thu, 16 Mar 2023 11:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umpT=7I=citrix.com=prvs=432886d25=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pclx4-0006Jr-T2
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:39:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3031e20c-c3ef-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 12:39:20 +0100 (CET)
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
X-Inumbo-ID: 3031e20c-c3ef-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678966758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6/FxWJn/VbWstuu90dsOxrq3W6RMkMbs1pdyvH/iD8=;
  b=Oe/gVUOy3pb15CPb17DY6ZGqrODLn1wCypCz/gVgOHWOE/dvIDaTIozf
   hTSbpdpvt08G5B0RmouGGbIh6zWgXhG9T3FwvqfCGhkjD1oe9L4xXJ0mQ
   bTpccC2ygU826msq482n170Zb0ol4VlO7f790f8Mfwi8X8n3LMRTPoiSM
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101511824
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KtxbD6LyigxjewtUFE+R+ZUlxSXFcZb7ZxGr2PjKsXjdYENS3zdWm
 2tLCzzVb/feYDf3f9pwaYW08k0O6JHczYVmSQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa4jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4rWk9py
 qxbFAoQUT2iu8im4+KiY+tV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZwIxx/I/
 D6uE2LRDU5CPfe+9gC81TGNlt7FonzESaUVLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4q/d+QOQHGUHZj9Hdt09tcUySCAq1
 1mGhNfgD3pkt7j9YXuF+62dtz+aJSkfJmhEbigBJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6i8HMQoIpDzvIxypqW3GztkxH8v7HLd1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jsYyjJ5fK6fTgAahwzRosmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTpF7ZFjOJyl31jmws/oKwXKDz2uYdymVbPEetVWLdwRrlRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbMuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVBxIClAam1SacQehIA1g6AI7SsV9EhSpTFUQR0ZyAgBDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:RQLTgazIfQgZCFKWIPd4KrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101511824"
Date: Thu, 16 Mar 2023 11:39:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 4/7] tools/pygrub: Factor out common setup.py parts
Message-ID: <9783cc2a-84fc-4af1-a483-a954065a3001@perard>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-5-andrew.cooper3@citrix.com>

On Tue, Mar 14, 2023 at 02:15:17PM +0000, Andrew Cooper wrote:
> ... to mirror the tools/python side in c/s 2b8314a3c354.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

