Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0F6C3814
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:20:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512906.793292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peff4-0008PC-B8; Tue, 21 Mar 2023 17:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512906.793292; Tue, 21 Mar 2023 17:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peff4-0008MM-8N; Tue, 21 Mar 2023 17:20:38 +0000
Received: by outflank-mailman (input) for mailman id 512906;
 Tue, 21 Mar 2023 17:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/aZB=7N=citrix.com=prvs=43775ecc5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1peff3-0008MG-EX
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:20:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0b2fab4-c80c-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:20:36 +0100 (CET)
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
X-Inumbo-ID: b0b2fab4-c80c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679419236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MgKd1eJ00uejEFhhx33/vJ84bMAK9HPuqXzE+ky54pw=;
  b=It6DyoQp+Kw3FYoPEg6DY39OH0VX1Rlw0EiXAEbYVaciYrCkM/41KGlr
   rvbpfmQLXvbSKEQs9vweYBxeyh1XRs6yAgE6i48z0btDZr9k01XF43Fjh
   Ae9valgR0z3ca1sfV6X+axThcfVZftq2sgzVppG7ilx69Ft63A0NjeLEq
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 104163658
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2jDyRK9m53xEk9/wREKvDrUDx3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 GoYDW6GMv7cYzSjfooiYd/i90sDv5+Dm94xSgdv/Ck8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoS5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl/z
 9NHDDRTYCuuoO6P/JSHcNlW3dYKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhrB+
 DmYojSR7hcyOOzD6wOC00qV2fLMxhr3BactNYWaz6s/6LGU7jNKU0BHPbehmtG7hVS5QMl3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsUTppeNEg8sgsSlQC1
 FWEgtfoDjxHq6CORDSW8bL8hS+7PCEOBXMBYSICQhoI55/op4RbphvOVd9iFKedhNzpFTz+z
 jaGoTJ4jLIW5eYTz6Sh9lnDijixjpLIUgI46AjRUm+/qAh+YeaNZIuu81HXq+lBKIWxSUOIt
 3wJ3cOZ6YgmAZiTmQSXTe4KHbXv4OyKWBXZiERqFoMs9Bys/WCiZoFa5DxiJEZvPd0AcDWva
 0jW0StT+ZtSMX2CfaJxJYWrBKwCxLDtD93/WtjIb9BFZd56cwrvwc11TRfOhSa3yhFqyPxhf
 87BKq5AEEr2F4xW9hXpY+ND34QG4SwH+UXvf6DBlAaOhO/2iGGudVsVDLefRrlns/Lf/liFq
 o0329iikEsGDrCnCsXD2ctKdA1RcyBmbXzjg5YPHtNvNDaKD43I5xX55bo6M7JokK1O/gsj1
 iHsAxQIoLYTaJCuFOlrVpyAQOm1NXqHhShnVRHAxH7xs5TZXa6h7b0Ea7w8dqQ9+epowJZcF
 qdaKp7bXawREWyXoVzxiKURSqQ4LHyWaf+mZXL5MFDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 oBMIjjzGMJZLyw7VZ6+QKv2nzuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5tRckWZnWbAj
 l/+7NVxjbClnrLZOeLh3cisx7pF2cMjdqaGNwE3NYqLCBQ=
IronPort-HdrOrdr: A9a23:zkN2SapboiKcRu6y4RUIHPMaV5oteYIsimQD101hICG8cqSj+f
 xGuM5rsSMc7wxhP03I+OrwXZVoLkmwyXcY2+Us1PKZLW/bUQiTXeNfBOnZowEIcheWnoU26U
 4jSdkcNDSZNykCsS+Q2miF+rgbr+W6zA==
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="104163658"
Date: Tue, 21 Mar 2023 17:20:05 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Christian Lindig
	<christian.lindig@cloud.com>
Subject: Re: [PATCH v3 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
Message-ID: <4b2fbe78-89e6-4d97-bc9b-36668e1f0568@perard>
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306072140.28402-2-jgross@suse.com>

On Mon, Mar 06, 2023 at 08:21:37AM +0100, Juergen Gross wrote:
> In order to better reflect the contents of the header and to make it
> more appropriate to use it for different runtime environments like
> programs, libraries, and firmware, rename the libs.h include file to
> common-macros.h. Additionally add a comment pointing out the need to be
> self-contained.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> # tools/python/xen/lowlevel/xc/xc.c
> Acked-by: Christian Lindig <christian.lindig@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

