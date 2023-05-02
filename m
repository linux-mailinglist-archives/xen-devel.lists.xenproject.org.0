Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947F6F46D0
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528717.822217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrhR-0002vt-W9; Tue, 02 May 2023 15:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528717.822217; Tue, 02 May 2023 15:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrhR-0002uD-TL; Tue, 02 May 2023 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 528717;
 Tue, 02 May 2023 15:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M8xE=AX=citrix.com=prvs=479c33cca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ptrhQ-0002u7-Gc
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:13:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0df85e0-e8fb-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 17:13:50 +0200 (CEST)
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
X-Inumbo-ID: f0df85e0-e8fb-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683040430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=07zf0NeMm2d5BtZmhXtI2pUoiNhPMEhhTEmYaZi+6VM=;
  b=GMAjk58st6hl2mDRuSqNadIMKB6vrLloc/s7G7V/3mXC7y0dYOnUeyiR
   cNVNwriIz6gRR3M2wanbDItqztGNhWXrK1BlzZPFpwgAH7SVMkBu6ts73
   9YFeENaroaK8JKZ/nX9YzkNuC+PY2sHtvaZQl6WWX+PqrDJlPJvCGxD9Z
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110035196
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:s+eLYaA7HJEE5xVW/wjjw5YqxClBgxIJ4kV8jS/XYbTApD0lgTwGm
 GMZD2qCOfyJNzTzed5xPoy39EhQuZKHndJhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo/p7JExO0
 cIhBBsKMTqHm+ToxK3iVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XSHZ4IxxfGz
 o7A1ye+X1IxF9W49TOArmuJq8rFrCfwWJ1HQdVU8dY12QbOlwT/EiY+UFKhpPCjh02WWtRBK
 lcV8C4jsagz8kOwStD3GRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2JWXRmia7ay8ti6pNG4eKmpqTSYcQBEM+dXLvIA5hRWJRdFmeJNZlfWsR2u2m
 WrT6nFj2fNK15VjO7iHEU7v2i6gg7XJajAMyi7QAUih8gUnYJH8eNn9gbTE1sqsPLp1X3HY4
 ihfw5HEvL9RZX2evHfTGbtQRdlF897AaWSB2gA3QvHN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9vy/DJg4lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EWf42kmXvHb9DjOBDKsUC+I8ubcqjk0TPPUS2PRZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9iizpNbWO3GNmaZKdABiEJTOLcyuwyChXrLZc1UO9aBII6O5/I7NjKQ+wf4Oyr6Zr
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldc0XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:RQmW+KkUW7NY1jcm7aKWfWYvGSDpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3AdEIMBWsbHOkjgbhsdIo8DqpQ6It8bnH44Xf0HXa?=
 =?us-ascii?q?UImE2YrmJTwGU5/p7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AE7+Nig39ZiOi1+2vvmHzld7ZgDUjoOPzS2sumLI?=
 =?us-ascii?q?6sszYLAldHj2siD+3Xdpy?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="110035196"
Date: Tue, 2 May 2023 16:13:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v3 2/4] tools/xendevicemodel: Introduce
 ..._get_ioreq_server_info_ext
Message-ID: <ZFEopAR3l2HCMK9d@perard>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <1f6dc87eebe5d1c27ae15ec8f5d8006e5aa1c36d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <e529da7e-0da6-af2f-e5b1-bb8f361a518c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e529da7e-0da6-af2f-e5b1-bb8f361a518c@suse.com>

On Thu, Apr 06, 2023 at 08:05:04AM +0200, Juergen Gross wrote:
> On 06.04.23 05:57, Marek Marczykowski-Górecki wrote:
> > Add xendevicemodel_get_ioreq_server_info_ext() which additionally
> > returns output flags that XEN_DMOP_get_ioreq_server_info can now return.
> > Do not change signature of existing
> > xendevicemodel_get_ioreq_server_info() so existing users will not need
> > to be changed.
> > 
> > This advertises behavior change of "x86/msi: passthrough all MSI-X
> > vector ctrl writes to device model" patch.
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > ---
> > v3:
> >   - new patch
> > 
> > Should there be some HAVE_* #define in the header? Does this change
> > require soname bump (I hope it doesn't...).
> 
> You need to add version 1.5 to libxendevicemodel.map which should define
> the new function.

And update MINOR in the Makefile.

-- 
Anthony PERARD

