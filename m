Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C96CA6B3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 16:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515287.797998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgnP3-0006Uw-Kh; Mon, 27 Mar 2023 14:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515287.797998; Mon, 27 Mar 2023 14:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgnP3-0006Rw-Gf; Mon, 27 Mar 2023 14:00:53 +0000
Received: by outflank-mailman (input) for mailman id 515287;
 Mon, 27 Mar 2023 14:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+OC=7T=citrix.com=prvs=44343e547=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pgnP2-0006Rq-36
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 14:00:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c32e4761-cca7-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 16:00:45 +0200 (CEST)
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
X-Inumbo-ID: c32e4761-cca7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679925649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XZ/VylZZdH7gN1gWRbGPgVlUknPaMl/61/kFHk/1rzM=;
  b=bhSjeeNVGpuRP+GT6VSatq3XrjltWtTuq1py+dBAvzEs8OnmdUZDRsZa
   VN77BMu1GfljM+cNJlYpKYntA5HWhRlXzlGtzv2JI1/S8RKK6V1TpvUWT
   M9Z2w28YMgTnv7Ku9ZpKYnW2RV//mD7cOC0/pW0MZ17BHyKI3cZigJ0BW
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 105415416
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ut9lZKAlaAFGDBVW//3jw5YqxClBgxIJ4kV8jS/XYbTApGwkhmMCx
 2IYDD/XbvnfNmH9fohxO962pk1Tvp7Rydc1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwoaEuJmYJz
 dIhECkGcAuCuf+W2KuWRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TXGZwIwh/Gz
 o7A12/8Xx9ADJ/H8Bnf/HOX2s73whz3cqtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaIsxsdc9tWDewh6QuJx7bU4gCWHWwNRHhKb9lOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKksijrfQ9AlF7S65vX3BDXxz
 jaivCU4wbIJgqYj3r2251ndjxqwp5LCSUg+4QC/Y46+xlonPsj/PdXusAWFq68ad+51U2Vto
 lBf3JG566c2I6i1jSeTW+QzAZGx/tuKZWi0bUFUI3Uxy9i80yf9ItEOvmwkfx8B3tUsImGwP
 hKK0e9FzNoKZSbxM/cqC26kI55ypZUMA+gJQRw9gjBmRpFqPDGK8yh1DaJ79zC8yRN8+U3T1
 HryTCpNMZr5If49pNZOb71BuYLHPwhnrY8pebj1zg68zZ2Vb2OPRLEOPTOmN75mvfPZ/VuEq
 Y4OaKNmLimzt8WgChQ7DKZJdQxaRZTFLcmeRzNrmh6rfVM9RTBJ5w75yrI9YY1195loehPz1
 ijlACdwkQOv7UAr3C3WMhiPnpuzB8cgxZ/6VARwVWuVN48LPdn/t/dDK8poFVTlncQ6pcNJo
 zA+U53oKpxypv7vpWp1gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:q0JR06AjwF2N7svlHemE55DYdb4zR+YMi2QD/Ep6ICYlCfBwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="105415416"
Date: Mon, 27 Mar 2023 15:00:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] configure: Drop --enable-githttp
Message-ID: <d3d2c13f-5fed-4f02-91f3-be803b2f8588@perard>
References: <20230324201404.3247572-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230324201404.3247572-1-andrew.cooper3@citrix.com>

On Fri, Mar 24, 2023 at 08:14:04PM +0000, Andrew Cooper wrote:
> Following Demi's work to use HTTPS everywhere, all users of GIT_HTTP have
> been removed from the build system.  Drop the configure knob.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Do we need a changelog entry about these changes? (That git clone are
now default over https and --enable-githttp / GIT_HTTP are ignored.)

In any case:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

