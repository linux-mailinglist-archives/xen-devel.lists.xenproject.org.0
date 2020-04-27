Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7B1BA0A6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 11:59:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT0Xw-0006Vh-2k; Mon, 27 Apr 2020 09:59:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jT0Xu-0006Vc-Sf
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 09:59:26 +0000
X-Inumbo-ID: c492fad0-886d-11ea-9750-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c492fad0-886d-11ea-9750-12813bfff9fa;
 Mon, 27 Apr 2020 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587981562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=48S0TXs23gXxDUUpiYjHmCrV+8owKESkeo9sF5f/npw=;
 b=OJFazssvCnUwwe3X6KS0EFZoAqNS+aAdco9+nQbikLVuBHUhQ6KNqtcZ
 ylTQ7i/E9AzIdOHMPW7XKRwC3Tz3lascPupfOefv4zqYpxlnZoHMa/ag/
 UQ3Q5U0BeAWREZ/wpwhYCbxf/UP2PziiPn6YI30HoJgmuDHAyeGQw1Gy0 I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XAk5OT5Q7kEAVDG/t14KFml7B60zZImLnw5T3t6TycVbKoeVa2QuV9bPjEUdFgVUxuPiLJw0gp
 vkwvd6YtX2ecbC+xjfLVDlS1zn8f/qWpfY91SJh5h1QCJJKnkb63QuqT9VlOwACK5OL2/fYbSw
 r5V0HLLqFvrXZ88RW2AONrskWtk2lWJDS9B1pSk9U15DtPfw7W37T3Y35V8ZuAbL4l3P4nldw+
 XWAiifdiCPxBfdP608xjLShy7hjvuNNXypb8MUho9GwoL4wVcq4uVwBbbLDW9dEGUHPGHQRYUB
 fsg=
X-SBRS: 2.7
X-MesageID: 16304291
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,323,1583211600"; d="scan'208";a="16304291"
Date: Mon, 27 Apr 2020 11:59:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: refine guest_mode()
Message-ID: <20200427095913.GN28601@Air-de-Roger>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 10:03:05AM +0200, Jan Beulich wrote:
> The 2nd of the assertions as well as the macro's return value have been
> assuming we're on the primary stack. While for most IST exceptions we
> eventually switch back to the main one, for #DF we intentionally never
> do, and hence a #DF actually triggering on a user mode insn (which then
> is still a Xen bug) would in turn trigger this assertion, rather than
> cleanly logging state.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While we could go further and also assert we're on the correct IST
> stack in an "else" ti the "if()" added, I'm not fully convinced this
> would be generally helpful. I'll be happy to adjust accordingly if
> others think differently; at such a point though I think this should
> then no longer be a macro.
> 
> --- a/xen/include/asm-x86/regs.h
> +++ b/xen/include/asm-x86/regs.h
> @@ -10,9 +10,10 @@
>      /* Frame pointer must point into current CPU stack. */                    \
>      ASSERT(diff < STACK_SIZE);                                                \
>      /* If not a guest frame, it must be a hypervisor frame. */                \
> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \

Why not use:

ASSERT(diff >= PRIMARY_STACK_SIZE || !diff || ((r)->cs == __HYPERVISOR_CS));

I'm not sure I fully understand this layout, is it possible that you
also need to account for the size of cpu_info?

Roger.

