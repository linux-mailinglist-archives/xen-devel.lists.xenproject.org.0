Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF641BA9C8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6I4-000272-0p; Mon, 27 Apr 2020 16:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzTj=6L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jT6I2-00026x-NW
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:07:26 +0000
X-Inumbo-ID: 2eeab3fe-88a1-11ea-97b4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2eeab3fe-88a1-11ea-97b4-12813bfff9fa;
 Mon, 27 Apr 2020 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588003645;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=r/4sxsISStf0Mfn4DrU0OKjJgriEsajDBe7zAhLtdp0=;
 b=Q4vGExcVLRWwNjPAD/9f9QH8ej5+6LAYwgBom+w3cd2LfFyKGIAio/xE
 Ol/YweEDC2MEUCsKTfZCS76Ic26z1x1XJQ9HBeHkFWviKmRsjfOXg56dY
 xCGrd3AlmSNbTXOhWSXJnaW8wZOzCNtV2A3f/18A8sv5k6sKtcyCOALWD U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oTUXQeaZ+xD5dA/1M0FCTA8gfr3i3CbCdi+/sXiq7ryHR9U78HHoNRI6hY9LQMXu78sgHZq2Aa
 PjL9owqwIA7ksAF2WxHzgpUvhixnBpw0BGKZE13uSQGipM91OjmMHHotAWfQPOzT2bRSBRXVpe
 h/mVNxRaq5FRtFO21m8U0v13LkEfqHWhT6euo6eyXjga3biI6ClMordrrb2hhKuzN0Yjhbpwe8
 Fy/ZdOo2eoKTFv88fsmYFpFT7/2pXx3k1Ps8fTpGoeFj54unBDOa7HjQFpYmGZGgYVIMN+ENtJ
 7Fk=
X-SBRS: 2.7
X-MesageID: 16628494
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16628494"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24231.823.216156.673425@mariner.uk.xensource.com>
Date: Mon, 27 Apr 2020 17:07:19 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 03/17] tools/migration: Drop IHDR_VERSION constant from
 libxc and python [and 1 more messages]
In-Reply-To: <b016711e-034d-cf00-1434-beb75b9c263d@citrix.com>,
 <2076e9a4-c07e-9aab-1cc2-f38f7eacd8c0@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-8-andrew.cooper3@citrix.com>
 <24148.2202.912512.939428@mariner.uk.xensource.com>
 <cea79256-f260-1710-a783-dadec276e32a@citrix.com>
 <24161.10156.858608.199136@mariner.uk.xensource.com>
 <2076e9a4-c07e-9aab-1cc2-f38f7eacd8c0@citrix.com>
 <20200127143444.25538-4-andrew.cooper3@citrix.com>
 <24148.1780.909250.638385@mariner.uk.xensource.com>
 <1f074dca-9798-1ed9-0163-882eb2079d53@citrix.com>
 <24161.12968.77707.404087@mariner.uk.xensource.com>
 <b016711e-034d-cf00-1434-beb75b9c263d@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH v2 03/17] tools/migration: Drop IHDR_VERSION constant from libxc and python"):
> I presume you mean here 2x send IHDR and 2x receive IHDR, one C and one
> Python in each case.
> 
> I understand what you're suggesting.  I completely disagree with it, as
> it obfuscates the logic and introduces a source of bugs for zero gain.
...
> The only thing IHDR_VERSION_* usefully gets you is the ability to get
> the defines accidentally wrong, and introduce bugs that way.

Andrew Cooper writes ("Re: [PATCH v2 07/17] libxc/restore: STATIC_DATA_END inference for v2 compatibility"):
> On 05/03/2020 16:24, Ian Jackson wrote:
> > You could handle that with a small bit of code around one of the call
> > sites to adjust the error handling.  (Also, what a mess, but I guess
> > we're here now...)
> 
> ... which is the majority the code you're trying to abstract away.
...
> tl;dr I could put an #ifdef x86'd static inline in the root common
> header (xc_sr_common.h), but the overall complexity is greater than what
> is presented here.

I still don't agree with you I'm afraid.  I went back through our
messages, and looked at the code again, and I think we are probably
still not communicating well.  However, I thought about how best to
deal with this disagreement.  As the actual author of much of this
code, and certainly the person putting a lot of effort in, you should
get quite a bit of leeway.

I considered taking your branch and showing you what I meant in code
terms.  But ultimately I think this is a waste of our time and I don't
want us to get into a pointless argument.  I don't think these issues
matter enough to be worth the debate.  I don't think there are actual
bugs here - we're talking about matters of style and taste.

So,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

It would probably have been better for me to have got to this point
earlier.

Sorry,
Ian.

