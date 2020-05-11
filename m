Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD5A1CD6B3
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5pp-0005b9-KI; Mon, 11 May 2020 10:38:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jY5pn-0005az-C0
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:38:55 +0000
X-Inumbo-ID: 9c4ca31c-9373-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c4ca31c-9373-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589193534;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2HZ8R5wunFDPYcA0cnORPcZAxJX0ODZv6tShorw+oXk=;
 b=AkeADt24UIVEV9xdpRkBWU0/GgKAl7tXubkhT1vS6BMgAIvMoNfEt+YY
 A0hzAANMOOk6+runAYDsu4eB5Xb9dGQqgPBOvOqd8CMu7Bz++S2/DQ5Um
 0GZmHNi8CQZdLCZMPnYafWBet13Sb2t0R13lysARV+r3O13CUBpMsFZtF 0=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: p0kxgfcqjRfrYBGkHTPe8yQpaL+DXNm6mYmEnmk+HKEk0fIx9Xv1OtPMHsaG/VXMa6c+avO4hL
 0rU6REGNNPcXsRvWnjmj+B9Z1Pj5Jc4+A+ul4vHiFRDFnozV947HU5opI7b+b7iBF4icQzHu1z
 w5Q9Afjn2dFeWtKe+q0kW+0mu9YPHh9bTmenNyzrZRscBI0M7wOqIhf3iyipWO2sP2xwLd6Fz8
 4dvXqE9i22Rvo+CgfXM05x2sU25fRqZWOwxDktH2Cbw1rOa3LKP5xndM6PTuG6qnJeKQnhxFTI
 pU8=
X-SBRS: 2.7
X-MesageID: 17573114
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17573114"
Subject: Re: [PATCH v2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200511101753.36610-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f3471cee-342e-c169-f3eb-34f559892336@citrix.com>
Date: Mon, 11 May 2020 11:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511101753.36610-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/05/2020 11:17, Roger Pau Monne wrote:
> Apply a workaround for Intel errata CLX30: "A Pending Fixed Interrupt
> May Be Dispatched Before an Interrupt of The Same Priority Completes".
>
> It's not clear which models are affected, as the errata is listed in
> the "Second Generation Intel Xeon Scalable Processors" specification
> update, but the issue has been seen as far back as Nehalem processors.

Really?  I'm only aware of it being Haswell and later.

CLX30 was just one single example I gave you.  It is public in all the
specification updates going backwards, and is for example SKX100, BDX99 etc.

> Apply the workaround to all Intel processors, the condition can be
> relaxed later.

Nothing in the code checks ISR, so we're applying "no power saving"
unilaterally rather than in the very rare corner case that it occurs.

I'm also not aware of it affecting Atom processors.

This will cripple anything running on battery power, and is therefore
not an appropriate fix in this form.

~Andrew

