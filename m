Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C3437735
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 14:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215048.373991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdtnT-0005it-Er; Fri, 22 Oct 2021 12:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215048.373991; Fri, 22 Oct 2021 12:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdtnT-0005gD-BZ; Fri, 22 Oct 2021 12:37:19 +0000
Received: by outflank-mailman (input) for mailman id 215048;
 Fri, 22 Oct 2021 12:37:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW94=PK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mdtnR-0005g7-LN
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 12:37:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9d83b4a-3334-11ec-83b7-12813bfff9fa;
 Fri, 22 Oct 2021 12:37:16 +0000 (UTC)
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
X-Inumbo-ID: c9d83b4a-3334-11ec-83b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634906236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sj+Ses7UlccZ5My87x/LX91y5zR4NEchAQqGR2YjoY8=;
  b=N5aGS9SHoxGH1pxYA5xkAIv8rg6id3Xf62V2SgC3iE85Uk0VnsfD0QOy
   8oTWGa58Kt46P+gPYjSA3O1+lsxCUyb3XAQotMBvDjOOWiKVaz/TVdd3y
   MtIl16Q0O8aERKymkN7kU4gpFEWd8+Kpn+e/CnEJ88FN5a0knogoHJb46
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UE/ygPf0ut+FK14idCfwhNSOla9JYR1qOeY37FXDtAZ6ij1+AdThdG2LNVtiXBML/+aTzKQtcQ
 qRKPHBP7JJr5w/W8655PrdNRy//SrMgIqDV39XaM+VgMP914GTF9nI/V+uJZ9bL4qvBdaG1iCT
 RtZ5NRYjZif1xsXsCotsG5f3LrYrsKmnqNdj0z/tMJMInj+JKpFgW+rm7HE2KMhmNwkb4lunEv
 5VqB6q+MqD8F927XEmS53XRyYrltd7hedZMpf2wamCEtOA1h0bC9tWKyXSW852+neOsIk45quF
 zB7s42zmJVv29Qr7HpL67ubr
X-SBRS: 5.1
X-MesageID: 56216545
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UJKzY6svoQXraeTJdZYRwDkSyefnVMRZMUV32f8akzHdYApBsoF/q
 tZmKWCEM/aLYGD3L9oiad+z8h5SuMfTmNBmSwtq+Ho8Ri0W+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllI6Cdw4Vbq7wgPUNbBgDKAhcM/Zc0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DO
 ZBAN2czMXwsZTVlZGw+Go9vu92rvVb0Wmd060Co/oMotj27IAtZj+G2bYu9lsaxbc5chEqfq
 0rN9n71BRxcP9uaoRKa9lq8i+mJmjn0MKoJCLC2//htxkaPz2YeDBkXU1qTsfi9i0iuHdlYL
 iQ84TEypKI/8EiqSNjVXBCipnOA+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/voGj5HoLCTUWia9LqfsXW1Iyd9EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpvznKw/5/
 2CJkDAvl4oS1vUi9avg53mS1lpAuaP1ZgIy4wzWWEes4QV4eJOpauSU1LTL0RpTBN3GFgfZ7
 RDoj+DbtbpUVcjcy0RhVc1UROnxj8tpJgEwlrKG83MJzD+q52K4Nb5Z5DVzNS+F2e5VJGe3P
 ic/Ve5XjaK/3UdGj4crPOpd6OxwlMAM8OgJsNiOMrKihbAqLGe6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+R3lnxnmjOLHs2qp/hC7VZ4TCTJIVviGADWBt3VEYve+FmFm
 zqhH5viJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbYSjeK7FoJUqeLqZt4ItQNt/0Myo/go
 yHsMmcFmQGXrSCWdm23hoVLNeqHsWBX9ilgY0TB/D+AhhAeXGpYxP5OLsVtJeB6rLALIDwdZ
 6BtRvhsy89nElzvkwnxp7GmxGC7XBj01w+IIQS/Zz0zI8xpSwDTo4e2dQrz7igeSCGwsJJm8
 bGn0wraR7sFRhhjU5mKOK7+kQvpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJot7xQetzF0ZXBUfB6rOyOXWI92av29YYAu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a2/u1U1AVpGnnPfm+HMLI4LynUx9RLu41M2qRd5Vm8V
 HWQ94QIIr6OIs7kTgIcfVJ3cuSZ2PgIsTDO9vBpcl7i7Sp68bfbA0VfOx6A1H5UILdvad53x
 O4gvIgd6hCliwpsOdGD13gG+2OJJ30GcqMmqpBFX9O71lt1kglPMc7GFyv7wJCTcNEdYEAlL
 widiLfGm7kBlFHJdGA+FCSV0OdQ7XjUVMumELPWy4y1p+f4
IronPort-HdrOrdr: A9a23:wSoM3qOpJd9jgcBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="56216545"
Date: Fri, 22 Oct 2021 13:37:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<cardoe@cardoe.com>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 1/3] automation: add x86_64 alpine 3.12 test-artifact
Message-ID: <YXKwd7hIOYuUbpx3@perard>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211021230839.10794-1-sstabellini@kernel.org>

On Thu, Oct 21, 2021 at 04:08:37PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> It is the same as the existing ARM64 alpine 3.12 test-artifact. It is
> used to export an Alpine rootfs for Dom0 used for testing.
> 
> Also add the exporting job to build.yaml so that the binaries can be
> used during gitlab-ci runs.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

This feels weird to me that we have a container just to share a file,
but I guess that works :-).

Thanks,

-- 
Anthony PERARD

