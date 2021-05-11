Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1837AAD7
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 17:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125791.236779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUSV-00007d-M8; Tue, 11 May 2021 15:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125791.236779; Tue, 11 May 2021 15:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUSV-00005B-Hz; Tue, 11 May 2021 15:38:07 +0000
Received: by outflank-mailman (input) for mailman id 125791;
 Tue, 11 May 2021 15:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgUST-000052-FO
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 15:38:05 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26308c16-cf12-4f24-9b09-357f6dc5e6f7;
 Tue, 11 May 2021 15:38:04 +0000 (UTC)
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
X-Inumbo-ID: 26308c16-cf12-4f24-9b09-357f6dc5e6f7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620747484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/mVvZJb6a3J6JyU/mCMymSi34pknKkya6IqAQC+qieg=;
  b=gT/PJaj/EBrkT7Wtm0nf4tvzXybN017Juoiv7ykVOUo+CoNvX1MNSbfR
   4HGGnUA7+IaXpJm44NNIGQ6mNcKkmmBJ146TNkLvSJEvPApOYyNLJ0grl
   92b6FD8RJxwrTjZGrQCBHQQflRPOIjkdz4dU7UpLUYoQYIS1p7Wrj2oEU
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MCG4+Il14Rkz9XYzlt51lc8Fa6/pxPOM7T7EvJXr2OsGd4RBVnBy17ACDF4M5D7K3DzAfeXVmO
 QPaF+1OgA/84p+RzY2MP+2SebSZZfI28MI8RWyz1byWeWOMUzuToApjZMZNM887FztxAvV+j2o
 MAk+YIMtpe+HB/QJAuFPSaYFul3pkWbuHxz81j1iZCHY2RGicS2SHOldrVIq8IjNWS/H9UQIFC
 vUk0N22nKlmTFd4ji1ILvPcay5Pem1dg+2mBkBeGPTBImZvOHnFWhFui8Wboil/+62+yGNwIFR
 anE=
X-SBRS: 5.1
X-MesageID: 43659972
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LauO+6CWGkYeJZPlHelc55DYdb4zR+YMi2TDt3oddfU1SL3+qy
 nKpp4mPHDP5wr5NEtPpTnEAtjifZq+z+8Q3WByB9eftWDd0QPFEGgh1/qB/9SJIUbDH4VmpM
 JdmsZFaeEZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43659972"
Date: Tue, 11 May 2021 16:37:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 11/14] tools/misc: Use const whenever we point to literal
 strings
Message-ID: <YJqk152zKuEmv3mY@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-12-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-12-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:10PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> literal strings are not meant to be modified. So we should use const
> char * rather than char * when we we to store a pointer to them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

