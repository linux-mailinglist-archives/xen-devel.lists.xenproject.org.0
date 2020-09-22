Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE3E27493A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKo3t-0008E9-Jo; Tue, 22 Sep 2020 19:34:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKo3r-0008E2-JT
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:34:47 +0000
X-Inumbo-ID: bc124c30-cb34-4713-b262-03f9da420c81
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc124c30-cb34-4713-b262-03f9da420c81;
 Tue, 22 Sep 2020 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600803287;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fnzN7mCV3kLVEx+6s/pez3uMQuHUF3vTGVgomVd0EUU=;
 b=LQ1L1Nyj4dO3h33vlEz7ZPEdpUYon8PD2AiH/moELqY2XKN8qdIW3IEQ
 8yGYt9H30CkoFSLG2uiJgK5P1QcdN0idXJSQdOQsUQK/g5giakpz9fZwT
 Q27FG0Z5W1mNnm5LbWrCcFC8aTdjKyyiOlyledrX9VCZDqXjN98SPtcjL 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5JIhH44cgLepYFOF1snRNj21oH90w9FSrAjnIZPOhl4MXOV4GO2F6JgfzISpOdNHOTSEZtypZF
 0cp1I0YbVRbupGBMLcZbNtkfXeGfvQMD7VHHVsQL7dXdNPFUhiiPzV39AoT6XqvEesXEzhjR4B
 VaYL7yuCaI2ftQmJ7HH7mN6gYj+S8jLn9ffWZ8JrNP+cH4nNE0m8tsMEyyBcvjESHVHsM5wNHR
 REAN7oRrfeSvYJ1M9zXhy1S29DZQFz0cNHKPI7bQlcFMQUoTx1tybj8n6+Gat24Q01FH50rhyU
 OCc=
X-SBRS: 2.7
X-MesageID: 27275546
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27275546"
Subject: Re: [PATCH 8/9] lib: move bsearch code
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <13e17bbd-4e58-d953-87c5-5fabafa21de2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b40bd4a7-b1fb-b2a0-44d1-398f533469a0@citrix.com>
Date: Tue, 22 Sep 2020 20:34:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <13e17bbd-4e58-d953-87c5-5fabafa21de2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 14/09/2020 11:18, Jan Beulich wrote:
> Build this code into an archive, which results in not linking it into
> x86 final binaries. This saves a little bit of dead code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This wants to be an extern inline in the header file just like in stdlib.h.

The implementation is trivial, and much faster when the compiler can
inline the cmp() function pointer.

I doubt we actually need out-of-line implementation (except perhaps for
CONFIG_UBSAN builds or so).

~Andrew

