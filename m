Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAEA4EDA8F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 15:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296980.505718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZusB-0006Xx-JR; Thu, 31 Mar 2022 13:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296980.505718; Thu, 31 Mar 2022 13:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZusB-0006Ub-G1; Thu, 31 Mar 2022 13:29:59 +0000
Received: by outflank-mailman (input) for mailman id 296980;
 Thu, 31 Mar 2022 13:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCIW=UK=citrix.com=prvs=082fe6e5b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZus9-0006UV-QN
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 13:29:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6719951-b0f6-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 15:29:56 +0200 (CEST)
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
X-Inumbo-ID: a6719951-b0f6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648733396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=StTlKPddtweVB8Ynd3dJ6GhX1brAZOyIbE879a+Gxdc=;
  b=SuAyJFWKT5uTe4wgsAiGslIvhLYliteOYdl58ubqBZr5f1HpUTH9gZxf
   S+tPSyFJ2bpTbSJo9xfxhcIi68awqxi/zrP484vMxx29xgFdC/qDNW3Ba
   Ac//+1o5o+iN4VEmCbd6Jaih6kGcnQkqkq3yLWdHKAAHDBBUOt3nJ+IET
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67092132
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Xgip5a7qIeW5e7utUQbMXAxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 mMfD2uHbKqIYmX8co1ybYW19klXuJ/czoJlGVRq/300Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPiWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTsaC10LqHntt48QhhJDwR8Jodf+LDudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RGMWs1NU+aC/FJEkccFqtmzf7rumLAfyJZtW+Rh4Y86lGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyNtOFziGe2mmxneKJliT+MKoQHbu07O93g3Wcw2USDFsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIO6O4cGCwm/
 XGzvsLoFCBKsqa/UHKS3+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qqf6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xL1WZX1uvHbUKAnoIF1Pz6zfWNE7qQQzd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0Mf8pPd/uVZ53kvWI+THZuhb8NIAmjn9ZLlLvwc2TTRTIgzCFfLYEz8nTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmreVQ+Qjh7W66MmdvMueVNxsxoqwsBx
 VnlMmcw9bY1rSavxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:jxVuiKx4cH9sRI4NZC+YKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="67092132"
Date: Thu, 31 Mar 2022 14:29:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] libxl: constify libxl__stubdomain_is_linux
Message-ID: <YkWszkXKonywX/de@perard.uk.xensource.com>
References: <20220330181722.30280-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220330181722.30280-1-jandryuk@gmail.com>

On Wed, Mar 30, 2022 at 02:17:22PM -0400, Jason Andryuk wrote:
> libxl__stubdomain_is_linux can take a const pointer, so make the change.
> 
> This isn't an issue in-tree, but was found with an OpenXT patch where it
> was called with only const libxl_domain_build_info available.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

