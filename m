Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902304DDC5A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 16:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292005.495964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVE8e-00037U-3E; Fri, 18 Mar 2022 15:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292005.495964; Fri, 18 Mar 2022 15:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVE8d-00033z-WD; Fri, 18 Mar 2022 15:03:36 +0000
Received: by outflank-mailman (input) for mailman id 292005;
 Fri, 18 Mar 2022 15:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gqp6=T5=citrix.com=prvs=069a58476=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nVE8c-00033t-Ju
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 15:03:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92fe537f-a6cc-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 16:03:33 +0100 (CET)
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
X-Inumbo-ID: 92fe537f-a6cc-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647615813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rv9gedlFnHMe/m4FcFQITmNF86t8mTlYCkEZwqq7ayU=;
  b=EwMgcLcmywNRum/Kn2hlyMBwOHWomUmFAxJBFso07sR9664kEW9GMBR/
   pBh9CZb/HpFbB8ceccgXyhv3oqP/rg9kyRrLxmvxc5HDuNsRNuXMeBm6h
   UQOzbD+eSVpiTmneXVhLfEbaKv1BvDHGIFoao4rswL1OGz0V77wyDx2VI
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66617835
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jC6QlKjph7uRXjaSv0/KFK7xX161hBAKZh0ujC45NGQN5FlHY01je
 htvDz2Gb6yJZzOnL4h/bYm38B8OvsKHmoVkTAA5+ChgEnsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YUQlHIz8oLUiaEhZOnx/P61325nYOWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2QxNUuQOEAn1lE/IpVkwrmNumvFYjB2t3eq+a1r503X9VkkuFTqGIWMIYHbLSlPpW6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3uV2jVOawGtVEwEfX1a/pfi/i2auWtZeL
 VxS8S0rxYA4+Va3VND7U1u9qWSdox8Hc9NKFqsx7wTl4rXQyxaUAC4DVDEpQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313rWJqTK/PwAFIGlEYjULJSMO6sPvp4wbhRvVQtFuVqWyi7XI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyE5ZTrbz4NtzrsD2OMswJ7ZL+GQZOw9g2OhRpfF7qxQl6Et
 XkCvsGR6uESEJ2A/BCwrPUx8KKBvKjcbmCF6bJ7N9x4rmn2pSb/FWxFyGsmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjasSsUpHONk1Hs3DaJ144wLuBJ0+U3YE
 c3HGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLFehYbgLXNbhktPrsTODpH
 zB3bZfiJ/J3CrCWX8Uq2dRLcQBiwYYTWPgaVPC7hsbce1E7SQnN+tfawK87epwNokimvrygw
 51JYWcBkACXrSSecW2iMyk/AJuyDccXhS9qZkQEYAf3s0XPlK7ytc/zgbNsJuJ5nAGipNYpJ
 8Q4lzKoWa0eFG6Yp2xDMfEQbuVKLXyWuO5HBAL9CBBXQnKqb1ahFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:kMNdaqwOLCDOJVIwMfbXKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.90,192,1643691600"; 
   d="scan'208";a="66617835"
Date: Fri, 18 Mar 2022 15:03:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, <cardoe@cardoe.com>, <wl@xen.org>,
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>, <bertrand.marquis@arm.com>
Subject: Re: [PATCH RESEND 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Message-ID: <YjSfPtUwWrqhDsW2@perard.uk.xensource.com>
References: <20210714004854.31135-2-sstabellini@kernel.org>
 <2aaddfc5-0502-fd0a-6393-63a17c7f6778@xen.org>
 <alpine.DEB.2.22.394.2203161508200.3497@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203161508200.3497@ubuntu-linux-20-04-desktop>

On Wed, Mar 16, 2022 at 06:38:53PM -0700, Stefano Stabellini wrote:
> Also considering the recent arm32 xen breakage, which could have been
> caught by gitlab-ci before commit,

I'm not sure that's true. I think the commits you are speaking about
also break the build on x86, which was caught by the gitlab ci.

Anyway, some arm32 smoke tests on gitlab should be useful.

Cheers,

-- 
Anthony PERARD

