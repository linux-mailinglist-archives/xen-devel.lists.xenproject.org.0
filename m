Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33031D7F38
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 18:53:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaj03-0003vH-Vs; Mon, 18 May 2020 16:52:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGN6=7A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jaj01-0003vC-Ms
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 16:52:21 +0000
X-Inumbo-ID: f03f7bde-9927-11ea-ae69-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f03f7bde-9927-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 16:52:20 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bT9m3LRueHZIYCT7JnvSTiQSjpwj/iDHe8KfUtKnoEobqEMCVfREJ/AQEThI8uLgyJVjsCJMdi
 J23myrWLQu/4lpSON5aDnNmnrumR2II2xXwVPLUSg2Kj8qG1MiMpw73Ciz2UJBradh/qLwSbzw
 78WSFFiUOLr3VevXbIGfUlFwTHMExDdntisdXYZiVzZNySPiDj5jLGKrOd/Z4zBg0UGbLV5RLT
 uJ4WapX9dPVzBds1Z+pFHcPTtdhNPwn5IfRPn5VPHSY1KvHrK2KZSD90fvZhLh8CiAELw3tgp1
 CfE=
X-SBRS: 2.7
X-MesageID: 17804328
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="17804328"
Date: Mon, 18 May 2020 18:52:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] x86/PV: remove unnecessary toggle_guest_pt() overhead
Message-ID: <20200518165213.GX54375@Air-de-Roger>
References: <24d8b606-f74b-9367-d67e-e952838c7048@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24d8b606-f74b-9367-d67e-e952838c7048@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 08:16:03AM +0200, Jan Beulich wrote:
> While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
> expensive (but still needed only for the toggle_guest_mode() path), the
> effect of the latter on the exit-to-guest path is not insignificant.
> Move the logic into toggle_guest_mode(), on the basis that
> toggle_guest_pt() will always be invoked in pairs, yet we can't safely
> undo the setting of root_pgt_changed during the second of these
> invocations.

I'm not sure if it would be worth to add a comment to note the
intended usage of toggle_guest_pt is to fetch data from the kernel
page tables when running in user mode. The one about using it in pairs
is certainly fine.

> While at it, add a comment ahead of toggle_guest_pt() to clarify its
> intended usage.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

