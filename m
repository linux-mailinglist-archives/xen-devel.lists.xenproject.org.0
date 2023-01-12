Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC0666F66
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 11:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475957.737887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFufL-000750-LE; Thu, 12 Jan 2023 10:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475957.737887; Thu, 12 Jan 2023 10:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFufL-00072b-I5; Thu, 12 Jan 2023 10:18:35 +0000
Received: by outflank-mailman (input) for mailman id 475957;
 Thu, 12 Jan 2023 10:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0AC=5J=citrix.com=prvs=3691819c0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pFufJ-00072V-HS
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 10:18:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c02d28-9262-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 11:18:30 +0100 (CET)
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
X-Inumbo-ID: 74c02d28-9262-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673518710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fht+EqOzpwz5ylkFBu+NCRnrKL+oPCraZHKG17BnUUM=;
  b=WPJDil11KVitLgAqLuEb1avTWuJr42jUNFg5QMpV3hyJKijjqRF07NDR
   psLrg3eGP7BJuvT8mUs4HXoBrNMNS+0RGV4Bq1o6a3UK0trv6MK10q8JJ
   Esl8IZ33dIzZ5tAyG7RCUnl6ci/q+MSAm2O7hLYeo8BOuXfSu16G0T3aT
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94746319
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lxnaMaDZ1mP2ghVW/xTjw5YqxClBgxIJ4kV8jS/XYbTApDgi1jAEx
 jBJUW2DOviNM2qmLd0ladzj/E4Pv8fWyNZlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpB5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2/srBWFM9
 8IjcDkDbj24pMbm0e6aRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKEJoPWG54Mzy50o
 EqW7jrEWE0mHeeOyCegy0iB3e/muT7CDdd6+LqQqacx3Qz7KnYoIB8LUVq2p9Gph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JPF8Uq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgAfmukXjcwJ6Z7j9F7HrgmPgsjYEi86s1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZ9CIUvIT46NuhXogj1mPPBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbhGiuB2mHBjmj2DLXwe8/hA+ePADEN5tJ9faAfeBgzHxP7sTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBiba0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWceVXaMCA7M+K/NXu9xFpiVRER0Z+T8yBLSe6SAG03LfPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:vtQgsKupwSSo291kJDBBN5Zc7skDcNV00zEX/kB9WHVpm62j5q
 aTdZEgviMc5wx/ZJhNo7690cq7MBDhHPxOgLX5VI3KNGOK1FdASrsSj7cKqAeBJ8SRzJ846Y
 5QN4R4Fd3sHRxboK/BkW6F+g8bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.96,319,1665460800"; 
   d="scan'208";a="94746319"
Date: Thu, 12 Jan 2023 10:18:17 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] include/compat: produce stubs for headers not otherwise
 generated
Message-ID: <Y7/eaTzkecTCW2oN@perard.uk.xensource.com>
References: <992a28e1-bfcd-97ef-b3d5-c7341846b3ad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <992a28e1-bfcd-97ef-b3d5-c7341846b3ad@suse.com>

On Thu, Jan 12, 2023 at 10:17:47AM +0100, Jan Beulich wrote:
> Public headers can include other public headers. Such interdependencies
> are retained in their compat counterparts. Since some compat headers are
> generated only in certain configurations, the referenced headers still
> need to exist. The lack thereof was observed with hvm/hvm_op.h needing
> trace.h, where generation of the latter depends on TRACEBUFFER=y. Make
> empty stubs in such cases (as generating the extra headers is relatively
> slow and hence better to avoid). Changes to .config and incrementally
> (re-)building is covered by the respective .*.cmd then no longer
> matching the command to be used, resulting in the necessary re-creation
> of the (possibly stub) header.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

This patch also takes care of "removing" compat headers that are no
longer needed due to change in .config, which is good to have (even if
this only remove the content in it).

Thanks,

-- 
Anthony PERARD

