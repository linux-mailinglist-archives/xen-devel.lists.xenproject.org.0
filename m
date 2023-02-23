Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A66A0C16
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500475.771879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCpU-0003ac-Vu; Thu, 23 Feb 2023 14:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500475.771879; Thu, 23 Feb 2023 14:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCpU-0003Y9-T7; Thu, 23 Feb 2023 14:44:16 +0000
Received: by outflank-mailman (input) for mailman id 500475;
 Thu, 23 Feb 2023 14:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOJK=6T=citrix.com=prvs=41104d4c8=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVCpT-0003Xz-PI
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:44:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 896239bc-b388-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 15:44:13 +0100 (CET)
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
X-Inumbo-ID: 896239bc-b388-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677163453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6N09BFP9qQbiCpEj1woegCXPh7SLVN6ZYQsbQlNBKcY=;
  b=QMCIdP27IAi9po61e7RlPmiBnutrPWXmMcd8yqI1PHTqzspYkxs5oI9u
   ShCt0vDP47Kr7TqjDJivdc+RySvdHgI8Bv/tFqYqruhb8uqSCguTiyQeo
   K1SJD4wEn+DBodPyQXhYw3G1Z5fuTKBr8m97geCRXD8tD+l2uunhGOON9
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98641383
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:o7jFXq1hCOi//C0Wa/bD5Q5xkn2cJEfYwER7XKvMYLTBsI5bpzVWy
 GcYXmCDO/7ZamX1LYwlPonn8BkBu8KHzYBhTQI/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCjhL1
 N8kJRU0YxGehtOR25W0adtrmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJULwh/D9
 jmuE2LRKCAiG8Ch+CO/6GPw2dSXxBHAeoE+PejtnhJtqALKnTFCYPEMbnOxrOOlkEe4V5RaI
 lYN5ys1haEo8QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsIwXno11
 1yNltXlCCZHtLyTQGiasLCOoluaJiw9PWIEIygeQmMt4db5p5oopgnSVdslG6mw5vX8ATzqy
 iqGhDQ/jb4Uy8UM0s2GEUvv2mz24MKTF0hsu1uRBzj+hu9kWGK7T4fx7Hn40ftlFYuYU1iwm
 2MjlOus6/9bWPlhixexaOkKGbio4dOMPzvdnUNjEvEdyti9x5KwVdsOuW8jfS+FJu5BIGa0O
 xGL5Wu98bcJZBOXgblLj5Vd4ijA5YzpDpzbW//ddbKiibAhJVbcrEmCiaN9tl0BcXTAc4llZ
 f93ku72Vx727JiLKxLnL9rxKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra/1qNo
 o4ObpPVlEk3vAjCjs7/q9N7ELz3BSJjWcCeRzJ/K4Zv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchYw9bYLvlWecV/iQik6ONvSsWNX8SpT0doEYQz5hBDOoO+HsM8iSnfAVeN7qLw4lK8vF
 qFtlgfpKq0ndwkrMg81NfHVxLGOvjzy7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:h+tTlKkVe3kM9jrg/jliXxF/q3XpDfId3DAbv31ZSRFFG/Fwwf
 re+cjztCWE8wr5PUtL9OxoV5PwJk80maQFmLX5Xo3CYOCFghrNEGgK1+KLqAEIfReOldK1+p
 0QEZSWY+eAa2SS4/yKmDVQ0OxO/DBEysyVbCvloUuFhDsLV51d
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="98641383"
Date: Thu, 23 Feb 2023 14:44:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <jens.wiklander@linaro.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: Use PKG_CONFIG_FILE instead of PKG_CONFIG variable
Message-ID: <Y/d7sgs7SOO4W8gQ@perard.citrite.net>
References: <b2638649e04e516e0aecabd928aa3f63ed50c409.1677150173.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b2638649e04e516e0aecabd928aa3f63ed50c409.1677150173.git.bertrand.marquis@arm.com>

On Thu, Feb 23, 2023 at 01:03:03PM +0000, Bertrand Marquis wrote:
> Replace PKG_CONFIG variable name with PKG_CONFIG_FILE for the name of
> the pkg-config file.
> This is preventing a conflict in some build systems where PKG_CONFIG
> actually contains the path to the pkg-config executable to use, as the
> default assignment in libs.mk is using a weak assignment (?=).
> 
> This problem has been found when trying to build the latest version of
> Xen tools using buildroot.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

