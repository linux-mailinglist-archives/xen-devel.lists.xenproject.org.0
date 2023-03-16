Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A508F6BCE13
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 12:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510507.788276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclhV-0002dN-UJ; Thu, 16 Mar 2023 11:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510507.788276; Thu, 16 Mar 2023 11:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pclhV-0002al-RT; Thu, 16 Mar 2023 11:23:17 +0000
Received: by outflank-mailman (input) for mailman id 510507;
 Thu, 16 Mar 2023 11:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umpT=7I=citrix.com=prvs=432886d25=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pclhU-0002af-RB
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 11:23:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef053684-c3ec-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 12:23:13 +0100 (CET)
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
X-Inumbo-ID: ef053684-c3ec-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678965793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8GVO48z9UwW7GijtGJgBinJL/FvYBdQtV+/UxHAj0cI=;
  b=gL1ZgpGJjsm9AYj5qCtCaVBlEd/PoYqyVOH1xu+ChkGlK+7f2gDTHG37
   KqPFuv1GqvrXJpw4B/3CiuDq76BhB0CSHFLhtJR0Yy3cUksUX9GgkorqN
   e2gFb5Myob5Q9CPd2JobNkLmn3H62QDQNdMpubuQqfnwQ16mLA99o9ncM
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103516252
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:sidvT6Kk1zWEUAxMFE+R+ZUlxSXFcZb7ZxGr2PjKsXjdYENS3zNSz
 WIeUD+Fa/vfY2ejfdxwbdy18UJS7ZOBzINrTVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa4jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57Kjp0y
 9EobwsTMD/bjr+I75/qDctz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZ4IxxjC+
 ziuE2LRUiBCD/nC5zC/2WOcpM/etiD/AKAbG+jtnhJtqALKnTFCYPEMbnO+qOO8g1SzWPpeL
 VIV4SskqaUu9E2tQcL5Vhf+q3mB1jYVQ9dKGvc2wB2MwKHTpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRutPQAFIGlEYjULJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6ioANlvYs+vYkwyfuUpVmavR2B99/rUVtgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jsYyjJ5fK6fTgAahwzRosmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTpF7ZFjOJyl31jmws/oKwXKDz2uYdymVbPEetVWLdwRrlRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbMuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVBxIClAam1SacQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:a0tBPa8VpO8sriPXjrNuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="103516252"
Date: Thu, 16 Mar 2023 11:23:01 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 1/7] tools/python: Drop pylintrc
Message-ID: <45cc32f5-5b10-41e0-8489-df3cce8d9e78@perard>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-2-andrew.cooper3@citrix.com>

On Tue, Mar 14, 2023 at 02:15:14PM +0000, Andrew Cooper wrote:
> This was added in 2004 in c/s b7d4a69f0ccb5 and has never been referenced
> since.  Given the the commit message of simply "Added .", it was quite
> possibly a mistake in the first place.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Well, "pylintrc" seems to be a config file to be used by `pylint`, but
there's also no reference to it. So removing the file seems a good
option.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

