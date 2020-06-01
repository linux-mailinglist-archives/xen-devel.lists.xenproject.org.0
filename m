Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39781EA74A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmg7-0005Nz-9P; Mon, 01 Jun 2020 15:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfmg5-0005Nr-Lh
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:48:41 +0000
X-Inumbo-ID: 5d4a4d10-a41f-11ea-81bc-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d4a4d10-a41f-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 15:48:40 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qWPRz7rXOFHQ5gaus6W6RV8ThmlGiE8Hyrh1P5QTrKD5qAw3qreZTAdqRkWGnJcvlzn0PFDkt6
 sZ7BLqXPlJEoV9I2+7C6VqJ/uDWS0NKXbDXMlXc2mK1GAK3A/z6jEPER/NzGUg/niezwUiMD/5
 z+GpvtqE/SJKeQkMLE+KLDL8kcqydySSDG4Ky3hKLOfB3/r20vNjLi3cNKWiuQQflRorAVNDv+
 ptjRkhFZI2w7aQa/JEdvyhqs8rkR7tNUM7Fc3hEVunYY5/Ahww94CX46KmAB39W5T53guA+4HO
 EnA=
X-SBRS: 2.7
X-MesageID: 18931394
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="18931394"
Date: Mon, 1 Jun 2020 17:48:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.14] x86/ucode: Fix errors with start/end_update()
Message-ID: <20200601154832.GT1195@Air-de-Roger>
References: <20200601145755.3661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200601145755.3661-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 01, 2020 at 03:57:55PM +0100, Andrew Cooper wrote:
> c/s 9267a439c "x86/ucode: Document the behaviour of the microcode_ops hooks"
> identified several poor behaviours of the start_update()/end_update_percpu()
> hooks.
> 
> AMD have subsequently confirmed that OSVW don't, and are not expected to,
> change across a microcode load, rendering all of this complexity unecessary.

Is there a reference to some AMD PM or similar document that can be
added here for completeness?

> Instead of fixing up the logic to not leave the OSVW state reset in a number
> of corner cases, delete the logic entirely.  This in turn allows for the
> removal of the poorly-named 'start_update' parameter to
> microcode_update_one().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

