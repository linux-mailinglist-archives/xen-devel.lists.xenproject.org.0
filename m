Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE326BE7A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:47:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISA9-0004Aw-VT; Wed, 16 Sep 2020 07:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kISA8-0004Ap-O2
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:47:32 +0000
X-Inumbo-ID: fbd676d9-48ac-4b04-be48-2f0b353342d0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbd676d9-48ac-4b04-be48-2f0b353342d0;
 Wed, 16 Sep 2020 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600242449;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HE0OMmjhbTCCCiRsJyzQeLnYxg2sejQTIiaOqCjEovc=;
 b=e487GEkGY+QKwRc8tYXlW/x9zXuXG9XPAZltf0pziyO4rLrqfH04s720
 b5pgZ3WibsbiHgAsGCtZe63RXDZQq7QRZ9ZA88Ce6t+hdkh0EeflaQO54
 sGDnK1bmNh11H5FWZ2Eg+YEU6sw0FpIoC9jybiy0G2L/uUKKu4V2Gyl+g A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YB69DiiTbvjSdHVfNqUkqh1K80uQg5Vn2HioUxXv4sAwbGtOfZ9YMdqcMpgv5dOd8fTSy/sdIG
 dpVtRbIVCr3SGhYQoOs40wOS2bQ+Jm9EmIc/Pq9rLONCzrnoz8UoCrRXgQzIy/DIobFDEm2lqO
 SClBDisAAcuyUgV0NDDfmz0AQZZsBE5ritOR/zm5nKOLTAUueSBom1IBunhW06UgejRLsQwzU3
 DBJGXa7P/wqIdTm8kMB0KWXBp3rMygHLcBQXr8ZrzwK2XOVHTOc0wd84rv+2TecWCno51QiN7x
 SB0=
X-SBRS: 2.7
X-MesageID: 26778018
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,432,1592884800"; d="scan'208";a="26778018"
Date: Wed, 16 Sep 2020 09:47:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [PATCH] mm: adjust get_page()'s types
Message-ID: <20200916074720.GT753@Air-de-Roger>
References: <ba4a5dcf-3d43-09bd-870e-46a540850cc3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba4a5dcf-3d43-09bd-870e-46a540850cc3@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 16, 2020 at 09:28:47AM +0200, Jan Beulich wrote:
> The passed in domain doesn't get altered and hence can be const. While
> modifying its prototype anyway, also switch to bool.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

