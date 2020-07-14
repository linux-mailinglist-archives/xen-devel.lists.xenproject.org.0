Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C421EDEA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 12:26:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvI7U-0006mY-EO; Tue, 14 Jul 2020 10:25:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvI7S-0006mT-QD
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 10:25:02 +0000
X-Inumbo-ID: 4638e6cc-c5bc-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4638e6cc-c5bc-11ea-8496-bc764e2007e4;
 Tue, 14 Jul 2020 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594722302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EKq76JGCpX9JyuiBmD1RFZqcz2aaCNExo1bFMJfbehY=;
 b=D/FtVt7MOXBW7J2wbQM5HXhb5ZS2C+0RyxVNYa7K3RI3lgVd4M56UzNb
 bIlNAUix+182K5kKGDILbf+7640YUS1Xbqc5KeuAFbS1OYx6hoNXqqkRx
 cp+yy2ixQv1Py3Z8RU3L+ONFiE0q4P5GQ32UTjKiHDAfcTqLKOUulLmQ4 A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hRnzf6DI4KKkJSoRozZQ7nLmEmjCFGKgNJGqkc2ENhFFjm4CKsl4YzXWqDgQFfRFS3NnKPmz1D
 BU5ZfVEt7aWYlfWvWqQUdHOSKOgS8BdTDlTn/FcBt9G+1m4bFq3kW+4bGIcEdMWafGI0mqcdoe
 OIECEMFCT7hZ8osW1prnkM55uousRj3hP4FZ3I/kHx8MwINGTHcieb46u5r4xW9vpa3Tg7tmEE
 BKtu+RNP7bNGtxdxUA8ElveA2KCW+6nuThjq0H9DzPXO6JWR5S54qnwH9+trkiqCVRDx06k3e3
 eRs=
X-SBRS: 2.7
X-MesageID: 22313854
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22313854"
Date: Tue, 14 Jul 2020 12:24:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/7] x86/mce: add compat struct checking for
 XEN_MC_inject_v2
Message-ID: <20200714102448.GH7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <007679c8-84d5-2e91-e48e-68746741fb45@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <007679c8-84d5-2e91-e48e-68746741fb45@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:25:48PM +0200, Jan Beulich wrote:
> 84e364f2eda2 ("x86: add CMCI software injection interface") merely made
> sure things would build, without any concern about things actually
> working:
> - despite the addition of xenctl_bitmap to xlat.lst, the resulting macro
>   wasn't invoked anywhere (which would have lead to recognizing that the
>   structure appeared to have no fully compatible layout, despite the use
>   of a 64-bit handle),
> - the interface struct itself was neither added to xlat.lst (and the
>   resulting macro then invoked) nor was any manual checking of
>   individual fields added.
> 
> Adjust compat header generation logic to retain XEN_GUEST_HANDLE_64(),
> which is intentionally layed out to be compatible between different size
> guests. Invoke the missing checking (implicitly through CHECK_mc).
> 
> No change in the resulting generated code.
> 
> Fixes: 84e364f2eda2 ("x86: add CMCI software injection interface")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM, just one question below.

> --- a/xen/tools/compat-build-header.py
> +++ b/xen/tools/compat-build-header.py
> @@ -19,6 +19,7 @@ pats = [
>   [ r"(^|[^\w])xen_?(\w*)_compat_t([^\w]|$$)", r"\1compat_\2_t\3" ],
>   [ r"(^|[^\w])XEN_?", r"\1COMPAT_" ],
>   [ r"(^|[^\w])Xen_?", r"\1Compat_" ],
> + [ r"(^|[^\w])COMPAT_HANDLE_64\(", r"\1XEN_GUEST_HANDLE_64(" ],

Why do you need to match with the opening parenthesis?

Is this for the #ifndef XEN_GUEST_HANDLE_64 instances? Don't they need
to also be replaced with the compat types?

Thanks, Roger.

