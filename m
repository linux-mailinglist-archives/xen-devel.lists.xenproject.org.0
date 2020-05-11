Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B51CD73B
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 13:08:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY6Hp-0008Nb-6u; Mon, 11 May 2020 11:07:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY6Hn-0008NW-KH
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 11:07:51 +0000
X-Inumbo-ID: a738d3fa-9377-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a738d3fa-9377-11ea-b9cf-bc764e2007e4;
 Mon, 11 May 2020 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589195271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZMGAZL7A0M3DP9SLTWecx9J810+9GaJaImgn1XXl3WU=;
 b=HDzsG54gkX1ba1ybLkMbHz3UOO4ttAS0nxFcDrUS5UZqxWPO257Amitk
 aKICjjhqtpHmESIZaBs5eZVL6BKg3xBEiDoV/b9GxQz0Mz6fceK6CBU8w
 KD6yixZvrRn2i+gsRU8OUwFz2pdfW0uiGc8HxsPIdt1v5Zwj9D3j2tqcx 4=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: mb8Lzy4JPpHYLts3I0dl1Mb/yHUQFTz9agoKyU+wHe0BK9TDJOa7obgjmQBWEejvHlkoZF6TVG
 mVHez3AXae3N4bAmfYjI/P/4pN/hGe57O7SRZZYzi6bBHUdXjTuE3agjJJd11vZnOn+D0j/s0z
 mJHaqpbMJ+fmALFn+5UGYp3LZKtUlq1TFrdmgD3eWYVhfyqVvCeV0z+0xbzp4ELyQddl8tyqOd
 BxgUQ98QZEwskE3J6KwcXMpXAPRq1+WJjxTL9CxQD06W3PWkie0tCM+WNryUT1kjX64EOthZEb
 Rjo=
X-SBRS: 2.7
X-MesageID: 17195507
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17195507"
Date: Mon, 11 May 2020 13:07:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
Message-ID: <20200511110743.GB35422@Air-de-Roger>
References: <20200511101753.36610-1-roger.pau@citrix.com>
 <f3471cee-342e-c169-f3eb-34f559892336@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3471cee-342e-c169-f3eb-34f559892336@citrix.com>
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
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 11, 2020 at 11:38:49AM +0100, Andrew Cooper wrote:
> On 11/05/2020 11:17, Roger Pau Monne wrote:
> > Apply a workaround for Intel errata CLX30: "A Pending Fixed Interrupt
> > May Be Dispatched Before an Interrupt of The Same Priority Completes".
> >
> > It's not clear which models are affected, as the errata is listed in
> > the "Second Generation Intel Xeon Scalable Processors" specification
> > update, but the issue has been seen as far back as Nehalem processors.
> 
> Really?  I'm only aware of it being Haswell and later.
> 
> CLX30 was just one single example I gave you.  It is public in all the
> specification updates going backwards, and is for example SKX100, BDX99 etc.

Right, will update accordingly then.

> > Apply the workaround to all Intel processors, the condition can be
> > relaxed later.
> 
> Nothing in the code checks ISR, so we're applying "no power saving"
> unilaterally rather than in the very rare corner case that it occurs.

We don't check ISR directly, but instead the stack of pending
interrupts to EOI, which should match the vectors pending in the ISR?

As vectors that can be masked are not held pending in the ISR. I can
check ISR directly if that's any better, but AFAICT using
cpu_has_pending_apic_eoi is equally effective and faster.

> I'm also not aware of it affecting Atom processors.
> 
> This will cripple anything running on battery power, and is therefore
> not an appropriate fix in this form.

TBH, I've tried it in it's current form and it doesn't trigger that
often.

Thanks, Roger.

