Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5292480C3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:36:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7x6m-0001qs-V2; Tue, 18 Aug 2020 08:36:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SD0B=B4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7x6k-0001qi-Pw
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:36:38 +0000
X-Inumbo-ID: b00ef5b5-4fde-4437-8123-d13ed935007a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b00ef5b5-4fde-4437-8123-d13ed935007a;
 Tue, 18 Aug 2020 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597739797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=02irrjygnVlE9mzK5xqI+Am879Afo4diMX05U7Q1tR8=;
 b=Wbsio8Hy7A9CrZd3gGBui3Pwtxrcn+2YHiarV0ppQvzuBEfp/6PX/iyO
 S4qDWRx6/VdO4AK9MehGX/yvDxNaxz28V1LRFtQpYh/F6KJC35E4dZjGP
 ROvp3/2kOaAvGoon1qLR75wrJRNacEs2bGYgMtmSe6EUW0oZZwM4SEfLT o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SNAk1/gmMEVLxcqnLwNTWkAQjAu2086RryKL1HcF/zko64L1O8UD5k7KrBeGgfAr0iDGjyoYfq
 ZUgORpOtqgDT7DctkLE3K+kjzAhbbgSpPwZ3bu/xTWtI6PtImwcgooNd3zZJ6o4u4ePlpj4DE+
 unAcs/aYJfLRFmkBqkGXQojGXodjeNzp3lMIQPZxXhGg9lKqJvXu4ya87xdG4mJ8UKSC47S3sd
 Lz/LSkTtIqKtLJxCHaQCQJiCwHuspclyIHUuMMEm0KW6aIE9xXDdL2+FnFLlk+0l7gEsudQgCr
 XuI=
X-SBRS: 2.7
X-MesageID: 25063952
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,326,1592884800"; d="scan'208";a="25063952"
Date: Tue, 18 Aug 2020 10:36:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
Message-ID: <20200818083629.GI828@Air-de-Roger>
References: <20200722165300.22655-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722165300.22655-1-julien@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Wed, Jul 22, 2020 at 05:53:00PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Even if we assigned pirq->arch.irq to a variable, a compile is still
> allowed to read pirq->arch.irq multiple time. This means that the value
> checked may be different from the value used to get the desc.
> 
> Force the compiler to only do one read access by using read_atomic().
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

The whole discussion about renaming {write/read}_atomic is orthogonal
to this patch IMO.

Thanks, Roger.

