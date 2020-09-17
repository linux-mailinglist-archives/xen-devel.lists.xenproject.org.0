Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F026DA80
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:40:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIsHG-00062d-KJ; Thu, 17 Sep 2020 11:40:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7l8=C2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIsHF-00062U-Ma
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:40:37 +0000
X-Inumbo-ID: 928309d4-1eb4-439e-968e-7973dfaaf287
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 928309d4-1eb4-439e-968e-7973dfaaf287;
 Thu, 17 Sep 2020 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600342837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NCWncAO+MDYKPeOVDX7S1Qh+zu9pS/LNweDEuHOuzy4=;
 b=VbJonQPCqHN4f7pSleJBnDhnA7/dS5gOrsUfe1uSKEtrTmywGZ1vQ65+
 G+DCVJPcklGh2fW9lCYGlXB+fgVJJ8DBeDJpw43oa5eikUOj+DdWtc6ER
 2dpg70oXWz3sEG3Cg9Y3wfd6X6NXWQbypzDsTMU1K7A2XixmH/sbqh76x Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /IRiIyPGsvbJNNvT//9jYC8Gw7PV11O++MM2J+ppeB86ZDYiz79KwdFtTj0TOY8bZAtV97bnIu
 l8vX7ZxTs075UAhmovlyUslu4gXMO+JA2kx2LfOrnGJpS5drKFCek/D+c2O20ZTn9hLQ9zYND1
 k8taok9b7pKlapFqm8LHAAdIGl+ppYfyDC6vECuf9jfUVmYWY00HmTX761S3eeDd9KbVZ9sgGL
 dwS1sAS1w33ZWkQjK3VKWvw9Vilz42c8Q7EKysbH8pXOPU3KtH/G4k3VAzGwsw4zIqKOrabDhH
 8Rw=
X-SBRS: 2.7
X-MesageID: 27254253
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,436,1592884800"; d="scan'208";a="27254253"
Date: Thu, 17 Sep 2020 13:40:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Trammell Hudson
 <hudson@trmm.net>
Subject: Re: [PATCH] EFI: some easy constification
Message-ID: <20200917114027.GD19254@Air-de-Roger>
References: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
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

On Thu, Sep 17, 2020 at 01:27:12PM +0200, Jan Beulich wrote:
> Inspired by some of Trammell's suggestions, this harvests some low
> hanging fruit, without needing to be concerned about the definitions of
> the EFI interfaces themselves.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is purely a non-functional change AFAICT?

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

