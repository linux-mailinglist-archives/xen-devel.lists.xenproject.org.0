Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2221F5A3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 17:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvMTM-0006nR-Ch; Tue, 14 Jul 2020 15:03:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvMTL-0006nM-FC
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 15:03:55 +0000
X-Inumbo-ID: 3bc51a18-c5e3-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bc51a18-c5e3-11ea-bb8b-bc764e2007e4;
 Tue, 14 Jul 2020 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594739036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ES+PpSMP/jGPxKETpq2ksPRVP5enEb1jmX7U4+BWQZQ=;
 b=CY+0b8O5wOvEp1fCzQ13wgO8TnF83mzVBxPtOa1rihUwzaKrCHJ+2BMw
 9eVfN7vza2tguxKWMEfBRDsHAqVcXfVRLuGnMUT9Zf3hQDlVF2wMfI+wD
 O5Mb7gB7NLPBW2pz8NwyfD+KHqvfRtS5YN8GJQdaR+GzBQtjXX9H6ZiE6 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: MwyClK8ACq6LlffZj8u0yXzH3r95/eznJztR+uyRriagpgkmGer/jfyrt++WjsdPGxUpNz8RKO
 W89tPHZ0oHGMVBLO0ICaieLnqKIhF2QWpS3SqNEP7oFYtallmXdxAuyKvN925+GS3U4Z2w3nO0
 UgxVUmJjt9iUn/sqXQJnNSwZCf1s9unnNNvXz7sY3sF7sGB1HUcfI9ouHJs+3YFVHa4Nn1U50q
 +n1XGDz54IWxAOoGA5bb0SV6nAEL09tGXJHRxqIqz2wVYzTbnitSp6p9pJYfrfrA7z5xdgt1ix
 2b4=
X-SBRS: 2.7
X-MesageID: 22664202
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22664202"
Date: Tue, 14 Jul 2020 17:03:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 7/7] x86: only generate compat headers actually needed
Message-ID: <20200714150344.GP7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <5892f237-cfcf-eb19-058c-bd4f45c7bc97@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5892f237-cfcf-eb19-058c-bd4f45c7bc97@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:28:27PM +0200, Jan Beulich wrote:
> As was already the case for XSM/Flask, avoid generating compat headers
> when they're not going to be needed. To address resulting build issues
> - move compat/hvm/dm_op.h inclusion to the only source file needing it,
> - add a little bit of #ifdef-ary.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

TBH I wouldn't mind generating the compat headers even when not
actually used by the build, sometimes is useful to have them for
review context without having to play with the build options.

Thanks.

