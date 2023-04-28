Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C56F19F9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 15:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527341.819898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOTw-0008PC-7F; Fri, 28 Apr 2023 13:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527341.819898; Fri, 28 Apr 2023 13:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOTw-0008Mb-3R; Fri, 28 Apr 2023 13:49:52 +0000
Received: by outflank-mailman (input) for mailman id 527341;
 Fri, 28 Apr 2023 13:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=plFI=AT=citrix.com=prvs=475a2a817=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1psOTv-00080U-3S
 for xen-devel@lists.xen.org; Fri, 28 Apr 2023 13:49:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a2f385a-e5cb-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 15:49:49 +0200 (CEST)
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
X-Inumbo-ID: 8a2f385a-e5cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682689789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FlF4+hxhk9VFaazEr8izLGgYD1gdeY+jeq/+ewTQkPg=;
  b=OJz9uJMg+AKL0FxpXo5BS/nUWNiUjyFWHcEZzbV2PuaVrk4/K14g1Ff1
   eo1JlMzKvPkEtdHHKVaOmN//wFaO/DYFZob0g7aKuXD5HT9D7pFp5Xa69
   XyXQxKJBPUNKaNfrR+eGBn2KLLDVxVVVQ/AvwMwwD3G37+ELDv5EPK8qX
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109669946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PmPFxquR2oj44vV8mQRyekl6EefnVDNZMUV32f8akzHdYApBsoF/q
 tZmKW7UO6nea2f2fowlaYW+9B8FvJ+HnYcyQAVv/CxmESxA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOExyFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKBEDUCyt1t2MxpmDdvVxueh8fY7ZBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zqXoTqoU01EXDCZ4SWk8Hy+q+KXpz2hQd0XGaSx7P1I3lLGkwT/DzVJDADm8JFVkHWWXNZSK
 FcI6zEuhac3/U2vCNL6WnWQpXeYvh8RRpxIFOwg6QyX4q7V5Q+DAS4PSTspQNUiud9wTzEs0
 FKEt9foAzV1t/uSU3313r6MoCm7IyQ9MW4IbihCRgwAi/HkpIwwlRvJQsxUDL+ujtb1FDfzx
 BiHtCE7wb4UiKYj2r+6/hbciDKtopzISAEd4gTRV3iiqARja+aNZYOy7kPAxe1dN4vfRV6E1
 FAUls7b4O0QAJWlkC2WXP5LDLyvofGfP1X0n191EoIhsTew/ne5VYRR5jhkIwFuKMlsUST1e
 kbPvhgU6JJNFHyyKKt2eJ6qTcAry6H6EpLiTP+8RsRPZJN8chPB8zxveVKXw0jpkU4li6Z5P
 o2UGe6uEHIbBKJP3DewAeAH3tcWKjsWnD2JA8qhllL+jOTYPSTOIVsYDLeQRuAY4p24jlTqy
 dB0D/eW1ipzD7y5UBCCpOb/Mms2wWgH6YHe8pIHLLDeflA7QAnNGNeKn+p/JtUNc7B9076Ro
 yrjAhIwJE/X3yWvFOmcVpx0hFoDt75bpGlzAyEjNE3AN5MLMdf2t/d3m3fakNAaGA1fIR1cF
 aNtlz2oWKgnd9g+0211gWPBhIJjbg+3ogmFIjCoZjMyF7Y5GVyTpIW8IlWyqnBTZsZSiSfZi
 +zI6+8macBbG1QK4Dj+MppDMG9dTVBCwbkvDiMk0/FYeVn28ZgCFhEdesQfeplWQT2an2vy6
 upjKUtAzQU7i9NvoYahaGHth9vBLtaS6WIGRTmBs+rraneLlodhqKcZONu1kfnmfDuc0M2fi
 S99lpkQ7NVvcI52jrdB
IronPort-HdrOrdr: A9a23:yiZVqas7hM32OCb4TM0XZaaU7skDcdV00zEX/kB9WHVpm62j5q
 aTdZEgv3LJYVkqOU3I9erhBED4ex3hHP1OkO4s1NWZLWzbUQKTRekI0WKF+UyCJ8SXzIJgPM
 xbAsxD4bPLfDpHZRmT2maF+7FJ+qj/zJyV
X-Talos-CUID: 9a23:B9GCbGDbKChC49b6EylG+nAoNJEaSHv29EvMPnCUVjcueoTAHA==
X-Talos-MUID: 9a23:ApcLaguToukmfGAzmM2nmxBgOtVF7vyUFhoUzpALosCeNg4uNGLI
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="109669946"
Date: Fri, 28 Apr 2023 14:49:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V3 2/2] libxl: fix matching of generic virtio device
Message-ID: <5e98d465-be8f-4050-a988-2a0829a71a2e@perard>
References: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
 <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <888e60d2ec49f53230bc82df393b6bed4180cb8a.1680771422.git.viresh.kumar@linaro.org>

On Thu, Apr 06, 2023 at 02:28:18PM +0530, Viresh Kumar wrote:
> The strings won't be an exact match, as we are only looking to match the
> prefix here, i.e. "virtio,device". This is already done properly in
> libxl_virtio.c file, lets do the same here too.
> 
> Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

