Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF557098C7
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 15:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537094.835877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00Yp-0003CU-6m; Fri, 19 May 2023 13:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537094.835877; Fri, 19 May 2023 13:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00Yp-0003AI-3x; Fri, 19 May 2023 13:54:23 +0000
Received: by outflank-mailman (input) for mailman id 537094;
 Fri, 19 May 2023 13:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1HX=BI=citrix.com=prvs=496750f7c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q00Yn-0003A8-TU
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 13:54:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5cd3c71-f64c-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 15:54:19 +0200 (CEST)
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
X-Inumbo-ID: a5cd3c71-f64c-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684504459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCnM66PND3tboRMB8gcvZFeeqFeCuf9rRPG+txHkYnQ=;
  b=iMGhEGsVfAYZpuKG5g27EZpWcytLqoEcpRtM8foaWE/5UTzHXjc/kW+0
   Vv7b4U9kr0hwKVwnliVE5H2j48+RqBpNX2QkQSCrpDjpgG7vJZOSKCzU8
   YuIE4Ocmq3Tc1fZxGT0gTleBugwNRws7QSAaONxWGfGYEDtRKtRbgbna4
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108992975
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bIGxo6sTzqosbWb3qXhbZNrZwufnVGBeMUV32f8akzHdYApBsoF/q
 tZmKWqAO/+CZGr3e91/aYzl/UsCuJDTmIM2GQJk/ng9ES1D+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcjknUTKgt7ONkbulV9lSqtgECMTIFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zqWrjWjU05HXDCZ4RGs/TGngO/joRPiALBPKLSCxPtpvGTGkwT/DzVJDADm8JFVkHWWWd1FL
 FcP0jEztqV0/0uuJvH0RxCiqWSIlgIdUdFXVeY97Wml1a788wufQG8eQVZpatUguNUnWD8C2
 VqAntevDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nFk3N3/kPLnyY3h9Hr4oRGc96OYRxAo1jv7QkWB4yBQMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNDKi8gjlmOMIZmOq7EMZGOyatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzOPGcunn0j8j+TPDJJwdVviGALUBt3VEYve+FmFm
 zqhH5DiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/Fqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiNigyMeq3Bcov8hrW/0UEZD6V5pTqWq73hI93Snf9VeVPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:9mSNXK3tqUYGUgvpxNcF6wqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-Talos-CUID: 9a23:5zytc2+L1V5UBgywE7OVvxQdMP8HUU2M9ybZPVKIN0p1b5mYanbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A2bG4SQ2NfjLmKxMmf27Jc7vqtDUjyI2hS0sLkbk?=
 =?us-ascii?q?6i9DcB3FMMg2viTeLe9py?=
X-IronPort-AV: E=Sophos;i="6.00,176,1681185600"; 
   d="scan'208";a="108992975"
Date: Fri, 19 May 2023 14:53:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v3 08/14 RESEND] libxc: Include hwp_para in definitions
Message-ID: <f8f43ced-f34a-4438-8821-7d41f80ab9ec@perard>
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-9-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230501193034.88575-9-jandryuk@gmail.com>

On Mon, May 01, 2023 at 03:30:28PM -0400, Jason Andryuk wrote:
> Expose the hwp_para fields through libxc.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

