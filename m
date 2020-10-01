Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5127FE17
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 13:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1209.4069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwPY-0002Xn-IB; Thu, 01 Oct 2020 11:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209.4069; Thu, 01 Oct 2020 11:06:08 +0000
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
	id 1kNwPY-0002XO-Ea; Thu, 01 Oct 2020 11:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1209;
 Thu, 01 Oct 2020 11:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNwPX-0002XI-F5
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:06:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bb6d98a-9eba-4b87-972e-f5e9c7ad2ef1;
 Thu, 01 Oct 2020 11:06:06 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNwPX-0002XI-F5
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:06:07 +0000
X-Inumbo-ID: 2bb6d98a-9eba-4b87-972e-f5e9c7ad2ef1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2bb6d98a-9eba-4b87-972e-f5e9c7ad2ef1;
	Thu, 01 Oct 2020 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601550367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WFxzw03ykNV/tSUsQJQrg4smpq/kZ88dl3LIJ7m3gco=;
  b=BzlBUeeC1KI/L+zXJrd3O8nVFHgSf4WqV9v4ZsjWS5Rb3rVqkNYuYNjb
   sEVyD0IqPAawLNRTYsA63+pTUiA4nvTDSHo1mcJeuAqFn5NdBweRCH+KZ
   ftWZ5bIAEbYDCnrZGVY6r/KwY8W2Fd4f4x55evJIB6/8ubZehzhKKTf/w
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: u8/irix7pqyCTWtGfl8AH+40goQQGWiUhwUQISqQf0FLUVAp+68pOxHlEjNUPYedgxNobgSZLz
 Vw7N9tNGqUbRnS9UTiS26jchyseetwmSjHmo+tNdH3DnXlJ9T5if3uAzu/CMtrF7axrfnu/2sX
 i5YgGYUXCAXwlOnf3VTFxv6dLxIPEImUn+sxqsqz7tOddQ44Rpv3ZXHeclOXfF6y2A5cwlHU7H
 xkAC7qXEs/FWI5xRrc4M27nj7JNUn42xtXfsbJ786j/gEjdXv1nTMuPh0ma+y/jQ3AoXhD97Z/
 K/E=
X-SBRS: None
X-MesageID: 28037187
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28037187"
Date: Thu, 1 Oct 2020 13:04:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 8/8] x86/cpuid: Move VMX/SVM out of the default policy
Message-ID: <20201001110459.GF19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-9-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-9-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:48PM +0100, Andrew Cooper wrote:
> Nested virt is still experimental, and requires explicitly opting in to at
> domain create time.  The VMX/SVM features should not be visible by default.
> 
> Also correct them from all HVM guests, to just HAP-enabled guests.  This has
> been the restriction for SVM right from the outset (c/s e006a0e0aaa), while
> VMX was first introduced supporting shadow mode (c/s 9122c69c8d3) but later
> adjusted to HAP-only (c/s 77751ed79e3).
> 
> There is deliberately no adjustment to xc_cpuid_apply_policy() for pre-4.14
> migration compatibility.  The migration stream doesn't contain the required
> architectural state for either VMX/SVM, and a nested virt VM which migrates
> will explode in weird and wonderful ways.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

