Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F8765543
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 15:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571123.894205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Fu-0005rY-8r; Thu, 27 Jul 2023 13:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571123.894205; Thu, 27 Jul 2023 13:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Fu-0005pS-5f; Thu, 27 Jul 2023 13:42:14 +0000
Received: by outflank-mailman (input) for mailman id 571123;
 Thu, 27 Jul 2023 13:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP1Fs-0005pM-9Z
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 13:42:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60af8e6c-2c83-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 15:42:08 +0200 (CEST)
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
X-Inumbo-ID: 60af8e6c-2c83-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690465328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SU6g1q4ym50O9nheaB8dyangoWY78CHXd0G+bWMcA6k=;
  b=JajCBo4wxDjaB2atZay1pZmN+vpXO22459jVvccHwZTAkYw3jgoMNPiY
   Vz/7pGM70YmK1CoDJPXPGrZIr2eukfNY9QKcRaojKZMmMjzZHK4sJ7LpT
   i77cHnHQJw/wzG4Hp1gZSuecVUYIAkauyc93HEYpCujRZGlv/7vQWSEIy
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117524933
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:DDmc1a3ak4j6az52OfbD5fpxkn2cJEfYwER7XKvMYLTBsI5bp2MBm
 zAeUTuEOfqCY2WmfIx1Ptm+90NQ65fdzNQ3GQdupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUU9rx
 LsxEWAxUA2OobLm5euwFuk8r5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwKwxzE9
 zmdl4j/KiMwFcbGxRSLy2CPgePSwiTyQrwWSJTto5aGh3XMnzdOWXX6T2CTo/C/hlSvRtF3J
 Ekd+y5opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2Dks7tBDdvmKaIUn/b/bCRxRu7ISUPJHUOTTMFRwACpdLkpekOYgnnF4g5VvTv15usRG+2m
 mrRxMQju1kNpZ4l8pT81GmXvwyxq76ZHits7VnXDkvwu2uVe7WZi5yUBUnztKgRdN3IFQnZ4
 BDoiODFsrlQUMjleDilBbxUQer3v6vt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2GZUZ5CIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8bDKpfyVylLUvw4pNZTewv7+eV1rszZ7TqNLa0XMjz9iebODJJrYelt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGOmbP/2WsidCBhbbiv8pw/SwJ2ClY+cI3XI6OLkOxJlk0Mt/g9q9okC
 VnmABICkwOm2iGaQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:UsuBzqzBzwt/QUu2Q3D2KrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-Talos-CUID: =?us-ascii?q?9a23=3AAqcmq2pph5WINfvJLoj+Ep7mUZALV0ya5U6AH3G?=
 =?us-ascii?q?lBEA5GJjMQgOQqIoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AQt5qyQ5U+lBB3eyVbA6NIQfExoxayYW0UUwjn6w?=
 =?us-ascii?q?UmM6IKHN3Mi2jiGieF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="117524933"
Date: Thu, 27 Jul 2023 14:42:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v7 14/15] xenpm: Add set-cpufreq-cppc subcommand
Message-ID: <52e1d50f-4cd5-4933-b741-400d02fe97ce@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-15-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726170945.34961-15-jandryuk@gmail.com>

On Wed, Jul 26, 2023 at 01:09:44PM -0400, Jason Andryuk wrote:
> set-cpufreq-cppc allows setting the Hardware P-State (HWP) parameters.
> 
> It can be run on all or just a single cpu.  There are presets of
> balance, powersave & performance.  Those can be further tweaked by
> param:val arguments as explained in the usage description.
> 
> Parameter names are just checked to the first 3 characters to shorten
> typing.
> 
> Some options are hardware dependent, and ranges can be found in
> get-cpufreq-para.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

