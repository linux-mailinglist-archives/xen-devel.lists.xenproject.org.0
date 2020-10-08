Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0028766C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 16:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4497.11735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXHf-00075H-Jo; Thu, 08 Oct 2020 14:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4497.11735; Thu, 08 Oct 2020 14:52:43 +0000
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
	id 1kQXHf-00074s-GT; Thu, 08 Oct 2020 14:52:43 +0000
Received: by outflank-mailman (input) for mailman id 4497;
 Thu, 08 Oct 2020 14:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQXHe-00074n-6G
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 14:52:42 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e937c2ca-adb6-4ab2-852f-fb4d5df2bf74;
 Thu, 08 Oct 2020 14:52:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQXHe-00074n-6G
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 14:52:42 +0000
X-Inumbo-ID: e937c2ca-adb6-4ab2-852f-fb4d5df2bf74
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e937c2ca-adb6-4ab2-852f-fb4d5df2bf74;
	Thu, 08 Oct 2020 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602168760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GljNlADrhBwR0lHtxxzzRDo6MX8DOuP2v2zSKoT+PvA=;
  b=En8m0NaZ8U+z/dPpaFJb2LSY2Bz1jrS+RYlYyuh9U3IelqY866CquA5R
   7oeJiHq6Eppu91ghTHiqjterl8NGRKA8y5jWFLUHKW2rWa/TeXJbxXhgH
   7KhUR4sClZDz54Gz1279uMIoueouNIVuZ9bMtyI4005pvXe8h3eAB+KxI
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +W/Mo867VPZVHBh+yRvNqntNMjCYjoK82wbO6EnPy1r9iDbQjHOqZwStoUuut2tSuXsu49UZym
 zpxkgHj3sdyloWJXGYenlv2LKSw4hOAnfJPNdj3mca1dvltEjMX5XatUuRWm6TGUvlElSYZsUX
 sv+d6Znx+jNmQYs+gY4+GWBBsKTDkDOfzgmmTkniZJh0uUyV/5uiMMf8QQY8M85Q4rfw7UnIL9
 20ss9h9I32YQYXbdS+wFwuQQ64k+pIIdXz7cpLEFTPGg6rHfNvFXG3/1WGsV2ZMlt5jLGfS78q
 N3E=
X-SBRS: None
X-MesageID: 28916378
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,351,1596513600"; 
   d="scan'208";a="28916378"
Date: Thu, 8 Oct 2020 16:52:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 3/4] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE
 at the same time
Message-ID: <20201008145229.GK19254@Air-de-Roger>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <c94e4480-96a0-34b6-a4c6-6176daa57588@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c94e4480-96a0-34b6-a4c6-6176daa57588@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 16, 2020 at 03:08:00PM +0200, Jan Beulich wrote:
> This combination doesn't really make sense (and there likely are more);
> in particular even if the code built with both options set, HVM guests
> wouldn't work (and I think one wouldn't be able to create one in the
> first place). The alternative here would be some presumably intrusive
> #ifdef-ary to get this combination to actually build (but still not
> work) again.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I can see the desire for being able to remove code, and the point
Andrew made about one option not making another disappear in a
completely different menu section.

Yet I don't see how to converge the two together, unless we completely
change our menu layouts, and even then I'm not sure I see how we could
structure this. Hence:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

