Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858E21EF0E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 13:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvIxs-0002jJ-JI; Tue, 14 Jul 2020 11:19:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvIxq-0002jD-Sd
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 11:19:10 +0000
X-Inumbo-ID: d5ce9619-c5c3-11ea-92fb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5ce9619-c5c3-11ea-92fb-12813bfff9fa;
 Tue, 14 Jul 2020 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594725549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bmMPQd+N8T9YBrSTYgCcoOlLXK1DFjRkp+a//IvzCNQ=;
 b=YTz8UlXSGNV2OcXX/cvKYb15Ik22+D6TInVYEF82cjkWN0y5D+caPbX5
 Bves7EjjyvVT+r0XEqHqAk8e22BwONqtH5PVf0FjlhIXndn2hg70rB353
 bP8MEOTPLigTaWvd15e1P2YOMQaZ38/gl6+ROuTKAyyaXE7dc5dO4/EQH I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dKvtN1W44Xs5OPJjtNdDWaeoDcRLea9VIVmnYr3g6VwRy0IdJIg9VyRU7czC6pkBts3fj5ptR/
 elVIgypijoulLpE33wL6LdkUb3HLI/0Mg7/vQQBQ2SVrzMlE0gX5VhohOg9+X2n8bAZOoE44Sl
 jtjMcQT0QnbzDEgG4fEJDjWZBavMRBtTJx+5gHrI5aat7emVe438Oh1grqKsfVUTJBqz9qxNH9
 7seSSqxxnd9vwZVTB0SUBxV01VHz0bZiwR7ZmI6jv7QwCfUeNRWKuRuuUGglz+a4Qs4FskQnOR
 62A=
X-SBRS: 2.7
X-MesageID: 22653112
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22653112"
Date: Tue, 14 Jul 2020 13:19:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/7] x86/mce: bring hypercall subop compat checking in
 sync again
Message-ID: <20200714111900.GI7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
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

I'm slightly puzzled by the fact that mc_fetch is marked as needs
checking while mc_physcpuinfo is marked as needs translation,
shouldn't both be marked as needing translation? (since both need to
handle a guest pointer using XEN_GUEST_HANDLE)

Thanks, Roger.

