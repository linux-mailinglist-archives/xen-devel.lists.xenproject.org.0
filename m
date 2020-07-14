Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BDE21F427
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 16:32:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvLzG-0003t4-BC; Tue, 14 Jul 2020 14:32:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvLzE-0003sp-QL
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 14:32:48 +0000
X-Inumbo-ID: e35c7dc0-c5de-11ea-931c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e35c7dc0-c5de-11ea-931c-12813bfff9fa;
 Tue, 14 Jul 2020 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594737167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W+4mPB3k7E9WEQwkaLmFSNqFF5GBBRz9I004eyGpiao=;
 b=N3pQLoomMYgOjUC6ALF3R3hQjG6n4ehqzxnKj0tJzm5FAXcGcOkXG29G
 Ayg2yVlybZ36rjBgQ0gRroq6DFC96HtmR09QKfjOUvb+7Rsn9d2/Ov18B
 j6HsvrPp9pmuyQZtGGXmcWTsWcLsZyxG/Hxjp3TcNy48A0U4KE93sxfFH g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: e9W0yGQB1TiwM2wn+v7JH3noqdCbU1DSvWWsyO2sIODaC0rR+Zfj0+962f6JwP/OImmHvA6ue6
 uaVci7yMfrSY48s2Q6LBQTt15I7HxUr/Nxvip2iHzFQQWZ/1Lz+kCpUMOUr1Iq206yqCIJ6Vn9
 AQciIStJH4ogvOR8mhZ5LoG/qVSehW2OeF/Wau2C2ofEndxMd1aDUoXSoENiN8yj5Cn9/nH4IW
 rJP/ViMjN84N/Cb9QYpX1k25sXj4kni+B0KifBwA5RkIcIJm2ud/mIbamb5R79EOK1KUs8xRED
 TKw=
X-SBRS: 2.7
X-MesageID: 22673810
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22673810"
Date: Tue, 14 Jul 2020 16:32:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/7] x86/mce: bring hypercall subop compat checking in
 sync again
Message-ID: <20200714143238.GN7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:26:54PM +0200, Jan Beulich wrote:
> Use a typedef in struct xen_mc also for the two subops "manually"
> translated in the handler, just for consistency. No functional
> change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

