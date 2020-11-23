Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC12C04C4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 12:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34064.64917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAGR-0004ZD-2n; Mon, 23 Nov 2020 11:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34064.64917; Mon, 23 Nov 2020 11:44:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAGQ-0004Yo-VU; Mon, 23 Nov 2020 11:44:10 +0000
Received: by outflank-mailman (input) for mailman id 34064;
 Mon, 23 Nov 2020 11:44:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khAGO-0004Yj-Ve
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:44:09 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 565f2a2e-50cc-4dab-ac4f-871ad59c73a0;
 Mon, 23 Nov 2020 11:44:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khAGO-0004Yj-Ve
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 11:44:09 +0000
X-Inumbo-ID: 565f2a2e-50cc-4dab-ac4f-871ad59c73a0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 565f2a2e-50cc-4dab-ac4f-871ad59c73a0;
	Mon, 23 Nov 2020 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606131848;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=gM0BV9SZvN21gQf6gMU83YW93bJ7J73jbMVa9MDje70=;
  b=NwAJe9vWt6pIbOHN0k1b8/Fl5fExtV/2qkcpE1d+t7Y8M/9pPwsU0aSN
   gVY2UkMllvnr3sQ3k4vVEpZusskEd4iEkkv3ltxuMCx6JYjRe14IjnkNv
   77Fs8Bf/GerElHo4Dya+cJWctWg9ZbAkDX27miLu0WnTIUPMfg86g2Knh
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ax8TINSluyw8DGB8pKBWMZTKlZvlYDF1Z0432ly6bdx1G63ffkfo7NtHfpTZnAjirQORnSDO23
 erCB0jZV5ZAbwjbc15FcvfibFtf5xE1mqsX0gTcW0zJ4SWgf7W1Smc/sPi7IdoypFpjCOlz0Ym
 Z6Y/geI9R/2U7kl1aANHMeVTlVxX104VWxyApea0YmRsvlO+xcOy36dQnsKPGdZoIjfomSiifl
 lFllwi9eeocfVruERgfr7HkB1MN6/1IgEa8kavwDQe3F1Lc7KgnqH3MPSnJwAwXNHIgtMIhR3V
 UJg=
X-SBRS: None
X-MesageID: 31704912
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31704912"
Subject: Re: [PATCH] x86/DMI: fix SMBIOS pointer range check
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <7823a8e0-6388-08f6-0ce6-36bd7139ff54@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c1cca0e5-d457-3e9c-17e6-1764471e1a3c@citrix.com>
Date: Mon, 23 Nov 2020 11:44:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7823a8e0-6388-08f6-0ce6-36bd7139ff54@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 23/11/2020 11:33, Jan Beulich wrote:
> Forever since its introduction this has been using an inverted relation
> operator.
>
> Fixes: 54057a28f22b ("x86: support SMBIOS v3")
> Signed-off-by: Jan Beulich <JBeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

